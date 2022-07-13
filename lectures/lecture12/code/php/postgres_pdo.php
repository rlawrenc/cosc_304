<!DOCTYPE html>
<html>
<head>
<title>Test Query PostgreSQL with PHP Example</title>
</head>
<body>

<?php
// Connecting, selecting database
try
{
	$db = new PDO("pgsql:host=fillin;dbname=tpch", 'rlawrenc', 'todo');
}
catch (PDOException $ex)
{
	echo "An error occurred: " . $ex->getMessage();
}
echo "<p>Connected successfully</p>";

// Performing SQL query

// Printing results in HTML
$stmt = $db->query('SELECT * FROM Nation');

echo "<table>\n";
 
while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
foreach ($row as $col_value)   
    {    
        echo "\t\t<td>$col_value</td>\n";
    }
    echo "\t</tr>\n";
}
echo "</table>\n";


// Closing connection
$db = null;

echo "<h2>List of PDO drivers</h2>";

// Print list of drivers
print_r(PDO::getAvailableDrivers());
?>

</body>
</html>

