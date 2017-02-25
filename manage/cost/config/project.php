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
	If details are correct then add project into database.
-->
<?php
	//Check if form is submitted.
	if (isset($_POST["submit_project"])){
		//Get form data into variables.
		$project_name 			= $_POST["project_name"];
		$project_url 			= $_POST["project_url"];
		$project_type 			= $_POST["project_type"];
		
		if ($echo_information == 1) {
			
			echo 	 $project_name; 	
			echo     $project_url; 
			echo     $project_type; 
		}
		else {
			//Insert the project details into database.
			$add_project = "INSERT INTO kalp_projects(project_name, project_url, project_type)
				VALUES ('{$project_name}', '{$project_url}', '{$project_type}')";

			$db_result = mysqli_query($db_connection,$add_project);	
			
			//test if there any query error.
			if (!$db_result) {
				die("Error while inserting new project values.");
			}			
			else {
				echo "project {$project_name} successfully saved in database.";
			}
		}
		
	}
?>

<!--
	Verify the details of form.
	If details are correct then add sub project into database.
-->
<?php
	//Check if form is submitted.
	if (isset($_POST["submit_subproject"])){
		//Get form data into variables.
		$subproject_name 			= $_POST["subproject_name"];
		$subproject_desc 			= $_POST["subproject_desc"];
		
		if ($echo_information == 1) {
			
			echo 	 $subproject_name; 	
			echo     $subproject_desc; 

		}
		else {
			//Insert the subproject details into database.
			$add_project = "INSERT INTO kalp_subprojects(subproject_name, subproject_desc)
				VALUES ('{$subproject_name}', '{$subproject_desc}')";

			$db_result = mysqli_query($db_connection,$add_project);	
			
			//test if there any query error.
			if (!$db_result) {
				die("Error while inserting new project values.");
			}			
			else {
				echo "Sub project {$subproject_name} successfully saved in database.";
			}
		}
		
	}
?>


<html>
	<head>
		<title>Project configuration</title>
	</head>	
	<body>
			<h3>Add new project</h3>
			
			<table style="width:50%">
				<form id = "add_new_project_form" name = "add_new_project_form" action="project.php" method = "post">
					<tr>
						<td>
							project Name:
						</td>
						<td>
							<input type="text" name="project_name">
						</td>
					</tr>
					<tr>
						<td>
							project url:
						</td>
						<td>
							<input type="text" name="project_url">
						</td>
					</tr>
					<tr>
						<td>
							project type:
						</td>
						<td>
							<input type="text" name="project_type">
						</td>
					</tr>
					<tr><td><input type = "submit" name = "submit_project" value = "Submit"/></td><td></td></tr>
				</form>	
			</table>
			
		<hr />
			<h3>Add new subproject</h3>
			<table style="width:50%">
				<form id = "add_new_subproject_form" name = "add_new_subproject_form" action="project.php" method = "post">
					<tr>
						<td>
							Sub project Name:
						</td>
						<td>
							<input type="text" name="subproject_name">
						</td>
						
					</tr>
					<tr>
						<td>
							Sub project Desc:
						</td>
						<td>
							<input type="text" name="subproject_desc">
						</td>
					</tr>
					<tr><td><input type = "submit" name = "submit_subproject" value = "Submit"/></td><td></td></tr>
				</form>	
			</table>
			
		<hr />
			<h3>List of existing projects</h3>
				<table border="5" style="width:100%">
					<tr>
						<th>project id</th>
						<th>project name</th>
						<th>project url</th>
						<th>project type</th>
					</tr>
					<?php
						//Database query to get project information.
						$project_details = "SELECT id, project_name, project_url, project_type
												FROM kalp_projects";
						
						$db_result = mysqli_query($db_connection,$project_details);
										
						//test if there any query error.
						if (!$db_result) {
							die("Database query failed.");
						}
						//Display result into table.
						while ($db_row = mysqli_fetch_assoc($db_result)) {
							
							echo "<tr>
									<td>{$db_row["id"]}</td>
									<td>{$db_row["project_name"]}</td>
									<td>{$db_row["project_url"]}</td>
									<td>{$db_row["project_type"]}</td>
								</tr>";
							
						}	
							
					?>
				</table>	
		<hr />
			<h3>List of existing subprojects</h3>	
				<table border="5" style="width:100%">
					<tr>
						<th>subproject id</th>
						<th>subproject name</th>
						<th>subproject desc</th>
					</tr>
					<?php
						//Database query to get sub project information.
						$subproject_details = "SELECT id, subproject_name, subproject_desc 
												FROM kalp_subprojects";
						
						$db_result = mysqli_query($db_connection,$subproject_details);
										
						//test if there any query error.
						if (!$db_result) {
							die("Database query failed.");
						}
						//Display result into table.
						while ($db_row = mysqli_fetch_assoc($db_result)) {
							
							echo "<tr>
									<td>{$db_row["id"]}</td>
									<td>{$db_row["subproject_name"]}</td>
									<td>{$db_row["subproject_desc"]}</td>
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