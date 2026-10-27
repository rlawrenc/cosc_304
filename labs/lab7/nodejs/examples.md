# COSC 304 — Lab 7: Node.js / Express Examples

These are **optional practice exercises** for [Lab 7: Building a Database-Enabled Web Store](README.md). They run in the same `cosc304-node` Docker environment as the assignment, under `/examples`, but are not part of your assignment submission.

Start Docker as described in the [main Lab 7 README](README.md), then open [http://localhost/examples](http://localhost/examples) to browse all runnable examples. Source files are in [`cosc304-node/examples/`](cosc304-node/examples/). The SQL Server hostname inside Docker is `cosc304_sqlserver` (not `localhost` from the Node container). All database examples use the shared connection helper in [`db.js`](cosc304-node/db.js).

## Example 1 — Basic Express routes

Read [`HelloWorld.js`](cosc304-node/examples/HelloWorld.js). This simple Express route returns the text `Hello World`. [Run it](http://localhost/examples/HelloWorld).

**Practice:** Modify the code to display **Hello World Again!** followed by the numbers 1–5, each on a separate line.

[Solution: `HelloWorldAgain.js`](cosc304-node/examples/HelloWorldAgain.js) — [Run the solution](http://localhost/examples/HelloWorldAgain).

## Example 2 — Query SQL Server

Read [`QuerySQLServer.js`](cosc304-node/examples/QuerySQLServer.js). It connects to the `workson` database with the `mssql` package, executes a `SELECT` query, and renders the results in an HTML table. [Run the example](http://localhost/examples/QuerySQLServer).

Observe `await getConnection('workson')`, `pool.request().query(...)`, and `await pool.close()` in a `finally` block.

## Example 3 — Departments, projects, and employees

**Practice:** Modify a Node.js query so that, for each department, it lists the department's projects followed by its employees.

[Solution: `WorksOnDeptEmpProj.js`](cosc304-node/examples/WorksOnDeptEmpProj.js) — [Run the solution](http://localhost/examples/WorksOnDeptEmpProj).

## Example 4 — HTML forms and SQL parameters

Read the [employee query form](cosc304-node/examples/sampleForm.js) and its handler [`EmpQuery.js`](cosc304-node/examples/EmpQuery.js). The form submits optional employee-name and department filters. The handler binds query values using `request.input(...)`.

[Run the form](http://localhost/examples/sampleForm). Observe that route paths such as `/examples/EmpQuery` are URLs, not filenames to open directly in the browser.

## Example 5 — Employee/project search

**Practice:** Build a form with employee-name and project-name fields accepting partial matches via SQL `LIKE`, display the matching `workson` assignments, and show the number of results.

[Solution: `WorksOnQuery.js`](cosc304-node/examples/WorksOnQuery.js) (form) and [`EmpProjQuery.js`](cosc304-node/examples/EmpProjQuery.js) (handler) — [Run the form](http://localhost/examples/WorksOnQuery).

[Return to Lab 7 assignment](README.md).
