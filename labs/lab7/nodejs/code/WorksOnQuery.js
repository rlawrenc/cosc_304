const express = require('express');

let empProjQuery = require('./EmpProjQuery');

const app = express();

// Setting up Express.js routes.
// These present a "route" on the URL of the site.
app.use('/EmpProjQuery', empProjQuery);

// Rendering the main page
app.get('/', function (req, res) {
    res.setHeader('Content-Type', 'text/html');

    res.write('<title>WorksOn Query Example using HTML Forms</title>');
    res.write('<h1>Enter the employee name and/or project name to search for:</h1>');
    res.write('<form method="get" action="EmpProjQuery">');
    res.write('Employee name: <input type="text" name="empname" size="25">');
    res.write('Project Name: <input type="text" name="projname" size="25">');
    res.write('<input type="submit" value="Submit">');
    res.write('<input type="reset" value="Reset">');
    res.write('</form>');
})

// Starting our Express app
app.listen(3000)
