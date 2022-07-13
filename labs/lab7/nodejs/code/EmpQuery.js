const express = require('express');
const sql = require('mssql');
const router = express.Router();

// This DB Config is accessible globally
dbConfig = {
    user: 'fill-in',
    password: 'fill-in',
    server: 'sql04.ok.ubc.ca',
    database: 'WorksOn',
    options: {
      'enableArithAbort': true,
      'encrypt': false,
    }
}

router.get('/', function (req, res) {
    res.setHeader('Content-Type', 'text/html');
    (async function() {
        try {
            let pool = await sql.connect(dbConfig);

            $sql = "SELECT ename, salary, dno FROM emp ";

            let sqlQuery = false;
            let results = false;
            if (req.query.empName && req.query.deptNum) {
                sqlQuery = sqlQuery + "WHERE dno = @dno AND ename LIKE @ename";
                results = await pool.request()
                    .input('dno', sql.Int, req.query.deptNum)
                    .input('ename', sql.VarChar, "%" + req.query.empName + "%")
                    .query(sqlQuery);

            } else if (req.query.deptNum) {
                sqlQuery = sqlQuery + "WHERE dno = @dno";
                results = await pool.request()
                    .input('dno', sql.Int, req.query.deptNum)
                    .query(sqlQuery);

            } else if (req.query.empName) {
                sqlQuery = sqlQuery + "ename LIKE @ename";
                results = await pool.request()
                    .input('ename', sql.VarChar, "%" + req.query.empName + "%")
                    .query(sqlQuery);

            } else {
                results = await pool.request()
                    .query(sqlQuery);
            }

            res.write("<h2>SQL Query: " + sqlQuery + "</h2>");

            res.write("<table><tr><th>Name</th><th>Salary</th><th>dno</th></tr>");
            for (let i = 0; i < results.recordset.length; i++) {
                let result = results.recordset[i]
                echo("<tr><td>" + result.ename + "</td><td>" + result.salary + "</td><td>" + result.dno + "</td></tr>");
            }
            res.write("</table>");

            res.end();
        } catch(err) {
            console.dir(err);
            res.write(err)
            res.end();
        }
    })();
})

module.exports = router;
