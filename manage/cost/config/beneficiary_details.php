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
		$beneficiary_id = $_GET["id"];
	}
	else {
		die("Invalid URL request.");
	}
?>

<!--
	Verify the details of form submitted in beneficiary_edit.php page.
	If details are correct then modify beneficiary mapping into database.
-->
<?php
	//Check if form is submitted.
	if (isset($_GET["Save_beneficiary_mapping"])){
		
		//Get form data into variables.
		$attached_categories 		= $_GET["attached_categories"];
		
		//first delete existing mapping into kalp_exp_benef_subcat_map for beneficiary_id in question.
		$delete_beneficiary_map = "DELETE FROM kalp_exp_benef_subcat_map
									WHERE beneficiary_id = {$beneficiary_id} ";
								
		$db_result = mysqli_query($db_connection, $delete_beneficiary_map);	

		//test if there any query error.
		if (!$db_result) {
			die("Error while deleting beneficiary mapping.");
		}			
		else {
			echo "Beneficiary mapping successfully deleted from database.";
		}
		
		//Now add complete mapping (new and old).
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
?>


<html>
	<head>
		<title>Beneficiary details</title>
	</head>	
	<body>
		<h3>Tools</h3>
		<br />
		<a href = "./beneficiary.php">Beneficiary Home </a>
		<br />
		<a href = "./beneficiary_details.php?id=<?php echo $beneficiary_id?>">Beneficiary details </a>
		<hr />
		
	</body>
</html>	

<?php
	
	//Database query to get existing beneficiaries information.
	$beneficiary_details = "SELECT kalp_exp_beneficiary.id AS beneficiary_id, kalp_exp_beneficiary.beneficiary_name, kalp_exp_beneficiary.beneficiary_desc, kalp_exp_beneficiary.beneficiary_type
	FROM kalp_exp_beneficiary
	WHERE id = {$beneficiary_id}";
	
	$db_result = mysqli_query($db_connection,$beneficiary_details);
					
	//test if there any query error.
	if (!$db_result) {
		die("Database query failed.");
	}
	//Display result into table.
	while ($db_row = mysqli_fetch_assoc($db_result)) {
		
		//First table will be used to display beneficiary details and second beneficiary-category mapping respectively.
		echo "<h4>Beneficiary details</h4>";
		echo "<table style=\"width:100%\" border=\"2\">"; //first inner table start.
		
		echo "<tr>
				<td>Beneficiary Name: </td>
				<td> {$db_row["beneficiary_name"]}</td>
			</tr>";	
			
		echo "<tr>
				<td>Beneficiary Description: </td>
				<td> {$db_row["beneficiary_desc"]}</td>
			</tr>";	
		
		echo "<tr>
				<td>Beneficiary Type: </td>
				<td> {$db_row["beneficiary_type"]}</td>
			</tr>";	
								
		
		echo "</table>"; //first inner table end.
		echo "<h4>Beneficiary-Category mapping</h4>";
		?>
		<!--edit and save button.
			This will be used to edit the mapping.
			Initially save will be hidden/disable. In edit mode edit button will be disabled.-->
			
		<!--
			<input type = "submit" name = "edit_beneficiary_button" id = "edit_beneficiary_button" value = "Edit" onclick="clickEditButton()"/>
		-->
		<!--Here I am using javascript to redirect to a new edit page instead of form submission.-->
			<input type = "button" onclick="location.href='beneficiary_edit.php?id=<?php echo $beneficiary_id?>';" value="Edit Mapping" />
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<!--
			<input type = "submit" name = "save_beneficiary_button" id = "save_beneficiary_button" value = "Save" disabled />
		-->
		<!--
		<script>
			function clickEditButton() {
				//Delete the table keeping mapping records.
				//document.getElementById("beneficiary_category_mapping_table").innerHTML = "";
				var element = document.getElementById("beneficiary_category_mapping_table");
				element.parentNode.removeChild(element);
				
				document.getElementById("save_beneficiary_button").disabled = false;
				document.getElementById("edit_beneficiary_button").disabled = true;
			}	
		</script>
		-->
		<?php
		echo "<table id = \"beneficiary_category_mapping_table\" style=\"width:100%\" border=\"2\">"; //second inner table start.
			
		echo "<tr>
				<th>Category Name</th>
				<th>Sub-category Name</th>
			</tr>";	
		
		//Database query to get category and subcategory details relevant for this baneficiary.	
		$beneficiary_details = "SELECT kalp_exp_category.category_name, kalp_exp_subcategory.subcategory_name
		FROM kalp_exp_benef_subcat_map
			INNER JOIN kalp_exp_subcategory
				ON kalp_exp_benef_subcat_map.subcategory_id = kalp_exp_subcategory.id
			INNER JOIN kalp_exp_category
				ON kalp_exp_subcategory.category_id = kalp_exp_category.id
		WHERE 	kalp_exp_benef_subcat_map.beneficiary_id = {$beneficiary_id}";
		
		$db_result = mysqli_query($db_connection,$beneficiary_details);
						
		//test if there any query error.
		if (!$db_result) {
			die("Database query failed.");
		}
		//Display result into table.
		while ($db_row = mysqli_fetch_assoc($db_result)) {
			echo "<tr>
				<td> {$db_row["category_name"]} </td>
				<td> {$db_row["subcategory_name"]}</td>
			</tr>";	
		}
			
		echo "</table>"; //second inner table end.
	
	}	
	
?>


<hr />
<!--
	View reports on beneficiary.
-->
<a href = "../../../reports/beneficiary_reports.php?id=<?php echo $beneficiary_id?>">Beneficiary Reports </a>