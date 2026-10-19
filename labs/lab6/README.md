# COSC 304 - Introduction to Database Systems<br>Lab 6: Using Java/Python with MySQL and Microsoft SQL Server

This lab demonstrates how Java and Python programs can connect to MySQL and Microsoft SQL Server, execute SQL queries, and process query results.

## Setup MySQL and SQL Server Using Docker

Before startying, make sure Docker is installed and running by following the **[course setup instructions](../setup).**

### Step 1: Get the course repository

Clone the COSC 304 repository if you have not already done so:

```bash
git clone https://github.com/rlawrenc/cosc_304.git
```

Open a terminal (or the terminal in VSCode) and navigate to the Lab 6 folder:

```bash
cd cosc_304/labs/lab6
```

If you have already cloned the repository, update your local copy with `git pull` before starting the lab.

### Step 2: Start the database servers

Run:

```bash
docker compose up -d
```

This starts both MySQL and Microsoft SQL Server and initializes the sample databases. The first startup may take several minutes while Docker downloads the images and initializes the databases.

To check that the containers are running:

```bash
docker compose ps
```

To view the database startup messages:

```bash
docker compose logs
```

Both database servers must finish initializing before you can connect.

### Step 3: Database connection information

The database credentials are defined in `docker-compose.yml`.

The `workson` database contains the employee, department, project, and assignment tables used in the exercises below.

If port 3306 or 1433 is already in use, you may need to stop another database server or change the host port in `docker-compose.yml`. If you change a port, you must also update the connection information in your Java or Python programs.

**Apple Silicon Macs:** SQL Server uses an x86-64 Docker image. See the [course setup instructions](../setup) for Docker compatibility guidance. SQL Server may run more slowly under emulation.

### Docker commands

- Start both databases: `docker compose up -d`
- Stop both databases: `docker compose down`
- View container status: `docker compose ps`
- View logs: `docker compose logs`

The databases use persistent Docker volumes, so stopping the containers does not delete your data.

To completely reset the databases, run:

```bash
docker compose down -v
docker compose up -d
```

**Warning:** This deletes all data stored in the Docker database volumes and recreates the sample databases.

## Part 1: MySQL

The `code/` directory contains sample Java and Python programs that connect to the `workson` MySQL database and execute a query.

Choose either Java or Python.

### Java Setup

1. Open [TestJDBCMySQL.java](code/TestJDBCMySQL.java) in VSCode or your preferred Java development environment.
2. Add the [MySQL JDBC driver](code/mysql-connector-j-9.5.0.jar) to your Java project's classpath. In VSCode, this can be done through the **Java Projects** view under **Referenced Libraries**.
3. Verify that the database connection information is:

```java
String url = "jdbc:mysql://localhost:3306/workson";
String uid = "testuser";
String pw = "304testpw";
```

Run the program and verify that it can connect to MySQL and display employee names and salaries.

### Python Setup

1. Install the MySQL Connector/Python library:

```bash
python -m pip install mysql-connector-python
```

2. Open [PythonQueryExample.py](code/PythonQueryExample.py).
3. Verify that the connection information is:

```python
cnx = mysql.connector.connect(
    user='testuser',
    password='304testpw',
    host='localhost',
    database='workson',
    ssl_disabled=True
)
```

Run the program and verify that it displays employee names and salaries.

The expected employees and salaries are:

```text
M. Smith    50000
A. Lee      40000
J. Miller   20000
B. Casey    50000
L. Chu      30000
R. Davis    40000
J. Jones    50000
```

### Question 1: Supervisors and Employees

Create a new program called `MyJDBC.java` or `MySQLQuestion.py`.

Your program must:

1. List every employee who is a supervisor.
2. Sort the supervisors by name.
3. Under each supervisor, list the employees they **directly supervise**, sorted by decreasing salary.

For Python, you can use a buffered cursor if you need to execute additional queries before consuming all rows from an earlier query:

```python
cursor = cnx.cursor(buffered=True)
```

**Expected output:**

```text
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

Solutions: [Java](code/MyJDBC.java) | [Python](code/MySQLQuestion.py)

## Part 2: Microsoft SQL Server

The second part demonstrates connecting to SQL Server using Java or Python.

The SQL Server container should already be running from the Docker setup at the start of the lab.

### Java Setup

1. Open [TestJdbcSqlServer.java](code/TestJdbcSqlServer.java).
2. Add the [Microsoft SQL Server JDBC driver](code/mssql-jdbc-13.2.1.jre11.jar) to your Java project's classpath.
3. Verify the connection information:

```java
String url = "jdbc:sqlserver://localhost:1433;databaseName=workson;trustServerCertificate=true";
String uid = "sa";
String pw = "304#sa#pw";
```

Run the program and verify that it displays employee names and salaries.

### Python Setup

1. Install the [Microsoft ODBC Driver 18 for SQL Server](https://learn.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server) for your operating system. This driver must be installed separately from the Python `pyodbc` library.

2. Install the Python library:

   ```bash
   python -m pip install pyodbc
   ```

3. Verify that the Microsoft ODBC driver is installed:

   ```bash
   python -c "import pyodbc; print(pyodbc.drivers())"
   ```

   The output should include `ODBC Driver 18 for SQL Server`.

4. Open [PythonSQLServer.py](code/PythonSQLServer.py) and verify that its connection settings match the Docker configuration:

   ```python
   cnx = pyodbc.connect(
       "DRIVER={ODBC Driver 18 for SQL Server};"
       "SERVER=localhost,1433;"
       "DATABASE=workson;"
       "UID=sa;"
       "PWD=304#sa#pw;"
       "Encrypt=yes;"
       "TrustServerCertificate=yes;"
   )
   ```

5. Run the Python program to verify that it connects to SQL Server and retrieves employee information.

### Question 2: Top Project by Department

Modify either the Java or Python sample program to list the top project for each department based on the total hours worked by employees on projects.

**Expected output:**

```text
Id: D1     Name: Management
Proj#   Name          Total Hours
P1      Instruments   36

Id: D2     Name: Consulting
Proj#   Name          Total Hours
P4      Maintenance   96

Id: D3     Name: Accounting
Proj#   Name          Total Hours
P3      Budget        46
```

Solutions: [Java](code/SqlServerQuestion.java) | [Python](code/SqlServerQuestion.py)

## Lab 6 Assignment

Complete **one** of the following versions of the assignment:

- [Lab 6 Assignment – Java](assignJava/)
- [Lab 6 Assignment – Python](assignPython/)

The starter code is included in the cloned course repository. Follow the instructions for your chosen language.

Do not submit the entire course repository. Follow the submission requirements in the assignment instructions.
