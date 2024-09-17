# COSC 304 - Introduction to Database Systems<br>Lab 2: Creating Tables using SQL and MySQL

Practice questions using SQL DDL on a MySQL database.

**Make sure your computer is setup to run Docker by following these [setup instructions](../../setup). Then follow the [lab 2 setup instructions](../setup).**

### Practice SQL DDL

As practice, here are some changes to make to the existing the database.  You can answer the questions in groups.

#### CREATE TABLE Command

1. Create a new table called `dept` with attributes `deptId INTEGER`, `deptName VARCHAR(40)`, and `deptLocation VARCHAR(50)`.

2. Create a new table called `courseDept` with attributes `deptId INTEGER` and `cname VARCHAR(40)`.

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

<li>Change the name of the course <tt>'Database Systems'</tt> to <tt>'Introduction to Database Systems'</tt>.  Update all affected records.</li>

<li>Change the <tt>course</tt> table to include an integer field called <tt>studentCount</tt> that counts all the students currently enrolled in the course.  Populate this field for all courses based on current enrollment information.</li>

<li>Remove student with id = <tt>'115987938'</tt> from the database and all courses the student is enrolled in.  Make sure to modify the <tt>studentCount</tt> field created in the previous section as appropriate.</li>

<li><B>Challenge: Do you have an SQL DDL that you think others cannot answer?  If so, let the TA know.</B></li>

</ol>

**Answers:**  <a href="labAnswers_DDL.txt">Download the answer script file</a>.</p>
