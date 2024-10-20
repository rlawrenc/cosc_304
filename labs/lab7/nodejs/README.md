# COSC 304 - Introduction to Database Systems<br>Lab 7: Building a Database-enabled Web Site using Node.js

**Please follow the setup instructions located in the [assign/setup](assign/setup) directory.**

**The sample code for these examples is [code/304_lab7_example_node.zip](code/304_lab7_example_node.zip).**

## Example 1

Here is the code to show "Hello World!" using Javascript:

```javascript
const express = require('express')
const app = express()

app.get('/', function (req, res) {
  res.send('Hello World')
})

app.listen(3000)
```

Try and change the code so that the output looks like this:

# Hello World Again!

<pre>
1
2
3
4
5
</pre>

### [Solution - HelloWorldAgain.js](code/HelloWorldAgain.js)

## Example 2

[Example code](code/QuerySQLServer.js) to query the workson database and return some answers in a table.

## Example 3

Modify the sample code for querying WorksOn such that for each department you list its projects and then its employees.  The output should look like <a href="https://cosc304.ok.ubc.ca/rlawrenc/Lab7/WorksOnDeptEmpProj.php">this (click here)</a>.

### [Solution - WorksOnDeptEmpProj.js](code/WorksOnDeptEmpProj.js)

## Example 4

You can pass and receive parameters between Node.js routes (AKA website pages).  An example is to create an HTML form that collects user input and then passes this information to a Node.js route to perform the query and render the answers.

### [Query Form Example](code/sampleForm.js)

### [Node.js Code for Performing Query](code/EmpQuery.js)


## Example 5

Create your own query form for the WorksOn database. Your form should have boxes for the Employee name and Project name that accept partial matches (using `LIKE '%queryString%'`).  The Js file should receive the parameters and create a query that lists all WorksOn records where the employee name and project name are as specified.  Show the count of the # of records at the bottom of the page.  An [example query form and system](https://cosc304.ok.ubc.ca/rlawrenc/Lab7/WorksOnQuery.html) is available.

### [Solution - HTML File](code/WorksOnQuery.js)

### [Solution - EmpProjQuery.js](code/EmpProjQuery.js)

## [Lab 7 Assignment](assign/)
