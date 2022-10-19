# COSC 304 - Introduction to Database Systems<br>Lab 6: Using Java/JDBC with MySQL and Microsoft SQL Server

This assignment practices developing Java code that uses JDBC to connect to a MySQL database.

The database is a university database consisting of students, professors, courses, sections, and enrollments. There is a list of courses each of which may have 1 or more sections. A student enrolls in a section which is taught by a professor. Assume that a student can only enroll in a course once. When the student completes the course, a grade is assigned that is used to calculate their overall GPA. The database schema is below:

<pre>
student (<u>sid</u>, sname, sex, birthdate, gpa)
prof (<u>pname</u>, dname)
course (<u>cnum</u>, dname, cname)
section (<u>cnum</u>, <u>secnum</u>, pname)
enroll (<u>sid</u>, <u>cnum</u>, <u>secnum</u>, grade)
</pre>

## Initial Steps

Download the [starter code](304_lab6.zip) and unzip. The starter code has a SQL DDL script to create the database, a JUnit test program called `TestEnrollJDBC.java`, and the code file to edit called `EnrollJDBC.java`. It also contains the MySQL JDBC JAR file.

Use VSCode to edit the code files. You will need to install the Java extension to compile and run.

## Question 1 (35 marks)

Write the code to complete the methods in `EnrollJDBC.java` (look for `TODO` items).

**Your code will be graded based on it passing the JUnit tests.** You can show the TA all JUnit tests passing to receive full marks. Otherwise, submit your source code online.

<table>
<tr><th>Operation</th>														<th width="100">Marks</th></tr>
<tr><td>
<tr><td>List all students in the database (<tt>listAllStudents</tt>)</td>			<td>1 mark</td></tr>
<tr><td>List all professors in a department (<tt>listDeptProfessors</tt>)</td>		<td>2 marks</td></tr>
<tr><td>List all students in a course (<tt>listCourseStudents</tt>)</td>			<td>2 marks</td></tr>
<tr><td>Compute student GPA (<tt>computeGPA</tt>)</td>								<td>2 marks</td></tr>
<tr><td>Add a student (<tt>addStudent</tt>)</td>									<td>2 marks</td></tr>
<tr><td>Delete a student (<tt>deleteStudent</tt>) (Make sure to also delete all courses enrolled in).</td>	<td>2 marks </td></tr>
<tr><td>Update a student (<tt>updateStudent</tt>)</td>								<td>2 marks</td></tr>
<tr><td>New student enrolment (<tt>newEnroll</tt>)</td>								<td>2 marks</td></tr>
<tr><td>Update student GPA (<tt>updateStudentGPA</tt>)</td>							<td>2 marks</td></tr>
<tr><td>Update student mark (<tt>updateStudentMark</tt>)</td>						<td>2 marks</td></tr>
<tr><td>Remove student from section (<tt>removeStudentFromSection</tt>)</td>		<td>2 marks</td></tr>
<tr><td><strong>Query1:</strong> Return the list of students that have not been in any course section. Hint: Left join can be used instead of a subquery.</td>	<td>3 marks</td</tr>
<tr><td><strong>Query2:</strong> For each student return their id and name, number of course sections registered in (called numcourses), and gpa (average of grades). Return only students born after March 15, 1992. A student is also only in the result if their gpa is above 3.1 or registered in 0 courses. Order by GPA descending then student name ascending and show only the top 5.</td><td>3 marks</td></tr>
<tr><td><strong>Query3:</strong> For each course, return the number of sections (numsections), total number of students enrolled (numstudents), average grade (avggrade), and number of distinct professors who taught the course (numprofs). Only show courses in Chemistry or Computer Science department. Make sure to show courses even if they have no students. Do not show a course if there are no professors teaching that course.</td><td>4 marks</td></tr>
<tr><td><strong>Query4:</strong> Return the students who received a higher grade than their course section average in at least two courses. Order by number of courses higher than the average and only show top 5.</td><td>4 marks</td></tr>
</table>

