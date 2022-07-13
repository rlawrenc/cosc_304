<%@ page language="java" import="java.io.*"%>
<%
	String authenticatedUser = null;
	session = request.getSession(true);

	try
	{
		authenticatedUser = validateLogin(out,request,session);
	}
	catch(IOException e)
	{	System.err.println(e); }

	if(authenticatedUser != null)
		response.sendRedirect("protectedPage.jsp");	// Successful login
	else
		response.sendRedirect("login.jsp");		// Failed login - redirect back to login page with a message 
%>


<%!
	String validateLogin(JspWriter out,HttpServletRequest request, HttpSession session) throws IOException
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String retStr = null;

		if(username == null || password == null)
				return null;
		if((username.length() == 0) || (password.length() == 0))
				return null;

		// Could make a database connection here and check password but for now just checking for single password
		if (username.equals("test") && password.equals("test"))
			retStr = username;

		// Login using database version
		/*
		try {

			Connection con = null;
			Statement stmt = null;
			ResultSet rst = null;

			// Make database connection

			String query = "SELECT PSWD FROM User WHERE ADMIN_ID = BINARY '"+username+"' AND PSWD = BINARY '"+password+"'";
			rst = executeQuery(con,query);
			stmt = rst.getStatement();
			if (!rst.next())
				retStr = "";

		}
		catch(SQLException e)
		{	out.println(e);}
		finally {
			// Close database connection
		}
		*/

		if(retStr != null)
		{	session.removeAttribute("loginMessage");
			session.setAttribute("authenticatedUser",username);
		}
		else
			session.setAttribute("loginMessage","Could not connect to the system using that username/password.");

		return retStr;
	}
%>

