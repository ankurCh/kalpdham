<!DOCTYPE html>
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
	require_once('../cost/secure/database_details.php'); 
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
		<title>Customer Registration form</title>
		<script>
			function validateForm() {
				
			
				console.log("1");
				var letters =  /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/                  // validation for Full Name
				var usrname = document.forms["myForm"]["Full_Name"].value;
				if(usrname.match(letters))  
				{  
					console.log("2");
					//return true;  
				}  
				else  
				{  
					console.log("3");
					alert('user name must have alphabet characters only'); 
					console.log("4");
					return false;
				
				}
				
				console.log("0");                                   // validation for email
				var x = document.forms["myForm"]["email"].value;
				var atpos = x.indexOf("@");
				var dotpos = x.lastIndexOf(".");
				if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
					alert("Not a valid e-mail address");
					return false;
				}
				
				
				
				var numbers = /^[0-9]+$/;                                        // validation for phonnumber 
				var phonnum = document.forms["myForm"]["usrmobilenumber"].value;
				if(phonnum.match(numbers))  
				{  
					console.log("5");
					//return true;  
				}  
				else  
				{  
					console.log("6");
					alert('phonnum must have numeric characters only');  
				 
					return false;  
				}  
					
					
					var paswd=  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;      //  password validation
				var usrpass = document.forms["myForm"]["password"].value;
					if(usrpass.match(paswd))   
					{   
					//alert('Correct, try another...')  
					//return true;  
					}  
					else  
					{   
					alert('Wrong...! password between 7 to 15 characters which contain at least one numeric digit and a special character')  
					return false;  
					}  
				
				var repassword = document.forms["myForm"]["repassword"].value;
				if (usrpass != repassword) {
						alert("Passwords do not match.");
						return false;
					}
					//return true;
					
					
			}
			
		</script>
	</head>	
	<body>
		<h3>Tools</h3>
			<a href = "../../index.php"> Home </a>
		<hr />	
		<h3> User Registration Page </h3>
				
		<form name="myForm"  onsubmit="return validateForm();" method="post">
			<table>
				<tr>
					<td>Full Name:</td> 
					<td><input type="text" name="Full_Name"></td>
				<tr>
				<tr>
					<td> E-mail:</td>
					<td> <input type="email" name="email"></td>
				</tr>
				<tr>
					<td>MobileNumber:</td>
					<td> <input type="tel" name="usrmobilenumber"></td>
				</tr>
				<tr>
					<td>Passward:</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td>Re Type Passward:</td>
					<td><input type="password" name="repassword"></td>
				</tr>
				
				<tr>
					<td>Collony Name:</td> 
					<td>
						<!--<select name="Collony Name">
							<option value="kalpdham">kalpdham</option>
							<option value="girdharipuram">girdharipuram</option>
							<option value="jiya ma puram phase 1">Jiya ma puram phase 1</option>
							<option value="jiya ma puram phase 2">Jiya ma puram phase 2</option>
						</select>
						-->
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
								
									echo "<input type=\"radio\" name=\"project_name\" value=\"{$db_row["id"]}\">{$db_row["project_name"]}";
								
								echo "<br>";
							}	
							
						?>
					</td>
				</tr>
				<tr>
					<td>Plot Number:</td> 
					<td>
						<select name="Plot Number">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
					</td>
				</tr>
				
			</table>
			
				<input type="submit" value="Submit"><td></tr><br>
				
		</form>
	</body>
</html>	

<!--
	Close the connection.
-->
<?php
	//Close connection.
	mysqli_close($db_connection);

?>