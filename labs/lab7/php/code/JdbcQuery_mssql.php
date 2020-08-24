<html>
<head>
<title>Query Results Using PHP</title>
</head>

<body>

<?php 
	$username = "fill-in;
	$password = "fill-in";
	$database = "db_" . $username;
	$server = "sql04.ok.ubc.ca";
	$connectionInfo = array( "Database"=>$database, "UID"=>$username, "PWD"=>$password, "CharacterSet" => "UTF-8");

	$con = sqlsrv_connect($server, $connectionInfo);
	if( $con === false ) {
		die( print_r( sqlsrv_errors(), true));
	}

	$sql = "SELECT ename,salary FROM emp";
	$results = sqlsrv_query($mysqli, $sql, array());	
	echo("<table><tr><th>Name</th><th>Salary</th></tr>");
	while ($row = sqlsrv_fetch_array( $results, SQLSRV_FETCH_ASSOC)) {
		echo("<tr><td>" . $row['ename'] . "</td><td>" . $row['salary'] . "</td></tr>");
	}
	echo("</table>");
?>
</body>
</html>
