<%
    // Invalidate the current session, removing all session attributes.
    session.invalidate();

    // Redirect to the login page.
    response.sendRedirect("login.jsp");
%>
