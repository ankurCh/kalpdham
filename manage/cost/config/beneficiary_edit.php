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

<html>
	<head>
		<title>Beneficiary Mapping edit</title>
	</head>	
	<body>
		<h3>Tools</h3>
		<br />
		<a href = "./beneficiary.php">Beneficiary Home </a>
		<br />
		<a href = "./beneficiary_details.php?id=<?php echo $beneficiary_id?>">Undo changes</a>
		<hr />
		<h3>Available subcategory including existing mapping</h3>
	</body>
</html>	

<form id = "beneficiary_mapping_edit" name = "beneficiary_mapping_edit" action="beneficiary_details.php" method = "get">

<?php
	//Database query to get mapping information.
	//Display both type of information existing attached as well as current not attached subcategory informations.
	$beneficiary_mapping = "SELECT kalp_exp_category.category_name, kalp_exp_subcategory.subcategory_name, kalp_exp_benef_subcat_map.id,
			CASE 
				WHEN kalp_exp_benef_subcat_map.id IS NULL THEN 
					CONCAT('<input type=\"checkbox\" name=\"attached_categories[]\" value=\"',kalp_exp_subcategory.id,'\">',CONCAT_WS(' :: ',kalp_exp_category.category_name, kalp_exp_subcategory.subcategory_name),'<br>')
				ELSE
					CONCAT('<input type=\"checkbox\" name=\"attached_categories[]\" value=\"',kalp_exp_subcategory.id,'\"  checked >',CONCAT_WS(' :: ',kalp_exp_category.category_name, kalp_exp_subcategory.subcategory_name),'<br>')
			END as checkbox_data
		FROM kalp_exp_benef_subcat_map
			RIGHT OUTER JOIN kalp_exp_subcategory
				ON kalp_exp_benef_subcat_map.subcategory_id = kalp_exp_subcategory.id
				AND kalp_exp_benef_subcat_map.beneficiary_id = {$beneficiary_id}
			RIGHT OUTER JOIN kalp_exp_category
				ON kalp_exp_subcategory.category_id = kalp_exp_category.id";
	
	$db_result = mysqli_query($db_connection,$beneficiary_mapping);
					
	//test if there any query error.
	if (!$db_result) {
		die("Database query failed.");
	}
	//Display result into table.
	while ($db_row = mysqli_fetch_assoc($db_result)) {
		
		echo "{$db_row["checkbox_data"]}";
		
	}	
		
?>
<input type = "hidden" name="id" value="<?php echo $beneficiary_id?>">
<input type = "submit" name = "Save_beneficiary_mapping" value = "Save"/>