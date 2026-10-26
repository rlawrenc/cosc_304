
<%@ page import="java.sql.*" %>

<%!
    // Database connection information shared by JSP pages.
    private static final String url = "jdbc:sqlserver://cosc304_sqlserver:1433;databaseName=orders;encrypt=true;trustServerCertificate=true";

    private static final String urlForLoadData = "jdbc:sqlserver://cosc304_sqlserver:1433;encrypt=true;trustServerCertificate=true";

    private static final String uid = "sa";
    private static final String pw = "304#sa#pw";

    // Return a new connection for each call.
    public Connection getConnection() throws SQLException
    {
        return DriverManager.getConnection(url, uid, pw);
    }
%>
