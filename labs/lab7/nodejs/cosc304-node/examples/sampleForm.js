const express = require('express');
const router = express.Router();
const { htmlPage } = require('../html');

router.get('/', (req, res) => {
    res.send(htmlPage('Querying Using Node.js and Forms', `
        <h1>Search by employee name and/or department</h1>
        <form method="get" action="/examples/EmpQuery">
            <label>Employee name: <input type="text" name="empname" size="25"></label>
            <label>Department: <input type="text" name="deptnum" size="5"></label>
            <input type="submit" value="Submit"><input type="reset" value="Reset">
        </form><p><a href="/examples">All Examples</a></p>`));
});

module.exports = router;
