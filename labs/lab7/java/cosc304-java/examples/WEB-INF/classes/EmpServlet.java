
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EmpServlet extends HttpServlet
{
    private static final String URL = "jdbc:sqlserver://cosc304_sqlserver:1433;databaseName=workson;encrypt=true;trustServerCertificate=true";

    private static final String UID = "sa";
    private static final String PW = "304#sa#pw";

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Get optional search parameters
        String empName = request.getParameter("empname");
        String deptNum = request.getParameter("deptnum");

        boolean hasEmp = empName != null && !empName.isEmpty();
        boolean hasDept = deptNum != null && !deptNum.isEmpty();

        // Construct SQL with optional filters
        String sql = "SELECT ename, salary, dno FROM emp WHERE 1=1";

        if (hasEmp)
            sql += " AND ename LIKE ?";
        if (hasDept)
            sql += " AND dno = ?";

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head><title>Employee Query Servlet</title></head>");
        out.println("<body>");
        out.println("<h2>Employee Query Results</h2>");
        out.println("<p>SQL Query: " + sql + "</p>");

        try (Connection con = DriverManager.getConnection(URL, UID, PW);
             PreparedStatement pstmt = con.prepareStatement(sql))
        {
            // Bind parameters in the order they appear in SQL
            int param = 1;

            if (hasEmp)
                pstmt.setString(param++, "%" + empName + "%");
            if (hasDept)
                pstmt.setString(param++, deptNum);

            try (ResultSet rst = pstmt.executeQuery())
            {
                out.println("<table>");
                out.println("<tr><th>Name</th><th>Salary</th>"
                          + "<th>Department</th></tr>");

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
            log("Employee query failed", ex);
            out.println("<p>Unable to execute employee query.</p>");
        }

        out.println("<p><a href='../QueryServlet.html'>New Search</a></p>");
        out.println("</body></html>");
    }
}
