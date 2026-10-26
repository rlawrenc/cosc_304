
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class JdbcServlet extends HttpServlet
{
    private static final String URL = "jdbc:sqlserver://cosc304_sqlserver:1433;databaseName=workson;encrypt=true;trustServerCertificate=true";

    private static final String UID = "sa";
    private static final String PW = "304#sa#pw";

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException
    {
        doTable(response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException
    {
        doTable(response);
    }

    private void doTable(HttpServletResponse response)
            throws IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head><title>JDBC Servlet Query</title></head>");
        out.println("<body>");
        out.println("<h2>Employees from SQL Server</h2>");

        String sql = "SELECT ename, salary FROM emp";

        try (Connection con = DriverManager.getConnection(URL, UID, PW);
             Statement stmt = con.createStatement();
             ResultSet rst = stmt.executeQuery(sql))
        {
            out.println("<table>");
            out.println("<tr><th>Name</th><th>Salary</th></tr>");

            while (rst.next())
            {
                out.println("<tr><td>" + rst.getString(1) + "</td>"
                          + "<td>" + rst.getDouble(2) + "</td></tr>");
            }

            out.println("</table>");
        }
        catch (SQLException ex)
        {
            log("Database query failed", ex);
            out.println("<p>Unable to execute database query.</p>");
        }

        out.println("</body></html>");
    }
}
