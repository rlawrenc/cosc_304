# COSC 304 - Introduction to Database Systems<br>Assignment 7 - Building a Database-enabled Web Site using PHP

This assignment practices web development using a commercial database system, [Microsoft SQL Server](https://www.microsoft.com/en-ca/sql-server). SQL Server supports most of the SQL standard including foreign keys and triggers.</p>

The web store that we are going to build allows customers to enter their information, chose products by putting them into a shopping cart, and then place an order.

## Initial Steps

1. Download the [starter project code files](304_lab7_starter_php.zip). 

2. Setup your local development environment ([instructions](setup/)). 

3. A new database called `orders` should be automatically created and populated with sample data. If that is not the case, create the tables and load the sample data into your SQL Server database.  The file `loaddata.php` will load the database using the `ddl/SQLServer_orderdb.ddl` script. You can run this file from the command line or by using the URL: `http://localhost/loaddata.php` .

## Databases and Autonumber Fields

This database storing customers, orders, and products uses autonumber fields to assign a primary key value for orders.  An autonumber field is an integer field which is automatically assigned by the database.  The value of the counter starts at 1.  When a record is added, the value of the autonumber field for the new record is set to the counter and then the counter is incremented.  Thus, the values of the autonumber field for records are 1,2,3,...  Autonumber fields are useful as primary keys as they are guaranteed to be unique.  To create an autonumber field in a SQL Server create table statement use the `IDENTITY` keyword: 

```
CREATE TABLE dummy (
   A int NOT NULL IDENTITY,
   B VARCHAR(50),
   ....
   PRIMARY KEY (A)
);
```
## Helpful PHP Links

- [Microsoft SQL Driver Documentation](http://php.net/manual/en/book.sqlsrv.php)
	- [Connect to database](http://php.net/manual/en/function.sqlsrv-connect.php)
	- [Disconnect from database](http://php.net/manual/en/function.sqlsrv-close.php)
	- [Execute SQL](http://php.net/manual/en/function.sqlsrv-query.php)
	- [Return first row from a query](http://php.net/manual/en/function.sqlsrv-fetch-array.php)
- [Session Documentation](http://php.net/manual/en/book.session.php)
	- [session_start - start or continue session throughout the website](http://php.net/manual/en/function.session-start.php)
	- [session_destroy - clear/reset all session variables](http://php.net/manual/en/function.session-destroy.php)
	- [$_SESSION array](http://php.net/manual/en/reserved.variables.session.php)
- [Check if variables are inuse](http://php.net/manual/en/function.isset.php)

## Question 1 (10 marks)

Modify the `listorder.php` so that it lists all orders currently in the database. You must list all orders and the products of those orders.

#### Details:

1. [Sample output](https://cosc304.ok.ubc.ca/rlawrenc/lab7_php/listorder.php)

2. The URL of your site on localhost is [http://localhost/shop.html](http://localhost/shop.html).

3. The main shop page is [shop.html](http://localhost/shop.html).  Feel free to change it to your shop name and style!

4. Your output does not have to look exactly like the sample (feel free to make it look better!).

5. A good way to get started with `listorder.php` is to copy some of the [sample code posted](../code/QuerySQLServer.php) and modify it for this particular query.


#### Marking Guide:

- **+1 mark** - for SQL Server connection information and making a successful connection
- **+3 marks** - for displaying order summary information for each order in a table
- **+4 marks** - for displaying items in each order in a table
- **+1 mark** - for formatting currency values correctly (e.g. $91.70)
- **+1 mark** - for closing connection 

## Question 2 (30 marks)

Build a simple web site that allows users to search for products by name, put products in their shopping cart, and place an order by checking out the items in their shopping cart. Starter code is provided. Fill in a few of the PHP files to get the application to work.  Here are the steps you should do to get started:

1. Use the [template code](304_lab7_starter_php.zip) downloaded and setup in Question 1. Summary of files:

- **listprod.php** - lists all products.  **TODO: fill-in your own code (10 marks)**
- **addcart.php** - adds an item to the cart (stored using session variable).  No changes needed.
- **showcart.php** - displays the items in the cart.  No changes needed.
- **checkout.php** - page to start the checkout.  No changes needed.
- **order.php** - store a checked-out order to database. **TODO: fill-in your own code (20 marks)**

2. Take a look at the sample web site available at [https://cosc304.ok.ubc.ca/rlawrenc/lab7_php/shop.html](https://cosc304.ok.ubc.ca/rlawrenc/lab7_php/shop.html).

3. Start by editing the PHP file called `listprod.php`.  This file is called from `shop.html` when the user begins to shop.  The file allows a customer to search for products by name.  If a customer enters "ab", then the query should be: `productName LIKE '%ab%'`.

4. Start off with just being able to list products by name.  Inside `listprod.php` is a form whose GET method calls `listprod.php` itself.  When a user submits the form, the URL passed to `listprod.php` will contain a parameter `productName`.  Based on this parameter, construct your query. Start with the template code and then add the required code to connect to the database and list the products.

5. The file `listprod.php` also allows users to add items to their cart. This is accomplished by having a link beside each item. When the user clicks on the link, another page called `addcart.php` is called with information on the product to add.

6. The file `addcart.php` expects the following parameters: `addcart.php?id=(productId)&name=(productName)&price=(productPrice)`.  You must make sure that you create the appropriate links when listing your products.

7. `addcart.php` calls another file that maintains a record of the shopping cart over a user's session.  This file is `showcart.php`.

8. When the user wants to check-out, they must enter customer information.  The file `checkout.php` prompts the user for a customer id and passes that information onto the file `order.php`.

9. The other file you must write is `order.php`. This file must save an order and all its products to the database as long as a valid customer id was entered.

10. Make sure to list the order id and all items as shown in the example.


#### Marking Guide (for listprod.php): (10 marks total)

- **+2 marks** - for using product name parameter to filter products shown (must handle case where nothing is provided in which case all products are shown)
- **+1 mark** - for using PreparedStatements
- **+3 marks** - for displaying table of products
- **+3 marks** - for building web link URL to allow products to be added to the cart
- **+1 mark** - for closing connection

#### Marking Guide (for order.php): (20 marks total)

- **+3 marks** - for validating that the customer id is a number and the customer id exists in the database. Display an error if customer id is invalid.
- **+1 mark** - for showing error message if shopping cart is empty
- **+4 marks** - for inserting into OrderSummary table and retrieving auto-generated id
- **+6 marks** - for traversing list of products and storing each ordered product in the orderproduct table
- **+2 marks** - for updating total amount for the order in OrderSummary table
- **+2 marks** - for displaying the order information including all ordered items
- **+1 mark** - for clearing the shopping cart (sessional variable) after order has been successfully placed
- **+1 mark** - for closing connection


#### Bonus Marks

Up to 10 bonus marks can be received by going beyond the basic assignment requirements:

- **+5 marks** - for allowing a user to remove items from their shopping cart and to change the quantity of items ordered when viewing their cart.
- **+5 marks** - for validating a customer's password when they try to place an order.
- **Up to +5 marks** - for improving the looks of the site such as:
	- **+2 marks** - for a page header with links to product page, list order, and shopping cart
	- **+3 marks** - for formatting product listing page to include better formatting as well as filter by category	
	- **+3 marks** - for improved formatting of cart page		

- Other bonus marks may be possible if discussed with the TA/instructor.

**If you want to be eligible for bonus marks, please note that on your assignment and explain what you did to deserve the extra marks.  An [example web site with improved features is available](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/bonus/shop.html).**

#### Deliverables:

1. Option #1: Demonstrate your working site to the TA in a help session. Bonus marks if completed by early deadlines. No submission on Canvas is required.
2. Option #2: Submit in a single zip file all your source code using Canvas. Submit **all** your files, but the files you must change are: `listprod.php`, `listorder.php` and `order.php`.
3. Only one submission for a group. Put both partners' names and student numbers on the submission.
