# COSC 304 - Introduction to Database Systems<br>Lab 6: Using Python with MySQL and Microsoft SQL Server

This assignment practices developing Java code that uses JDBC to connect to a MySQL database.

The database is a standard order database consisting of products, customers, orders, ordered products, and employees.  There is a list of products to order and a list of employees who take orders. An order has an id and date and may contain multiple products.  The database schema is below:

<pre>
Customer (<u>CustomerId</u>, CustomerName)
Employee (<u>EmployeeId</u>, EmployeeName, Salary, <i>SupervisorId</i>)
Product(<u>ProductId</u>, ProductName, ListPrice)
Orders (<u>OrderId</u>, OrderDate, <i>CustomerId</i>, <i>EmployeeId</i>, Total)
OrderedProduct (<i><u>OrderId</u></i>, <i><u>ProductId</u></i>, Quantity, Price)
</pre>

## Initial Steps

Download the starter code [Python file](OrderDB.py) and the test file [Python file](TestOrderDB.py). There is also a [DDL script](order.ddl) to create the database.

Use VSCode to edit the code files. You will need to install the Python extension to execute.

## Question 1 (35 marks)

Write the code to complete the methods in `OrderDB.py` (look for `TODO` items).

The Python test library is called `unittest`. To add it to your project in VSCode, click on the test (beaker) icon, then click on the `Configure Tests` blue button. VSCode will ask for the test library. Respond with `unittest` and indicate the test files will have the format `Test*.py`.

**Your code will be graded based on it passing the unit tests.** You can show the TA all JUnit tests passing to receive full marks. Otherwise, submit your source code via Canvas.

<table>
<tr><th>Operation</th>														<th width="100">Marks</th></tr>
<tr><td>
<tr><td>List all customers in database (<tt>listAllCustomers</tt>)</td>		<td>3 marks</td></tr>
<tr><td>List all orders for a customer (<tt>listCustomerOrders</tt>)</td>	<td>3 marks</td></tr>
<tr><td>List all lineitems for an order (<tt>listLineItemsForOrder</tt>)</td><td>2 marks</td></tr>
<tr><td>Computer order total (<tt>computeOrderTotal</tt>)</td>				<td>2 marks</td></tr>
<tr><td>Add a customer (<tt>addCustomer</tt>)</td>							<td>2 marks</td></tr>
<tr><td>Delete a customer (<tt>deleteCustomer</tt>) (Make sure to also delete Orders and OrderedProducts for the customer deleted).</td>	<td>2 marks </td></tr>
<tr><td>Update a customer (<tt>updateCustomer</tt>)</td>					<td>2 marks</td></tr>
<tr><td>New order (<tt>newOrder</tt>)</td>									<td>2 marks</td></tr>
<tr><td>New order item (<tt>newLineItem</tt>)</td>							<td>2 marks</td></tr>
<tr><td>Update order total (<tt>updateOrderTotal</tt>)</td>					<td>2 marks</td></tr>
<tr><td><b>Query1:</b> Return the list of products that have not been in any order. Hint: Left join can be used instead of a subquery.</td>	<td>3 marks</td</tr>
<tr><td><b>Query2:</b> Return the order ids and total amount where the order total does not equal the sum of quantity*price for all ordered products in the order.</td><td>3 marks</td></tr>
<tr><td><b>Query3:</b> Return for each customer their id, name and average total order amount for orders starting on January 1, 2024 (inclusive). Only show customers that have placed at least 2 orders.</td><td>3 marks</td></tr>
<tr><td><b>Query4:</b> Return the employees who have had at least 2 distinct orders where some product on the order had quantity >= 5.</td><td>4 marks</td></tr>
</table>
