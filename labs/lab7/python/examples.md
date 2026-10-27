# COSC 304 — Lab 7: Python / Flask Examples

These are **optional practice exercises** for [Lab 7: Building a Database-Enabled Web Store](README.md). They run as Flask routes in the same `cosc304-python` Docker environment as the assignment, under `/examples`. **Do not submit the examples.**

Start Docker as described in the [main Lab 7 README](README.md), then open [http://localhost/examples](http://localhost/examples) to browse all the examples. The Python source files are in [`cosc304-python/examples/`](cosc304-python/examples/). The SQL Server hostname inside Docker is `cosc304_sqlserver`, not `localhost`; all examples use `get_connection()` from [`db.py`](cosc304-python/db.py).

## Example 1 — Basic Flask routes

Read [`HelloWorld.py`](cosc304-python/examples/HelloWorld.py). This route returns `Hello World`. [Run the example](http://localhost/examples/HelloWorld).

**Practice:** Modify it to display the heading **Hello World Again!** followed by the numbers 1–5 on separate lines. You can generate a sequence with `range(1, 6)`.

[Solution: `HelloWorldAgain.py`](cosc304-python/examples/HelloWorldAgain.py) — [Run the solution](http://localhost/examples/HelloWorldAgain).

## Example 2 — Query SQL Server

Read [`QuerySQLServer.py`](cosc304-python/examples/QuerySQLServer.py), which connects to the `workson` database using `pyodbc`, runs a `SELECT` query, and displays the results in an HTML table. [Run the example](http://localhost/examples/QuerySQLServer).

Notice `get_connection('workson')`, `connection.cursor()`, `cursor.execute(...)`, `cursor.fetchall()`, and `connection.close()` in `finally`.

## Example 3 — Departments, projects, and employees

**Practice:** Write a Python route that, for each department, displays the department's projects followed by its employees. Retrieve each department and use `?` parameters to search for its projects and employees.

[Solution: `WorksOnDeptEmpProj.py`](cosc304-python/examples/WorksOnDeptEmpProj.py) — [Run the solution](http://localhost/examples/WorksOnDeptEmpProj).

## Example 4 — HTML forms and SQL parameters

Examine the [employee query form](cosc304-python/examples/sampleForm.py) and its handler [`EmpQuery.py`](cosc304-python/examples/EmpQuery.py). The form submits optional employee-name and department filters. The handler obtains these values with `request.args.get(...)` and safely binds them to a SQL query using `?` placeholders.

[Run the form](http://localhost/examples/sampleForm). The URL `/examples/EmpQuery` invokes a Flask route; you do not open the `.py` source file directly in the browser.

## Example 5 — Employee/project search

**Practice:** Build a form with employee-name and project-name fields, accepting partial matches with SQL `LIKE`. Display the matching assignments from `workson` and their count.

[Solution: `WorksOnQuery.py`](cosc304-python/examples/WorksOnQuery.py) (form) and [`EmpProjQuery.py`](cosc304-python/examples/EmpProjQuery.py) (handler) — [Run the form](http://localhost/examples/WorksOnQuery).

[Return to Lab 7 assignment](README.md).
