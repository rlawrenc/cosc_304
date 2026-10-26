
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Querying WorksOn using JSP</title>
</head>
<body>

<%
String url = "jdbc:sqlserver://cosc304_sqlserver:1433;databaseName=workson;encrypt=true;trustServerCertificate=true";
String uid = "sa";
String pw = "304#sa#pw";

try (Connection con = DriverManager.getConnection(url, uid, pw);
     PreparedStatement pstmtProj = con.prepareStatement("SELECT pno, pname, budget FROM proj WHERE dno = ?");
     PreparedStatement pstmtEmp = con.prepareStatement("SELECT eno, ename, bdate, salary FROM emp WHERE dno = ?");
     Statement stmt = con.createStatement();
     ResultSet rst = stmt.executeQuery("SELECT dno, dname FROM dept"))
{
    // Iterate through department list
    while (rst.next())
    {
        String dno = rst.getString(1);
        out.println("<h2>" + dno + " : " + rst.getString(2) + "</h2>");

        // Retrieve projects for department
        pstmtProj.setString(1, dno);

        try (ResultSet rstProj = pstmtProj.executeQuery())
        {
            if (rstProj.next())
            {
                out.println("<h3>Project List</h3>");
                out.println("<table><tr><th>pno</th><th>pname</th><th>budget</th></tr>");

                do
                {
                    out.println("<tr><td>" + rstProj.getString(1) + "</td>"
                              + "<td>" + rstProj.getString(2) + "</td>"
                              + "<td>" + rstProj.getString(3) + "</td></tr>");
                } while (rstProj.next());

                out.println("</table>");
            }
            else
                out.println("<h3>No projects.</h3>");
        }

        // Retrieve employees for department
        pstmtEmp.setString(1, dno);

        try (ResultSet rstEmp = pstmtEmp.executeQuery())
        {
            if (rstEmp.next())
            {
                out.println("<h3>Employee List</h3>");
                out.println("<table><tr><th>eno</th><th>ename</th><th>birth date</th><th>salary</th></tr>");

                do
                {
                    out.println("<tr><td>" + rstEmp.getString(1) + "</td>"
                              + "<td>" + rstEmp.getString(2) + "</td>"
                              + "<td>" + rstEmp.getString(3) + "</td>"
                              + "<td>" + rstEmp.getString(4) + "</td></tr>");
                } while (rstEmp.next());

                out.println("</table>");
            }
            else
                out.println("<h3>No employees.</h3>");
        }
    }
}
catch (SQLException ex)
{
    out.println(ex);
}
%>

</body>
</html>
