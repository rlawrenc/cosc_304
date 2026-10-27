# COSC 304 — Lab 7: JSP, JDBC, and Servlet Examples

These are **optional practice examples** to help with [Lab 7: Building a Database-Enabled Web Store](README.md). They run in the same `cosc304-java` Docker environment as the assignment, but in a separate web application. **You do not need to submit the example code.**

Start Docker as described in the [main Lab 7 README](README.md), then open [http://localhost/examples/](http://localhost/examples/) to browse all runnable examples. The source is in [`cosc304-java/examples/`](cosc304-java/examples/). The SQL Server connection hostname inside Docker is `cosc304_sqlserver`; it is not `localhost` from the Tomcat container.

## Example 1 — JSP basics

Look at [`HelloWorld.jsp`](cosc304-java/examples/HelloWorld.jsp), which uses JSP scriptlets to generate HTML output. Run it at [http://localhost/examples/HelloWorld.jsp](http://localhost/examples/HelloWorld.jsp).

**Practice:** Modify the example to display the heading **Hello World Again!** followed by the numbers 1–5, each on its own line.

[Solution: `HelloWorldAgain.jsp`](cosc304-java/examples/HelloWorldAgain.jsp) — [Run the solution](http://localhost/examples/HelloWorldAgain.jsp).

## Example 2 — Query SQL Server with JDBC

Examine [`JdbcSQLServer.jsp`](cosc304-java/examples/JdbcSQLServer.jsp). It connects to the `workson` database and displays query results in an HTML table. [Run the example](http://localhost/examples/JdbcSQLServer.jsp).

Observe how `DriverManager`, `Statement`, and `ResultSet` are used. The SQL Server JDBC driver is installed in Tomcat, so you do not need to call `Class.forName()` explicitly.

## Example 3 — Departments, projects, and employees

**Practice:** Extend a JSP query against the `workson` database so that, for each department, you list its projects and then its employees.

[Solution: `WorksOnDeptEmpProj.jsp`](cosc304-java/examples/WorksOnDeptEmpProj.jsp) — [Run the solution](http://localhost/examples/WorksOnDeptEmpProj.jsp).

## Example 4 — HTML form parameters and prepared statements

Study the [employee query form](cosc304-java/examples/QueryJSP.html) and its handler, [`EmpQuery.jsp`](cosc304-java/examples/EmpQuery.jsp). The form submits optional employee-name and department filters. The JSP uses a `PreparedStatement` to bind these values.

[Run the form](http://localhost/examples/QueryJSP.html). For comparison, [`EmpQueryBad.jsp`](cosc304-java/examples/EmpQueryBad.jsp) intentionally constructs SQL by concatenating user input to demonstrate SQL injection; **do not copy that approach into the assignment**.

## Example 5 — Employee/project search

**Practice:** Create a form with employee-name and project-name fields that accept partial matches. Write a JSP that receives those fields, queries `workson`, and displays matching assignments using `LIKE`. Count and display the number of matches.

[Solution: `WorksOnQuery.html`](cosc304-java/examples/WorksOnQuery.html) and [`EmpProjQuery.jsp`](cosc304-java/examples/EmpProjQuery.jsp) — [Run the form](http://localhost/examples/WorksOnQuery.html).

## Additional examples

The [examples index](http://localhost/examples/) also links to examples covering session data (`sendingPage.jsp`, `receivingPage.jsp`), login/logout, client-side validation, AJAX (`provinceState.html`, `validateUserEmail.html`), and three servlets (`HelloServlet`, `JdbcServlet`, `EmpServlet`). You can browse their source under [`cosc304-java/examples/`](cosc304-java/examples/).

[Return to Lab 7 assignment](README.md).
