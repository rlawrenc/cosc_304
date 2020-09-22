const express = require('express')
const app = express()

app.get('/', function (req, res) {
    res.setHeader('Content-Type', 'text/html');
    res.write("<title>Hello World in Node.js</title>")
    res.write("<h1>Hello World Again!</h1>")
    res.write("<pre>");
    for (let i = 0; i <= 5; i++) {
        res.write(i.toString() + "<br>");
    }
    res.write("</pre>");
    res.end();
})

app.listen(3000)