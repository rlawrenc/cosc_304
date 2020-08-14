import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class EmpServlet extends HttpServlet {

	private Connection con;

	public void init(ServletConfig cfg) throws ServletException {
		super.init(cfg);

		try
		{	// Load driver class
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (java.lang.ClassNotFoundException e) {
			throw new ServletException("ClassNotFoundException: " +e);
		}

		String url = "jdbc:mysql://cosc304.ok.ubc.ca/workson";
		con = null;
		try {
			con = DriverManager.getConnection(url,"rlawrenc","todo");
		} catch (SQLException e)
		{	throw new ServletException("SQLException: "+e); }
   	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
      				throws ServletException, java.io.IOException {
	        doQuery(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
      				throws ServletException, java.io.IOException {
        	doQuery(request, response);
	}

	public void destroy()
	{	try {
			if (con != null)
				con.close();
		}
		catch (SQLException e)
		{	System.err.println("SQLException: "+e); }
	}

	private void doQuery(HttpServletRequest request,HttpServletResponse response)
			throws ServletException, java.io.IOException
	{
		response.setContentType("text/html");

		java.io.PrintWriter out = response.getWriter();
		out.println("<html><head><title></title></head>");
		if (con == null)
		{	out.println("<body><h1>Unable to connect to DB</h1></body></html>");
			out.close();
			return;
		}

		// Get parameters from request
		String empName = request.getParameter("empname");
		String deptNum = request.getParameter("deptnum");
		try
		{
			String sql = "SELECT ename, salary, dno FROM emp";
			boolean hasEmp = empName != null && !empName.equals("");
			boolean hasDept= deptNum != null && !deptNum.equals("");

			PreparedStatement pstmt=null;
			ResultSet rst = null;

			if (!hasEmp && !hasDept)
			{
				pstmt = con.prepareStatement(sql);
				rst = pstmt.executeQuery();
			}
			else if (hasEmp)
			{	empName = "%"+empName+"%";
				sql += " WHERE ename LIKE ?";
				if (hasDept)
					sql += " AND dno = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, empName);
				if (hasDept)
					pstmt.setString(2, deptNum);
				rst = pstmt.executeQuery();
			}
			else if (hasDept)
			{
				sql += " WHERE dno = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, deptNum);
				rst = pstmt.executeQuery();
			}
			// Note: Asking driver to return actual SQL executed
			sql = pstmt.toString();
			out.println("<h2>SQL Query: "+sql+"</h2>");
			out.print("<table><tr><th>Name</th><th>Salary</th><th>dno</th></tr>");
			while (rst.next())
			{       out.println("<tr><td>"+rst.getString(1)+"</td>"
						+"<td>"+rst.getDouble(2)+"</td>"
						+"<td>"+rst.getString(3)+"</td></tr>");

			}
			out.println("</table></body></html>");
			out.close();
		}
		catch (SQLException ex)
		{ 	out.println(ex);
		}
	}
}

