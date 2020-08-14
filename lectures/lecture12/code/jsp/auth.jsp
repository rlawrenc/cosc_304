<%
	boolean authenticated = session.getAttribute("authenticatedUser") == null ? false : true;

	if (!authenticated)
	{
        	String loginMessage = "You have not been authorized to access the URL "+request.getRequestURL().toString();
        	session.setAttribute("loginMessage",loginMessage);
        	// response.sendRedirect("login.jsp");
 		RequestDispatcher disp = request.getRequestDispatcher("/login.jsp");
		disp.forward(request,response);
	}
%>
