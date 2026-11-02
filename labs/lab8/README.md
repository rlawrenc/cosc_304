# COSC 304 - Introduction to Database Systems<br>Lab 8

## [Development Stream](develop/) -  Images, Security, and Transactions

Add images and more features to your online store. 

## [Analysis](analyze/) Stream - Data Prediction, Forecasting, and Visualization

Extend the analysis to perform forecasting and prediction. Add improved visualizations and charts.

## Reference Material

### Images
Images can be stored as files on a web server, in cloud storage, or as binary data in a database. Web applications typically display images using an HTML `<img>` tag with a URL. Images stored in a database can be retrieved and returned to the browser by server-side code.

### Security
Database security controls access to data through users, roles, and privileges such as SELECT, INSERT, UPDATE, and DELETE. Web applications also require authentication (verifying a user's identity) and authorization (controlling what the user can access). Prepared statements help protect applications from SQL injection.

### Transactions
A transaction is a sequence of database operations treated as a single unit of work. All changes are committed together, or they are rolled back if the transaction fails.

By default, JDBC uses **auto-commit**, where each SQL statement is committed automatically. To group multiple statements into one transaction:

1. Call `setAutoCommit(false)` on the connection.
2. Execute the SQL statements.
3. Call `commit()` if all operations succeed, or `rollback()` if the transaction must be aborted.

See [JdbcTransactions.java](code/JdbcTransactions.java) for a Java example.
