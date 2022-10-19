# COSC 304 - Introduction to Database Systems<br>Lab 6: Using Java/Python with MySQL and Microsoft SQL Server

This lab shows how Java and Python programs can connect to MySQL and Microsoft SQL Server.

**Make sure your computer is setup to run Docker by following these [setup instructions](../setup).**

### Setup MySQL and SQL Server Docker Container

 - Create a directory `cosc304_lab6`.
 - Download the `docker-compose.yml` file into the `cosc304_lab6` directory. 
 - Create a folder `ddl` in `cosc304_lab6` directory. Download the contents of the `ddl` folder into the `cosc304_lab6\ddl` folder.
 - Open a command shell either directly on your machine or using VSCode. Make sure your current directory is `cosc304_lab6`.
 - Run the command `docker-compose up -d`
 - If everything is successful, the MySQL database will start on port 3306. If there is a port conflict, change the port to 3307 in the `docker-compose.yml` file.
 - Your database is `mydb`. There are other databases also created such as `workson` and `university`.
 - Microsoft SQL Server will be running on port 1433.
 
## Part #1: MySQL

Download [the sample Java program](code/TestJDBCMySQL.java) or [sample Python program](code/PythonQueryExample.py) that connects to a WorksOn database hosted by MySQL. 
The user id and password information is in the `docker-compose.yml` file.

MySQL commands can be running using the command line within the Docker container. Run the command:

```
docker exec -it cosc304-mysql bash
```

This will start a command line session. Connect to MySQL using:

```
mysql -u root -p
```
OR
```
mysql -u testuser -p
```

To make the Java program work:

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

### Java Setup

1. Make sure the [Microsoft SQL Server JDBC driver](code/mssql-jdbc-11.2.0.jre11.jar) is in your classpath. This can be done in VSCode in the `Java Project` tab.

2. You must connect to SQL Server using SQuirreL or command line to create the workson database. 

3. [Download the sample file](code/TestJdbcSqlServer.java).  Save this file in your `cosc304_lab6` folder that you just created. 

4. These are the modifications you must make to get the program working:

```
Change Line 5 to:	String url = "jdbc:sqlserver://localhost;DatabaseName=WorksOn;;TrustServerCertificate=True";
Change Line 6 to:	String uid = "sa";
Change Line 7 to:	String pw = "put password here";
```

### Python Setup

1. Install SQL Server pyodbc connector by following [these directions](https://docs.microsoft.com/en-us/sql/connect/python/python-driver-for-sql-server).

2. [Download the sample Python file](code/PythonSQLServer.py) and setup in your Python environment.

3. These are the modifications you must make to get the program working:

```
Change Line 3 and 4 to:	cnx = pyodbc.connect("""DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;
							DATABASE=workson;UID=sa;PWD=yourPassword""")
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
