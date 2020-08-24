# COSC 304 - Introduction to Database Systems<br>Assignment 7 - Building a Database-enabled Web Site using JSP

This assignment practices web development using a commercial database system, [Microsoft SQL Server](https://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/sqlserver.html)</a>. SQL Server supports almost all of the
SQL standard including foreign keys and triggers.  <b>The assignment is done in your project groups of 2, 3, or 4 people.</b> <b>If you are off campus, you must connect using VPN to access the database. <a href="https://it.ubc.ca/services/email-voice-internet/myvpn/setup-documents">Click for info</a>. The server is myvpn.ok.ubc.ca.</b></p>

<p>The web store that we are going to build allows customers to enter their information, chose products by putting them into a shopping cart, and then place an order.</p>


<h2>Initial Steps</h2>

<ol>

<li>If you are developing on your own laptop, you must setup your development environment. <a href="../../../Notes/JavaEE/setup.html">Click for instructions</a></li>

<li>Download the <a href="304_lab7.zip">starter project code files</a> and import into Eclipse as a Dynamic Web Server project.<br>
<p>
<img src="import1.png" align="top" height="400">
<img src="import2.png" height="400">
</p>
</li>

<li>Create the tables and load the sample data into your SQL Server database.  The file <tt>LoadData.java</tt> will load the database using the <tt>data/orderdb_sql.ddl</tt> script.  Make sure to set your own database, user id, and password.</li>

<li>Test your web site on your local machine.</li>

<li><b>Optional:</b> Upload your working site to the server when completed. Before uploading, create a directory called <tt><b>Lab7</b></tt> in your <tt>public_html/tomcat</tt> directory in your home
account on <tt>cosc304.ok.ubc.ca</tt>.  All files for this assignment will be in that directory. Use FileZilla to perform the upload (<a href="../../../Notes/filezilla/filezilla.html">instructions</a>).</li>

</ol>


<h2>Databases and Autonumber Fields</h2>

<p>This database storing customers, orders, and products uses autonumber fields to assign a primary key value for orders.  An
autonumber field is an integer field which is automatically assigned by the database.  The value of the counter starts
at 1.  When a record is added, the value of the autonumber field for the new record is set to the counter and then the counter is incremented.  Thus, the values of the autonumber field for records are 1,2,3,...  Autonumber fields are useful as primary keys as they are guaranteed to be unique.  To create an autonumber field in a SQL Server create table statement use the <tt>IDENTITY</tt> keyword: </p>

<pre>
CREATE TABLE dummy (
   A int NOT NULL IDENTITY,
   B VARCHAR(50),
   ....
   PRIMARY KEY (A)
);
</pre>


<h2>Question 1 (10 marks)</h2>

<p>Modify the <tt><b>listorder.jsp</b></tt> so that it lists all orders currently in the database. You must list all orders and the
products of those orders.</p>

<h4>Details:</h4>
<ol>
<li><a href="http://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/listorder.jsp">Sample output</a></li>

<li>If you upload your site to the server in the folder <tt>public_html/tomcat/Lab7</tt> then your URL will be:
<tt>http://cosc304.ok.ubc.ca/(yourUnivId)/tomcat/Lab7/shop.html</tt>.  <br>For example, my web site is at:
<tt><a href="http://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/shop.html">http://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/shop.html</a></tt>.</li>

<li>The main shop page is <tt><a href="http://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/shop.html">shop.html</a></tt>.  Feel free to change it to your shop name and style!</li>

<li>Your output does not have to look exactly like the sample (feel free to make it look better!).</li>

<li>A good way to get started with <tt>listorder.jsp</tt> is to copy some of the <a href="../../../Notes/Code/JdbcQuery.jsp">sample JDBC code posted (JdbcQuery.jsp)</a> and modify it
for this particular query. Note that the URL is now for Microsoft SQL Server not MySQL.</li>

</ol>

<h4>Marking Guide:</h4>

<ul>
<li><strong>+2 marks</strong> - for SQL Server connection information and making a successful connection</li>
<li><strong>+1 mark</strong> - for using try-catch syntax</li>
<li><strong>+2 marks</strong> - for displaying order summary information for each order in a table</li>
<li><strong>+3 marks</strong> - for displaying items in each order in a table</li>
<li><strong>+1 mark</strong> - for formatting currency values correctly (e.g. $91.70)</li>
<li><strong>+1 mark</strong> - for closing connection (either explicitly or as part of try-catch with resources syntax)</li>
</ul>

<h2>Question 2 (30 marks)</h2>

<p>Build a simple web site that allows users to search for products by name, put
products in their shopping cart, and place an order by checking out the items in their shopping cart.
Starter code is provided. Fill in a few of the JSP files to get the application to work.  Here are the steps you should do to get started:</p>

<ol>

<li>Use the <a href="304_lab7.zip">template code</a> downloaded and setup in Eclipse in Question 1. Summary of files:
<ul>
<li><strong><tt>listprod.jsp</tt></strong> - lists all products.  <strong>TODO: fill-in your own code (10 marks)</strong></li>
<li><strong><tt>addcart.jsp</tt></strong> - adds an item to the cart (stored using session variable).  No changes needed.</li>
<li><strong><tt>showcart.jsp</tt></strong> - displays the items in the cart.  No changes needed.</li>
<li><strong><tt>checkout.jsp</tt></strong> - page to start the checkout.  No changes needed.</li>
<li><strong><tt>order.jsp</tt></strong> - store a checked-out order to database.  <strong>TODO: fill-in your own code (20 marks)</strong></li>
</ul>
</li>

<li>Take a look at the sample web site which is available at <A
HREF="http://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/shop.html">http://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/shop.html</a>.</li>

<li>Start by editing the JSP file called <tt><b>listprod.jsp</b></tt>.  This file is called from <tt>shop.html</tt> when the
user begins to shop.  The file allows a customer to search for products by name.  If a customer enters "ab", then the query
should be: <tt>productName LIKE '%ab%'</tt>.</li>

<li>Start off with just being able to list products by name.  Inside <tt>listprod.jsp</tt> is a form whose GET method calls
<tt>listprod.jsp</tt> itself.  When a user submits the form, the URL passed to <tt>listprod.jsp</tt> will contain a parameter
<tt>productName</tt>.  Based on this parameter, construct your query.  Start with the template code and then add the required
code to connect to the database and list the products.</li>

<li>The file <tt>listprod.jsp</tt> also allows users to add items to their cart.  This is accomplished by having a link beside
each item.  When the user clicks on the link, another page called <b><tt>addcart.jsp</tt></b> is called with information on
the product to add.</li>

<li>The file <tt>addcart.jsp</tt> expects the following parameters:
<tt>addcart.jsp?id=(productId)&name=(productName)&price=(productPrice)</tt>.  You must make sure that you create the
appropriate links when listing your products.</li>

<li><tt>addcart.jsp</tt> calls another file that maintains a record of the shopping cart over a user's
session.  This file is <tt>showcart.jsp</tt>.</li>

<li>When the user wants to check-out, they must enter customer information.  The file <tt>checkout.jsp</tt> prompts the user
for a customer id and passes that information onto the JSP file <tt>order.jsp</tt>.</li>

<li>The other file you must write is <tt>order.jsp</tt>. This file must save an order and all its products to the database as long as a valid customer id was
entered.</li>

<li>Make sure to list the order id and all items as shown in the example.</li>

</ol>

<h4>Marking Guide (for listprod.jsp): (10 marks total)</h4>

<ul>
<li><strong>+1 mark</strong> - for SQL Server connection information and making a successful connection</li>
<li><strong>+2 marks</strong> - for using product name parameter to filter products shown (must handle case where nothing is provided in which case all products are shown)</li>
<li><strong>+1 mark</strong> - for using PreparedStatements</li>
<li><strong>+2 marks</strong> - for displaying table of products</li>
<li><strong>+3 marks</strong> - for building web link URL to allow products to be added to the cart</li>
<li><strong>+1 mark</strong> - for closing connection (either explicitly or as part of try-catch with resources syntax)</li>
</ul>

<h4>Marking Guide (for order.jsp): (20 marks total)</h4>

<ul>
<li><strong>+1 mark</strong> - for SQL Server connection information and making a successful connection</li>
<li><strong>+3 marks</strong> - for validating that the customer id is a number and the customer id exists in the database. Display an error if customer id is invalid.</li>
<li><strong>+1 mark</strong> - for showing error message if shopping cart is empty</li>
<li><strong>+3 marks</strong> - for inserting into ordersummary table and retrieving auto-generated id</li>
<li><strong>+6 marks</strong> - for traversing list of products and storing each ordered product in the orderproduct table</li>
<li><strong>+2 marks</strong> - for updating total amount for the order in OrderSummary table</li>
<li><strong>+2 marks</strong> - for displaying the order information including all ordered items</li>
<li><strong>+1 mark</strong> - for clearing the shopping cart (sessional variable) after order has been successfully placed</li>
<li><strong>+1 mark</strong> - for closing connection (either explicitly or as part of try-catch with resources syntax)</li>
</ul>

<h4>Bonus Marks</h4>

<p>Up to 10 bonus marks can be received by going beyond the basic assignment requirements:</p>

<ul>
<li><b>+5 marks</b> - for allowing a user to remove items from their shopping cart and to change the quantity of items ordered when viewing their cart.</li>
<li><b>+5 marks</b> - for validating a customer's password when they try to place an order.</li>
<li><b>+5 marks</b> - your site runs on cosc304.ok.ubc.ca or another server not just on your local development machine</li>
<li><b>Up to +5 marks</b> - for improving the looks of the site such as:
	<ul>
	<li><b>+2 marks</b> - for a page header with links to product page, list order, and shopping cart</li>
	<li><strong>+3 marks</strong> - for formatting product listing page to include better formatting as well as filter by category</li>	
	<li><strong>+3 marks</strong> - for improved formatting of cart page</li>	
	</ul>
</li>
<li>Other bonus marks may be possible if discussed with the TA/instructor.</li>
</ul>

<p><b>If you want to be eligible for bonus marks, please note that on your assignment and explain what you did to deserve the extra marks.  An <a href="http://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/bonus/shop.html">example web site with improved features is available.</a></b></p>

<h4>Deliverables:</h4>

<ol>
<li>Option #1: Demonstrate your working site to the TA in the lab and get +2 bonus marks. No submission on Canvas is required.</li>
<li>Option #2: Submit in a single zip file all your source code using Canvas. This can be done by exporting your project. Submit all your files, but the files you must change are: <tt><b>listprod.jsp</b></tt>, <tt><b>listorder.jsp</b></tt> and <tt><b>order.jsp</b></tt>.</li>
<li>You do NOT have to get the code uploaded and running on the web server cosc304.ok.ubc.ca to complete the assignment. However, if you do, you can submit the URL on the server for the TA to test your assignment.</li>
<li>If you work in a group, only one person needs to submit the assignment. Put all partner's names and student numbers on the submission.</li>
</ol>
