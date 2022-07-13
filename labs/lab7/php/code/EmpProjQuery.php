<html>
<head>
<title>WorksOn Query Results Using PHP with HTML Forms</title>
</head>
<body>

<?php
	$host = "cosc304.ok.ubc.ca";
	$database = "workson";
	$uid = "fill-in";
	$pw = "fill-in";
	$mysqli = new mysqli($host, $uid, $pw, $database);
		
	// Get parameters from request
	$empName = $_GET['empname'];
	$projName = $_GET['projname'];
	
	// Validate that they are not empty/null
	$hasEmp = isset($empName) && strlen($empName) != 0;  		
	$hasProj= isset($projName) && strlen($projName) != 0;
	
	$sql = "SELECT E.eno, E.ename, P.pno, P.pname, resp, hours FROM emp E, workson W, proj P WHERE E.eno = W.eno and P.pno = W.pno ";
	$preparedStatement = null;
	if ($hasProj){
		$projName = "%" . $projName . "%";
	}
	if ($hasEmp) {
		$empName = "%" . $empName . "%";
		$sql = $sql . " AND ename LIKE ?";
		if ($hasProj) {
			$sql = $sql . " AND pname LIKE ?";
			$preparedStatement = mysqli_prepare($mysqli, $sql);
			mysqli_stmt_bind_param($preparedStatement, "ss", $empName, $projName);
		} else {
			$preparedStatement = mysqli_prepare($mysqli, $sql);
			mysqli_stmt_bind_param($preparedStatement, "s", $empName);
		}
	} else if ($hasProj) {
		$sql = $sql . " AND pname LIKE ?";
		$preparedStatement = mysqli_prepare($mysqli, $sql);
		mysqli_stmt_bind_param($preparedStatement, "s", $projName);
	} else {
		$preparedStatement = mysqli_prepare($mysqli, $sql);
	}
	
	mysqli_stmt_execute($preparedStatement);
	mysqli_stmt_bind_result($preparedStatement, $eno, $ename, $pno, $pname, $resp, $hours);
	
	echo("<h2>SQL Query: " . $sql ."</h2>");
	
	echo("<table><tr><th>eno</th><th>ename</th><th>pno</th><th>pname</th><th>resp</th><th>hours</th></tr>");
	while (mysqli_stmt_fetch($preparedStatement)){
		echo("<tr><td>" . $eno . "</td><td>" . $ename . "</td><td>" . $pno . "</td><td>" . 
			$pname . "</td><td>" . $resp . "</td><td>" . $hours . "</td></tr>");

	}
	echo("</table>");
	mysqli_stmt_close($preparedStatement);
	mysqli_close($mysqli);
?>
</body>
</html>
