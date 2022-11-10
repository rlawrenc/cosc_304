<html>
<head>
<title>Query MySQL Using PHP</title>
</head>

<body>

<?php 
	$host = "cosc304_mysql";   
	$database = "workson";
	$uid = "testuser";              // TODO: Update user id and password to your account
	$pw = "304testpw";

	$mysqli = new mysqli($host, $uid, $pw, $database);
	if ($mysqli->connect_errno) {
	    echo "<p>Failed to connect to MySQL: " . $mysqli->connect_error . "</p>";
		exit;
	}
	
	$sql = "SELECT ename,salary FROM emp";
	$results = mysqli_query($mysqli, $sql);	
	echo("<table><tr><th>Name</th><th>Salary</th></tr>");
	while ($row = mysqli_fetch_row($results)) {
		echo("<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td></tr>");
	}
	echo("</table>");
?>
</body>
</html>