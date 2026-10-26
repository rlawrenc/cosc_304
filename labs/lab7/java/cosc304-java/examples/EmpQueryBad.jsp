<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Query Results Using JSP - Bad SQL Injection Attack!</title>
</head>
<body>

<% 
	String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=workson;TrustServerCertificate=True";
	String uid = "sa";
	String pw = "304#sa#pw";
	
	// Get parameters from request
    String empName = request.getParameter("empname");
    String deptNum = request.getParameter("deptnum");
    try ( Connection con = DriverManager.getConnection(url, uid, pw);
           Statement stmt = con.createStatement();) 
    {
		// WARNING: Intentionally vulnerable to SQL injection.
		// Used only to demonstrate why PreparedStatement is necessary.
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
		out.println("</table>");         
	}
	catch (SQLException ex) 
	{ 	out.println(ex); 
	}	
%>
</body>
</html>
