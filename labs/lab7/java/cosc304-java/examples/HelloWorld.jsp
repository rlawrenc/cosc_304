<!DOCTYPE html>
<html>
<head>
<title>Hello World in JSP</title>
</head>

<body>

<% out.println("<h1>Hello World!</h1>"); %>

<%!
    // JSP declaration: shared across requests to this JSP.
    // Not thread-safe; used here only to demonstrate JSP variables.
    int num = 0;
%>

<%
    num++;
    out.println("<h3>This JSP has been called " + num + " times.</h3>");
    out.println("<p>Client address: " + request.getRemoteAddr() + "</p>");
%>

</body>
</html>
