<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Image Display Example</title>
</head>
<body>

<h1>Search for the images you want to see:</h1>

<form method="get" action="displayImages.jsp">
<input type="text" name="imageName" size="50">
<input type="submit" value="Submit"><input type="reset" value="Reset"> (Leave blank for all images)
</form>

<% // Get product name to search for
String name = request.getParameter("imageName");

if (name == null)
	name = "";

if (name.equals(""))
	out.println("<h2>All Images</h2>");
else
	out.println("<h2>Images containing '"+name+"'</h2>");

String sql = "SELECT id, fileName, fileData FROM pictures WHERE fileName LIKE '%"+name+"%';";

try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}

// Database connection information
String url = "jdbc:sqlserver://sql04.ok.ubc.ca;databaseName=db_rlawrenc;";
String uid = "rlawrenc";
String pw = "todo";

try ( Connection con = DriverManager.getConnection(url, uid, pw);
	  Statement stmt = con.createStatement(); ) 
{
	ResultSet rst = stmt.executeQuery(sql);		
	out.println("<table><tr><th>Image</th><th>id</th><th>Name</th></tr>");
	
	while (rst.next())
	{	int id = rst.getInt(1);
		String imageurl = "displayImage.jsp?id="+id;
		out.println("<tr><td><a href=\""+imageurl+"\"><img width=\"100\" height=\"100\" src=\""+imageurl+"\"></a></td>"+
			"<td>"+id+"</td><td>"+rst.getString(2)+"</td></tr>");
	}
        out.println("</table>");
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
%>

</body>
</html>