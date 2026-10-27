# COSC 304 — Lab 7: Building a Database-Enabled Web Store Using Node.js

In this assignment you will extend a Node.js/Express web store backed by Microsoft SQL Server. You will display orders, search for products, add them to a session-based shopping cart, and store completed orders. **Continue developing the same `cosc304-node` project for Labs 8, 9, and 10.**

## Example code (optional)

The project includes a separate `examples/` set of Express routes demonstrating basic Node.js output, SQL Server queries, parameterized SQL, HTML forms, and request parameters. These examples are not part of the assignment submission. See [Lab 7 examples and practice exercises](examples.md) or, after starting Docker, visit [http://localhost/examples](http://localhost/examples).

## Set up the project

1. Install [Visual Studio Code](https://code.visualstudio.com/Download) (recommended) or another editor, and [Docker Desktop](https://www.docker.com/products/docker-desktop/).
2. The project source is available in [cosc304-node](cosc304-node/). Alternatively there is a zip file [cosc304-node.zip](cosc304-node.zip).
3. Open the **`cosc304-node`** folder in your editor.
4. Open a terminal in `cosc304-node` (in VS Code: *Terminal → New Terminal*). Run:

   ```bash
   docker compose up -d --build
   docker compose ps
   ```

   Docker starts Node.js and SQL Server and initializes the sample databases the first time the persistent database volume is created. SQL Server can take a little time to become ready. (If you are also working with the Java version, first run `docker compose down` in its project folder, not just `stop`, because the versions use the same port numbers and SQL Server container name.)
5. Open [http://localhost/](http://localhost/) to see the store. Visit [http://localhost/loaddata](http://localhost/loaddata) to verify database connectivity and view data counts. That page also provides a **Reset Database** button if you need to reload the original store data. **Resetting deletes any orders and other changes you have made to the store data.**
6. Edit the files in `cosc304-node/routes/` and refresh the browser to see changes. Node automatically restarts as JavaScript files change. `db.js` provides shared SQL Server connection information; import and call `getConnection()` from the routes you implement. The `examples/` folder is for reference only.

Useful commands (run from `cosc304-node`):

```bash
docker compose ps                 # Show running services
docker compose logs --tail=100    # View recent logs
docker compose logs -f app        # Follow Node.js logs/errors
docker compose stop               # Stop services, preserve data
docker compose up -d              # Start again
docker compose down               # Remove containers, preserve database volume
```

Do **not** run `docker compose down -v` unless you deliberately want to delete the persisted database. If SQL Server does not run on your computer, contact the instructor about access to the course SQL Server.

### Project folders

| Folder/file | Purpose |
|---|---|
| `routes/` | Your web store routes, including the three files you modify |
| `views/index.html` | Store landing page |
| `examples/` | Optional runnable instructional examples; not submitted |
| `ddl/` | SQL Server scripts used to initialize/reset course data |
| `db.js` | Shared SQL Server connection helper |
| `html.js` | Small helpers for escaping HTML and formatting currency |
| `server.js` | Express server, sessions, and route registration |
| `docker-compose.yml`, `Dockerfile`, `package.json` | Local SQL Server and Node.js development environment |

---

## Databases and Autonumber Fields

The database stores customers, orders, and products. Autonumber fields provide unique, automatically generated primary keys for orders. In SQL Server, an `IDENTITY` column generates these keys:

```sql
CREATE TABLE dummy (
    A INT NOT NULL IDENTITY,
    B VARCHAR(50),
    PRIMARY KEY (A)
);
```

Use SQL Server's `OUTPUT INSERTED.orderId` with your order `INSERT` to retrieve the new order ID. Use **parameterized SQL** with `pool.request().input(...).query(...)` rather than concatenating data from requests into SQL statements.

## Question 1 (10 marks)

Modify `routes/listorder.js` to list all orders currently in the database, including the products belonging to each order.

#### Details:

1. [Sample output](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/listorder.jsp).
2. Your main shop page is [http://localhost/](http://localhost/); a [sample shop](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/shop.html) is available. Feel free to change the name and style of your store.
3. Your output does not have to look exactly like the sample.
4. Start from the working [SQL Server example](cosc304-node/examples/QuerySQLServer.js). **Use the shared connection helper in `db.js` (`await getConnection()`) and close the pool in a `finally` block.** The SQL Server `mssql` package provides `pool.request().query(...)` and parameterized requests.

#### Marking Guide:

- **+2 marks** — for establishing a successful SQL Server connection
- **+1 mark** — for using try-catch syntax
- **+2 marks** — for displaying order summary information for each order in a table
- **+3 marks** — for displaying items in each order in a table
- **+1 mark** — for formatting currency values correctly (e.g. $91.70)
- **+1 mark** — for closing the connection (e.g. `await pool.close()` in `finally`)

## Question 2 (30 marks)

Build a simple web site that allows users to search for products by name, put products in their shopping cart, and place an order by checking out. Starter code is provided. Complete the three marked routes without rewriting the provided cart and checkout routes.

1. Summary of code files:

   - **`routes/listprod.js`** — lists/searches all products. **TODO: write your own code (10 marks).**
   - **`routes/addcart.js`** — adds a product to the session shopping cart. No changes needed.
   - **`routes/showcart.js`** — displays items in the shopping cart. No changes needed.
   - **`routes/checkout.js`** — prompts for a customer ID. No changes needed.
   - **`routes/order.js`** — stores a checked-out order in the database. **TODO: write your own code (20 marks).**

2. Look at the [sample shopping site](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/shop.html).
3. Start by editing `routes/listprod.js`. This route is called from the main page at `/`. It allows customers to search for products by name. If someone searches for `ab`, the SQL predicate should be `productName LIKE '%ab%'`.
4. The GET form in `listprod.js` submits to `/listprod` and provides an optional parameter called `productName`, accessible through `req.query.productName`. **If nothing is entered, list all products.** Bind search values with `request.input('name', sql.VarChar, ... )` and use `LIKE @name` rather than constructing SQL from input strings.
5. Display each matching product with an add-to-cart link. Each link must follow the form `/addcart?id=(productId)&name=(productName)&price=(productPrice)`. Encode values in the query string using `encodeURIComponent` or `URLSearchParams` so special characters in product names work correctly.
6. `addcart.js` adds the product to the session and redirects to `/showcart`. Cart entries are stored in `req.session.productList` **as an object keyed by product ID**. You can obtain the items with `Object.values(req.session.productList || {})`. Each item contains `id`, `name`, `price`, and `quantity`.
7. When users check out, `checkout.js` asks for an existing customer ID and submits a **POST** form to `/order`. Retrieve its value as `req.body.customerId` in `routes/order.js`.
8. Complete `order.js` so it checks the customer ID and cart, inserts the order and its items into `ordersummary` and `orderproduct`, retrieves the generated order ID, and updates the order total. Display the new order ID and all items. **Only clear the session cart after a successful checkout.** A transaction is recommended to prevent partially saved orders if an INSERT fails.
9. Use `formatCurrency(value)` to display currency and `escapeHtml(value)` when outputting user-facing text. These helpers are exported by `html.js` and already imported in the starter routes.

#### Marking Guide (for listprod.js): (10 marks total)

- **+1 mark** — for establishing a successful SQL Server connection
- **+2 marks** — for using product name to filter results (or listing all products when blank)
- **+1 mark** — for using parameterized SQL (`.input(...)`)
- **+2 marks** — for displaying a table of products
- **+3 marks** — for correct add-to-cart URLs
- **+1 mark** — for closing the connection

#### Marking Guide (for order.js): (20 marks total)

- **+1 mark** — for establishing a successful SQL Server connection
- **+3 marks** — for checking that customer ID is numeric and exists in the database, showing an error otherwise
- **+1 mark** — for showing an error when the cart is empty
- **+3 marks** — for inserting an `ordersummary` row and retrieving the generated ID
- **+6 marks** — for inserting each ordered product in `orderproduct`
- **+2 marks** — for updating the total amount in `ordersummary`
- **+2 marks** — for displaying order details including all purchased items
- **+1 mark** — for clearing the session cart after successful checkout
- **+1 mark** — for closing the connection

#### Bonus Marks

A maximum of 10 bonus marks may be awarded, regardless of how many bonus features are completed. Bonus mark options:

- **+5 marks** — for allowing users to remove items from the shopping cart and change quantities in the cart.
- **+5 marks** — for validating a customer's password when they place an order.
- **Up to +5 marks** — for improving the appearance of the site:
  - **+2 marks** — for a page header with links to product search, order list, and shopping cart.
  - **+3 marks** — for a better formatted product page, including category filtering.
  - **+3 marks** — for improved cart formatting.

Other bonus marks may be possible if discussed with the TA/instructor.

**If you want to be eligible for bonus marks, indicate this in your submission and explain the work completed.** An [example site with improved features](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/bonus/shop.html) is available.

#### Deliverables:

1. **Option #1:** Demonstrate your working site to the TA in a help session. Bonus marks may be available for early completion. No Canvas submission is required.
2. **Option #2:** Submit a ZIP containing your completed `routes/` directory plus any other application files you modified (`server.js`, `views/`, `html.js`, etc.). The required implementations are `listprod.js`, `listorder.js`, and `order.js`. Do not submit the optional `examples/`, Docker files, `ddl/`, or `node_modules/` unless requested.
3. Only one submission per group. Put both partners' names and student numbers on the submission.
