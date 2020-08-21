# Lab 3

h1>COSC 304 - Introduction to Database Systems
<br>Assignment 3 - SQL</h1>

<p>This assignment practices writing queries in SQL.</p>


<h2>Question 1 (20 marks)</h2>

<p>Given the following relational schema, write queries in <b>SQL</b> to answer the English questions. <b>There is a shipment database on the MySQL server.</b> You can also use the <a href="ShipmentMySQL.sql">DDL for MySQL</a>. <b>You must only submit the SQL for your answers but you can include the query output as well to help the TA with marking.</b></p>

<pre>
Customer(<i>cid:</i> integer, <i>cname:</i> string, <i>address:</i> string, <i>city:</i> string, <i>state:</i> string)
Product(<i>pid:</i> integer, <i>pname:</i> string, <i>price:</i> currency, <i>inventory:</i> integer)
Shipment(<i>sid:</i> integer, <i>cid:</i> integer, <i>shipdate:</i> Date/Time)
ShippedProduct(<i>sid:</i> integer, <i>pid:</i> integer, <i>amount:</i> integer)
</pre>

<ol>
<li> Return the product names and inventory value of each product (<b>price*inventory</b>) ordered by product name.<br>
<h4>Output:</h4>
<pre>
</pre>
</li>

<li> Return total value of products in inventory.
<br><h4>Output:</h4>
<pre>
</pre>
</li>

<li> For all customers in Iowa (<b>'IA'</b>) list the customer name, product name, and amount for all shipments.
<br><h4>Output:</h4>
<pre>
</pre>
</li>

<li> Return the number of shipments to customers with first name <b>'Scott'</b>.
<br><h4>Output:</h4>
<pre>
</pre>
</li>

<li> Return customer names and total sales of products shipped to each customer. Only show customers with total sales
	 of over <b>$200</b> with the results ordered in descending order of total sales.
<br><h4>Output:</h4>
<pre>
</pre>
</li>

<li> Return the list of customers (no duplicates) that have never received a shipment.
<br><h4>Output:</h4>
<pre>
</pre>
</li>

<li> Return product names and total amount shipped (<b>price*amount</b>) for products shipping over <b>$1,000</b>.
<br><h4>Output:</h4>
<pre>
</pre>
</li>

<li> Return the products (name) whose name contains <b>'Ch'</b> with a price more than the average price.
<br><h4>Output:</h4>
<pre>
</pre>
</li>

<li> Return all customers and their states that share a state with another customer.
<br><h4>Output: (Note: Order of rows does not matter.)</h4>
<pre>
</pre>
</li>

<li> Return the shipment id and total value of the <b>entire</b> shipment (<b>price*amount</b>) ordered by the shipment values ascending.
<br><h4>Output:</h4>
<pre>
</pre>
</li>

</ol>