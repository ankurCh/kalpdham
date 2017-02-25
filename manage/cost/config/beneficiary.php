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
				
?>

<!--
	Verify the details of form.
	If details are correct then add beneficiary into database.
-->
<?php
	//Check if form is submitted.
	if (isset($_POST["submit_beneficiary"])){
		//Get form data into variables.
		$beneficiary_name 			= $_POST["beneficiary_name"];
		$beneficiary_desc 			= $_POST["beneficiary_desc"];
		$beneficiary_type 			= $_POST["beneficiary_type"];
		$attached_categories 		= $_POST["attached_categories"];
		
		if ($echo_information == 1) {
			
			echo 	 $beneficiary_name; 	
			echo 	 $beneficiary_desc; 	
			echo     $beneficiary_type; 
			var_dump($attached_categories); 

		}
		else {
			//Insert the beneficiary details into database.
			//we need to insert ti into two tables: kalp_exp_beneficiary, kalp_exp_benef_subcat_map
			//first insert into master table.
			$add_beneficiary = "INSERT INTO kalp_exp_beneficiary(beneficiary_name, beneficiary_desc, beneficiary_type)
				VALUES ('{$beneficiary_name}', '{$beneficiary_desc}', '{$beneficiary_type}')";

			$db_result = mysqli_query($db_connection, $add_beneficiary);	
			
			//test if there any query error.
			if (!$db_result) {
				die("Error while inserting new category values.");
			}			
			else {
				echo "Beneficiary {$beneficiary_name} successfully saved in database.";
			}
			
			//Insert Beneficiary and category mapping.
			//First get the last inserted category id.
			$beneficiary_id = mysqli_insert_id($db_connection);
			
			foreach ($attached_categories as $value) {
				$add_beneficiary_map = "INSERT INTO kalp_exp_benef_subcat_map(beneficiary_id, subcategory_id)
					VALUES ({$beneficiary_id},{$value})";
										
				$db_result = mysqli_query($db_connection, $add_beneficiary_map);	

				//test if there any query error.
				if (!$db_result) {
					die("Error while inserting beneficiary mapping.");
				}			
				else {
					echo "Beneficiary mapping successfully saved in database.";
				}
			}
		}
	}
?>

<html>
	<head>
		<title>Beneficiary configuration</title>
	</head>	
	<body>
			<h3>Tools</h3>
			<a href = "beneficiary.php"> Beneficiary configuration </a>
			<br />
			<a href = "../../../index.php"> Home </a>
			<hr />
			<h3>Add new Beneficiary</h3>
			
			<table style="width:50%">
				<form id = "add_new_beneficiary_form" name = "add_new_beneficiary_form" action="beneficiary.php" method = "post">
					<tr>
						<td>
							Beneficiary Name:
						</td>
						<td>
							<input type="text" name="beneficiary_name">
						</td>
					</tr>
					<tr>
						<td>
							Beneficiary Desc:
						</td>
						<td>
							<input type="text" name="beneficiary_desc">
						</td>
					</tr>
					<tr>
						<td>
							Beneficiary type:
						</td>
						<td>
							<select name="beneficiary_type" id="beneficiary_type">
								<option value="Person">Person</option>
								<option value="Group of Person">Group of Person</option>
								<option value="Firm or company">Firm or company</option>
								<option value="Govt department">Govt department</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							Attach subcategory:
						</td>
						<td>
							<?php
							//Database query to get attached category information.
							$category_details = "SELECT	CONCAT('<input type=\"checkbox\" name=\"attached_categories[]\" value=\"',subcategory_id,'\">',CONCAT_WS(' :: ',category_name, subcategory_name),'<br>') as checkbox_data
							FROM kalp_exp_subcategory_stats
								INNER JOIN kalp_exp_category 
									ON kalp_exp_subcategory_stats.category_id = kalp_exp_category.id
							ORDER BY category_name, subcategory_usage DESC";
							
							$db_result = mysqli_query($db_connection,$category_details);
											
							//test if there any query error.
							if (!$db_result) {
								die("Database query failed.");
							}
							//Display result into table.
							while ($db_row = mysqli_fetch_assoc($db_result)) {
								
								echo "{$db_row["checkbox_data"]}";
								
							}	
								
						?>
						</td>
					</tr>
					<tr><td><input type = "submit" name = "submit_beneficiary" value = "Submit"/></td><td></td></tr>
				</form>	
			</table>
			
		<hr />
			<h3>List of existing beneficiaries</h3>
				<table border="5" style="width:100%">
					<tr>
						<th>beneficiary name</th>
						<th>beneficiary desc</th>
						<th>beneficiary type</th>
					<!--	<th>attached categories</th> -->
					</tr>
					<?php
						//Database query to get existing beneficiaries information.
						$beneficiary_details = "SELECT kalp_exp_beneficiary.id AS beneficiary_id, kalp_exp_beneficiary.beneficiary_name, kalp_exp_beneficiary.beneficiary_desc, kalp_exp_beneficiary.beneficiary_type
						FROM kalp_exp_beneficiary
						ORDER BY kalp_exp_beneficiary.beneficiary_name";
						
						$db_result = mysqli_query($db_connection,$beneficiary_details);
										
						//test if there any query error.
						if (!$db_result) {
							die("Database query failed.");
						}
						//Display result into table.
						while ($db_row = mysqli_fetch_assoc($db_result)) {
							
							echo "<tr>
									<td><a href=\"./beneficiary_details.php?id={$db_row["beneficiary_id"]}\">{$db_row["beneficiary_name"]}</a></td>
									<td>{$db_row["beneficiary_desc"]}</td>
									<td>{$db_row["beneficiary_type"]}</td>
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