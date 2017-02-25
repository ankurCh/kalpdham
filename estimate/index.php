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
	else {
		if ($echo_information == 1)
		{
			echo "hi";
		}
		
	}
				
?>

<html>
	<head>
		<title>Material and cost estimation module</title>
	</head>	
	<body>
		<h3>Tools</h3>
		<a href = "estimation_config.php">Estionmation Related Configuration </a>
		<br />
		<a href = "../index.php"> Home </a>
		<hr />
		<h3>Material Estimation for concrete</h3>
		<h4>Material Estimation for concrete road</h4>
		<table style="width:50%">
			<form id = "estimate_cc_road_material_cost" name = "estimate_cc_road_material_cost" action="index.php" method = "post">
				<tr>
					<td>Strength of Road</td>
					<td>
						<?php
							//Perform database query to get list of strength type available.
							$db_query = "SELECT distinct concrete_strength_28day_MPA FROM kalp_cost_config_concrete_mix";

							$db_result = mysqli_query($db_connection,$db_query);
							
							//test if there any query error.
							if (!$db_result) {
								die("Database query failed.");
							}
							echo "<select name=\"cc_road_strength\">";
								while ($db_row = mysqli_fetch_assoc($db_result)) {
									//Dump data from each row.
									//var_dump($db_row);
									echo "<option value=\"{$db_row["concrete_strength_28day_MPA"]}\">{$db_row["concrete_strength_28day_MPA"]}</option>";
									
									echo "<br>";
									
								}	
							echo "</select>";
						?>
					</td>
				</tr>
				<tr>
					<td>Length of Road (in Metre)</td>
					<td><input type="text" name="road_length_metre"></td>
				</tr>
				<tr>
					<td>Width of Road (in Metre)</td>
					<td><input type="text" name="road_width_metre"></td>
				</tr>
				<tr>
					<td>Depth of Road (in Metre)</td>
					<td><input type="text" name="road_depth_metre"></td>
				</tr>
				<tr><td><input type = "submit" name = "submit_cc_road_param" value = "Submit"/></td><td></td><td></td><td></td></tr>
			</form>		
		</table>
	</body>
</html>

<!--
	Verify the details of form.
	If details are correct then add category into database.
-->
<?php
	//Check if form is submitted.
	if (isset($_POST["submit_cc_road_param"])){
		//Get form data into variables.
		$cc_road_strength			= $_POST["cc_road_strength"];
		$cc_road_length				= $_POST["road_length_metre"];
		$cc_road_width				= $_POST["road_width_metre"];
		$cc_road_depth				= $_POST["road_depth_metre"];
		
		//Calculate volume of road in cubic metre.
		$cc_road_vol_cum = $cc_road_length * $cc_road_width * $cc_road_depth;
		
		//Display the value passed by form submission.
		echo "	<table>
					<tr><td>Value submitted are</td></tr>
					<tr><td>Desired strength of Road::</td><td>M{$cc_road_strength}</td></tr>
					<tr><td>Length of Road::</td><td>{$cc_road_length}</td></tr>
					<tr><td>Width of Road::</td><td>{$cc_road_width}</td></tr>
					<tr><td>Depth of Road::</td><td>{$cc_road_depth}</td></tr>
					<tr><td>Total volume of Road::</td><td>{$cc_road_vol_cum}</td></tr>
				</table>";
		
		if ($echo_information == 1) {
			
			echo 	 $cc_road_strength; 	
			echo     $cc_road_length; 
			echo     $cc_road_width; 
			echo     $cc_road_depth; 
			echo     $cc_road_vol_cum; 

		}
		else {
			//Now get all different configurations of cement, sand and stone with respect to strength specified.
			$db_query = "SELECT id, concrete_strength_28day_MPA, unit_mass_vol, halfstone_cement, halfstone_sand, halfstone_stone, threeforthstone_cement, threeforthstone_sand, threeforthstone_stone
											FROM kalp_cost_config_concrete_mix
											where concrete_strength_28day_MPA = {$cc_road_strength}
											ORDER BY id";

			$db_result = mysqli_query($db_connection,$db_query);
			
			//test if there any query error.
			if (!$db_result) {
				die("Database query failed.");
			}
			//echo "<select name=\"cc_road_strength\">";
			echo "<table style=\"width:100%\" border=\"5\">";
			echo "<tr>
					<!--<th>Road strength</th>-->
					<th>Units</th>
					<th>Cement</th>
					<th>Sand</th>
					<th>Stone</th>
				</tr>";
				while ($db_row = mysqli_fetch_assoc($db_result)) {
					//Dump data from each row.
					//var_dump($db_row);
					// Remember :: cum_vol_per_cum = cubic metre volume of individual ingredient per cubic metre of concrete.
					if ($db_row["unit_mass_vol"] == "cum_vol_per_cum")
					{
						//Calculate volume of individual ingredient.
						$cc_road_cement_vol = $db_row["halfstone_cement"] * $cc_road_vol_cum;
						$cc_road_sand_vol = $db_row["halfstone_sand"] * $cc_road_vol_cum;
						$cc_road_stone_vol = $db_row["halfstone_stone"] * $cc_road_vol_cum;
						
						echo "<tr>
								<!--<td>{$db_row["concrete_strength_28day_MPA"]}</td>-->
								<td>Cubic metre</td>
								<td>{$cc_road_cement_vol}</td>
								<td>{$cc_road_sand_vol}</td>
								<td>{$cc_road_stone_vol}</td>
							  </tr>";
							  
						//Now display information in more useful way i.e. using conventional paramter like number of bags for cement, number of dumphars for sand and stone.
						//Remember:-
						//1 bag of cement = 50 kg = 0.2 cubic metre.
						$cement_param = 0.2;
						//1 dumphar of sand = 400 cubic feet = 11.325 cubic metre.
						$sand_param = 11.325;
						//1 dumphar of stone = 400 cubic feet = 11.325 cubic metre.
						$stone_param = 11.325;
						
						//Now calculate information.
						$cc_road_cement_qty = $cc_road_cement_vol / $cement_param;
						$cc_road_sand_qty = round(($cc_road_sand_vol / $sand_param),3);
						$cc_road_stone_qty = round(($cc_road_stone_vol / $stone_param),3);
						
						echo "<tr>
								<!--<td>{$db_row["concrete_strength_28day_MPA"]}</td>-->
								<td>Conventional</td>
								<td>{$cc_road_cement_qty} Bag</td>
								<td>{$cc_road_sand_qty} Dumphar</td>
								<td>{$cc_road_stone_qty} Dumphar</td>
							  </tr>";
						
					}
					
					
				}	
			echo "</table>";
			//echo "</select>";
			
			
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