# COSC 304 - Introduction to Database Systems<br>Lab 2: Creating tables using SQL and MySQL

This lab practices creating tables using SQL DDL on a MySQL database.

**Note: If you are off campus, you MUST connect using <a href="https://it.ubc.ca/services/email-voice-internet/myvpn/setup-documents">VPN to UBC Okanagan</a> (use: myvpn.ok.ubc.ca) to be able to access the databases.**

### Step #1: Login to cosc304.ok.ubc.ca using SSH

cosc304.ok.ubc.ca is a Linux machine that has a MySQL server running. You have a home account to store program code and other course related files. Your user id is your student id for your Novell account and your initial password is the same as that account's password.  You can directly access the MySQL command-line interface by typing:

<pre>
mysql -u &lt;user_id&gt; -p
</pre>

Your MySQL user id is the first letter in your first name followed by up to 7 letters of your last name and your initial password is your student id.  For more information on how to login and use MySQL, see [Using MySQL](http://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/mysql.html).

### Step #2: Accessing MySQL using SQuirreL SQL

We will be using [SQuirreL](http://squirrel-sql.sourceforge.net) as an open source graphical query tool.  SQuirreL is capable of querying any JDBC-accessible database including Oracle, MySQL, and SQL Server.

Start up SQuirreL.  Register our MySQL server with the information: ([screenshot](img/squirrel_mysql_register.png)).

<pre>
Name: MySQL
Login name: (your MySQL user id - the first letter of your first name followed by up to 7 letters of your last name)
Password: (initially your student #)
Host name: cosc304.ok.ubc.ca
Port: (leave blank for default)
Database: db_(your MySQL user id - the first letter of your first name followed by up to 7 letters of your last name)
</pre>


### Step #3: Example SQL DDL

Using SQuirreL (or MySQL command-line), create the tables for the [university database](university_MySQL_DDL.txt) in your own database.  Load the initial data for these tables (in the DDL script).  

**Optional:** We have been using the [WorksOn database](http://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/DB/MySQL_WorksOn_DDL.sql) in class.  This database contains information about employees and the projects that they work on. You can also use the [WorksOn DDL](http://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/DB/MySQL_WorksOn_DDL.sql) to create those tables in your database as well.

### Step #4: Practice SQL DDL

As practice, here are some changes to make to the existing the database.  You can answer the questions in groups.

#### CREATE TABLE Command

<ol>
<li>Create a new table called <tt>dept</tt> with attributes <tt>deptId</tt> (integer), <tt>deptName</tt> (varchar(40)), and <tt>deptLocation</tt> (varchar(50)).</li>

<li>Create a new table called <tt>courseDept</tt> with attributes <tt>deptId</tt> (integer) and <tt>cname</tt> (varchar(40)).</li>
</ol>

#### INSERT Command

<ol>
<li>Insert these records into <tt>dept</tt>:
<pre>
deptId,deptName,deptLocation
11,'Law', 'Arts 333'
12,'Fine Arts', 'Arts 333'
20,'Computer Science', 'Arts 333'
33,'Mathematics', 'Science 234'
68,'Engineering', 'SSC 100'
</pre></li>

<li>Add these three records into <tt>faculty</tt>:
<pre>
fid, fname, deptId
'111111111','Yves Lucet',20
'222222222','Yong Gao',20
'333333333','Ramon Lawrence',20
</pre></li>
</ol>

#### DELETE Command

<ol>
<li>Delete the student with number = <tt>'318548912'</tt>.</li>
</ol>

#### UPDATE Command

<ol>
<li>Change the name of student <tt>'Steven Green'</tt> to <tt>'Steven Yellow'</tt>.  Update his age to be <tt>20</tt> as well.</li>
</ol>

#### ALTER TABLE Command

<ol>
<li>Modify the faculty table so that the <tt>deptId</tt> is a foreign key to the <tt>dept</tt> table.</li>
</ol>

#### Various Commands

<ol>
<li>Add tuples to the <tt>courseDept</tt> relation.  This relation gives what departments teach what courses.  Populate the data based on the department number of the faculty member currently teaching the course.  If no one is currently teaching the course, the course should be given to department <tt>20</tt>.</li>

<li><b>For MySQL database only (Oracle doesn't have ON UPDATE CASCADE option):</b> Change the name of the course <tt>'Database Systems'</tt> to <tt>'Introduction to Database Systems'</tt>.  Update all affected records.</li>

<li>Change the <tt>course</tt> table to include an integer field called <tt>studentCount</tt> that counts all the students currently enrolled in the course.  Populate this field for all courses based on current enrollment information.</li>

<li>Remove student with id = <tt>'115987938'</tt> from the database and all courses the student is enrolled in.  Make sure to modify the <tt>studentCount</tt> field created in the previous section as appropriate.</li>


<li><B>Challenge: Do you have an SQL DDL that you think others cannot answer?  If so, let the TA know.</B></li>

</ol>

**Answers:**  <a href="labAnswers_DDL.txt">Download the MySQL answer script file here</a> or <a href="OracleLab2Answers_DDL.sql">the Oracle answer script file here</a>.</p>

[Lab 2 - SQL Lab Assignment](assign/)

