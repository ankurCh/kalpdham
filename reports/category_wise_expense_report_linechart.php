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
	
	//get project_id parameters.
	//If user came from reports project home page (like http://localhost/com/kalpdham/reports/project_expense_report.php?id=1) then this URL will contain a id parameter (GET).
	//If user came from this page itself(like selecting expense date ranges) then this page URL will have a project_id parameter (POST)
	if (isset($_GET["id"])){
		$project_id = $_GET["id"];
	}
	else if (isset($_POST["project_id"])){
		$project_id = $_POST["project_id"];
	}
	else {
		die("Invalid URL request.");
	}
	
	//get expense date range parameter.
	//These parameters were only set if user came from this page itself by selecting date ranges.
	//min date -- range start.
	if (isset($_POST["min_expense_date"])) {
		$min_expense_date = date('Y-m-d',strtotime($_POST["min_expense_date"]));
	}
	else {
		$min_expense_date = date('Y-m-d',strtotime("2012-01-01"));
	}
	//max date -- range end.
	if (isset($_POST["max_expense_date"])) {
		$max_expense_date = date('Y-m-d',strtotime($_POST["max_expense_date"]));
	}
	else {
		$max_expense_date = date('Y-m-d',strtotime("2025-01-01"));
	}
	
	//debugging
	if ($echo_information == 1) {
		echo $min_expense_date;
		echo "<br />";
		echo $max_expense_date;
		echo "<br />";
		echo $project_id;
	}
?>

<html>
	<head>
		<title>Category wise expenses report</title>
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
				WHERE kalp_project_exp_details.project_id = {$project_id}
					AND kalp_project_exp_details.expense_date >= STR_TO_DATE('{$min_expense_date}','%Y-%m-%d')
					AND kalp_project_exp_details.expense_date <= STR_TO_DATE('{$max_expense_date}','%Y-%m-%d')";

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
	Database query to get expense data.
	Get whole data relevant to project in single query.
	Do not group it.
	
	Pass this information into javascript array and do all the manipulations there.
-->
<?php
	$db_query = "SELECT kalp_project_exp_details.id AS expense_id, kalp_exp_category.id AS category_id, kalp_exp_category.category_name, kalp_project_exp_details.subproject_id, kalp_subprojects.subproject_name, kalp_project_exp_details.expense_date, kalp_exp_category.color_code, kalp_project_exp_details.amount
					FROM kalp_project_exp_details 
							INNER JOIN kalp_exp_category
								ON kalp_project_exp_details.category_id = kalp_exp_category.id
							INNER JOIN kalp_subprojects
								ON kalp_project_exp_details.subproject_id = kalp_subprojects.id
					WHERE kalp_project_exp_details.project_id = {$project_id}
						AND kalp_project_exp_details.expense_date >= STR_TO_DATE('{$min_expense_date}','%Y-%m-%d')
						AND kalp_project_exp_details.expense_date <= STR_TO_DATE('{$max_expense_date}','%Y-%m-%d')
					ORDER BY 1";

	$db_result = mysqli_query($db_connection,$db_query);
	
	//test if there any query error.
	if (!$db_result) {
		die("Database query failed.");
	}
	
	while ($db_row = mysqli_fetch_assoc($db_result)){
		
		//$expense_info array will have all the necessary records.
		//create an extra key-value pair in array. its key will be "_is_hidden". this key will be used to manipulate the array. If its value is 0 then its not hidden else its hidden. This is remove the need of two javascript array. We can do all the manipulations using single array.
		$expense_info[] = array(
							"expense_id" => $db_row["expense_id"],
							"category_id" => $db_row["category_id"],
							"category_name" => $db_row["category_name"],
							"subproject_id" => $db_row["subproject_id"],
							"subproject_name" => $db_row["subproject_name"],
							"expense_date" => $db_row["expense_date"],
							"color_code" => $db_row["color_code"],
							"amount" => $db_row["amount"],
							"_is_hidden" => 0);
	}
	
	//debugging step
	if($echo_information == 1){	
		var_dump($expense_info);
	}	
?>

<!--
	Category wise expense report.
-->
<h4><?php echo $project_name ?> : Category wise expense</h4>
<h5>Apply filters</h5>
<br>

<!--
	First filter is related to sub projects associated with this project.
