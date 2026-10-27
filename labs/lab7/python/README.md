# COSC 304 — Lab 7: Building a Database-Enabled Web Store Using Python

In this assignment you will extend a Python/Flask web store backed by Microsoft SQL Server. You will display orders, search for products, add them to a session-based shopping cart, and store completed orders. **Continue developing the same `cosc304-python` project for Labs 8, 9, and 10.**

## Example code (optional)

The project includes separate `examples/` Flask routes demonstrating Python web programming, SQL Server queries with `pyodbc`, parameterized SQL, HTML forms, and request parameters. These examples are not part of the assignment submission. See [Lab 7 examples and practice exercises](examples.md), or after starting Docker, visit [http://localhost/examples](http://localhost/examples).

## Set up the project

1. Install [Visual Studio Code](https://code.visualstudio.com/Download) (recommended) or another editor, and [Docker Desktop](https://www.docker.com/products/docker-desktop/).
2. The project source is available in [cosc304-python](cosc304-python/). Alternatively download the [cosc304-python.zip](cosc304-python.zip) starter project.
3. Open the **`cosc304-python`** folder in your editor.
4. Open a terminal in `cosc304-python` (in VS Code: *Terminal → New Terminal*). Run:

   ```bash
   docker compose up -d --build
   docker compose ps
   ```

   Docker starts Python/Flask and SQL Server and initializes the sample databases when the persistent database volume is first created. SQL Server can take a little time to become ready, especially on first startup. **You do not need to install Python, ODBC, or SQL Server on your own computer.**

   If you have the Java or Node.js version running, first execute `docker compose down` in that project's folder (not just `stop`): all versions use port 80 and SQL Server port 1433, so you should run only one at a time.
5. Visit [http://localhost/](http://localhost/) to see your store. Visit [http://localhost/loaddata](http://localhost/loaddata) to verify database connectivity and see data counts. That page includes a **Reset Database** button to reload the original store data. **Resetting deletes any orders and other changes you have made to store data.**
6. Modify the Python files in `cosc304-python/routes/` and refresh the browser. Flask's development server reloads automatically when Python files change. The shared `db.py` provides `get_connection()` to connect to SQL Server. `examples/` is for reference only.

Useful commands (run from `cosc304-python`):

```bash
docker compose ps                 # Show running services
docker compose logs --tail=100    # Show recent logs
docker compose logs -f app        # Follow Python errors/output
docker compose stop               # Stop services, preserve data
docker compose up -d              # Start again
docker compose down               # Remove containers, preserve database volume
```

Do **not** use `docker compose down -v` unless you want to delete the persisted database. If SQL Server does not run on your computer, contact the instructor about access to the course SQL Server.

### Project folders

| Folder/file | Purpose |
|---|---|
| `routes/` | Web store routes, including the three files you modify |
| `views/index.html` | Store landing page |
| `examples/` | Optional runnable Python/Flask examples; not submitted |
| `ddl/` | SQL Server scripts used to initialize/reset course data |
| `db.py` | Shared `pyodbc` SQL Server connection helper |
| `html_utils.py` | HTML escaping and currency formatting helpers |
| `app.py` | Flask application and route registration |
| `requirements.txt`, `docker-compose.yml`, `Dockerfile` | Python dependencies and local SQL Server/Flask environment |

---

## Databases and Autonumber Fields

The database stores customers, orders, and products. Autonumber fields are integer fields that automatically receive unique values when rows are inserted. In SQL Server, the `IDENTITY` keyword creates these fields:

```sql
CREATE TABLE dummy (
    A INT NOT NULL IDENTITY,
    B VARCHAR(50),
    PRIMARY KEY (A)
);
```

To retrieve a newly generated order ID in Python, SQL Server supports `OUTPUT INSERTED.orderId` in an `INSERT` statement. `pyodbc` executes parameterized SQL using `?` placeholders rather than concatenating user input into SQL:

```python
cursor.execute("SELECT customerId FROM customer WHERE customerId = ?", 1)
row = cursor.fetchone()
```

A connection is created with `connection = get_connection()`. Use `connection.cursor()` to run queries, and **close the connection** in a `finally` block. For inserts and updates, use `connection.commit()` only after all statements succeed, and `connection.rollback()` if an error occurs.

## Question 1 (10 marks)

Modify **`routes/listorder.py`** so it lists all orders in the database, together with the products belonging to each order.

#### Details:

1. [Sample output](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/listorder.jsp).
2. The main shop page is [http://localhost/](http://localhost/). A [sample shop](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/shop.html) is available. You can change your shop's name and style.
3. Your output does not have to look exactly like the sample.
4. Start by looking at the working [`QuerySQLServer.py` example](cosc304-python/examples/QuerySQLServer.py). Use `get_connection()` from `db.py` and call `connection.close()` in the `finally` block. For an order's items, you can join `orderproduct` to `product` and bind the `orderId` with a `?` parameter.

#### Marking Guide:

- **+2 marks** — successful SQL Server connection
- **+1 mark** — using `try` / `except` syntax
- **+2 marks** — displaying order summary information for each order in a table
- **+3 marks** — displaying the items in each order in a table
- **+1 mark** — formatting currency (e.g., $91.70)
- **+1 mark** — closing the connection

## Question 2 (30 marks)

Build a website that allows users to search for products by name, place products in a shopping cart, and check out. Starter code is included. Complete the three graded route files; the cart and checkout routes are already implemented.

1. Summary of code files:

   - **`routes/listprod.py`** — lists/searches products. **TODO: implement (10 marks).**
   - **`routes/addcart.py`** — adds products to the session cart. No changes needed.
   - **`routes/showcart.py`** — displays the shopping cart. No changes needed.
   - **`routes/checkout.py`** — prompts for a customer ID. No changes needed.
   - **`routes/order.py`** — saves a completed order to the database. **TODO: implement (20 marks).**

2. Try the [sample shopping site](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/shop.html).
3. Begin with `routes/listprod.py`, which handles the `/listprod` URL. When a user searches for `ab`, the query should use `productName LIKE '%ab%'`.
4. The GET form on `/listprod` submits its optional `productName` parameter to the same URL. Access it with `request.args.get('productName', '')`. **If the input is blank, show all products.** When searching, write SQL with a `?` placeholder for `LIKE`, passing `f'%{name}%'` as a parameter to `cursor.execute()`.
5. For each displayed product, provide an add-to-cart link of the form `/addcart?id=(productId)&name=(productName)&price=(productPrice)`. Use `url_for('addcart.add_to_cart', id=..., name=..., price=...)` from Flask to encode the product name and other parameters correctly.
6. The existing `addcart.py` handles the link and redirects to `/showcart`. It stores cart entries in the session as `session['productList']`, a dictionary keyed by product ID. Obtain all entries with `list(session.get('productList', {}).values())`. Each entry has `id`, `name`, `price`, and `quantity`.
7. `/checkout` displays a form requesting an existing customer ID, which it sends using **POST** to `/order`. Read the ID in `order.py` with `request.form.get('customerId', '')`.
8. Complete `order.py` to validate the customer and cart, insert the order in `ordersummary`, get the generated order ID, insert each product in `orderproduct`, and update the order total. **Only clear the cart after a successful order.** Using a database transaction is recommended to avoid incomplete orders if an insert fails.
9. Display the order ID, all purchased products, and the total. Use `escape_html(value)` for display text and `format_currency(value)` for dollar amounts (both are in `html_utils.py`).

#### Marking Guide (for listprod.py): (10 marks total)

- **+1 mark** — successful SQL Server connection
- **+2 marks** — filtering by product name, or listing all products for an empty filter
- **+1 mark** — using parameterized SQL (`?` placeholders)
- **+2 marks** — displaying a product table
- **+3 marks** — generating working add-to-cart links
- **+1 mark** — closing the connection

#### Marking Guide (for order.py): (20 marks total)

- **+1 mark** — successful SQL Server connection
- **+3 marks** — ensuring customer ID is numeric and exists, with an error if invalid
- **+1 mark** — showing an error for an empty shopping cart
- **+3 marks** — inserting in `ordersummary` and getting the generated order ID
- **+6 marks** — inserting each purchased product in `orderproduct`
- **+2 marks** — updating `ordersummary.totalAmount`
- **+2 marks** — displaying order details and all purchased items
- **+1 mark** — clearing the session cart after a successful order
- **+1 mark** — closing the connection

#### Bonus Marks

A maximum of **10 bonus marks** may be awarded, regardless of the total available bonuses:

- **+5 marks** — allow users to remove products or change quantities when viewing the cart.
- **+5 marks** — validate a customer's password during checkout.
- **Up to +5 marks** — improve the appearance of the site:
  - **+2 marks** — header with links to product search, order listing, and shopping cart.
  - **+3 marks** — better formatted product page including category filtering.
  - **+3 marks** — improved cart formatting.

Other bonus marks may be possible if discussed with the TA/instructor.

**If you want to be eligible for bonus marks, indicate this in your submission and explain the work completed.** An [example site with improved features](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/bonus/shop.html) is also available.

#### Deliverables:

1. **Option #1:** Demonstrate your working site to the TA during a help session. Bonus marks may be available for early completion. No Canvas submission is required.
2. **Option #2:** Submit a ZIP containing the completed `routes/` directory and any other application files you changed (`app.py`, `views/`, `html_utils.py`, etc.). The required files are **`listprod.py`, `listorder.py`, and `order.py`**. Do not include optional examples, Docker files, DDL, or `.venv` unless requested.
3. Submit once per group. Include both partners' names and student numbers.

**Note:** This assignment uses a development environment and a deliberately simplified cart URL for teaching. A production store should authenticate users and load trusted product names and prices from the database when placing orders, rather than trusting URL/session values.
