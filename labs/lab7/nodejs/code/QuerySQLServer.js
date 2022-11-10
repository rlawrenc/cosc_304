const express = require('express');
const sql = require('mssql');
const app = express();

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
            res.write(JSON.stringify(err));
            res.end();
        }
    })();
})

app.listen(3000)