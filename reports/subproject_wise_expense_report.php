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
		<title>Sub-project wise expenses report</title>
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
	Subproject wise expense report.
-->
<?php
	echo "<h4>{$project_name} : Subproject wise expense</h3>";
	echo "<br>";
?>
<!--
	First create a upper table to hold actual data and chart in two columns.
-->
<table style="width:100%" border="5">
<tr>
	<td>
		<?php
				
			
			//Now display the expense details.
			$db_query = "SELECT kalp_subprojects.subproject_name, kalp_subprojects.color_code, SUM( kalp_project_exp_details.amount) AS exp_amount, ((SUM( kalp_project_exp_details.amount) * 100)/{$total_expense}) AS relative_contribution, kalp_subprojects.color_code
						FROM kalp_project_exp_details 
								INNER JOIN kalp_subprojects
									ON kalp_project_exp_details.subproject_id = kalp_subprojects.id
						WHERE kalp_project_exp_details.project_id = {$project_id}
						GROUP BY kalp_subprojects.subproject_name
						ORDER BY 2 DESC";

			$db_result = mysqli_query($db_connection,$db_query);
			
			//test if there any query error.
			if (!$db_result) {
				die("Database query failed.");
			}
			
			//display the result set into a table.
			//Inner table will hold only data.
			echo "<table style=\"width:100%\" border=\"2\">";
				echo "<tr>
						<th>subproject name</th>
						<th>amount</th>
						<th>% contribution</th>
						<th>subproject color</th>
					</tr>";
				
				while ($db_row = mysqli_fetch_assoc($db_result)){
					
					echo "<tr>
							<td id=\"subproject_name_table\">{$db_row["subproject_name"]}</td>
							<td>{$db_row["exp_amount"]}</td>
							<td>{$db_row["relative_contribution"]}</td>
							<td><span style=\"background:{$db_row["color_code"]}\">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
						</tr>";
						
					$subproject_info[] = array("value" => $db_row["exp_amount"], "color" =>$db_row["color_code"], "label" => $db_row["subproject_name"]);
				}
				
				echo "<tr>
						<th>Total</th>
						<th>{$total_expense}</th>
						<th>100</th>
					</tr>";
			
			echo "</table>"; //inner table end.
			//var_dump($subproject_info);
		?>
	</td>
	<td>
		<!--
			Create a chart.
		-->
		<div id="canvas-holder">
			<canvas id="subproject-chart-area" width="300" height="300"/>
		</div>
		<script>

			var pieData = <?php echo json_encode($subproject_info);?>;
			//console.log(pieData);
			window.onload = function(){
				var ctx = document.getElementById("subproject-chart-area").getContext("2d");
				window.myPie = new Chart(ctx).Pie(pieData);
			};



		</script>
	</td>	
</tr>
</table> <!--Upper table end-->
