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
		<title>Detailed report of beneficiary</title>
		<script src="./Chart.js-master/Chart.js"></script>
	</head>	
	<body>
		<h3>Tools</h3>
		<br />
		<a href = "../manage/cost/config/beneficiary.php">Beneficiary Home </a>
		<br />
		<a href = "../manage/cost/config/beneficiary_details.php?id=<?php echo $beneficiary_id?>">Beneficiary details </a>
		<hr />
		
	</body>
</html>	

<!--
	Get some common values from DB.
-->

<?php
	//Perform database query to get some payment related information.
	$db_query = "SELECT SUM( kalp_project_exp_details.amount) AS total_payment
				FROM kalp_project_exp_details 
				WHERE kalp_project_exp_details.beneficiary_id = {$beneficiary_id}";

	$db_result = mysqli_query($db_connection,$db_query);
	
	//test if there any query error.
	if (!$db_result) {
		die("Database query failed.");
	}
	
	while ($db_row = mysqli_fetch_assoc($db_result)){
		
		$total_payment = $db_row["total_payment"];
	}	
?>

<!--
	Detailed payment report.
-->
<?php
		echo "<br>";
	
	//Now display the payment details.
	$db_query = "SELECT kalp_projects.project_name,
	        kalp_subprojects.subproject_name,
	        kalp_exp_category.category_name,
	        kalp_exp_subcategory.subcategory_name,
	        kalp_project_exp_details.expense_date,
	        kalp_project_exp_details.amount,
	        kalp_project_exp_details.remark
	FROM kalp_project_exp_details
	  INNER JOIN kalp_projects
	    ON kalp_project_exp_details.project_id = kalp_projects.id
	  INNER JOIN kalp_subprojects
	    ON kalp_project_exp_details.subproject_id = kalp_subprojects.id
	  INNER JOIN kalp_exp_category
	    ON kalp_project_exp_details.category_id = kalp_exp_category.id
	  INNER JOIN kalp_exp_subcategory
	    ON kalp_project_exp_details.subcategory_id = kalp_exp_subcategory.id
	    AND kalp_project_exp_details.category_id = kalp_exp_subcategory.category_id
	WHERE beneficiary_id = {$beneficiary_id}
	ORDER BY  kalp_project_exp_details.id ASC";

	$db_result = mysqli_query($db_connection,$db_query);
	
	//test if there any query error.
	if (!$db_result) {
		die("Database query failed.");
	}
	
	//display the result set into a table.
	echo "<table style=\"width:100%\" border=\"5\">";
		echo "<tr>
				<th>project name</th>
				<th>subproject name</th>
				<th>category name</th>
				<th>subcategory name</th>
				<th>expense date</th>
				<th>amount</th>
				<th>remark</th>
			</tr>";
		
		while ($db_row = mysqli_fetch_assoc($db_result)){
			
			echo "<tr>
					<td>{$db_row["project_name"]}</td>
					<td>{$db_row["subproject_name"]}</td>
					<td>{$db_row["category_name"]}</td>
					<td>{$db_row["subcategory_name"]}</td>
					<td>{$db_row["expense_date"]}</td>
					<td>{$db_row["amount"]}</td>
					<td>{$db_row["remark"]}</td>
				</tr>";
		}
	
	echo "</table>";
?>