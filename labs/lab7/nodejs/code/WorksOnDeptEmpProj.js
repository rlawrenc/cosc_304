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

            let results = await pool.request()
                .query("SELECT dno, dname FROM dept");

            for (let i = 0; i < results.recordset.length; i++) {
                let result = results.recordset[i];
                let dno = result[0]
                res.write("<h2>" + dno + " : " + result[1] + "</h2>");

                let results2 = await pool.request()
                    .input('dno', sql.Int, dno)
                    .query("SELECT pno, pname, budget FROM proj WHERE dno = @dno'");
                
                if (results2.recordset.length > 0) {
                    res.write("<H3>Project List</H3><TABLE><TH>pno</TH><TH>pname</TH><TH>budget</TH>");

                    for (let j = 0; j < results2.recordset.length; j++) {
                        result2 = results2[j]
                        res.write("<TR><TD>" + result2[0] + "</TD><TD>" + result2[1] + "</TD><TD>" + result2[2] + "</TD></TR>");
                    }

                    res.write("</table>");
                } else {
                    res.write("<h3>No Projects.</h3>");
                }

                let results2 = await pool.request()
                    .input('dno', sql.Int, dno)
                    .query("SELECT eno, ename, bdate, salary FROM emp WHERE dno = @dno'");
                
                if (results2.recordset.length > 0) {
                    res.write("<H3>Employee List</H3><TABLE><TH>eno</TH><TH>ename</TH><TH>birth date</TH><TH>salary</TH>");

                    for (let j = 0; j < results2.recordset.length; j++) {
                        result2 = results2[j]
                        res.write("<TR><TD>" + result2[0] + "</TD><TD>" + result2[1] + "</TD><TD>" + result2[2] + "</TD><TD>" + result2[3] + "</TD></TR>");
                    }

                    res.write("</table>");
                } else {
                    res.write("<h3>No Employees.</h3>");
                }
            }

            res.end();
        } catch(err) {
            console.dir(err);
            res.write(err)
            res.end();
        }
    })();
})

app.listen(3000)