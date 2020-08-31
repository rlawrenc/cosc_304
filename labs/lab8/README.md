# COSC 304 - Introduction to Database Systems<br>Lab 8: Images, Security, and Transactions

### Images

### Security

### Transactions

A transaction is an atomic program that is executed completely or not at all. A database enforces a transaction in combination with the database access library. Using the database API, code indicates the start of a transaction as well as when it should be committed (saved) or rolled back (aborted). 

A transaction's **isolation level** determines if it can see updates by other transactions that may not be performed during its execution.

#### Java

There are two options for supporting transactions in Java code. If the entire transaction can be expressed in one SQL string, you can just send the entire transaction as a single string and call `statement.execute(SQLString)`.  However, it is more common that a transaction will consist of a sequence of SQL statements, but you want to have Java code actions in between.  For instance, consider if what you wanted to do was fix an order total for an order.  To do this, you would calculate the order total and check if it does not match the required total, then update the order total if required.  In JDBC, each statement you execute is a transaction.  You must turn auto-commit off if you want to have transactions that have more than one statement.  Sample code for transactions is in the file [JdbcTransactions.java](code/JdbcTransactions.java).

