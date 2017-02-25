
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
		<title>Project expenses report</title>
		<script src="./Chart.js-master/Chart.js"></script>
	</head>	
	<body>
		<h3>Tools</h3>
		<br />
		<a href = "../index.php"> Home </a>
		<br />
		<a href = "./index.php"> Reports Home </a>
		<hr />
		
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
				<h3><?php echo $project_name?>: Project wise expenses report</h3>
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
				Subproject wise expense report.
			-->
			<h4><a href = "./subproject_wise_expense_report.php?id=<?php echo $project_id ?>"> <?php echo $project_name?>: Sub-project wise expenses report </a></h4>
			
			<!--
				Category wise expense report.
			-->
			<!--
					Weighted distribution using pie chart.
					
			-->
			<h4><a href = "./category_wise_expense_report.php?id=<?php echo $project_id ?>"> <?php echo $project_name?>: Category wise expenses report -- Weighted distribution </a></h4>
			
			<h4><a href = "./category_wise_expense_report_linechart.php?id=<?php echo $project_id ?>"> <?php echo $project_name?>: Category wise expenses report -- Time bound trend</a></h4>
			
			<!--
				Subcategory wise expense report.
			-->
			<h4><a href = "./subcategory_wise_expense_report.php?id=<?php echo $project_id ?>"> <?php echo $project_name?>: Sub-category wise expenses report </a></h4>
			
			<!--
				Detailed expense report.
			-->
			<h4><a href = "./detailed_project_expense_report.php?id=<?php echo $project_id ?>"> <?php echo $project_name?>: Detailed project wise expenses report </a></h4>
			
		<hr />
	</body>
</html>	