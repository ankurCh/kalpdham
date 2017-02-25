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
	If details are correct then add category into database.
-->
<?php
	//Check if form is submitted.
	if (isset($_POST["submit_category"])){
		//Get form data into variables.
		$category_name 			= $_POST["category_name"];
		$category_desc 			= $_POST["category_desc"];
		$category_color 		= $_POST["category_color"];
		
		if ($echo_information == 1) {
			
			echo 	 $category_name; 	
			echo     $category_desc; 
			echo     $category_color; 

		}
		else {
			//Insert the category details into database.
			$add_category = "INSERT INTO kalp_exp_category(category_name, category_desc, color_code)
				VALUES ('{$category_name}', '{$category_desc}', '{$category_color}')";

			$db_result = mysqli_query($db_connection,$add_category);	
			
			//test if there any query error.
			if (!$db_result) {
				die("Error while inserting new category values.");
			}			
			else {
				echo "Category {$category_name} successfully saved in database.";
			}
			
			//Insert exp category stats.
			//First get the last inserted category id.
			$category_id = mysqli_insert_id($db_connection);
			
			$set_category_stats = "INSERT INTO kalp_exp_category_stats(category_id,category_name,category_usage)
				VALUES ({$category_id},'{$category_name}', 0)";
									
			$db_result = mysqli_query($db_connection,$set_category_stats);	

			//test if there any query error.
			if (!$db_result) {
				die("Error while inserting new category values.");
			}			
			else {
				echo "Category stats successfully saved in database.";
			}
		}
		
	}
?>

<!--
	Verify the details of form.
	If details are correct then add sub category into database.
-->
<?php
	//Check if form is submitted.
	if (isset($_POST["submit_subcategory"])){
		//Get form data into variables.
		$subcategory_name 			= $_POST["subcategory_name"];
		$category_id	 			= $_POST["category_id"];
		$subcategory_desc 			= $_POST["subcategory_desc"];
		$subcategory_color 			= $_POST["subcategory_color"];
		
		if ($echo_information == 1) {
			
			echo 	 $subcategory_name; 	
			echo 	 $category_id; 	
			echo     $subcategory_desc; 
			echo     $subcategory_color; 
		}
		else {
			//Insert the subcategory details into database.
			$add_category = "INSERT INTO kalp_exp_subcategory(subcategory_name, subcategory_desc, category_id, color_code)
				VALUES ('{$subcategory_name}', '{$subcategory_desc}', {$category_id}, '{$subcategory_color}')";

			$db_result = mysqli_query($db_connection,$add_category);	
			
			//test if there any query error.
			if (!$db_result) {
				die("Error while inserting new category values.");
			}			
			else {
				echo "Sub Category {$subcategory_name} successfully saved in database.";
			}
			
			//Insert exp category stats.
			//First get the last inserted category id.
			$subcategory_id = mysqli_insert_id($db_connection);
			
			$set_category_stats = "INSERT INTO kalp_exp_subcategory_stats(subcategory_id, category_id,subcategory_name,subcategory_usage)
				VALUES ({$subcategory_id}, {$category_id},'{$subcategory_name}', 0)";
									
			$db_result = mysqli_query($db_connection,$set_category_stats);	

			//test if there any query error.
			if (!$db_result) {
				die("Error while inserting new category values.");
			}			
			else {
				echo "Sub Category stats successfully saved in database.";
			}
		}
		
	}
?>


