const express = require('express');
const router = express.Router();
const { sql, getConnection } = require('../db');
const { escapeHtml, htmlPage } = require('../html');

router.get('/', async (req, res) => {
    const empName = typeof req.query.empname === 'string' ? req.query.empname : '';
    const projName = typeof req.query.projname === 'string' ? req.query.projname : '';
    let pool;
    try {
        pool = await getConnection('workson');
        let query = `SELECT E.eno, E.ename, P.pno, P.pname, W.resp, W.hours
            FROM emp E JOIN workson W ON E.eno = W.eno
            JOIN proj P ON P.pno = W.pno WHERE 1=1`;
        const request = pool.request();
        if (empName.trim()) {
            query += ' AND E.ename LIKE @ename';
            request.input('ename', sql.VarChar, `%${empName}%`);
        }
        if (projName.trim()) {
            query += ' AND P.pname LIKE @pname';
            request.input('pname', sql.VarChar, `%${projName}%`);
        }
        query += ' ORDER BY E.ename, P.pname';
        const results = await request.query(query);
        const rows = results.recordset.map(row => `<tr><td>${escapeHtml(row.eno)}</td>
            <td>${escapeHtml(row.ename)}</td><td>${escapeHtml(row.pno)}</td>
            <td>${escapeHtml(row.pname)}</td><td>${escapeHtml(row.resp)}</td>
            <td>${escapeHtml(row.hours)}</td></tr>`).join('');
        res.send(htmlPage('Employee/Project Query Results', `<h1>Employee/Project Assignments</h1>
            <p>SQL query: <code>${escapeHtml(query)}</code></p>
            <table border="1"><tr><th>Employee #</th><th>Employee</th>
            <th>Project #</th><th>Project</th><th>Responsibility</th><th>Hours</th>
            </tr>${rows}</table><p>Number of records: ${results.recordset.length}</p>
            <p><a href="/examples/WorksOnQuery">New Search</a></p>`));
    } catch (err) {
        console.error('Employee/project query example failed:', err);
        res.status(500).send('Unable to query workson database. Check Docker logs.');
    } finally {
        if (pool) await pool.close();
    }
});

module.exports = router;
