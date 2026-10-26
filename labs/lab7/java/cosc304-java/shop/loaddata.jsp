
<%@ page import="java.sql.*,java.io.*,java.nio.file.*,java.nio.charset.StandardCharsets" %>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>COSC 304 Database Setup</title>
</head>
<body>

<h2>COSC 304 Store Database</h2>

<%
String fileName = "/opt/cosc304/ddl/SQLServer_orderdb.ddl";

if ("POST".equalsIgnoreCase(request.getMethod()))
{
    // Reset the database by executing the DDL script.
    try (Connection con = DriverManager.getConnection(urlForLoadData, uid, pw);
         Statement stmt = con.createStatement();
         BufferedReader reader = Files.newBufferedReader(
             Path.of(fileName), StandardCharsets.UTF_8))
    {
        StringBuilder batch = new StringBuilder();
        String line;

        // SQL Server scripts use GO to separate batches.
        while ((line = reader.readLine()) != null)
        {
            if (line.trim().equalsIgnoreCase("GO"))
            {
                if (!batch.toString().isBlank())
                    stmt.execute(batch.toString());

                batch.setLength(0);
            }
            else
            {
                batch.append(line).append("\n");
            }
        }

        // Execute the last batch if no final GO is present.
        if (!batch.toString().isBlank())
            stmt.execute(batch.toString());

        out.println("<p><strong>Database reset completed successfully.</strong></p>");
    }
    catch (Exception ex)
    {
        log("Database reset failed", ex);
        out.println("<p><strong>Database reset failed.</strong> "
                  + "Check the Tomcat logs for details.</p>");
    }
}

// Check database connectivity and verify the tables.
try (Connection con = getConnection();
     Statement stmt = con.createStatement();
     ResultSet rst = stmt.executeQuery(
         "SELECT "
       + "(SELECT COUNT(*) FROM customer) AS customers, "
       + "(SELECT COUNT(*) FROM product) AS products, "
       + "(SELECT COUNT(*) FROM ordersummary) AS orders"))
{
    if (rst.next())
    {
        out.println("<h3>Database connection successful.</h3>");
        out.println("<p>Customers: " + rst.getInt("customers") + "</p>");
        out.println("<p>Products: " + rst.getInt("products") + "</p>");
        out.println("<p>Orders: " + rst.getInt("orders") + "</p>");
    }
}
catch (SQLException ex)
{
    log("Database connectivity check failed", ex);
    out.println("<p><strong>Unable to access the store database.</strong></p>");
    out.println("<p>Check that Docker and SQL Server are running "
              + "and that the database has been initialized.</p>");
}
%>

<hr>

<h3>Reset Database</h3>
<p>
Resetting the database will delete existing orders, customers,
products, and other store data, and restore the original sample data.
</p>

<form method="post" action="loaddata.jsp"
      onsubmit="return confirm('Reset database and delete existing data?');">
    <input type="submit" value="Reset Database">
</form>

<p><a href="index.jsp">Return to Store</a></p>

</body>
</html>
