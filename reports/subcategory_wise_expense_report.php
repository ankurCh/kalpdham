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
		$project_id = $_GET["id"];
	}
	else {
		die("Invalid URL request.");
	}
?>

<html>
	<head>
		<title>Sub-category wise expenses report</title>
		<script src="./Chart.js-master/Chart.js"></script>
	</head>	
	<body>
		<h3>Tools</h3>
		<br />
		<a href = "../index.php"> Home </a>
		<br />
		<a href = "./index.php"> Reports Home </a>
		<br />
		<a href = "./project_expense_report.php?id=<?php echo $project_id?>"> Project Home </a>
		<hr />
		
	</body>
</html>	

<!--
	Get some common values from DB.
-->
<?php
	//Perform database query to get name of project in question.
	$db_query = "SELECT id, project_name
				FROM kalp_projects
				WHERE id = {$project_id}";

	$db_result = mysqli_query($db_connection,$db_query);
	
	//test if there any query error.
	if (!$db_result) {
		die("Database query failed.");
	}
	
	while ($db_row = mysqli_fetch_assoc($db_result)){
		
		$project_name = $db_row["project_name"];
	}	
	?>
	<?php
	//Perform database query to get some expense related information.
	$db_query = "SELECT SUM( kalp_project_exp_details.amount) AS total_expense
				FROM kalp_project_exp_details 
				WHERE kalp_project_exp_details.project_id = {$project_id}";

	$db_result = mysqli_query($db_connection,$db_query);
	
	//test if there any query error.
	if (!$db_result) {
		die("Database query failed.");
	}
	
	while ($db_row = mysqli_fetch_assoc($db_result)){
		
		$total_expense = $db_row["total_expense"];
	}	
?>

<!--
	Subcategory wise expense report.
-->
<?php
		echo "<h4>{$project_name} : Subcategory wise expense</h3>";
		echo "<br>";
	
	//Now display the expense details.
	$db_query = "SELECT kalp_exp_category.category_name, kalp_exp_subcategory.subcategory_name, SUM(kalp_project_exp_details.amount) AS exp_amount, ((SUM( kalp_project_exp_details.amount) * 100)/{$total_expense}) AS relative_contribution
			FROM kalp_project_exp_details 
					INNER JOIN kalp_exp_category
						ON kalp_project_exp_details.category_id = kalp_exp_category.id
					INNER JOIN kalp_exp_subcategory
						ON kalp_project_exp_details.subcategory_id = kalp_exp_subcategory.id	
						AND kalp_project_exp_details.category_id = kalp_exp_subcategory.category_id
			WHERE kalp_project_exp_details.project_id = {$project_id}
			GROUP BY kalp_exp_category.category_name, kalp_exp_subcategory.subcategory_name
			ORDER BY 1,2 DESC;";

	$db_result = mysqli_query($db_connection,$db_query);
	
	//test if there any query error.
	if (!$db_result) {
		die("Database query failed.");
	}
	
	//display the result set into a table.
	echo "<table style=\"width:100%\" border=\"5\">";
		echo "<tr>
				<th>Category name</th>
				<th>Subcategory name</th>
				<th>amount</th>
				<th>% contribution</th>
			</tr>";
		
		while ($db_row = mysqli_fetch_assoc($db_result)){
			
			echo "<tr>
					<td>{$db_row["category_name"]}</td>
					<td>{$db_row["subcategory_name"]}</td>
					<td>{$db_row["exp_amount"]}</td>
					<td>{$db_row["relative_contribution"]}</td>
				</tr>";
		}
		
		echo "<tr>
				<th>Total</th>
				<th></th>
				<th>{$total_expense}</th>
				<th>100</th>
			</tr>";
	
	echo "</table>";
?>