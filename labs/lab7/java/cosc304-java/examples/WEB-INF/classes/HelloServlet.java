
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Compile command: docker run --rm -v "${PWD}/examples/WEB-INF/classes:/src" -w /src tomcat:11.0-jdk21-temurin javac -cp /usr/local/tomcat/lib/servlet-api.jar HelloServlet.java JdbcServlet.java EmpServlet.java
 */
public class HelloServlet extends HttpServlet
{
    // Instance variable shared across requests (not thread-safe).
    private int num = 0;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head><title>Hello World Servlet</title></head>");
        out.println("<body>");
        out.println("<h2>Hello World from a Servlet!</h2>");

        num++;
        out.println("<h3>This servlet has been called: " + num + " times.</h3>");

        out.println("</body></html>");
    }
}


