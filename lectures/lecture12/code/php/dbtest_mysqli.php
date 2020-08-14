<!DOCTYPE html>
<html>
<head>
<title>Test DB Access with MySQLI Interface</title>
</head>
<body>

<?php
// Procedural version

echo "<h2>Procedural version</h2>";

// Connecting, selecting database
$mysqli = mysqli_connect("cosc304.ok.ubc.ca", "rlawrenc", "todo", "db_rlawrenc")
    or die("Could not connect: " . mysql_error());

echo "<p>Connected successfully</p>";

// Performing SQL query
$query = "SELECT * FROM emp";
$result = mysqli_query($mysqli, $query); // or die("Query failed: " . mysql_error());
if (mysqli_connect_errno($mysqli)) {
    echo "<p>Failed to connect to MySQL: " . mysqli_connect_error() . "</p>";
}

echo "<p>Query success</p>";

// Printing results in HTML
echo "<table>\n";
while ($line = mysqli_fetch_assoc($result)) 
{
    echo "\t<tr>\n";
    foreach ($line as $col_value) {
        echo "\t\t<td>$col_value</td>\n";
    }
    echo "\t</tr>\n";
}
echo "</table>\n";

// Free resultset
mysqli_free_result($result);

// Closing connection
mysqli_close($mysqli);

echo "<h2>Object-oriented version</h2>";

// OO Version
$mysqli = new mysqli("cosc304.ok.ubc.ca", "rlawrenc", "todo", "db_rlawrenc");
if ($mysqli->connect_errno) {
    echo "<p>Failed to connect to MySQL: " . $mysqli->connect_error . "</p>";
}

$result = $mysqli->query($query);

// Printing results in HTML
echo "<table>\n";
while ($line = $result->fetch_assoc())
{
    echo "\t<tr>\n";
    foreach ($line as $col_value) {
        echo "\t\t<td>$col_value</td>\n";
    }
    echo "\t</tr>\n";
}
echo "</table>\n";

// Free resultset
$result->free();

// Closing connection
$mysqli->close();
?>

</body>
</html>

