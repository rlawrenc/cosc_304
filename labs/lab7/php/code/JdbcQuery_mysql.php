<html>
<head>
<title>Query Results Using PHP</title>
</head>

<body>

<?php 
	$host = "cosc304_mysql";
	$database = "workson";
	$uid = "testuser";
	$pw = "304testpw";

	$mysqli = new mysqli($host, $uid, $pw, $database);

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
