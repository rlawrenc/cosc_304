<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html>
<html>
<head>
<title>Query Results Using JSP (connection pools)</title>
</head>
<body>

<% 
Context root = new InitialContext();		// Get root of JNDI tree
String path = "java:comp/env/jdbc/workson";	// Name key
DataSource ds = (DataSource) root.lookup(path);	// JNDI lookup
// Context envContext  = (Context) root.lookup("java:/comp/env");
// DataSource ds = (DataSource)envContext.lookup("jdbc/workson");
out.println(ds);

try ( Connection con = ds.getConnection();			// Get connection from pool
      Statement stmt = con.createStatement();) 	
{ 		
	ResultSet rst = stmt.executeQuery("SELECT ename,salary FROM emp");		
	out.print("<table><tr><th>Name</th>");
	out.println("<th>Salary</th></tr>");
	while (rst.next())
	{	out.println("<tr><td>"+rst.getString(1)+"</td>"+"<td>"+rst.getDouble(2)+"</td></tr>");
	}
	out.println("</table>");
}
catch (SQLException ex) 
{ 	out.println(ex);	
}
%>
</body>
</html>
