<!DOCTYPE html>
<html>
<head>
<title>Query Results Using PHP with PreparedStatements</title>
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
	$deptNum = $_GET['deptnum'];
	
	// Validate that they aren't empty/null
	$hasEmp = isset($empName) && strlen($empName) != 0;  		
	$hasDept= isset($deptNum) && strlen($deptNum) != 0;
	
	$sql = "SELECT ename, salary, dno FROM emp ";
	$preparedStatement = null;
	if ($hasDept && $hasEmp)
	{
		$sql = $sql . "WHERE dno = ? AND ename LIKE ?";
		$empName = "%" . $empName . "%";
		$preparedStatement = mysqli_prepare($mysqli, $sql);
		mysqli_stmt_bind_param($preparedStatement, "ss", $deptNum, $empName);
	}
	else if ($hasDept)
	{
		$sql = $sql . "WHERE dno = ?";
		$preparedStatement = mysqli_prepare($mysqli, $sql);
		mysqli_stmt_bind_param($preparedStatement, "s", $deptNum);
	}
	else if ($hasEmp)
	{
		$sql = $sql . "WHERE ename LIKE ?";
		$empName = "%" . $empName . "%";
		$preparedStatement = mysqli_prepare($mysqli, $sql);
		mysqli_stmt_bind_param($preparedStatement, "s", $empName);
	}
	else
	{
		$preparedStatement = mysqli_prepare($mysqli, $sql);
	}
	
	mysqli_stmt_execute($preparedStatement);
	mysqli_stmt_bind_result($preparedStatement, $ename, $salary, $dno);
	
	echo("<h2>SQL Query: " . $sql ."</h2>");
	
	echo("<table><tr><th>Name</th><th>Salary</th><th>dno</th></tr>");
	while (mysqli_stmt_fetch($preparedStatement)){
		echo("<tr><td>" . $ename . "</td><td>" . $salary . "</td><td>" . $dno . "</td></tr>");
	}
	echo("</table>");
	mysqli_stmt_close($preparedStatement);
	mysqli_close($mysqli);
?>
</body>
</html>
