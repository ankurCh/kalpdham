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
	require_once('./secure/database_details.php'); 
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
		<title>Add new expense</title>
	</head>	
	<body>
		<h3>Tools</h3>
		<a href = "addExpenses.php"> Add Expenses </a>
		<br />
		<a href = "../../index.php"> Home </a>
		<hr />
		<h3>Add new expense</h3>
		<hr />
		<table style="width:100%" border="5">
			<form id = "add_project_expense_form" name = "add_project_expense_form" action="addExpenses.php" method = "post">
				<tr>
						<td>Project: </td>
						<td>
							<?php
								//Perform database query to get list of projects.
								$db_query = "SELECT id, project_name
											FROM kalp_projects";

								$db_result = mysqli_query($db_connection,$db_query);
								
								//test if there any query error.
								if (!$db_result) {
									die("Database query failed.");
								}
								
								while ($db_row = mysqli_fetch_assoc($db_result)) {
									//Dump data from each row.
									//var_dump($db_row);
									if (isset($_POST["project_type"]) && $_POST["project_type"] == $db_row["id"]) {
										echo "<input type=\"radio\" name=\"project_type\" value=\"{$db_row["id"]}\" checked=\"checked\" >{$db_row["project_name"]}";
									}
									else {
										echo "<input type=\"radio\" name=\"project_type\" value=\"{$db_row["id"]}\">{$db_row["project_name"]}";
									}
									echo "<br>";
									
								}	
								
								?>
					
						</td>
						
						<td>Sub Project: </td>
						<td>
							<?php
								//Perform database query to get list of sub projects.
								$db_query = "SELECT id, subproject_name
											FROM kalp_subprojects";

								$db_result = mysqli_query($db_connection,$db_query);
								
								//test if there any query error.
								if (!$db_result) {
									die("Database query failed.");
								}
								
								while ($db_row = mysqli_fetch_assoc($db_result)) {
									if (isset($_POST["project_subtype"]) && $_POST["project_subtype"] == $db_row["id"]) {
										echo "<input type=\"radio\" name=\"project_subtype\" value=\"{$db_row["id"]}\" checked=\"checked\">{$db_row["subproject_name"]}";
									}
									else {
										echo "<input type=\"radio\" name=\"project_subtype\" value=\"{$db_row["id"]}\">{$db_row["subproject_name"]}";
									}
									//Dump data from each row.
									//var_dump($db_row);
									
									
									echo "<br>";
									
								}	
								
								?>
					
						</td>
				</tr>
				<tr>
					<td>Expense category:</td>
					<td>
						<select name="category_id" id="category_id_list" onchange="updateSubCategory('category_id_list')">
							<option value="">Select category</option>
							<?php
								//Perform database query to get list of expense categories.
								$db_query = "SELECT id, category_name FROM kalp_exp_category";

								$db_result = mysqli_query($db_connection,$db_query);
								
								//test if there any query error.
								if (!$db_result) {
									die("Database query failed.");
								}
								
									while ($db_row = mysqli_fetch_assoc($db_result)) {
										//Dump data from each row.
										//var_dump($db_row);
										echo "<option value=\"{$db_row["id"]}\">{$db_row["category_name"]}</option>";
										
										echo "<br>";
										
									}	
								
							?>
						</select>
					</td>
					
					<td>Expense sub category:</td>
					<td>
						<select name="subcategory_id" id="subcategory_id_list" onchange="updateBeneficiary('subcategory_id_list')">
							<option value="">Select category first</option>
						</select>
						<?php
							//Perform database query to get list of expense categories.
							$db_query = "SELECT kalp_exp_category.id AS category_id, kalp_exp_category.category_name, kalp_exp_subcategory.subcategory_name , kalp_exp_subcategory.id
								FROM kalp_exp_category
									INNER JOIN kalp_exp_subcategory
										ON kalp_exp_category.id = kalp_exp_subcategory.category_id
									INNER JOIN kalp_exp_subcategory_stats
										ON kalp_exp_subcategory.id = kalp_exp_subcategory_stats.subcategory_id
										AND kalp_exp_category.id = kalp_exp_subcategory_stats.category_id
								ORDER BY kalp_exp_subcategory_stats.subcategory_usage DESC, kalp_exp_subcategory_stats.last_use_date DESC;";

							$db_result = mysqli_query($db_connection,$db_query);
							
							//Create a variable for counter. This variable will drive the location of a sub category. A sub category can be placed in radio button or/and in a drop down list based on its frequency of usage.
							$tmp_cntr = 0;
							
							//test if there any query error.
							if (!$db_result) {
								die("Database query failed.");
							}
							//diplay sub category values into drop down list.
							/*while ($db_row = mysqli_fetch_assoc($db_result)) {
								if ($tmp_cntr < 6) {
								
									echo "<input type=\"radio\" name=\"subcategory_id_main\" value=\"{$db_row["id"]}\">{$db_row["category_name"]} :: {$db_row["subcategory_name"]}";
									
									echo "<br>";
									
									
								}
								else {
									if ($tmp_cntr == 6) {
										echo "<select name=\"subcategory_id\">";
									}
									echo "<option value=\"{$db_row["id"]}\">{$db_row["category_name"]} :: {$db_row["subcategory_name"]}</option>";
									
									echo "<br>";
								}
								
								$tmp_cntr = $tmp_cntr + 1;
							}
							
							echo "</select>";
							*/	
							while ($db_row = mysqli_fetch_assoc($db_result)) {
							
								$subcategory_info[] = array("category" => $db_row["category_name"], "subcategory" =>$db_row["subcategory_name"], "id" => $db_row["id"], "category_id" => $db_row["category_id"]);
								
							}
							
							if ($echo_information == 1) {
								var_dump($subcategory_info);
							}
						?>
						
						<!--
							generate sub category drop down list dynamically
						-->
						<script>
							//convert php array into javascript array.
							var subcategory_list = <?php echo json_encode($subcategory_info);?>;
							
							//Use updateSubCategory function to dynamically populate values in sub category drop down list based on selected category.
							function updateSubCategory(category_id){
								//Crerate a variable to refer category drop down list.
								var category_ref = document.getElementById(category_id);
								
								//Crerate a variable to refer selected category_id.
								var category_val = category_ref.value;
								
								//Crerate a variable to refer sub category drop down list.
								var subcategory_ref = document.getElementById("subcategory_id_list");
								
								//remove all existing child nodes of subcategory drop down list.
								subcategory_ref.innerHTML = '';
								
								//console.log(subcategory_list);
								//console.log(document.getElementById(category_id).value);
								
								//create one dummy element into subcategory drop down. THis is to ensure that we will always trigger JS funciton updateBeneficiary (to pupulate beneficiary values dynamically)
								var el = document.createElement("option");
								el.textContent = "##select subcategory##";
								el.value = "";
								subcategory_ref.appendChild(el);
					
								
								for(var i = 0; i < subcategory_list.length; i++) {
								
									//Choose one subcategory. This will also be an array.
									var aSubCategory = subcategory_list[i];
									if (category_val == aSubCategory["category_id"]) {
										//if category_id of select category matches the category id of array then display it.
										//console.log(aSubCategory);
										//Create a sub category drop down list element.
										var el = document.createElement("option");
										el.textContent = aSubCategory["subcategory"];
										el.value = aSubCategory["id"];
										subcategory_ref.appendChild(el);
									}
								}
							}


						</script>
				
					</td>
				</tr>
				<tr>
						<td>Date of expense:</td>
						<td>
							<input type="date" name="expense_date" value="<?php if (isset($_POST["expense_date"])) {echo $_POST["expense_date"];} else { echo date('Y-m-d');} ?>" min="2012-01-01" max="2025-01-01">
						</td>
						<td>Amount:</td>
						<td><input type="number" name="expense_amount" min="0"></td>
				</tr>
				<tr>
					<td>Remark:</td>
					<td><input type="text" name="expense_remark"></td>
					<td>Per unit cost:</td>
					<td><input type="text" name="expense_unit_cost" value="-1"></td>
				</tr>
				<tr>
					<td>Select beneficiary:</td>
					<td>
						<select name="beneficiary_id" id="beneficiary_id_list">
							<option value="">Select subcategory first</option>
						</select>
						<!--
							Fatch list of all beneficiary and their mapped sub categories into an array.
							This array will be used to display (dynamic list) beneficiary when user select a relevant sub category.
						-->
						<?php
							//Perform database query to get mapping of beneficiary and subcategory.
							$db_query = "SELECT kalp_exp_beneficiary.id AS beneficiary_id, kalp_exp_subcategory.id AS subcategory_id, kalp_exp_beneficiary.beneficiary_name,  kalp_exp_subcategory.subcategory_name
							FROM kalp_exp_beneficiary
								INNER JOIN kalp_exp_benef_subcat_map
									ON kalp_exp_beneficiary.id = kalp_exp_benef_subcat_map.beneficiary_id
								INNER JOIN kalp_exp_subcategory
									ON kalp_exp_subcategory.id = kalp_exp_benef_subcat_map.subcategory_id";

							$db_result = mysqli_query($db_connection,$db_query);
							
							//test if there any query error.
							if (!$db_result) {
								die("Database query failed.");
							}
								
							while ($db_row = mysqli_fetch_assoc($db_result)) {
							
								$beneficiary_info[] = array("beneficiary_id" => $db_row["beneficiary_id"], "subcategory_id" =>$db_row["subcategory_id"], "beneficiary_name" => $db_row["beneficiary_name"], "subcategory_name" => $db_row["subcategory_name"]);
								
							}
							if ($echo_information == 1) {
								var_dump($beneficiary_info);
							}
						?>
						
						<!--
							generate beneficiary drop down list dynamically.
						-->
						<script>
							//convert php array into javascript array.
							var beneficiary_info = <?php echo json_encode($beneficiary_info);?>;
							
							//Use updateBeneficiary function to dynamically populate values in beneficiary drop down list based on selected subcategory.
							function updateBeneficiary(subcategory_id){
								//Crerate a variable to refer subcategory drop down list element.
								var subcategory_ref = document.getElementById(subcategory_id);
								
								//Crerate a variable to refer selected subcategory_id.
								var subcategory_val = subcategory_ref.value;
								
								//Crerate a variable to refer beneficiary drop down list element.
								var beneficiary_ref = document.getElementById("beneficiary_id_list");
								
								//remove all existing child nodes of beneficiary drop down list.
								beneficiary_ref.innerHTML = '';
								
								
								for(var i = 0; i < beneficiary_info.length; i++) {
								
									//Choose one beneficiary. This will also be an array.
									var aBeneficiary = beneficiary_info[i];
									if (subcategory_val == aBeneficiary["subcategory_id"]) {
										//if subcategory_id of select subcategory matches the subcategory_id of array then display it.
										//console.log(aBeneficiary);
										//Create a sub category drop down list element.
										var el = document.createElement("option");
										el.textContent = aBeneficiary["beneficiary_name"];
										el.value = aBeneficiary["beneficiary_id"];
										beneficiary_ref.appendChild(el);
									}
								}
							}


						</script>
					</td>
					<td><input type = "submit" name = "submit" value = "Submit"/></td>
				</tr>
				
			</form>	
		</table>	

		<!--
			Add some javascript for valiations.
		-->
		
	</body>	
