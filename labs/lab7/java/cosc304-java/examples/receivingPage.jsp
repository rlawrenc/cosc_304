<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Receiving Data Page</title>
</head>
<body>

<%
    // Retrieve the array from the session.
    ArrayList<Integer> ar = (ArrayList<Integer>) session.getAttribute("arraydata");

    if (ar == null)
    {
        out.println("<h2>No array found in session.</h2>");
    }
    else
    {
        out.println("<h2>Received the following array from the session:</h2>");

        for (int i = 0; i < ar.size(); i++)
            out.println(ar.get(i) + "<br>");
    }
%>

<p><a href="sendingPage.jsp">Generate a new array</a></p>

</body>
</html>
