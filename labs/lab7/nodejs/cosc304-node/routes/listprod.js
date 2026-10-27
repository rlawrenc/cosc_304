const express = require('express');
const router = express.Router();
const { sql, getConnection } = require('../db');
const { escapeHtml, formatCurrency, htmlPage } = require('../html');

router.get('/', async (req, res) => {
    const name = typeof req.query.productName === 'string' ? req.query.productName : '';
    const form = `<h1>Search for the products you want to buy:</h1>
        <form method="get" action="/listprod">
        <input type="text" name="productName" size="50" value="${escapeHtml(name)}">
        <input type="submit" value="Submit"><input type="reset" value="Reset">
        (Leave blank for all products)</form>`;

    let pool;
    try {
        // TODO (Q2): Open a connection with await getConnection().
        // TODO: Query products; when name is provided filter using LIKE @name.
        //       Bind the parameter, e.g. request.input('name', sql.VarChar, `%${name}%`).
        //       When blank, return all products.
        // TODO: Print a table of matching products with prices formatted using
        //       formatCurrency(price) and HTML text escaped with escapeHtml(text).
        // TODO: For each row, create an add-to-cart link with URL query parameters:
        //       /addcart?id=productId&name=productName&price=productPrice
        //       Use encodeURIComponent(...) or URLSearchParams to encode values.

        res.send(htmlPage('YOUR NAME Grocery', form +
            '<p>TODO: implement product search for Question 2.</p>'));
    } catch (err) {
        console.error('Unable to list products:', err);
        res.status(500).send(htmlPage('Product Search Error',
            form + '<p>Unable to search products.</p>'));
    } finally {
        // TODO (Q2): Close the connection: if (pool) await pool.close();
    }
});

module.exports = router;
