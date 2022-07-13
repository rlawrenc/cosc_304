<%@ page import="java.util.ArrayList,java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
<title>Sending Data Page</title>
</head>
<body>

<%
	// Generate and print array
	ArrayList ar = new ArrayList(20);
	Random generator = new Random();

	out.println("<h2>Created the following array and storing in a session variable:</h2>");
	for (int i = 0; i < 20; i++)
	{	ar.add(new Integer(generator.nextInt(10)));
		out.println(ar.get(i)+"<br>");
	}

	// Store arraylist in a session variable
	session.setAttribute("arraydata",ar);
%>

</body>
</html>

