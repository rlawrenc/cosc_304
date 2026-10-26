
<!DOCTYPE html>
<html>
<head>
    <title>Login Screen</title>
</head>
<body>

<h3>Please Login to System</h3>

<%
    String loginMessage = (String) session.getAttribute("loginMessage");
    if (loginMessage != null)
    {
        out.println("<p>" + loginMessage + "</p>");
        session.removeAttribute("loginMessage");
    }
%>

<form method="post" action="validateLogin.jsp">
    <p>
        Username:
        <input type="text" name="username" required>
    </p>
    <p>
        Password:
        <input type="password" name="password" required>
    </p>
    <input type="submit" value="Log In">
</form>

</body>
</html>
