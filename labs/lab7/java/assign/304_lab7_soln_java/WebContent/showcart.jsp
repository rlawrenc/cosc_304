<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<html>
<head>
<title>Your Shopping Cart</title>
</head>
<body>

<script>
function update(newid, newqty)
{
	window.location="showcart.jsp?update="+newid+"&newqty="+newqty;
}
</script>
<form name="form1">

<%
// Get the current list of products
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");
ArrayList<Object> product = new ArrayList<Object>();
String id = request.getParameter("delete");
String update = request.getParameter("update");
String newqty = request.getParameter("newqty");

// check if shopping cart is empty
if (productList == null)
{	out.println("<h1>Your shopping cart is empty!</h1>");
	productList = new HashMap<String, ArrayList<Object>>();
}
else
{
	NumberFormat currFormat = NumberFormat.getCurrencyInstance();
	
	// if id not null, then user is trying to remove that item from the shopping cart
	if(id != null && (!id.equals(""))) {
		if(productList.containsKey(id)) {
			productList.remove(id);
		}
	}
	
	// if update isn't null, the user is trying to update the quantity
	if(update != null && (!update.equals(""))) {
		if (productList.containsKey(update)) { // find item in shopping cart
			product = (ArrayList<Object>) productList.get(update);
			product.set(3, (new Integer(newqty))); // change quantity to new quantity
		}
		else {
			productList.put(id,product);
		}
	}

	// print out HTML to print out the shopping cart
	out.println("<h1>Your Shopping Cart</h1>");
	out.print("<table><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th>");
	out.println("<th>Price</th><th>Subtotal</th><th></th><th></th></tr>");

	int count = 0;
	double total =0;
	// iterate through all items in the shopping cart
	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
	while (iterator.hasNext()) {
		count++;
		Map.Entry<String, ArrayList<Object>> entry = iterator.next();
		product = (ArrayList<Object>) entry.getValue();
		// read in values for that product ID
		out.print("<tr><td>"+product.get(0)+"</td>");
		out.print("<td>"+product.get(1)+"</td>");

		out.print("<td align=\"center\"><input type=\"text\" name=\"newqty"+count+"\" size=\"3\" value=\""
			+product.get(3)+"\"></TD>");
		double pr = Double.parseDouble( (String) product.get(2));
		int qty = ( (Integer)product.get(3)).intValue();
		
		// print out values for that product from shopping cart
		out.print("<td align=\"right\">"+currFormat.format(pr)+"</td>");
		out.print("<td align=\"right\">"+currFormat.format(pr*qty)+"</td>");
		// allow the customer to delete items from their shopping cart by clicking here
		out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"showcart.jsp?delete="
			+product.get(0)+"\">Remove Item from Cart</a></td>");
		// allow customer to change quantities for a product in their shopping cart
		out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" onclick=\"update("
			+product.get(0)+", document.form1.newqty"+count+".value)\" value=\"Update Quantity\">");
		out.println("</tr>");
		// keep a running total for all items ordered
		total = total +pr*qty;
	}
	// print out order total
	out.println("<td><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>"
			+"<td align=\"right\">"+currFormat.format(total)+"</td></tr>");
	out.println("</table>");
	//give user option to check out
	out.println("<h2><a href=\"checkout.jsp\">Check Out</a></h2>");
}
// set the shopping cart
session.setAttribute("productList", productList);
// give the customer the option to add more items to their shopping cart
%>
<h2><a href="listprod.jsp">Continue Shopping</a></h2>
</form>
</body>
</html> 



