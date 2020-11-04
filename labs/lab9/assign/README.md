# COSC 304 - Introduction to Database Systems<br>Lab 9: XML, JSON, Views, and Triggers

## Question 1 - XPath (3 marks)

Write XPath expressions for the following queries. Use the Depts XML data set and the online [XPath query tool](https://cosc304.ok.ubc.ca/rlawrenc/tomcat/xml/xmlquery.html).

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

## Question 2 - Views (4 marks)

1. Write a CREATE VIEW statement for the workson database called `deptSummary` that has the department number, name, count of employees in the department, and total employee salaries. View contents:

---------------------------------------------
| dno | dname      | totalEmp | totalSalary |
| --- | ---------- | -------- | ----------- |
| D1  | Management | 3        | 90000.00    |
| D2  | Consulting | 2        | 70000.00    |
| D3  | Accounting | 2        | 100000.00   |
--------------------------------------------|

2. Write a CREATE VIEW statement for workson database that ...
