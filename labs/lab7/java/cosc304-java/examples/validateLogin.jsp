
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Demonstration only: hardcoded username and password.
    // Real applications authenticate using securely stored password hashes.
    boolean validLogin = "test".equals(username) && "test#1234".equals(password);

    if (validLogin)
    {
        request.changeSessionId();
        session.setAttribute("authenticatedUser", username);
        session.removeAttribute("loginMessage");
        response.sendRedirect("protectedPage.jsp");
    }
    else
    {
        session.removeAttribute("authenticatedUser");
        session.setAttribute("loginMessage",
            "Invalid username or password.");
        response.sendRedirect("login.jsp");
    }
%>
