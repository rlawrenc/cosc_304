# COSC 304 - Introduction to Database Systems<br>Lab 1: Querying using Relational Algebra

## [RelaX - Online Relational Algebra Tool](https://dbis-uibk.github.io/relax/)

[RelaX](https://dbis-uibk.github.io/relax/) is an online relational algebra tool that we will use for the assignments. It allows entering relational algebra expressions and executing them to get results. The data set can be loaded from a GitHub Gist including the [Bookstore data set GIST: 367f41bb51110ef3c84bb5f906f2fb87](https://gist.github.com/rlawrenc/367f41bb51110ef3c84bb5f906f2fb87) used for sample relational algebra queries in this lab, and the [Shipment database GIST: 585ee1836abb142a461d137e12dd14a3](https://gist.github.com/rlawrenc/585ee1836abb142a461d137e12dd14a3) used in the lab questions.
 
![](img/lab1_loadGist.png)

## Relational Algebra Questions (10 marks - 2 marks each)

Given the following relational schema, write queries in **relational algebra** to answer the English questions using the <a href="http://dbis-uibk.github.io/relax/">online relational algebra tool</a>. The database definition is available as a [Shipment database GIST: 585ee1836abb142a461d137e12dd14a3](https://gist.github.com/rlawrenc/585ee1836abb142a461d137e12dd14a3). The database is also available as an <a href="Shipment.sql">DDL file.</a></p>

<pre>
Customer(<i>cid:</i> integer, <i>cname:</i> string, <i>address:</i> string, <i>city:</i> string, <i>state:</i> string)
Product(<i>pid:</i> integer, <i>pname:</i> string, <i>price:</i> currency, <i>inventory:</i> integer)
Shipment(<i>sid:</i> integer, <i>cid:</i> integer, <i>shipdate:</i> Date/Time)
ShippedProduct(<i>sid:</i> integer, <i>pid:</i> integer, <i>amount:</i> integer)
</pre>

<ol>
<li> Return the customer id,  name, address, and state where the customer is either in the state of Iowa ('IA') or California ('CA'). <br>Expected output:<br><img src="img/ra_q1.png" height="200"></li>

<li> Return the shipment id, date, shipped amount, product id, product name, and inventory for products that have 10 or less current inventory and have been in a shipment with a shipment amount over 3.  <br>Expected output:<br><img src="img/ra_q2.png" height="100"></li>

<li> Return a list of all the product id, name, and price that have been in a shipment before May 17, 2014. The product price must be less than $50, and the shipped amount < 5. <br>Expected output:<br><img src="img/ra_q3.png" height="100"></li>

<li> Return the product name, current inventory, shipment amount, and price where the product had a shipment of an amount greater than 60% of its current inventory and the product price is less than $5 or greater than or equal to $50.<br>Expected output:<br><img src="img/ra_q4.png" height="150"></li>

<li> Return a list of customer ids and names where the customer has no shipments or has a shipment with a shipped product with a price greater than $40.<br>Expected output:<br><img src="img/ra_q5.png" height="200"><br>Note: Order does not matter for records.</li>
</ol>

