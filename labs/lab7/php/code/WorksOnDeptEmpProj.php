<html>
<head>
<title>Querying WorksOn using PHP</title>
</head>
<body>

<?php
	$host = "cosc304.ok.ubc.ca";
	$database = "workson";
	$uid = "fill-in";
	$pw = "fill-in";

	$mysqli = new mysqli($host, $uid, $pw, $database);
	mysqli_query($mysqli, "SET NAMES 'UTF8'"); //Allows more character types
	$result = mysqli_query($mysqli, "SELECT dno, dname FROM dept");

	while ($row = mysqli_fetch_row($result)) {
		$dno = $row[0];
		echo("<h2>" . $dno . " : " . $row[1] . "</h2>");

		$result2 = mysqli_query($mysqli, "SELECT pno, pname, budget FROM proj WHERE dno = '" . $dno ."'");

		if ($row2 = mysqli_fetch_row($result2)) {
			echo("<H3>Project List</H3><TABLE><TH>pno</TH><TH>pname</TH><TH>budget</TH>");

			do {	
				echo("<TR><TD>" . $row2[0] . "</TD><TD>" . $row2[1] . "</TD><TD>" . $row2[2] . "</TD></TR>");
			} while ($row2 = mysqli_fetch_row($result2));

			echo("</TABLE>");
		}
		else {
			echo("<H3>No projects.</H3>");
		}

		mysqli_free_result($result2);
 		$result2 = mysqli_query($mysqli, "SELECT eno, ename, bdate, salary FROM emp WHERE dno = '" . $dno . "'");
        if ($row2 = mysqli_fetch_row($result2)) {
			echo("<H3>Employee List</H3><TABLE><TH>eno</TH><TH>ename</TH><TH>birth date</TH><TH>salary</TH>");
                 
			do {	
				echo("<TR><TD>" . $row2[0] . "</TD><TD>" . $row2[1] . "</TD><TD>" . $row2[2] . "</TD><TD>" . $row2[3] . "</TD></TR>");
			} while ($row2 = mysqli_fetch_row($result2));
			echo("</TABLE>");
		}
		else {
			echo("<H3>No employees.</H3>");
		}
		mysqli_free_result($result2);
	}
	mysqli_free_result($result);
			
	echo("</TABLE>");
	mysqli_close($mysqli);
?>
</body>
</html>
