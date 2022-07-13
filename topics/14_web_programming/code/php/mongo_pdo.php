<!DOCTYPE html>
<html>
<head>
<title>Test Mongo PHP Example</title>
</head>
<body>

<!--
Note: This is not released to students and is not debugged/working currently on Windows. May be working on Linux server. Reference: http://php.net/manual/en/mongodb.installation.pecl.php 
 -->
<?php

echo "Test Mongo\n";

print_r(get_loaded_extensions()); 

// connect
$m = new MongoClient("mongodb://dbuser:dbuser@ds029847.mongolab.com:29847/tpch");

// select a database
$db = $m->tpch;

// select a collection (analogous to a relational database's table)
$collection = $db->nation;

// find everything in the collection
$cursor = $collection->find();

// iterate through the results
foreach ($cursor as $document) {
  //  echo $document["n_nationkey"] . "\n";
    echo print_r($document) . "\n<br>";
}

echo "Done";
?>

</body>
</html>

