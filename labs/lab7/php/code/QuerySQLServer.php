<html>
<head>
<title>Query Microsoft SQL Server Using PHP</title>
</head>

<body>
<!--
Note: Requires to be run on Linux and PHP 7.
Install details at: https://www.microsoft.com/en-us/sql-server/developer-get-started/php/rhel/step/2.html
 -->
<?php
	$username = "fill-in";
	$password = "fill-in";
	$database = "WorksOn";
	$server = "sql04.ok.ubc.ca";
	$connectionInfo = array( "Database"=>$database, "UID"=>$username, "PWD"=>$password, "CharacterSet" => "UTF-8");

	$con = sqlsrv_connect($server, $connectionInfo);
	if( $con === false ) {
		die( print_r( sqlsrv_errors(), true));
	}

	$sql = "SELECT ename,salary FROM emp";
	$results = sqlsrv_query($con, $sql, array());
	echo("<table><tr><th>Name</th><th>Salary</th></tr>");
	while ($row = sqlsrv_fetch_array( $results, SQLSRV_FETCH_ASSOC)) {
		echo("<tr><td>" . $row['ename'] . "</td><td>" . $row['salary'] . "</td></tr>");
	}
	echo("</table>");
?>
</body>
</html>
