
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Query Results Using JSP</title>
</head>
<body>

<h3>Example Microsoft SQL Server JDBC Query on Workson Database</h3>

<%
String url = "jdbc:sqlserver://cosc304_sqlserver:1433;databaseName=workson;encrypt=true;trustServerCertificate=true";
String uid = "sa";
String pw = "304#sa#pw";

try (Connection con = DriverManager.getConnection(url, uid, pw);
     Statement stmt = con.createStatement();
     ResultSet rst = stmt.executeQuery("SELECT ename, salary FROM emp"))
{
    out.println("<table><tr><th>Name</th><th>Salary</th></tr>");

    while (rst.next())
    {
        out.println("<tr><td>" + rst.getString(1) + "</td>"
                  + "<td>" + rst.getDouble(2) + "</td></tr>");
    }

    out.println("</table>");
}
catch (SQLException ex)
{
    out.println(ex);
}
%>

</body>
</html>
