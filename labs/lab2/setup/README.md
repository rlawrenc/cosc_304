# COSC 304 - Introduction to Database Systems<br>Lab 2: Creating Tables using SQL and MySQL - Local Setup

**Make sure your computer is setup to run Docker by following these [setup instructions](../../setup).**

### Step #1: Setup MySQL Docker Container

 - Create a directory `cosc304_lab2`.
 - Download the `docker-compose.yml` file into the `cosc304_lab2` directory. 
 - Create a folder `ddl` in `cosc304_lab2` directory. Download the contents of the `ddl` folder into the `cosc304_lab2\ddl` folder.
 - Open a command shell either directly on your machine or using VSCode. Make sure your current directory is `cosc304_lab2`.
 - Run the command `docker-compose up -d`
 - If everything is successful, the MySQL database will start on port 3306. If there is a port conflict, change the port to 3307 in the `docker-compose.yml` file.
 - Your database is `mydb`. There are other databases also created such as `workson` and `university`.

## Step #2: Access MySQL using Command Interface

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

The password is given in the `docker-compose.yml` file (which you are **encouraged to change**). Note that all commands are terminated with a semi-colon (`;`). Some useful commands are:

| Function  | Command |
| ------------- | ------------- |
| Listing all databases	  | `show databases;`  |
| Use database `dbname`  | `use dbname;`  |
| List all tables  | `show tables;`  |

![Connecting using MySQL Command Line](img/commandline.png)

### Step #2: Accessing MySQL using SQuirreL SQL

[SQuirreL](http://squirrel-sql.sourceforge.net) is an open source graphical query tool capable of querying any JDBC-accessible database including Oracle, MySQL, and SQL Server.

[Download and install MySQL JDBC driver](mysql-connector-java-8.0.27.jar) and put it in the SQuirreL `lib` folder.

Start up SQuirreL.  Register our MySQL server with the information: 

<pre>
Name: MySQL
Login name: root
Password: (see docker-compose.yml file)
Host name: localhost
Port: (leave blank for default)
Database: mydb
</pre>

<img src="img/squirrel-mysql.png" width="400" alt="MySQL Connection Setup in SQuirreL">

### Step #3: Example SQL DDL

The university database should already be loaded. If you have any issues, using SQuirreL, create the tables and load the data for the [university database using this DDL script](../ddl/university_MySQL_DDL.sql).  

