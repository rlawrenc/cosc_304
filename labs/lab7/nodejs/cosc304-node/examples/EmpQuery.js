const express = require('express');
const router = express.Router();
const { sql, getConnection } = require('../db');
const { escapeHtml, formatCurrency, htmlPage } = require('../html');

router.get('/', async (req, res) => {
    const empName = typeof req.query.empname === 'string' ? req.query.empname : '';
    const deptNum = typeof req.query.deptnum === 'string' ? req.query.deptnum : '';
    let pool;
    try {
        pool = await getConnection('workson');
        let query = 'SELECT ename, salary, dno FROM emp WHERE 1=1';
        const request = pool.request();
        if (empName.trim()) {
            query += ' AND ename LIKE @ename';
            request.input('ename', sql.VarChar, `%${empName}%`);
        }
        if (deptNum.trim()) {
            query += ' AND dno = @dno';
            request.input('dno', sql.Char(5), deptNum);
        }
        query += ' ORDER BY ename';
        const results = await request.query(query);
        let rows = '';
        for (const result of results.recordset) {
            rows += `<tr><td>${escapeHtml(result.ename)}</td>
                <td>${formatCurrency(result.salary)}</td><td>${escapeHtml(result.dno)}</td></tr>`;
        }
        res.send(htmlPage('Employee Query Results', `<h1>Employee Search Results</h1>
            <p>SQL query: <code>${escapeHtml(query)}</code></p>
            <table border="1"><tr><th>Name</th><th>Salary</th><th>Department</th></tr>
            ${rows}</table><p><a href="/examples/sampleForm">New Search</a></p>`));
    } catch (err) {
        console.error('Employee query example failed:', err);
        res.status(500).send('Unable to query workson database. Check Docker logs.');
    } finally {
        if (pool) await pool.close();
    }
});

module.exports = router;
