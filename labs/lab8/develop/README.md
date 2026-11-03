# COSC 304 - Introduction to Database Systems<br>Lab 8: Images, Security, and Transactions

Modify your existing project web site with new features including a product detail page, a login feature, an administrator page, and support for transactions.

## Project Requirements (25 marks)

1. [Sample web site](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/lab8/index.jsp)

2. Start with the setup for lab 7 for either [Java](https://github.com/rlawrenc/cosc_304/tree/main/labs/lab7/java), [Python](https://github.com/rlawrenc/cosc_304/tree/main/labs/lab7/python), or [Node.js](https://github.com/rlawrenc/cosc_304/tree/main/labs/lab7/nodejs). **If you have an existing Docker container for lab 7, you do not need to download and setup lab 7 again.**

3. Download starter code for [Java](304_lab8_java_starter.zip), [Python](304_lab8_python_starter.zip), or [Node.js](304_lab8_node_starter.zip). These code files should be **ADDED** to your existing lab 7 project. 

4. Your output does not have to look exactly like the sample (feel free to make it look better!).

The product page will show details on the product including images. An image can be retrieved from a local folder using a URL or stored as a binary object in the database.

#### Marking Guide (product page): (10 marks)

- **+1 mark** - for modifying product listing page to go to product detail page when click on product name
- **+3 marks** - for using PreparedStatement to retrieve and display product information by id
- **+2 marks** - for displaying an image using an HTML `img` tag based on `productImageURL` field
- **+3 marks** - for displaying an image from the binary field `productImage` by providing an `img` tag and modifying the `displayImage` server-side code.
- **+1 mark** - for adding two links: "Add to Cart" link should use the product's actual ID, name, and price, and "Continue Shopping" link should return to the product listing.

#### Screenshot

<img src="img/productPage.png" width="300">

#### Marking Guide (admin and login page): (5 marks)

- **+2 marks** - Validate the user ID and password against the database and store the logged-in user in the session.
- **+1 mark** - Restrict access to the administrator page and display the current user on the main page.
- **+2 marks** - Display a report showing total sales for each day, ordered by date. Use SQL aggregation and date functions as required.

#### Screenshot

<img src="img/adminPage.png" width="300">

#### Marking Guide (customer page): (5 marks)

The customer page displays the currently logged-in customer's information.

- **+1 mark** - for displaying error message if attempt to access page and not logged in
- **+4 marks** - for retrieving customer information by id and displaying it

#### Screenshot

<img src="img/customerPage.png" width="300">


#### Marking Guide (shipment page): (5 marks)

- **+3 marks** - Use a database transaction to process all products in an order. If every product can be shipped, update the inventory for all products and commit the transaction. If an error occurs, roll back all changes.
- **+2 marks** - Check that the selected warehouse has sufficient inventory for the ordered quantity of each product. If any product has insufficient inventory, display an error and roll back the entire transaction.

Test both a successful and an unsuccessful shipment. Verify that inventory is updated only when the entire transaction succeeds. Note that you may need to reload the database if you test more than once.
- Test by entering URL like: http://localhost/shop/ship.jsp?orderId=1

#### Screenshot - Successful Shipment with orderId=1

<img src="img/shipmentPage1.png" width="500">

#### Screenshot - Unsuccessful Shipment with orderId=3

<img src="img/shipmentPage2.png" width="500">

# Submission

**If you do not demonstrate live to the TA in virtual office hours, please upload your code and a video clip demonstrating your working pages with the new features on Canvas.** Bonus marks available for early completion.
