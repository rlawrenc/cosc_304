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

    sqlQuery = "SELECT E.eno, E.ename, P.pno, P.pname, resp, hours FROM emp E, workson W, proj P WHERE E.eno = W.eno and P.pno = W.pno ";

    let projName = false;
    if (req.query.projName) {
        projName = "%" + req.query.projName + "%";
        sqlQuery = sqlQuery + " AND pname LIKE @pname";
    }

    let empName = false;
    if (req.query.empName) {
        empName = "%" + empName + "%";
        sqlQuery = sqlQuery + " AND ename like @ename";
    }

    (async function() {
        try {
            let pool = await sql.connect(dbConfig);

            results = await pool.request()
                .input('pname', sql.VarChar, projName)
                .input('ename', sql.VarChar, empName)
                .query(sqlQuery);
            
            echo("<h2>SQL Query: " + sqlQuery + "</h2>");

            echo("<table><tr><th>eno</th><th>ename</th><th>pno</th><th>pname</th><th>resp</th><th>hours</th></tr>");
            for (let i = 0; i < results.recordset.length; i++) {
                result = results[i];
                echo("<tr><td>" + result.eno + "</td><td>" + result.ename + "</td><td>" + result.pno + "</td><td>" + \
                        result.pname + "</td><td>" + result.resp + "</td><td>" + result.hours + "</td></tr>");

            }
            echo("</table>");

            }
        } catch(err) {
            console.dir(err);
            res.write(err)
            res.end();
        }
    })();

    res.end()
})

module.exports = router;
