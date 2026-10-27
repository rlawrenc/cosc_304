
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%
    // For this lab, we accept the product name and price from the request.
    // In a real web store, the server should use the product ID to retrieve
    // and verify the name and price from the database, since users can modify URL parameters.
    // Get product information from request
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String price = request.getParameter("price");

    if (id == null || id.isBlank() || name == null || price == null)
    {
        response.sendError(400, "Missing product information.");
        return;
    }

    // Get the current shopping cart from the session
    @SuppressWarnings("unchecked")
    HashMap<String, ArrayList<Object>> productList =
        (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

    if (productList == null)
        productList = new HashMap<>();

    // Each product contains: ID, name, price, quantity
    if (productList.containsKey(id))
    {
        ArrayList<Object> product = productList.get(id);
        int quantity = (Integer) product.get(3);
        product.set(3, quantity + 1);
    }
    else
    {
        ArrayList<Object> product = new ArrayList<>();
        product.add(id);
        product.add(name);
        product.add(price);
        product.add(1);
        productList.put(id, product);
    }

    session.setAttribute("productList", productList);
    response.sendRedirect("showcart.jsp");
%>
