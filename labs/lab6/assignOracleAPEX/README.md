# COSC 304 - Introduction to Database Systems<br>Lab 6: Using Oracle APEX on the top of the Oracle Express Edition (EX) in Cloud (Under the Development: 5 Jun 2022)

This assignment practices developing an Oracle APEX application that uses an Oracle EX V19.1 database in Cloud.

The university database consists of students, professors, courses, sections, and enrollments. There is a list of courses, each of which may have one or more sections. A student enrolls in a section that a professor teaches. Assume that a student can only enroll in a course once. When the student completes the course, a grade is assigned to calculate their overall GPA. The database schema is below:

<pre>
student (<u>sid</u>, sname, sex, birthdate, gpa)
prof (<u>pname</u>, dname)
course (<u>cnum</u>, dname, cname)
section (<u>cnum</u>, <u>secnum</u>, pname)
enroll (<u>sid</u>, <u>cnum</u>, <u>secnum</u>, grade)
</pre>

## Question 1 (35 marks)

There is also a [Oracle EnrollDB DDL script](COSC304APEXlab6code/COSC304L6APEXuniversity.ddl) to create the database.

Create an Oracle APEX Application COSC304Lab6EnrollDB to complete the forms in `EnrollDB` (look for `TODO` items below).

**Your code will be graded based on it running the application online. You should provide your password (generated) to TA for marking purposes in your submission.** You can show the TA all tests passing to receive full marks. TA or Instructor can reset the password. Otherwise, submit your screenshots online.

<table>
<tr><th>Operation in a new page of APEX's COSC304Lab6EnrollDB application</th>														<th width="100">Marks</th></tr>
<tr><td>
<tr><td>List all students in the database <tt>listAllStudents</tt> page.<br> <b>Hint:</b> Use Classic Report</td>			<td> 1 mark</td></tr>
<tr><td>List all professors in a department <tt>listDeptProfessors</tt> page <br> <b>Hint:</b> Use Classic Report</td>		<td>2 marks</td></tr>
<tr><td>List all students on a course <tt>listCourseStudents</tt> page. <br> <b>Hint:</b> Use Classic Report</td>			<td> 2 marks</td></tr>
<tr><td>Compute student GPA <tt>computeGPA</tt> page. <br> <b>Hints:</b> (1) Use Classic Report; (2) Use Group By statement; (3) Use oracle round function to round to 2 decimal places (ROUND(AVG(grade), 2)). </td>								<td>2 marks</td></tr>
<tr><td>Add a student <tt>addStudent</tt> page</td>									<td>2 marks</td></tr>
<tr><td>Delete a student <tt>deleteStudent</tt>  page(Make sure to also delete all courses enrolled in).</td>	<td>2 marks </td></tr>
<tr><td>Update a student <tt>updateStudent</tt> page</td>								<td>2 marks</td></tr>
<tr><td>New student enrolment <tt>newEnroll</tt> page</td>								<td>2 marks</td></tr>
<tr><td>Update student GPA <tt>updateStudentGPA</tt> page</td>							<td>2 marks</td></tr>
<tr><td>Update student mark <tt>updateStudentMark</tt> page</td>						<td>2 marks</td></tr>
<tr><td>Remove student from section <tt>removeStudentFromSection</tt> page</td>		<td>2 marks</td></tr>
<tr><td><strong>Query 1:</strong> Return the list of students that have not been in any course section. <strong>Hint:</strong> Left join can be used instead of a subquery.</td>	<td>3 marks</td</tr>
<tr><td><strong>Query 2:</strong> For each student return their id and name, number of course sections registered in (called numcourses), and gpa (average of grades). Return only students born after March 15, 1992. A student is also only in the result if their gpa is above 3.1 or registered in 0 courses. Order by GPA descending then student name ascending and show only the top 5.</td><td>3 marks</td></tr>
<tr><td><strong>Query 3:</strong> For each course, return the number of sections (numsections), total number of students enrolled (numstudents), average grade (avggrade), and number of distinct professors who taught the course (numprofs). Only show courses in Chemistry or Computer Science department. Make sure to show courses even if they have no students. Do not show a course if there are no professors teaching that course.</td><td>4 marks</td></tr>
<tr><td><strong>Query 4:</strong> Return the students who received a higher grade than their course section average in at least two courses. Order by number of courses higher than the average and only show top 5.</td><td>4 marks</td></tr>
</table>


