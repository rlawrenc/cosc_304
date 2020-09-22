const express = require('express');
const sql = require('mssql');
const app = express();

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

app.get('/', function (req, res) {
    res.setHeader('Content-Type', 'text/html');
    (async function() {
        try {
            let pool = await sql.connect(dbConfig);

            let sqlQuery = "SELECT ename,salary FROM emp";
            let results = await pool.request()
                .query(sqlQuery);
            
            res.write("<table><tr><th>Name</th><th>Salary</th></tr>");
            for (let i = 0; i < results.recordset.length; i++) {
                let result = results.recordset[i];
                res.write("<tr><td>" + result.ename + "</td><td>" + result.salary + "</td></tr>");
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

app.listen(3000)