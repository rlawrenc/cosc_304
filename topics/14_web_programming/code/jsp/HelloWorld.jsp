<!DOCTYPE html>
<html>
<head>
<title>Hello World in JSP</title>
</head>

<body>

<% out.println("<h1>Hello World!</h1>"); %>

<!--
<%= "<H1>I am here .. unfortunately...</H1>" %>
-->

<%! int num=0; %>

<%
num++;
out.println("<H3>This JSP file has been called: "+num+" times.</H3>");
%>

<%
/*
// This causes an infinite loop
int i =0;
while (i < 100)
{ 	i++;
	out.print(i+" ");
	if (i >= 20)
		i=0;
}
*/
%>

<%
out.println(request.getRemoteHost());
%>


</body>
</html>