-->
<table style="width:50%" border="2">
	<tr>
		<th>Expense Date Range</th>
		<td>
			<form id = "select_expense_date" name = "select_expense_date" action="category_wise_expense_report.php" method = "post">
				<?php
					//database query to get min and max expense date of project.
					$project_date = "SELECT DATE(MIN(expense_date)) AS min_exp_date, DATE(MAX(expense_date)) AS max_exp_date
										FROM kalp_project_exp_details
										WHERE project_id = {$project_id}
											AND kalp_project_exp_details.expense_date >= STR_TO_DATE('{$min_expense_date}','%Y-%m-%d')
											AND kalp_project_exp_details.expense_date <= STR_TO_DATE('{$max_expense_date}','%Y-%m-%d')";
					
					$db_result = mysqli_query($db_connection,$project_date);
									
					//test if there any query error.
					if (!$db_result) {
						die("Database query failed.");
					}
					
					//Initilize the date variables.
					$min_project_exp_date;
					$max_project_exp_date;
					
					while ($db_row = mysqli_fetch_assoc($db_result)) {
						
							$min_project_exp_date = $db_row["min_exp_date"];
							$max_project_exp_date = $db_row["max_exp_date"];
						
					}
				?>
				<input type="date" name="min_expense_date" value="<?php echo $min_project_exp_date;?>" min="2012-01-01" max="2025-01-01">
				to
				<input type="date" name="max_expense_date" value="<?php echo $max_project_exp_date;?>" min="2012-01-01" max="2025-01-01">
				&nbsp&nbsp&nbsp&nbsp
				<input type = "hidden" name = "project_id" value="<?php echo $project_id?>">
				<input type = "submit" name = "submit" value = "GO"/>
			</form>		
		</td>
	</tr>
	<tr>
		<th>Sub projects</th>
		<td>
			<?php
				//database query to get list of all the subprojects.
				$subproject_mapping = "SELECT CONCAT('<input type=\"checkbox\" name=\"sub_project_check[]\"  id=\"',CONCAT(\"sub_project_check\",kalp_subprojects.id),'\" value=\"',kalp_subprojects.id,'\" onchange=\"updateSubProject(''',CONCAT(\"sub_project_check\",kalp_subprojects.id),''')\" checked >', kalp_subprojects.subproject_name,'<br>') AS checkbox_data
						FROM kalp_projects 
							INNER JOIN kalp_subprojects_mapping
								ON kalp_projects.id = kalp_subprojects_mapping.project_id
							INNER JOIN kalp_subprojects
								ON kalp_subprojects.id = kalp_subprojects_mapping.subproject_id
						WHERE kalp_projects.id = {$project_id}";
				
				$db_result = mysqli_query($db_connection,$subproject_mapping);
								
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
	
</table>
	
<!--
	First create a upper table to hold actual data and chart in two columns.
