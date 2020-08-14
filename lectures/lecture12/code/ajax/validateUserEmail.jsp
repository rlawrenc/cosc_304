<%
	String name = request.getParameter("name");
	if (name != null)
	{	// This is validation code.  We could look up in a database here to see if user name is used.
		if (name.length() < 4)
			out.println("Name too short.  Must be at least 4 characters.");
		else
			out.println("VALID");
	}
	else
	{
		String email = request.getParameter("email");
		if (email != null)
		{	if (!email.contains("@"))
				out.println("INVALID");
			else
				out.println("VALID");
		}
		else
			out.println("INVALID INPUT");
	}
%>
