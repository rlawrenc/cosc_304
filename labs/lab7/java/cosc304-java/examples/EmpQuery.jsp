
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Employee Query Using PreparedStatement</title>
</head>
<body>

<%
String url = "jdbc:sqlserver://cosc304_sqlserver:1433;databaseName=workson;encrypt=true;trustServerCertificate=true";
String uid = "sa";
String pw = "304#sa#pw";

// Get parameters from request
String empName = request.getParameter("empname");
String deptNum = request.getParameter("deptnum");

boolean hasEmp = empName != null && !empName.isEmpty();
boolean hasDept = deptNum != null && !deptNum.isEmpty();

String sql = "SELECT ename, salary, dno FROM emp WHERE 1=1";

if (hasEmp)
    sql += " AND ename LIKE ?";
if (hasDept)
    sql += " AND dno = ?";

try (Connection con = DriverManager.getConnection(url, uid, pw);
     PreparedStatement pstmt = con.prepareStatement(sql))
{
    int param = 1;

    if (hasEmp)
        pstmt.setString(param++, "%" + empName + "%");
    if (hasDept)
        pstmt.setString(param++, deptNum);

    out.println("<h2>SQL Query: " + sql + "</h2>");

    try (ResultSet rst = pstmt.executeQuery())
    {
        out.println("<table>");
        out.println("<tr><th>Name</th><th>Salary</th><th>dno</th></tr>");

        while (rst.next())
        {
            out.println("<tr><td>" + rst.getString(1) + "</td>"
                + "<td>" + rst.getDouble(2) + "</td>"
                + "<td>" + rst.getString(3) + "</td></tr>");
        }
        out.println("</table>");
    }
}
catch (SQLException ex)
{
    out.println(ex);
}
%>

</body>
</html>