-->
<table id="category_expense_mastertable" style="width:100%" border="1">
<tr>
	<td id="category_expense_mastertable_data">
	<?php
			
		//Now display the expense details.
		$db_query = "SELECT kalp_exp_category.category_name, kalp_exp_category.color_code, SUM(kalp_project_exp_details.amount) AS exp_amount, ((SUM( kalp_project_exp_details.amount) * 100)/{$total_expense}) AS relative_contribution
						FROM kalp_project_exp_details 
								INNER JOIN kalp_exp_category
									ON kalp_project_exp_details.category_id = kalp_exp_category.id
						WHERE kalp_project_exp_details.project_id = {$project_id}
							AND kalp_project_exp_details.expense_date >= STR_TO_DATE('{$min_expense_date}','%Y-%m-%d')
							AND kalp_project_exp_details.expense_date <= STR_TO_DATE('{$max_expense_date}','%Y-%m-%d')
						GROUP BY kalp_exp_category.category_name
						ORDER BY 3 DESC";

		$db_result = mysqli_query($db_connection,$db_query);
		
		//debugging
		if ($echo_information == 1) {
			echo $db_query;
		}
		
		//test if there any query error.
		if (!$db_result) {
			die("Database query failed.");
		}
		
		//display the result set into a table.
		echo "<table id=\"category_expense_mainrtable\" style=\"width:100%\" border=\"5\">";
			echo "<tr>
					<th>Category name</th>
					<th>amount</th>
					<th>% contribution</th>
					<th>Category Color</th>
				</tr>";
			
			while ($db_row = mysqli_fetch_assoc($db_result)){
				
				echo "<tr>
						<td>{$db_row["category_name"]}</td>
						<td>{$db_row["exp_amount"]}</td>
						<td>{$db_row["relative_contribution"]}</td>
						<td><span style=\"background:{$db_row["color_code"]}\">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
					</tr>";
					
					$category_info[] = array("value" => $db_row["exp_amount"], "color" =>$db_row["color_code"], "label" => $db_row["category_name"]);
			}
			
			echo "<tr>
					<th>Total</th>
					<th>{$total_expense}</th>
					<th>100</th>
				</tr>";
		
		echo "</table>";
	?>
	</td>
	<td>
		<!--
			Create a chart.
		-->
		<div id="canvas-holder1">
			<canvas id="category-chart-area" width="300" height="300"/>
		</div>
		<script>

			var pieData = <?php echo json_encode($category_info);?>;
			//console.log(pieData);
			window.onload = function(){
				var ctx = document.getElementById("category-chart-area").getContext("2d");
				var myPieChart = new Chart(ctx).Pie(pieData);
				window.myPie = myPieChart;
			};


			//convert php array which contains raw expenses information into javascript array.
			//Create two copies of array. One master array will be used as reference and will remain static.
			//Copy array gets modifed.
			//var expense_info_master = <?php echo json_encode($expense_info);?>;
			var expense_info_copy = <?php echo json_encode($expense_info);?>;
			
			//Use updateBeneficiary function to dynamically populate values in beneficiary drop down list based on selected subcategory.
			function updateSubProject(subproject_id){
				//console.log(subproject_id);
				//console.log(expense_info_copy);
				
				//Crerate a variable to refer subproject checkbox element.
				var subproject_ref = document.getElementById(subproject_id);
				//Crerate a variable to refer selected subproject_id.
				var subproject_val = subproject_ref.value;
				
				//Check if this checkbox gets checked or uncheked.
				if (subproject_ref.checked) {
					//console.log(subproject_val);
					//console.log('checked');
					for (var i = 0; i < expense_info_copy.length; i++) {
						if (expense_info_copy[i]["subproject_id"] == subproject_val) {
							expense_info_copy[i]["_is_hidden"] = 0;
						}
					}
				}
				else {
					//console.log(subproject_val);
					//console.log('unchecked');
					for (var i = 0; i < expense_info_copy.length; i++) {
						if (expense_info_copy[i]["subproject_id"] == subproject_val) {
							expense_info_copy[i]["_is_hidden"] = 1;
						}
					}
				}
				//console.log(expense_info_copy);
				
				//Now reset the amount key of pieData array for each element in the array.
				for (var j = 0; j < pieData.length; j++) {
					pieData[j]["value"] = 0;
				}
				
				//Create a variable to hold sum of all expenses. This will be used in calculating % contribution.
				var total_expense = 0;
				//again iterate expense_info_copy array and use it to repopulate pieData array.
				for (var i = 0; i < expense_info_copy.length; i++) {
					if (expense_info_copy[i]["_is_hidden"] == 1) {
						continue;
					}
					else {
						for (var j = 0; j < pieData.length; j++) {
						
							if (pieData[j]["label"] == expense_info_copy[i]["category_name"]) {
								pieData[j]["value"] = parseFloat(pieData[j]["value"]) + parseFloat(expense_info_copy[i]["amount"]);
								
								total_expense = parseFloat(total_expense) + parseFloat(expense_info_copy[i]["amount"]);
							}
						}
					}
				}
				
				//console.log(pieData);
				//Now reload the chart.
				var element = document.getElementById("category-chart-area");
				element.parentNode.removeChild(element);
				
				var canv = document.createElement('canvas');
				canv.id = 'category-chart-area';
				canv.setAttribute("width", "300");
				canv.setAttribute("height", "300");
				document.getElementById('canvas-holder1').appendChild(canv);
				
				var ctx = document.getElementById("category-chart-area").getContext("2d");
				var myPieChart = new Chart(ctx).Pie(pieData);
				window.myPie = myPieChart;
				
				//Now reload the table.
				//For this first delete all the child elements of table.
				var table_element = document.getElementById("category_expense_mainrtable");
				table_element.parentNode.removeChild(table_element);
				
				//Now create the table.
				var cate_exp_tab = document.createElement('table');
				cate_exp_tab.id = 'category_expense_mainrtable';
				cate_exp_tab.setAttribute("style", "width:100%");
				cate_exp_tab.setAttribute("border", "5");
				document.getElementById('category_expense_mastertable_data').appendChild(cate_exp_tab);
				
				//table header.
				var cate_exp_tab_header_row = document.createElement('tr');
				cate_exp_tab_header_row.id = 'category_expense_mainrtable_header_row';
				document.getElementById('category_expense_mainrtable').appendChild(cate_exp_tab_header_row);
				document.getElementById("category_expense_mainrtable_header_row").innerHTML = "<th>Category name</th>		<th>amount</th><th>% contribution</th><th>Category Color</th>";
				
				//table data.
				for (var j = 0; j < pieData.length; j++) {
						var cate_exp_tab_row = document.createElement('tr');
						cate_exp_tab_row.id = 'category_expense_mainrtable_row' + j;
						document.getElementById('category_expense_mainrtable').appendChild(cate_exp_tab_row);
						document.getElementById("category_expense_mainrtable_row" + j).innerHTML = "<td>"+pieData[j]["label"]+"</td><td>"+pieData[j]["value"]+"</td><td>"+((parseFloat(pieData[j]["value"])/total_expense)*100).toFixed(2)+"</td><td><span style=\"background:"+pieData[j]["color"]+"\">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>";
						
				}
				
				//table footer.
				var cate_exp_tab_footer_row = document.createElement('tr');
				cate_exp_tab_footer_row.id = 'category_expense_mainrtable_footer_row';
				document.getElementById('category_expense_mainrtable').appendChild(cate_exp_tab_footer_row);
				document.getElementById("category_expense_mainrtable_footer_row").innerHTML = "<th>Total</th>		<th>"+total_expense+"</th><th>100</th>";
				
			}
		</script>
	</td>
</tr>	
</table>
