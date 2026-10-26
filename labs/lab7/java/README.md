# COSC 304 — Lab 7: Building a Database-Enabled Web Store Using JSP

In this assignment you will extend a Java/JSP web store backed by Microsoft SQL Server. You will display orders, search for products, add them to a session-based shopping cart, and store completed orders. **Continue developing the same `cosc304-java` project for Labs 8, 9, and 10.**

## Example code (optional)

The project includes a separate `examples/` web application with demonstrations of JSP, HTML forms, sessions, JDBC, prepared statements, JavaScript/AJAX, and servlets. These examples are not part of the assignment submission. See [Lab 7 examples and practice exercises](examples.md) or, after starting Docker, visit [http://localhost/examples/](http://localhost/examples/).

## Set up the project

1. Install [Visual Studio Code](https://code.visualstudio.com/Download) (recommended) or another editor, and [Docker Desktop](https://www.docker.com/products/docker-desktop/).
2. The project source is available in [cosc304-java](cosc304-java/). Alternatively there is a zip file [cosc304-java.zip](cosc304-java.zip).
3. Open the **`cosc304-java`** folder in your editor. 
4. Open a terminal in `cosc304-java` (in VS Code: *Terminal → New Terminal*). Run:

   ```bash
   docker compose up -d --build
   docker compose ps
   ```

   Docker starts Tomcat and SQL Server and initializes the sample databases the first time the persistent database volume is created. SQL Server can take a little time to become ready.
5. Open [http://localhost/shop/](http://localhost/shop/) to see the store. Visit [http://localhost/shop/loaddata.jsp](http://localhost/shop/loaddata.jsp) to verify database connectivity and view data counts. That page also provides a **Reset Database** button if you need to reload the original store data. **Resetting deletes any orders and other changes you have made to the store data.**
6. Edit the JSP files in `cosc304-java/shop/` and refresh the browser to see changes. `shop/jdbc.jsp` provides shared connection information. The `examples/` folder is for reference only.

Useful commands (run from `cosc304-java`):

```bash
docker compose ps                 # Show running services
docker compose logs --tail=100    # View recent logs
docker compose stop               # Stop services, preserve data
docker compose up -d              # Start again
docker compose down               # Remove containers, preserve database volume
```

Do **not** run `docker compose down -v` unless you deliberately want to delete the persisted database. If SQL Server does not run on your computer, contact the instructor about access to the course SQL Server.

### Project folders

| Folder/file | Purpose |
|---|---|
| `shop/` | Your web store application and the JSP files you modify |
| `examples/` | Optional instructional examples; not submitted |
| `ddl/` | SQL Server scripts used to initialize/reset course data |
| `lib/` | JDBC driver used by Tomcat |
| `docker-compose.yml`, `Dockerfile` | Local SQL Server and Tomcat development environment |

---

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

## Question 1 (10 marks)

Modify `listorder.jsp` so that it lists all orders currently in the database. You must list all orders and the products of those orders.

#### Details:

1. [Sample output](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/listorder.jsp)

2. The main shop page is [http://localhost/shop/](http://localhost/shop/) and a sample is at [the course demonstration site](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/shop.html).  Feel free to change it to your shop name and style!

3. Your output does not have to look exactly like the sample (feel free to make it look better!).

4. A good way to get started with `listorder.jsp` is to copy some of the [sample SQL Server JDBC code](https://github.com/rlawrenc/cosc_304/blob/main/labs/lab6/code/TestJdbcSqlServer.java) and modify it for this particular query. **Use the SQL Server connection provided by `shop/jdbc.jsp` (include the file and call `getConnection()`).**


#### Marking Guide:

- **+2 marks** - for establishing a successful SQL Server connection
- **+1 mark** - for using try-catch syntax
- **+2 marks** - for displaying order summary information for each order in a table
- **+3 marks** - for displaying items in each order in a table
- **+1 mark** - for formatting currency values correctly (e.g. $91.70)
- **+1 mark** - for closing connection (either explicitly or as part of try-catch with resources syntax)

## Question 2 (30 marks)

Build a simple web site that allows users to search for products by name, put products in their shopping cart, and place an order by checking out the items in their shopping cart. Project code is provided. Fill in a few of the JSP files to get the application to work.  Here are the steps you should do to get started:

1. Summary of code files:

- **listprod.jsp** - lists all products.  **TODO: fill-in your own code (10 marks)**
- **addcart.jsp** - adds an item to the cart (stored using session variable).  No changes needed.
- **showcart.jsp** - displays the items in the cart.  No changes needed.
- **checkout.jsp** - page to start the checkout.  No changes needed.
- **order.jsp** - store a checked-out order to database. **TODO: fill-in your own code (20 marks)**

2. Take a look at the sample web site available at [https://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/shop.html](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/shop.html).

3. Start by editing the JSP file called `listprod.jsp`.  This file is called from `index.jsp` when the user begins to shop.  The file allows a customer to search for products by name.  If a customer enters "ab", then the query should be: `productName LIKE '%ab%'`.

4. Start off with just being able to list products by name.  Inside `listprod.jsp` is a form whose GET method calls `listprod.jsp` itself.  When a user submits the form, the URL passed to `listprod.jsp` will contain a parameter `productName`.  Based on this parameter, construct your query. Start with the provided code and then add the required code to connect to the database and list the products.

5. The file `listprod.jsp` also allows users to add items to their cart. This is accomplished by having a link beside each item. When the user clicks on the link, another page called `addcart.jsp` is called with information on the product to add.

6. The file `addcart.jsp` expects the following parameters: `addcart.jsp?id=(productId)&name=(productName)&price=(productPrice)`.  You must make sure that you create the appropriate links when listing your products.

7. `addcart.jsp` updates the session shopping cart and redirects to `showcart.jsp`, which displays the cart contents.

8. When the user wants to check out, they must enter an existing customer ID.  The file `checkout.jsp` prompts the user for a customer id and passes that information onto the JSP file `order.jsp`.

9. The other file you must write is `order.jsp`. This file must save an order and all its products to the database as long as a valid customer id was entered.

10. Make sure to list the order id and all items as shown in the example.


#### Marking Guide (for listprod.jsp): (10 marks total)

- **+1 mark** - for establishing a successful SQL Server connection
- **+2 marks** - for using product name parameter to filter products shown (must handle case where nothing is provided in which case all products are shown)
- **+1 mark** - for using PreparedStatements
- **+2 marks** - for displaying table of products
- **+3 marks** - for building web link URL to allow products to be added to the cart
- **+1 mark** - for closing connection (either explicitly or as part of try-catch with resources syntax)

#### Marking Guide (for order.jsp): (20 marks total)

- **+1 mark** - for establishing a successful SQL Server connection
- **+3 marks** - for validating that the customer id is a number and the customer id exists in the database. Display an error if customer id is invalid.
- **+1 mark** - for showing error message if shopping cart is empty
- **+3 marks** - for inserting into ordersummary table and retrieving auto-generated id
- **+6 marks** - for traversing list of products and storing each ordered product in the orderproduct table
- **+2 marks** - for updating total amount for the order in OrderSummary table
- **+2 marks** - for displaying the order information including all ordered items
- **+1 mark** - for clearing the shopping cart (session variable) after order has been successfully placed
- **+1 mark** - for closing connection (either explicitly or as part of try-catch with resources syntax)


#### Bonus Marks

A maximum of 10 bonus marks may be awarded, regardless of how many bonus features are completed. Bonus mark options:

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
2. Option #2: Submit your completed `shop/` directory as a single ZIP file on Canvas. The required implementations are `listprod.jsp`, `listorder.jsp`, and `order.jsp`; include any other shop files you modified. Do not submit the optional `examples/` directory or Docker/database files unless requested.
3. Only one submission for a group. Put both partners' names and student numbers on the submission.
