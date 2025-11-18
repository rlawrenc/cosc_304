# COSC 304 - Introduction to Database Systems<br>Lab 9: XML, JSON, Views, and Triggers

## Question 1 - XPath (3 marks)

Write XPath expressions for the following queries. Use the [XML Practice Query Page](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/xml/xmlquery.html) to practice writing some XPath queries or use the [XPath Tester / Evaluator online tool](https://www.freeformatter.com/xpath-tester.html) with the [depts.xml](depts.xml) XML data set.

1. Write an XPath expression that returns all departments with a budget less than $400,000. Output:

	```
	<Dept dno="D2" mgr="E7">
   	<name>Consulting</name>
   	<Emp eno="E6">
      <name>L. Chu</name>
   	</Emp>
   	<Emp eno="E3">
      <name>A. Lee</name>
   	</Emp>
   	<budget>350000</budget>
	</Dept>
	```

2. Write an XPath expression that returns all employees in the Management department that have a name greater than 'K'. Output:

	```
	<Emp eno="E7">
   	<name>R. Davis</name>
	</Emp>
	```

3. Write an XPath expression that returns the employee number of the 2nd employee in the Consulting department. Note: To return an attribute use `data()` such as `data(//Dept/@dno)`. Output:

	```
	E3
	```
	or

	```
	UntypedAtomic='E3'
	```
## Question 2 - Views (4 marks)

1. Write a CREATE VIEW statement for the workson database called `deptSummary` that has the department number, name, count of employees in the department, and total employee salaries. View contents:

---------------------------------------------
| dno | dname      | totalEmp | totalSalary |
| --- | ---------- | -------- | ----------- |
| D1  | Management | 2        | 90000.00    |
| D2  | Consulting | 2        | 70000.00    |
| D3  | Accounting | 3        | 120000.00   |
---------------------------------------------

2. Write a CREATE VIEW statement for workson database called `empSummary` that has the employee number, name, salary, birthdate, department, count of projects worked on for the employee and the total hours worked. Only show employees in `'D1', 'D2', or 'D3'` and with birthdate after `'1966-06-08'`.View contents:

-------------------------------------------------------------------------
| eno | ename    | salary   | bdate      | dno | totalProj | totalHours |
| --- | -------- | -------- | ---------- | --- | --------- | ---------- |
| E3  | A. Lee   | 40000.00 | 1966-07-05 | D2  | 2         | 58         |
| E5  | B. Casey | 50000.00 | 1971-12-25 | D3  | 1         | 24         |
| E7  | R. Davis | 40000.00 | 1977-09-08 | D1  | 1         | 36         |
| E8  | J. Jones | 50000.00 | 1972-10-11 | D1  | 0         | <null>     |
-------------------------------------------------------------------------

## Question 3 - Triggers (6 marks)

1. Write a trigger on MySQL with the workson data set (testing in your own database) that increases the budget of a project whenever a record is inserted in `workson` table. Increase the budget by `$1,000`.

2. Write a trigger on MySQL with the workson data set (testing in your own database) that sets the salary of a new employee to be `$5,000` more than the average salary of employees with that title whenever an employee is inserted with a salary less than `$50,000`. For example, if employee `'E10'` called `'P. Person'` with title `'ME'` is inserted with a salary of `$35,000`, then the salary should be changed to `$45,000` (average salary of `'ME'` employees is `$40,000`).


## Question 4 - JSON (2 marks)

1. Create a single, valid JSON document that stores the information of the `dept` and `proj` tables in the workson database.
