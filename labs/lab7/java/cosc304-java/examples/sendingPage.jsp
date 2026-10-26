<%@ page import="java.util.ArrayList, java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sending Data Page</title>
</head>
<body>

<h2>Created the following array and storing in a session variable:</h2>

<%
    // Generate an array of 20 random integers.
    ArrayList<Integer> ar = new ArrayList<>(20);
    Random generator = new Random();

    for (int i = 0; i < 20; i++)
    {
        ar.add(generator.nextInt(10));
        out.println(ar.get(i) + "<br>");
    }

    // Store the array in a session variable.
    session.setAttribute("arraydata", ar);
%>

<p><a href="receivingPage.jsp">Retrieve array from session</a></p>

</body>
</html>

