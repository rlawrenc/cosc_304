const express = require('express');
const router = express.Router();
const { htmlPage } = require('../html');

router.get('/', (req, res) => {
    res.send(htmlPage('COSC 304 - Node.js Web Programming Examples', `
        <style>
            body { font-family: Arial, sans-serif; max-width: 900px; margin: 32px auto; padding: 0 20px; line-height: 1.5; color: #222; }
            h1 { margin-bottom: 0; }
            .intro { color: #555; margin-top: 5px; }
            section { margin: 28px 0; }
            h2 { border-bottom: 1px solid #ccc; padding-bottom: 6px; }
            li { margin: 8px 0; }
            a { color: #064b95; }
            a:hover { text-decoration: none; }
            code { background: #f3f3f3; padding: 1px 4px; }
        </style>
        <h1>COSC 304: Node.js Web Programming Examples</h1>
        <p class="intro">Examples of Node.js, Express routes, HTML forms, and SQL Server queries.
            The database examples use the SQL Server <code>workson</code> database.</p>

        <section>
            <h2>1. Node.js and Express Basics</h2>
            <ul>
                <li><a href="/examples/HelloWorld">Hello World</a> — Send a simple response from an Express route.</li>
                <li><a href="/examples/HelloWorldAgain">Hello World Again</a> — Practice answer using a JavaScript loop to generate HTML.</li>
            </ul>
        </section>

        <section>
            <h2>2. SQL Server Queries</h2>
            <ul>
                <li><a href="/examples/QuerySQLServer">Basic SQL Server query</a> — Execute a SQL query and display employee results in an HTML table.</li>
                <li><a href="/examples/WorksOnDeptEmpProj">Departments, projects, and employees</a> — Use parameterized queries to retrieve related records by department.</li>
            </ul>
        </section>

        <section>
            <h2>3. HTML Forms and Parameterized Queries</h2>
            <ul>
                <li><a href="/examples/sampleForm">Employee search</a> — Submit optional employee name and department filters to an Express route.</li>
                <li><a href="/examples/WorksOnQuery">Employee/project search</a> — Join tables and search assignments using optional employee and project filters.</li>
            </ul>
        </section>

        <p><a href="/">Return to Store</a></p>`));
});

router.use('/HelloWorld', require('./HelloWorld'));
router.use('/HelloWorldAgain', require('./HelloWorldAgain'));
router.use('/QuerySQLServer', require('./QuerySQLServer'));
router.use('/WorksOnDeptEmpProj', require('./WorksOnDeptEmpProj'));
router.use('/sampleForm', require('./sampleForm'));
router.use('/EmpQuery', require('./EmpQuery'));
router.use('/WorksOnQuery', require('./WorksOnQuery'));
router.use('/EmpProjQuery', require('./EmpProjQuery'));

module.exports = router;
