
<%@ page contentType="text/plain; charset=UTF-8" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");

if (name != null)
{
    // A real application could also check whether a name is in use.
    if (name.trim().length() < 4)
        out.print("Name too short. Must be at least 4 characters.");
    else
        out.print("VALID");
}
else if (email != null)
{
    // Simplified email validation for demonstration purposes.
    if (!email.trim().matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$"))
        out.print("Invalid email address.");
    else
        out.print("VALID");
}
else
{
    out.print("INVALID INPUT");
}
%>
