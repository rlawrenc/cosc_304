<!DOCTYPE html>
<html>
<head>
<title>Password Protected Page</title>
</head>
<body>

<%@ include file="auth.jsp"%>

<%
	String userName = (String) session.getAttribute("authenticatedUser");
	out.println("<h1>You have access to this page: "+userName+"</h1>");
%>

</body>
</html>

