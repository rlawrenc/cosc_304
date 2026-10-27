
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>WorksOn Query Results Using JSP with HTML Forms</title>
</head>
<body>

<%
String url = "jdbc:sqlserver://cosc304_sqlserver:1433;databaseName=workson;encrypt=true;trustServerCertificate=true";
String uid = "sa";
String pw = "304#sa#pw";

// Get parameters from request
String empName = request.getParameter("empname");
String projName = request.getParameter("projname");

boolean hasEmp = empName != null && !empName.isEmpty();
boolean hasProj = projName != null && !projName.isEmpty();

// Construct SQL with optional filters
String sql = "SELECT E.eno, E.ename, P.pno, P.pname, W.resp, W.hours "
           + "FROM emp E "
           + "JOIN workson W ON E.eno = W.eno "
           + "JOIN proj P ON P.pno = W.pno "
           + "WHERE 1=1";

if (hasEmp)
    sql += " AND E.ename LIKE ?";
if (hasProj)
    sql += " AND P.pname LIKE ?";

try (Connection con = DriverManager.getConnection(url, uid, pw);
     PreparedStatement pstmt = con.prepareStatement(sql))
{
    // Bind parameters in the order they appear in SQL
    int param = 1;

    if (hasEmp)
        pstmt.setString(param++, "%" + empName + "%");
    if (hasProj)
        pstmt.setString(param++, "%" + projName + "%");

    out.println("<h2>SQL Query: " + sql + "</h2>");

    try (ResultSet rst = pstmt.executeQuery())
    {
        out.println("<table>");
        out.println("<tr><th>eno</th><th>ename</th><th>pno</th>"
                  + "<th>pname</th><th>resp</th><th>hours</th></tr>");

        int count = 0;
        while (rst.next())
        {
            count++;
            out.println("<tr><td>" + rst.getString(1) + "</td>"
                      + "<td>" + rst.getString(2) + "</td>"
                      + "<td>" + rst.getString(3) + "</td>"
                      + "<td>" + rst.getString(4) + "</td>"
                      + "<td>" + rst.getString(5) + "</td>"
                      + "<td>" + rst.getInt(6) + "</td></tr>");
        }
        out.println("</table>");
        out.println("<p>Number of matching records: " + count + "</p>");
    }
}
catch (SQLException ex)
{
    out.println(ex);
}
%>

</body>
</html>
