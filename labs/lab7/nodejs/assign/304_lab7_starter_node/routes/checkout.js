const express = require('express');
const router = express.Router();

router.get('/', function(req, res, next) {
    res.setHeader('Content-Type', 'text/html');
    res.write("<title>Grocery CheckOut Line</title>");

    res.write("<h1>Enter your customer id to complete the transaction:</h1>");

    res.write('<form method="get" action="order">');
    res.write('<input type="text" name="customerId" size="50">');
    res.write('<input type="submit" value="Submit"><input type="reset" value="Reset">');
    res.write('</form>');

    res.end();
});

module.exports = router;
