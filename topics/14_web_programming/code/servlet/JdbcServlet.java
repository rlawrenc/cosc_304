import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class JdbcServlet extends HttpServlet {

	private Connection con;

	public void init(ServletConfig cfg) throws ServletException
	{
		super.init(cfg);

		try
		{	// Load driver class
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (java.lang.ClassNotFoundException e) {
			throw new ServletException("ClassNotFoundException: " +e);
		}

		String url = "jdbc:mysql://cosc304.ok.ubc.ca/workson";
		String uid = "fill-in";
		String pw = "fill-in";
		con = null;
		try
		{
			con = DriverManager.getConnection(url, uid, pw);
		}
		catch (SQLException e)
		{
			throw new ServletException("SQLException: "+e);
		}
   	}

	public void destroy()
	{
		try
		{
			if (con != null)
				con.close();
		}
		catch (SQLException e)
		{	System.err.println("SQLException: "+e); }
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
      		throws ServletException, java.io.IOException
    {
	        doTable(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
      		throws ServletException, java.io.IOException
    {
	        doTable(request, response);
	}

	private void doTable(HttpServletRequest request,HttpServletResponse response)
				throws ServletException, java.io.IOException
	{
		response.setContentType("text/html");
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><head><title></title></head>");

		if (con == null)
		{
			out.println("<body><h1>Unable to connect to DB</h1></body></html>");
		}
		else
		{	try
			{
				Statement stmt = con.createStatement();
				ResultSet rst = stmt.executeQuery("SELECT ename,salary FROM emp");

				out.print("<table><tr><th>Name</th><th>Salary</th></tr>");
				while (rst.next())
				{
					out.println("<tr><td>"+rst.getString(1)+"</td>"+"<td>"+rst.getDouble(2)+"</td></tr>");
				}
				out.println("</table></body></html>");
			}
			catch (SQLException ex)
			{
				out.println(ex);
			}
		}
	}
}

