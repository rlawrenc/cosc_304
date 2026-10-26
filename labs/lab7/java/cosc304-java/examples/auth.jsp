<%
    boolean authenticated = session.getAttribute("authenticatedUser") != null;

    if (!authenticated)
    {
        session.setAttribute("loginMessage",
            "Please log in to access this page.");
        response.sendRedirect("login.jsp");
        return;
    }
%>