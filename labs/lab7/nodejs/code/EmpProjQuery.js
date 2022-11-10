const express = require('express');
const sql = require('mssql');
const router = express.Router();

// This DB Config is accessible globally
dbConfig = {    
    server: 'cosc304_sqlserver',
    database: 'workson',
    authentication: {
        type: 'default',
        options: {
            userName: 'sa', 
            password: '304#sa#pw'
        }
    },   
    options: {      
      encrypt: false,      
      enableArithAbort:false,
      database: 'workson'
    }
}

router.get('/', function (req, res) {
    res.setHeader('Content-Type', 'text/html');

    sqlQuery = "SELECT E.eno, E.ename, P.pno, P.pname, resp, hours FROM emp E, workson W, proj P WHERE E.eno = W.eno and P.pno = W.pno ";

    let projName = false;
    if (req.query.projname) {
        projName = "%" + req.query.projname + "%";
        sqlQuery = sqlQuery + " AND pname LIKE @pname";
    }

    let empName = false;
    if (req.query.empname) {
        empName = "%" + req.query.empname + "%";
        sqlQuery = sqlQuery + " AND ename like @ename";
    }

    (async function() {
        try {
            let pool = await sql.connect(dbConfig);

            results = await pool.request()
                .input('pname', sql.VarChar, projName)
                .input('ename', sql.VarChar, empName)
                .query(sqlQuery);
            
            res.write("<h2>SQL Query: " + sqlQuery + "</h2>");

            res.write("<table><tr><th>eno</th><th>ename</th><th>pno</th><th>pname</th><th>resp</th><th>hours</th></tr>");
            // console.log(results.recordset);
            console.log("HERE");
            for (let i = 0; i < results.recordset.length; i++) {
                result = results.recordset[i];
                console.log(result);
                console.log("HERE2");
                res.write("<tr><td>" + result.eno + "</td><td>" + result.ename + "</td><td>" + result.pno + "</td><td>" + 
                        result.pname + "</td><td>" + result.resp + "</td><td>" + result.hours + "</td></tr>");

            }
            res.write("</table>");
        } catch(err) {
            console.dir(err);
            res.write(JSON.stringify(err));
            res.end();
        }
    })();    
})

module.exports = router;
