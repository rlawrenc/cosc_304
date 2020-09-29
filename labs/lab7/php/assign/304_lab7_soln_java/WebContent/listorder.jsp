<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

<html>
<head>
<title>Ray's Grocery Order List</title>
</head>
<body>

<h1>Order List</h1>

<%
String sql = "SELECT O.orderId, O.CustomerId, totalAmount, firstName+' '+lastName, productId, quantity, price, orderDate "
		+ "FROM OrderSummary O, Customer C, OrderProduct OP "
		+ "WHERE O.customerId = C.customerId and OP.orderid = O.orderId ";

NumberFormat currFormat = NumberFormat.getCurrencyInstance();

try 
{	
	getConnection();
	ResultSet rst = con.createStatement().executeQuery(sql);		
	out.println("<table class=\"table\" border=\"1\">");
	out.print("<tr><th>Order Id</th><th>Order Date</th><th>Customer Id</th><th>Customer Name</th>");
	out.println("<th>Total Amount</th></tr>");

	int lastOrderId = -1;
	double totalAmount=0, price;
	int totalQuantity=0, quantity;

	// Note: This version requires only one query rather than one for each order.  More efficient if listing all orders.
	while (rst.next())
	{	
		int orderId = rst.getInt(1);

		if (orderId != lastOrderId)
		{
			if (lastOrderId != -1)
			{
				out.print("<tr><td><span class=\"label label-primary\">Total:</span></td>");
				out.print("<td>"+totalQuantity+"</td>");
				out.println("<td>"+currFormat.format(totalAmount)+"</td></tr>");
				totalQuantity = 0;
				totalAmount = 0;
				out.println("</table></td></tr>");	// Close previous table
			}

			out.print("<tr><td>"+orderId+"</td>");
			out.print("<td>"+rst.getString(7)+"</td>");
			out.print("<td>"+rst.getInt(2)+"</td>");
			out.print("<td>"+rst.getString(4)+"</td>");
			out.print("<td>"+currFormat.format(rst.getDouble(3))+"</td>");
			out.println("</tr>");
		
			out.println("<tr align=\"right\"><td colspan=\"5\"><table class=\"table\" border=\"1\">");
			out.println("<th>Product Id</th> <th>Quantity</th> <th>Price</th></tr>");
		}

		// Print lineitem information
		quantity = rst.getInt(6);
		price = rst.getDouble(7);
		totalQuantity += quantity;
		totalAmount += quantity*price;
		out.print("<tr><td>"+rst.getInt(5)+"</td>");
		out.print("<td>"+quantity+"</td>");
		out.println("<td>"+currFormat.format(price)+"</td></tr>");

		lastOrderId = orderId;
	}

	if (lastOrderId != -1)
	{		
		out.print("<tr><td><span class=\"label label-primary\">Total:</span></td>");
		out.print("<td>"+totalQuantity+"</font></td>");
		out.println("<td>"+currFormat.format(totalAmount)+"</font></td></tr>");
		totalQuantity = 0;
		totalAmount = 0;
		out.println("</table></td></tr>");	// Close previous table		
    }

	out.println("</table>");
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
finally
{
	try
	{
		closeConnection();
	}
	catch (SQLException ex)
	{
		out.println(ex); 
	}
}
%>

</body>
</html>


