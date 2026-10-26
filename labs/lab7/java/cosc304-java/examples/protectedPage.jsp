<%@ include file="auth.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Password Protected Page</title>
</head>
<body>

<%
    String userName = (String) session.getAttribute("authenticatedUser");
    out.println("<h1>You have access to this page: " + userName + "</h1>");
%>

<p><a href="logout.jsp">Logout</a></p>

</body>
</html>


