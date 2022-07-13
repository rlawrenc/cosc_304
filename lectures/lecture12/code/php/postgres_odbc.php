<!DOCTYPE html>
<html>
<head>
<title>Test PostgreSQL ODBC</title>
</head>
<body>

<?php
echo "Test Access to PostgreSQL using ODBC\n";

$conn=odbc_connect("tpch",  "rlawrenc", "todo");	
if (!$conn)
{
	exit("Connection to the database Failed: " . $conn);
}
	
$sql="SELECT * FROM Nation";
	
$resultSet=odbc_exec($conn, $sql);

if (!$resultSet)
{
	exit("Error!");
}

echo "<table><tr>";
while (odbc_fetch_row($resultSet))
{
	$nkey=odbc_result($resultSet,"n_nationkey");
	$nname=odbc_result($resultSet,"n_name");
	echo "<tr><td>$nkey</td>";
	echo "<td>$nname</td></tr>";
}
	   
odbc_close($conn);
echo "</table>";
?>



</body>
</html>

