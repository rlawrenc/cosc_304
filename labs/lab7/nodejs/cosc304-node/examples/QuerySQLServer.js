const express = require('express');
const router = express.Router();
const { getConnection } = require('../db');
const { escapeHtml, formatCurrency, htmlPage } = require('../html');

router.get('/', async (req, res) => {
    let pool;
    try {
        pool = await getConnection('workson');
        const result = await pool.request().query('SELECT ename, salary FROM emp');
        const rows = result.recordset.map(row => `<tr><td>${escapeHtml(row.ename)}</td>
            <td>${formatCurrency(row.salary)}</td></tr>`).join('');
        res.send(htmlPage('SQL Server Query', `<h1>Employees</h1>
            <table border="1"><tr><th>Name</th><th>Salary</th></tr>${rows}</table>
            <p><a href="/examples">All Examples</a></p>`));
    } catch (err) {
        console.error('Example SQL query failed:', err);
        res.status(500).send('Unable to query workson database. Check Docker logs.');
    } finally {
        if (pool) await pool.close();
    }
});

module.exports = router;
