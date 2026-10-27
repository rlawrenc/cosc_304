const express = require('express');
const router = express.Router();
const { htmlPage } = require('../html');

router.get('/', (req, res) => {
    res.send(htmlPage('WorksOn Query Example', `
        <h1>Search for employee/project assignments</h1>
        <form method="get" action="/examples/EmpProjQuery">
            <label>Employee name: <input type="text" name="empname" size="25"></label>
            <label>Project name: <input type="text" name="projname" size="25"></label>
            <input type="submit" value="Submit"><input type="reset" value="Reset">
        </form><p><a href="/examples">All Examples</a></p>`));
});

module.exports = router;
