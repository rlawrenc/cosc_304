# COSC 304 - Introduction to Database Systems<br>Lab 8

## [Development Stream](develop/) -  Images, Security, and Transactions

Add images and more features to your online store. 

## [Analysis](analyze/) Stream - Data Prediction, Forecasting, and Visualization

Extend the analysis to perform forecasting and prediction. Add improved visualizations and charts.

## Reference Material

### Images

Images can be stored in the database, on the web server file system, or on a cloud service like Amazon S3. Typically, storing on the web server provides higher performance, but the images may not be as easy to secure compared to storing them in the database.

### Security

Security in SQL is based on authorization identifiers, ownership, and privileges. An authorization identifier (or user id) is associated with each user as well as a password. The authorization identifier is used to determine which database objects the user has access to.

### Transactions

A transaction is an atomic program that is executed completely or not at all. A database enforces a transaction in combination with the database access library. Using the database API, code indicates the start of a transaction as well as when it should be committed (saved) or rolled back (aborted). 

In JDBC, each statement you execute is a transaction.  You must turn auto-commit off if you want to have transactions that have more than one statement.  Sample code for transactions is in the file [JdbcTransactions.java](code/JdbcTransactions.java).
