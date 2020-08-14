<?php    
	$conn = mysqli_connect("cosc304.ok.ubc.ca", "rlawrenc", "todo", "WorksOn")
					or die("Could not connect: " . mysqli_connect_error());
	
    
    $query = "SELECT title, AVG(salary) as value FROM emp GROUP BY title";
    $result = mysqli_query($conn, $query)
					or die("Query failed: " . mysqli_error($conn));
        
    $data = array();
    
    for ($x = 0; $x < mysqli_num_rows($result); $x++) {
        $data[] = mysqli_fetch_assoc($result);
    }
    
    echo json_encode($data);     
     
    mysqli_close($conn);
?>