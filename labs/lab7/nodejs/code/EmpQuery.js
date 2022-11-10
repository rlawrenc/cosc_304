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
    (async function() {
        try {
            let pool = await sql.connect(dbConfig);

            sqlQuery = "SELECT ename, salary, dno FROM emp ";
            
            let results = false;
            let empName = req.query.empname;
            let deptNum = req.query.deptnum;
     
            if (empName && deptNum) {
                sqlQuery = sqlQuery + "WHERE dno = @dno AND ename LIKE @ename";
                results = await pool.request()
                    .input('dno', sql.VarChar, deptNum)
                    .input('ename', sql.VarChar, "%" + empName + "%")
                    .query(sqlQuery);

            } else if (deptNum) {
                sqlQuery = sqlQuery + "WHERE dno = @dno";
                results = await pool.request()
                    .input('dno', sql.VarChar, deptNum)
                    .query(sqlQuery);

            } else if (empName) {
                sqlQuery = sqlQuery + "WHERE ename LIKE @ename";
                results = await pool.request()
                    .input('ename', sql.VarChar, "%" + empName + "%")
                    .query(sqlQuery);

            } else {
                results = await pool.request()
                    .query(sqlQuery);
            }

            res.write("<h2>SQL Query: " + sqlQuery + "</h2>");

            res.write("<table><tr><th>Name</th><th>Salary</th><th>dno</th></tr>");
           
            for (let i = 0; i < results.recordset.length; i++) {
                let result = results.recordset[i];
                res.write("<tr><td>" + result.ename + "</td><td>" + result.salary + "</td><td>" + result.dno + "</td></tr>");
            }
            res.write("</table>");

            res.end();
        } catch(err) {
            console.dir(err);
            res.write(JSON.stringify(err));
            res.end();
        }
    })();
})

module.exports = router;
