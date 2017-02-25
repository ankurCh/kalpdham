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
	
	//get URL parameters.
	if (isset($_GET["id"])){
		$subcategory_id = $_GET["id"];
	}
	else {
		die("Invalid URL request.");
	}
?>

<html>
	<head>
		<title>Sub Category edit</title>
	</head>	
	<body>
		<h3>Tools</h3>
		<br />
		<a href = "./category.php">Category Home </a>
		<br />
		<a href = "./subcategory_details.php?id=<?php echo $subcategory_id?>">Undo changes</a>
		<hr />
	</body>
</html>	

<form id = "subcategory_edit" name = "subcategory_edit" action="subcategory_details.php" method = "get">
