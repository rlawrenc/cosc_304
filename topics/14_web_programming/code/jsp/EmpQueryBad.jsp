<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Query Results Using JSP - Bad SQL Injection Attack!</title>
</head>
<body>

<% 
	String url = "jdbc:mysql://cosc304.ok.ubc.ca/workson";
	String uid = "rlawrenc";
	String pw = "test";

	try 
	{	// Load driver class
		Class.forName("com.mysql.jdbc.Driver");
	}
	catch (java.lang.ClassNotFoundException e) {
		System.err.println("ClassNotFoundException: " +e);	
	}
	
	// Get parameters from request
    String empName = request.getParameter("empname");
    String deptNum = request.getParameter("deptnum");
    try ( Connection con = DriverManager.getConnection(url, uid, pw);
           Statement stmt = con.createStatement();) 
    {
		String SQLSt = "SELECT ename, salary, dno FROM emp WHERE 1=1 ";
		if (empName != null && !empName.equals(""))               
			SQLSt = SQLSt + " and ename LIKE '%"+empName+"%'";
		if (deptNum != null && !deptNum.equals(""))
			SQLSt = SQLSt + " and dno ='"+deptNum+"'";
	
		out.println("<h2>SQL Query: "+SQLSt+"</h2>");     
		
		ResultSet rst = stmt.executeQuery(SQLSt);
		out.print("<table><tr><th>Name</th><th>Salary</th><th>dno</th></tr>");
		while (rst.next())
		{       out.println("<tr><td>"+rst.getString(1)+"</td>"
		                                         +"<td>"+rst.getDouble(2)+"</td>"
		                                         +"<td>"+rst.getString(3)+"</td></tr>");
		
		}
        out.println("</table></body></html>");
        out.close();
	}
	catch (SQLException ex) 
	{ 	out.println(ex); 
	}	
%>
</body>
</html>
