<%@ page import="java.sql.*" %>
<html>
<head>
<title>Querying WorksOn using JSP</title>
</head>
<body>

<% 
try 
{	// Load driver class
	Class.forName("com.mysql.jdbc.Driver");
}
catch (java.lang.ClassNotFoundException e) {
	System.err.println("ClassNotFoundException: " +e);	
}

String url = "jdbc:mysql://cosc304_mysql/workson";
String uid = "fill-in";
String pw = "fill-in";

try (Connection con = DriverManager.getConnection(url, uid, pw);)
{
	// Create prepared statement to retrieve projects as going to repeat multiple times
	PreparedStatement pstmt = con.prepareStatement("SELECT pno, pname, budget FROM proj WHERE dno = ?");
	
	// Create prepared statement to retrieve employees as going to repeat multiple times
	PreparedStatement pstmtEmp = con.prepareStatement("SELECT eno, ename, bdate, salary FROM emp WHERE dno = ?");
	
	// Retrieve list of departments
	Statement stmt = con.createStatement();
	ResultSet rst = stmt.executeQuery("SELECT dno, dname FROM dept");

	// Iterate through department list
	while (rst.next())
	{	
		String dno = rst.getString(1);
		out.println("<h2>"+dno+" : "+rst.getString(2)+"</h2>");

		// Retrieve projects for department
		pstmt.setString(1, dno);
		ResultSet rstProj = pstmt.executeQuery();
		int count = 0;

		if (rstProj.next())
		{
			out.println("<h3>Project List</h3><table><th>pno</th><th>pname</th><th>budget</th>");

			do 
			{	
				out.println("<tr><td>"+rstProj.getString(1)+"</td><td>"+rstProj.getString(2)+"</td><td>"
					+rstProj.getString(3)+"</td></tr>");
			} while (rstProj.next());

			out.println("</table>");
		}
		else
			out.println("<h3>No projects.</h3>");

		rstProj.close();
		
		// Retrieve employees for department
		pstmtEmp.setString(1, dno);
		ResultSet rstEmp = pstmtEmp.executeQuery();
		
        if (rstEmp.next())
		{
			out.println("<h3>Employee List</h3><table><th>eno</th><th>ename</th><th>birth date</th><th>salary</th>");
                 
			do
			{
       				out.println("<tr><td>"+rstEmp.getString(1)+"</td><td>"+rstEmp.getString(2)+"</td><td>"
                                 +rstEmp.getString(3)+"</td><td>"+rstEmp.getString(4)+"</td></tr>");
             } while (rstEmp.next());
			out.println("</table>");
		}
		else
		{
			out.println("<H3>No employees.</H3>");
		}
	}
			
	out.println("</table>");
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
%>
</body>
</html>
