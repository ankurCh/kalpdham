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
	require_once('../manage/cost/secure/database_details.php'); 
	//echo $db_hostname;

	$db_connection = mysqli_connect($db_hostname,$db_username,$db_password,$db_name);

	//Verify the conneciton.
	if (mysqli_connect_errno()) {
		//Error while connecing the db.
		die("Database connection failed. Error no: " . mysqli_connect_errno() . ", error message: " . mysqli_connect_error());
	}
	else {
		if ($echo_information == 1)
		{
			echo "hi";
		}
		
	}
				
?>

<html>
	<head>
		<title>Material and cost estimation Configuration</title>
	</head>	
	<body>
		<h3>Tools</h3>
		<a href = "index.php">Material and cost estimation module Home </a>
		<br />
		<a href = "../index.php"> Home </a>
		<hr />
		<h3>Configuration for concrete</h3>
			<table border="5" style="width:100%">
				<tr>
					<th>configuration id</th>
					<th>concrete_strength_28day_MPA</th>
					<th>unit_mass_vol</th>
					<th>halfstone_cement</th>
					<th>halfstone_sand</th>
					<th>halfstone_stone</th>
					<th>threeforthstone_cement</th>
					<th>threeforthstone_sand</th>
					<th>threeforthstone_stone</th>
				</tr>
				<?php
					//Database query to get concrete configuration information.
					$category_details = "SELECT id, concrete_strength_28day_MPA, unit_mass_vol, halfstone_cement, halfstone_sand, halfstone_stone, threeforthstone_cement, threeforthstone_sand, threeforthstone_stone
											FROM kalp_cost_config_concrete_mix
											ORDER BY id";
					
					$db_result = mysqli_query($db_connection,$category_details);
									
					//test if there any query error.
					if (!$db_result) {
						die("Database query failed.");
					}
					//Display result into table.
					while ($db_row = mysqli_fetch_assoc($db_result)) {
						
						echo "<tr>
								<td><a href=\"./concr_confi_details.php?id={$db_row["id"]}\">{$db_row["id"]}</a></td>
								<td>{$db_row["concrete_strength_28day_MPA"]}</td>
								<td>{$db_row["unit_mass_vol"]}</td>
								<td>{$db_row["halfstone_cement"]}</td>
								<td>{$db_row["halfstone_sand"]}</td>
								<td>{$db_row["halfstone_stone"]}</td>
								<td>{$db_row["threeforthstone_cement"]}</td>
								<td>{$db_row["threeforthstone_sand"]}</td>
								<td>{$db_row["threeforthstone_stone"]}</td>
							</tr>";
						
					}	
						
				?>
			</table>	
		<hr />
	</body>
</html>



<!--
	Close the connection.
-->
<?php
	//Close connection.
	mysqli_close($db_connection);

?>