
<%@ page import="java.sql.*" %>
<%@ page contentType="text/plain; charset=UTF-8" %>
<%
String country = request.getParameter("country");

if (!"CA".equals(country) && !"US".equals(country))
{
    out.print("INVALID");
    return;
}

String url = "jdbc:sqlserver://cosc304_sqlserver:1433;databaseName=workson;encrypt=true;trustServerCertificate=true";
String uid = "sa";
String pw = "304#sa#pw";

String sql = "SELECT stateCode FROM states WHERE countryCode = ? ORDER BY stateName";

try (Connection con = DriverManager.getConnection(url, uid, pw);
     PreparedStatement pstmt = con.prepareStatement(sql))
{
    pstmt.setString(1, country);

    try (ResultSet rst = pstmt.executeQuery())
    {
        StringBuilder buf = new StringBuilder();

        while (rst.next())
        {
            if (buf.length() > 0)
                buf.append(",");

            buf.append(rst.getString(1).trim());
        }

        out.print(buf.toString());
    }
}
catch (SQLException ex)
{
    log("Province/state query failed", ex);
    response.setStatus(500);
}
%>
