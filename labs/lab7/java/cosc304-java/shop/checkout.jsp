
<!DOCTYPE html>
<html>
<head>
<title>Grocery Store Checkout</title>
</head>
<body>

<h1>Checkout</h1>
<p>Enter your customer ID to complete the transaction:</p>

<form method="post" action="order.jsp">
    <label for="customerId">Customer ID:</label>
    <input type="text" id="customerId" name="customerId" required>
    <input type="submit" value="Place Order">
</form>

<p><a href="showcart.jsp">Return to Shopping Cart</a></p>

</body>
</html>
