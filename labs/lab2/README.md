# COSC 304 - Introduction to Database Systems<br>Lab 2: Creating tables using SQL on Oracle APEX or MySQL

This lab practices creating tables using SQL DDL on an Oracle or MySQL database.

**Note:  Note: Oracle Cloud accounts are provided by the instructor, but MySQL server should be installed by the students on their local computers. **

### Step #1: Login to [https://iacademy.oracle.com](https://iacademy.oracle.com)

[https://iacademy.oracle.com](https://iacademy.oracle.com) is an Oracle Application Server provided by Oracle Corporation. Your user name is CA_A637_SQL_Snn where "nn" is from "01" to "50" (The number for your account is your LabPair number. For the projects you will use the number of your project group + 20). Provided accounts have no tables or data pre-populated. The home accounts are to store program code and run the code or/and SQL scripts.  


### Step #2: Accessing Oracle APEX using a Web Browser

We will be using Safari, Firefox or Google Chrome. I tested everything using Safari. 

<ol>
<li> Please login to the Oracle APEX account.
<li> Open SQL Workshop
<li> Choose SQL Scripts
</ol>

### Step #3: Example SQL DDL

Using Oracle APEX create the tables for the  [university database in Oracle](university_Oracle_DDL.sql) (If you prefer to use MySQL, please use the [university database in MySQL](university_MySQL_DDL.txt) in your own database).  In Oracle APEX create tables and load the initial data for these tables (in the DDL script) in SQL Workshop -> SQL Scripts -> Upload and then run the uploaded script.  

**Optional:** We have been using the [WorksOn MySQL database](http://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/DB/MySQL_WorksOn_DDL.sql) in class.  This database contains information about employees and the projects that they work on. You can also use the [MySQL WorksOn DDL](http://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/DB/MySQL_WorksOn_DDL.sql) to create those tables in your MySql or database as well. The [Oracle DDL script](Oracle_WorksOn_DDL.sql) is available as well. 

### Step #4: Practice SQL DDL

As practice, here are some changes to make to the existing the database.  You can answer the questions in groups.

#### CREATE TABLE Command

<ol>
<li>Create a new table called <tt>dept</tt> with attributes <tt>deptId</tt> (integer), <tt>deptName</tt> (varchar(30)), and <tt>deptLocation</tt> (varchar(30)).</li>

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

<<<<<<< HEAD
**Answers:**  <a href="labAnswers_DDL.txt">Download the MySQL answer script file</a> or <a href="OracleLab2Answers_DDL.sql">Oracle answer Script</a></p>
=======
**Answers:**  <a href="labAnswers_DDL.txt">Download the MySQL answer script file here</a> or <a href="OracleLab2Answers_DDL.sql">the Oracle answer script file here</a>.</p>
>>>>>>> 9c32d61f64f4bbd444dd35d177f78bcf16b5c1f9

[Lab 2 - SQL Lab Assignment](assign/)

