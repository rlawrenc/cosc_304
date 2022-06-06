# COSC 304 - Introduction to Database Systems<br>Lab 6: Using Oracle APEX on the top of the Oracle Express Edition (EX) in the Cloud

This assignment practices developing an Oracle APEX application that uses an Oracle EX V19.1 database in Cloud.

The university database consists of students, professors, courses, sections, and enrollments. There is a list of courses, each of which may have one or more sections. A student enrolls in a section that a professor teaches. Assume that a student can only enroll in a course once. When the student completes the course, a grade is assigned to calculate their overall GPA. The database schema is below:

<pre>
student (<u>sid</u>, sname, sex, birthdate, gpa)
prof (<u>pname</u>, dname)
course (<u>cnum</u>, dname, cname)
section (<u>cnum</u>, <u>secnum</u>, pname)
enroll (<u>sid</u>, <u>cnum</u>, <u>secnum</u>, grade)
</pre>

## Questions (35 marks)

There is also a [Oracle EnrollDB DDL script](COSC304APEXlab6code/COSC304L6APEXuniversity.ddl) to create the database.

Create an Oracle APEX Application COSC304Lab6EnrollDB to complete the forms in `EnrollDB` (look for `TODO` items below). Question 9 should be done using Oracle APEX SQL Workshop Scripts. 

**Your code will be graded based on it running the application online. You should provide your password (generated) to TA for marking purposes in your submission.** You can show the TA all tests passing to receive full marks. TA or Instructor can reset the password. Otherwise, submit your screenshots online.

<table>
<tr><th>Operation in a new page of APEX's COSC304Lab6EnrollDB application</th>														<th width="100">Marks</th></tr>
<tr><td>
<tr><td>1. List all students in the database <tt>listAllStudents</tt> page.<br> <b>Hint:</b> Use Classic Report</td>			<td> 1 mark</td></tr>
<tr><td>2. List all professors in a department <tt>listDeptProfessors</tt> page <br> <b>Hint:</b> Use Classic Report</td>		<td>2 marks</td></tr>
<tr><td>3. List all students on a course <tt>listCourseStudents</tt> page. <br> <b>Hint:</b> Use Classic Report</td>			<td> 2 marks</td></tr>
<tr><td>4. Compute student GPA <tt>computeGPA</tt> page. <br> <b>Hints:</b> (1) Use Classic Report; (2) Use Group By statement; (3) Use oracle round function to round to 2 decimal places (ROUND(AVG(grade), 2)). </td>								<td>2 marks</td></tr>
<tr><td>5. Add a student <tt>addStudent</tt> page. <br> <b>Hints:</b>  Use Form -> Editable Interactive Grid -> then SQL query <tt>select * from studnet</tt> </td>									<td>2 marks</td></tr>
<tr><td>6. To delete a student use Editable Interactive Grid <tt>addStudent</tt> page (Make sure to also delete all courses enrolled in). Check the deleted student using  <tt>listAllStudents</tt> page. Submit screen shots in a MS World or PDF document. <br> 

<!--
A good video for master/detail form: <a href=https://www.youtube.com/watch?v=CAlKcrTLaus > https://www.youtube.com/watch?v=CAlKcrTLaus</a>)
-->
</td>	<td>2 marks </td></tr>

<tr><td>7. Update a student using Editable Interactive Grid <tt>addStudent</tt> page (see above). Submit screen shots in a MS World or PDF document.</td>								<td>2 marks</td></tr>

<tr><td>8. New student enrolment <tt>newEnroll</tt> using <tt>select * from enroll;</tt>: Use Form -> Editable Interactive Grid -> then SQL query. </td>								<td>2 marks</td></tr>

<tr><td>9. Update student GPA creating <tt>updateStudentGPA</tt> script in SQL Workshop -> Scripts.</td>							<td>2 marks</td></tr>

<tr><td>10. Update student mark using Editable Interactive Grid <tt> newEnroll </tt> page page (see above). Submit screen shots in a MS World or PDF document.</td>						<td>2 marks</td></tr>

<tr><td>11. Remove student from section <tt>removeStudentFromSection</tt> page using Editable Interactive Grid and submit a screen shot.</td>		<td>2 marks</td></tr>

<tr><td><strong>12. Query 1:</strong> Create a page <tt> Query 1</tt> which will return the list of students that have not been in any course section. <strong>Hint:</strong> Left join can be used instead of a subquery.</td>	<td>3 marks</td</tr>

<tr><td><strong>13. Query 2:</strong> Create a page <tt>Query 2</tt> which will return for each student their id and name, number of course sections registered in (called numcourses), and gpa (average of grades). Return only students born after March 15, 1992. A student is also only in the result if their gpa is above 3.1 or registered in 0 courses. Order by GPA descending then student name ascending.</td><td>3 marks</td></tr>

<tr><td><strong>14.Query 3:</strong> Create a page <tt> Query 3</tt> which will return  for each course the number of sections (numsections), total number of students enrolled (numstudents), average grade (avggrade), and number of distinct professors who taught the course (numprofs). Only show courses in Chemistry or Computer Science department. Make sure to show courses even if they have no students. Do not show a course if there are no professors teaching that course.</td><td>4 marks</td></tr>

<tr><td><strong>15. Query 4:</strong> Create a page <tt> Query 4</tt> which will return the students who received a higher grade than their course section average in at least two courses. Order by number of courses higher than the average and only show top 5.</td><td>4 marks</td></tr>
</table>