</html>

<!--
	Verify the details of form.
	If details are correct then add expense into database.
-->
<?php
	//Check if form is submitted.
	if (isset($_POST["submit"])){
		//Get form data into variables.
		$project_type_id 		= $_POST["project_type"];
		$project_subtype_id 	= $_POST["project_subtype"];
		$expense_date 			= $_POST["expense_date"];
		$category_id 			= $_POST["category_id"];
		
		if (isset($_POST["subcategory_id_main"])){
			$subcategory_id 		= $_POST["subcategory_id_main"];
		}
		else {
			$subcategory_id 		= $_POST["subcategory_id"];
		}
		
		$expense_amount 		= $_POST["expense_amount"];
		$expense_remark 		= $_POST["expense_remark"];
		
		if (isset($_POST["expense_unit_cost"])) {
			$expense_unit_cost 		= $_POST["expense_unit_cost"];
		}
		else {
			//-1 means not defined.
			$expense_unit_cost 		= -1;
		}
		
		$beneficiary_id = $_POST["beneficiary_id"];
		
		if ($echo_information == 1) {
			
			echo 	 $project_type_id; 	
			echo     $project_subtype_id; 
			echo     $expense_date; 		
			echo     $category_id; 		
			echo     $subcategory_id; 	
			echo     $expense_amount; 	
			echo     $expense_remark; 	
			echo     $expense_unit_cost; 	
			echo     $beneficiary_id; 	
		}
		else {
			//Insert the expense details into database.
			$set_expense = "INSERT INTO kalp_project_exp_details(when_created, project_id, subproject_id, expense_date,category_id, subcategory_id, amount, remark, per_unit_cost, beneficiary_id)
			VALUES ('{$when_created}', {$project_type_id}, {$project_subtype_id}, '{$expense_date}', {$category_id}, {$subcategory_id}, {$expense_amount}, '{$expense_remark}', {$expense_unit_cost}, {$beneficiary_id})";

			$db_result = mysqli_query($db_connection,$set_expense);	
			
			//test if there any query error.
			if (!$db_result) {
				die("Error while inserting expense values.");
			}			
			else if($echo_information == 1){
				echo "Expense amount {$expense_amount} successfully saved in database.";
			}
			
			//Insert exp category stats.
			$set_category_stats = "UPDATE kalp_exp_category_stats
									SET category_usage = category_usage + 1,
										last_use_date = '{$when_created}'
									WHERE category_id = {$category_id}";
									
			$db_result = mysqli_query($db_connection,$set_category_stats);	
			
			//test if there any query error.
			if (!$db_result) {
				die("Error while inserting expense stats.");
			}			
			else if($echo_information == 1){
				echo "Category stats successfully saved in database.";
			}

			//Insert exp subcategory stats.
			$set_subcategory_stats = "UPDATE kalp_exp_subcategory_stats
									SET subcategory_usage = subcategory_usage + 1,
										last_use_date = '{$when_created}'
									WHERE subcategory_id = {$subcategory_id}";
									
			$db_result = mysqli_query($db_connection,$set_subcategory_stats);

			//test if there any query error.
			if (!$db_result) {
				die("Error while inserting expense stats.");
			}			
			else if($echo_information == 1){
				echo "Subcategory stats successfully saved in database.";
			}
			
			echo "Expense amount {$expense_amount} successfully saved in database.";
		}
		
	}
?>

<!--
	Close the connection.
-->
<?php
	//Close connection.
	mysqli_close($db_connection);

?>