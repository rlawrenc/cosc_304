# COSC 304 - Introduction to Database Systems<br>Lab 6: Using Java/Python/Oracle APEX with MySQL, Microsoft SQL Server and Oracle Express Edition (EX)

This lab shows how Java and Python programs can connect to MySQL and Microsoft SQL Server.

## Part #1: MySQL

Download [the sample Java program](code/TestJDBCMySQL.java) or [sample Python program](code/PythonQueryExample.py) that connects to a WorksOn database hosted by MySQL. If running Java, setup your Eclipse project. For Python, setup your Python environment using Jupyter Notebook or an editor like Spyder (install with [Anaconda Python 3.8 distribution](https://www.anaconda.com/distribution/)). For Oracle APEX (default for COSC 304 Summer T1 2022), use the online connection to APEX. 

To make the Java and Python work program please use your local MySQL DBMS system installation:

```
Change Line 5 to:	String url = "jdbc:mysql://localhost/workson";
Change Line 6 to:	String uid = "put your user id here";
Change Line 7 to:	String pw = "put your password here";
```

To make the Python program work:

```
Change Line 3 to:	cnx = mysql.connector.connect(user='put your user id here', password='put your password here', host='localhost', database='workson')
```

The result of the program is this:

```
Employee Name,Salary
M. Smith,50000.0
A. Lee,40000.0
J. Miller,20000.0
B. Casey,50000.0
L. Chu,30000.0
R. Davis,40000.0
J. Jones,50000.0
```

## Question #1

Create a new program called `MyJDBC.java` or `MySQLQuestion.py`.

Note: With Python to have multiple cursors on a connection, set the cursor to buffering like this: `cursor = cnx.cursor(buffered=True)`.

Your program should be able to do this:

- List each employee that is a supervisor.
- Sort the list of supervisors by name.
- Under each supervisor, list the employees that he/she <b>directly</b> supervises sorted by decreasing salary.

The result of your program should look like this:

```
Supervisor: B. Casey
   M. Smith, 50000.00

Supervisor: J. Jones
   B. Casey, 50000.00
   R. Davis, 40000.00

Supervisor: L. Chu
   J. Miller, 20000.00

Supervisor: M. Smith
   J. Doe, 30000.00
   
Supervisor: R. Davis
   A. Lee, 40000.00
   L. Chu, 30000.00
```
**Answer:**  [Java answer file](code/MyJDBC.java), [Python answer file](code/MySQLQuestion.py)

## Part #2: Microsoft SQL Server

Your Microsoft SQL Server user id is the first letter in your first name followed by up to 7 letters of your last name and your initial password is your student id. For more information on how to login and use Microsoft SQL Server, see [Using Microsoft SQL Server](https://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/sqlserver.html).

### Java Setup

1. [Download the Microsoft SQL Server driver](code/sqljdbc4.jar) and put it in your classpath or in the `lib\ext` folder of your JRE.

2. Open Eclipse.  Select `File`, `New`, `Java project`. ([screenshot](img/EclipseJavaProject.png))

3. [Download the sample file](code/TestJdbcSqlServer.java).  Save this file in your Eclipse workspace under the project folder that you just created. 

4. These are the modifications you must make to get the program working:

```
Change Line 5 to:	String url = "jdbc:sqlserver://sql04.ok.ubc.ca;DatabaseName=WorksOn;";
Change Line 6 to:	String uid = "put your user id here";
Change Line 7 to:	String pw = "put your password here";
```

### Python Setup

1. Install SQL Server pyodbc connector by following [these directions](https://docs.microsoft.com/en-us/sql/connect/python/python-driver-for-sql-server).

2. [Download the sample Python file](code/PythonSQLServer.py) and setup in your Python environment.

3. These are the modifications you must make to get the program working:

```
Change Line 3 and 4 to:	cnx = pyodbc.connect("""DRIVER={ODBC Driver 17 for SQL Server};SERVER=sql04.ok.ubc.ca;
							DATABASE=workson;UID=yourUserId;PWD=yourPassword""")
```

### Expected Output

```
Employee Name,Salary
M. Smith,50000.0
A. Lee,40000.0
J. Miller,20000.0
B. Casey,50000.0
L. Chu,30000.0
R. Davis,40000.0
J. Jones,50000.0
```

## Question #2

Modify either the Java or Python sample program to create a program that lists the top project for each department based on the total hours worked by employees on projects.

### Expected Output

```
Id: D1     Name: Management
Proj#	Name	Total Hours
P1   	Instruments	36

Id: D2     Name: Consulting
Proj#	Name	Total Hours
P4   	Maintenance	96

Id: D3     Name: Accounting
Proj#	Name	Total Hours
P3   	Budget	46
```

**Answer:**  [Java answer file](code/SqlServerQuestion.java), [Python answer file](code/SqlServerQuestion.py)

## [Lab 6 Assignment (Java)](assignJava/)

## [Lab 6 Assignment (Python)](assignPython/)
