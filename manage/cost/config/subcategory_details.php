<?php
	//Create some variables.
	//for debugging.
	$echo_information = 0;	//1 = debugging, 0 = no debugging.
	//for create date.
	$when_created = date('Y-m-d');
?>

<!--
	First create a database connection.
-->
<?php
	require_once('../secure/database_details.php'); 
	//echo $db_hostname;

	$db_connection = mysqli_connect($db_hostname,$db_username,$db_password,$db_name);

	//Verify the conneciton.
	if (mysqli_connect_errno()) {
		//Error while connecing the db.
		die("Database connection failed. Error no: " . mysqli_connect_errno() . ", error message: " . mysqli_connect_error());
	}
	/*else {
		echo "hi";
	}*/
	
	//get URL parameters.
	if (isset($_GET["id"])){
		$subcategory_id = $_GET["id"];
	}
	else {
		die("Invalid URL request.");
	}
?>

<html>
	<head>
		<title>Sub Category details</title>
	</head>	
	<body>
		<h3>Tools</h3>
		<br />
		<a href = "./category.php">Category Home </a>
		<br />
		<a href = "./subcategory_details.php?id=<?php echo $subcategory_id?>">Sub Category details </a>
		<hr />
		<input type = "button" onclick="location.href='subcategory_edit.php?id=<?php echo $subcategory_id?>';" value="Edit Sub category" />
		<?php
			
			//Database query to get sub category information.
			$category_details = "SELECT kalp_exp_subcategory.id, kalp_exp_subcategory.subcategory_name, kalp_exp_subcategory.subcategory_desc, kalp_exp_subcategory.color_name, kalp_exp_subcategory.color_code, kalp_exp_subcategory_stats.subcategory_usage, kalp_exp_subcategory_stats.last_use_date
				FROM kalp_exp_subcategory
					INNER JOIN kalp_exp_subcategory_stats
						ON kalp_exp_subcategory.id = kalp_exp_subcategory_stats.subcategory_id
				WHERE kalp_exp_subcategory.id = {$subcategory_id}";
			
			$db_result = mysqli_query($db_connection,$category_details);
							
			//test if there any query error.
			if (!$db_result) {
				die("Database query failed.");
			}
			//Display result into table.
			while ($db_row = mysqli_fetch_assoc($db_result)) {
				
				//Crate an outer table and two inner tables.
				//Inner tables will be used to display sub category details and sub category stats respectively. Outer table will be used to hold these two inner tables.
				echo "<table style=\"width:100%\" border=\"5\">"; //outer table start.
				echo "<tr>";
					echo "<td><h4>Sub Category details</h4>";
						echo "<table style=\"width:100%\" border=\"2\">"; //first inner table start.
							
						echo "<tr>
								<td>Sub Category Name: </td>
								<td> {$db_row["subcategory_name"]}</td>
							</tr>";	
							
						echo "<tr>
								<td>Sub Category Description: </td>
								<td> {$db_row["subcategory_desc"]}</td>
							</tr>";	
							
						if ($db_row["color_code"] != null) {	
							echo "<tr>
									<td>Sub Category Color: </td>
									<td><span style=\"background:{$db_row["color_code"]}\">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
								</tr>";	
						}
						else {
							echo "<tr>
									<td>Sub Category Color: </td>
									<td>Not set</td>
								</tr>";	
						}
						echo "</table>"; //first inner table end.
					echo "</td>";
					echo "<td><h4>Sub Category stats</h4>";
						echo "<table style=\"width:100%\" border=\"2\">"; //second inner table start.
						echo "<tr>
								<td>Sub Category Usage: </td>
								<td> {$db_row["subcategory_usage"]}</td>
							</tr>";	
							
						echo "<tr>
								<td>Sub Category last use date: </td>
								<td> {$db_row["last_use_date"]}</td>
							</tr>";	
						
						echo "</table>"; //second inner table end.
					echo "</td>";
				echo "<tr>";
				echo "</table>"; //outer table end.
			}	
			
		?>
		
	</body>
</html>	