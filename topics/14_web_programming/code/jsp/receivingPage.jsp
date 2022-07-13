<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<title>Receiving Data Page</title>
</head>
<body>

<%
	ArrayList ar = (ArrayList) session.getAttribute("arraydata");
	if (ar == null)
		out.println("<h2>No data sent to page using session variable.</h2>");
	else
	{
		out.println("<h2>Received the following array from the session variable:</h2>");
		for (int i = 0; i < 20; i++)
			out.println(ar.get(i)+"<br>");
	}
%>

</body>
</html>

