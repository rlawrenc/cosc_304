import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet
{
	int num = 0;

    public void doGet(HttpServletRequest request,  HttpServletResponse response)
                throws IOException, ServletException
    {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>Hello World Servlet</title></head>");
		out.println("<body>");
		out.println("<h2>Hello World Today!!</h2>");
		num++;
		out.println("<h3>This servlet has been called: "+num+" times.</h3>");
		out.println("</body></html>");
	}
}


