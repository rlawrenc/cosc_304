const express = require('express');
const router = express.Router();
const { sql, getConnection } = require('../db');
const { escapeHtml, formatCurrency, htmlPage } = require('../html');

router.get('/', async (req, res) => {
    let pool;
    try {
        pool = await getConnection('workson');
        const departments = await pool.request().query('SELECT dno, dname FROM dept ORDER BY dno');
        let output = '<h1>Projects and Employees by Department</h1>';

        for (const dept of departments.recordset) {
            output += `<h2>${escapeHtml(dept.dno)}: ${escapeHtml(dept.dname)}</h2>`;
            const projects = await pool.request()
                .input('dno', sql.Char(5), dept.dno)
                .query('SELECT pno, pname, budget FROM proj WHERE dno = @dno ORDER BY pno');
            output += '<h3>Projects</h3>';
            if (projects.recordset.length === 0) {
                output += '<p>No projects.</p>';
            } else {
                output += '<table border="1"><tr><th>Number</th><th>Name</th><th>Budget</th></tr>';
                for (const proj of projects.recordset) {
                    output += `<tr><td>${escapeHtml(proj.pno)}</td><td>${escapeHtml(proj.pname)}</td>
                        <td>${formatCurrency(proj.budget)}</td></tr>`;
                }
                output += '</table>';
            }

            const employees = await pool.request()
                .input('dno', sql.Char(5), dept.dno)
                .query('SELECT eno, ename, bdate, salary FROM emp WHERE dno = @dno ORDER BY eno');
            output += '<h3>Employees</h3>';
            if (employees.recordset.length === 0) {
                output += '<p>No employees.</p>';
            } else {
                output += '<table border="1"><tr><th>Number</th><th>Name</th><th>Birth Date</th><th>Salary</th></tr>';
                for (const emp of employees.recordset) {
                    const birthDate = emp.bdate ? new Date(emp.bdate).toISOString().slice(0, 10) : '';
                    output += `<tr><td>${escapeHtml(emp.eno)}</td><td>${escapeHtml(emp.ename)}</td>
                        <td>${escapeHtml(birthDate)}</td><td>${formatCurrency(emp.salary)}</td></tr>`;
                }
                output += '</table>';
            }
        }
        res.send(htmlPage('Departments, Projects, and Employees', output +
            '<p><a href="/examples">All Examples</a></p>'));
    } catch (err) {
        console.error('Department example query failed:', err);
        res.status(500).send('Unable to query workson database. Check Docker logs.');
    } finally {
        if (pool) await pool.close();
    }
});

module.exports = router;
