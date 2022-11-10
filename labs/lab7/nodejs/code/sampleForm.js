const express = require('express');

let empQuery = require('./EmpQuery');

const app = express();

// Setting up Express.js routes.
// These present a "route" on the URL of the site.
app.use('/EmpQuery', empQuery);

// Rendering the main page
app.get('/', function (req, res) {
    res.setHeader('Content-Type', 'text/html');

    res.write("<title>Querying Using Node.js and Forms</title>");
    res.write("<h1>Enter the name and/or department to search for:</h1>");
    res.write('<form method="get" action="EmpQuery">');
    res.write('Employee name: <input type="text" name="empname" size="25">');
    res.write('Department: <input type="text" name="deptnum" size="5">');
    res.write('<input type="submit" value="Submit">');
    res.write('<input type="reset" value="Reset">');
    res.write('</form>');
})

// Starting our Express app
app.listen(3000)
