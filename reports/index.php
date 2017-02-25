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
	
			
?>


<html>
	<head>
		<title>Expense reports</title>
	</head>	
	<body>
		<h3>Tools</h3>
		<br />
		<a href = "../index.php"> Home </a>
		<hr />
		<h3>Project wise expenses</h3>
			<?php
				//Perform database query to get list of all projects.
				$db_query = "SELECT id, project_name
							FROM kalp_projects";

				$db_result = mysqli_query($db_connection,$db_query);
				
				//test if there any query error.
				if (!$db_result) {
					die("Database query failed.");
				}
				
				while ($db_row = mysqli_fetch_assoc($db_result)) {
					
					echo "<a href=\"./project_expense_report.php?id={$db_row["id"]}\">{$db_row["project_name"]}</a>";
					
					echo "<br>";
					
				}	
			
			?>
		<hr />
		<h3>Category wise expense</h3>
		<hr />
		<h3>beneficiary wise expense</h3>
		<hr />
	</body>
</html>	