<html>
	<head>
		<title>Category configuration</title>
	</head>	
	<body>
			<h3>Tools</h3>
			<a href = "category.php"> Category configuration </a>
			<br />
			<a href = "../../../index.php"> Home </a>
			<hr />
			<h3>Add new category</h3>
			
			<table style="width:50%">
				<form id = "add_new_category_form" name = "add_new_category_form" action="category.php" method = "post">
					<tr>
						<td>
							Category Name:
						</td>
						<td>
							<input type="text" name="category_name">
						</td>
					</tr>
					<tr>
						<td>
							Category Desc:
						</td>
						<td>
							<input type="text" name="category_desc">
						</td>
					</tr>
					<tr>
						<td>
							Category Color:
						</td>
						<td>
							<input type="color" name="category_color" value="#ff0000">
						</td>
					</tr>
					<tr><td><input type = "submit" name = "submit_category" value = "Submit"/></td><td></td></tr>
				</form>	
			</table>
			
		<hr />
			<h3>Add new subcategory</h3>
			<table style="width:50%">
				<form id = "add_new_subcategory_form" name = "add_new_subcategory_form" action="category.php" method = "post">
					<tr>
						<td>
							Sub Category Name:
						</td>
						<td>
							<input type="text" name="subcategory_name">
						</td>
						<td>
							Category Name:
						</td>
						<td>
							<?php
								//Perform database query to get list of expense categories.
								$db_query = "SELECT id, category_name FROM kalp_exp_category";

								$db_result = mysqli_query($db_connection,$db_query);
								
								//test if there any query error.
								if (!$db_result) {
									die("Database query failed.");
								}
								echo "<select name=\"category_id\">";
									while ($db_row = mysqli_fetch_assoc($db_result)) {
										//Dump data from each row.
										//var_dump($db_row);
										echo "<option value=\"{$db_row["id"]}\">{$db_row["category_name"]}</option>";
										
										echo "<br>";
										
									}	
								echo "</select>";
							?>
						</td>
					</tr>
					<tr>
						<td>
							Sub Category Desc:
						</td>
						<td>
							<input type="text" name="subcategory_desc">
						</td>
						<td>
							Sub Category Color:
						</td>
						<td>
							<input type="color" name="subcategory_color" value="#ffff00">
						</td>
					</tr>
					<tr><td><input type = "submit" name = "submit_subcategory" value = "Submit"/></td><td></td><td></td><td></td></tr>
				</form>	
			</table>
			
		<hr />
			<h3>List of existing categories</h3>
				<table border="5" style="width:100%">
					<tr>
						<th>category id</th>
						<th>category name</th>
						<th>category usage</th>
						<th>last use date</th>
						<th>Associated Color</th>
					</tr>
					<?php
						//Database query to get category information.
						$category_details = "SELECT kalp_exp_category_stats.category_id, kalp_exp_category_stats.category_name, kalp_exp_category_stats.category_usage, kalp_exp_category_stats.last_use_date,kalp_exp_category.color_code
												FROM kalp_exp_category_stats
													INNER JOIN kalp_exp_category
														ON kalp_exp_category_stats.category_id = kalp_exp_category.id
												ORDER BY category_usage DESC";
						
						$db_result = mysqli_query($db_connection,$category_details);
										
						//test if there any query error.
						if (!$db_result) {
							die("Database query failed.");
						}
						//Display result into table.
						while ($db_row = mysqli_fetch_assoc($db_result)) {
							
							echo "<tr>
									<td><a href=\"./category_details.php?id={$db_row["category_id"]}\">{$db_row["category_id"]}</a></td>
									<td>{$db_row["category_name"]}</td>
									<td>{$db_row["category_usage"]}</td>
									<td>{$db_row["last_use_date"]}</td>
									<td><span style=\"background:{$db_row["color_code"]}\">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
								</tr>";
							
						}	
							
					?>
				</table>	
		<hr />
			<h3>List of existing subcategories</h3>	
				<table border="5" style="width:100%">
					<tr>
						<th>subcategory id</th>
						<th>category name</th>
						<th>subcategory name</th>
						<th>subcategory usage</th>
						<th>last use date</th>
						<th>Associated Color</th>
					</tr>
					<?php
						//Database query to get sub category information.
						$subcategory_details = "SELECT kalp_exp_subcategory_stats.subcategory_id, kalp_exp_category.category_name, kalp_exp_subcategory_stats.subcategory_name, kalp_exp_subcategory_stats.subcategory_usage, kalp_exp_subcategory_stats.last_use_date,kalp_exp_subcategory.color_code
									FROM kalp_exp_subcategory_stats
										INNER JOIN kalp_exp_subcategory
											ON kalp_exp_subcategory_stats.subcategory_id = kalp_exp_subcategory.id
										INNER JOIN kalp_exp_category 
											ON kalp_exp_subcategory_stats.category_id = kalp_exp_category.id
									ORDER BY category_name, subcategory_usage DESC;";
						
						$db_result = mysqli_query($db_connection,$subcategory_details);
										
						//test if there any query error.
						if (!$db_result) {
							die("Database query failed.");
						}
						//Display result into table.
						while ($db_row = mysqli_fetch_assoc($db_result)) {
							
							echo "<tr>
									<td><a href=\"./subcategory_details.php?id={$db_row["subcategory_id"]}\">{$db_row["subcategory_id"]}</a></td>
									<td>{$db_row["category_name"]}</td>
									<td>{$db_row["subcategory_name"]}</td>
									<td>{$db_row["subcategory_usage"]}</td>
									<td>{$db_row["last_use_date"]}</td>
									<td><span style=\"background:{$db_row["color_code"]}\">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
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