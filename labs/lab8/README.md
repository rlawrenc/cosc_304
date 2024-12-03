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

Privileges give users the right to perform operations on database objects.  Some example privileges:
- `SELECT` - the user can retrieve data from table
- `INSERT` - the user can insert data into table
- `UPDATE` - the user can modify data in the table
- `DELETE` - the user can delete data (rows) from the table

The `GRANT` command gives privileges on database objects to users.

```
GRANT {privilegeList | ALL [PRIVILEGES]}
  ON ObjectName
  TO {AuthorizationIdList | PUBLIC}
  [WITH GRANT OPTION]
```
The `REVOKE` command is used to remove privileges on database objects from users.

```
REVOKE [GRANT OPTION FOR]{privilegeList | ALL [PRIVILEGES]}
  ON ObjectName
  FROM {AuthorizationIdList | PUBLIC} {RESTRICT|CASCADE}
```

### Transactions

A transaction is an atomic program that is executed completely or not at all. A database enforces a transaction in combination with the database access library. Using the database API, code indicates the start of a transaction as well as when it should be committed (saved) or rolled back (aborted). 

A transaction's **isolation level** determines if it can see updates by other transactions that are performed during its execution. Isolation levels include serializable, repeatable read, read committed, and read uncommitted.

Transactions provide the following properties:
- **Atomicity** -  Either all operations of the transaction are properly reflected in the database or none are.
- **Consistency** -  Execution of a transaction in isolation preserves the consistency of the database.
- **Isolation** -  Although multiple transactions may execute concurrently, each transaction must be unaware of other concurrently executing transactions.  
- **Durability** -  After a transaction successfully completes, the changes it has made to the database persist, even if there are system failures. 

In SQL, a transaction begins implicitly. A transaction in SQL ends by:
- **Commit** accepts updates of current transaction. 
- **Rollback** aborts current transaction and discards its updates.  Failures may also cause a transaction to be aborted.

#### Java

There are two options for supporting transactions in Java code. If the entire transaction can be expressed in one SQL string, you can just send the entire transaction as a single string and call `statement.execute(SQLString)`.  However, it is more common that a transaction will consist of a sequence of SQL statements, but you want to have Java code actions in between.  For instance, consider if what you wanted to do was fix an order total for an order.  To do this, you would calculate the order total and check if it does not match the required total, then update the order total if required.  In JDBC, each statement you execute is a transaction.  You must turn auto-commit off if you want to have transactions that have more than one statement.  Sample code for transactions is in the file [JdbcTransactions.java](code/JdbcTransactions.java).
