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

            let results = await pool.request()
                .query("SELECT dno, dname FROM dept");

            console.log(JSON.stringify(results));
            for (let i = 0; i < results.recordset.length; i++) {
                let result = results.recordset[i];
                let dno = result.dno
               
                res.write("<h2>" + dno + " : " + result.dname + "</h2>");

                let results2 = await pool.request()
                    .input('dno', sql.NVarChar(5), dno)
                    .query("SELECT pno, pname, budget FROM proj WHERE dno = @dno");
                
                if (results2.recordset.length > 0) {
                    res.write("<H3>Project List</H3><TABLE><TH>pno</TH><TH>pname</TH><TH>budget</TH>");
                  
                    for (let j = 0; j < results2.recordset.length; j++) {
                        let result2 = results2.recordset[j]
                        console.log(JSON.stringify(result2));
                        res.write("<TR><TD>" + result2.pno + "</TD><TD>" + result2.pname + "</TD><TD>" + result2.budget + "</TD></TR>");
                    }

                    res.write("</table>");
                } else {
                    res.write("<h3>No Projects.</h3>");
                }

                results2 = await pool.request()
                    .input('dno', sql.NVarChar(5), dno)
                    .query("SELECT eno, ename, bdate, salary FROM emp WHERE dno = @dno");
                
                if (results2.recordset.length > 0) {
                    res.write("<H3>Employee List</H3><TABLE><TH>eno</TH><TH>ename</TH><TH>birth date</TH><TH>salary</TH>");

                    for (let j = 0; j < results2.recordset.length; j++) {
                        let result2 = results2.recordset[j]
                        res.write("<TR><TD>" + result2.eno + "</TD><TD>" + result2.ename + "</TD><TD>" + result2.bdate.toLocaleDateString() + "</TD><TD>" + result2.salary + "</TD></TR>");
                    }

                    res.write("</table>");
                } else {
                    res.write("<h3>No Employees.</h3>");
                }                
            }

            res.end();
        } catch(err) {
            console.dir(err);
            res.write(JSON.stringify(err));
            res.end();
        }
    })();
})

app.listen(3000)