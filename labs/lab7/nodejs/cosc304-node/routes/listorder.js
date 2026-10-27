const express = require('express');
const router = express.Router();
const { sql, getConnection } = require('../db');
const { escapeHtml, formatCurrency, htmlPage } = require('../html');

router.get('/', async (req, res) => {
    let pool;
    try {
        // TODO (Q1): Open a connection with await getConnection().

        // TODO: Query ordersummary and display order headers in an HTML table.
        // TODO: For each order, query orderproduct and product to list its items.
        //       Use pool.request().input('orderId', sql.Int, id).query(...)
        //       to bind the order ID rather than concatenating it into SQL.
        // Use formatCurrency(amount) and escapeHtml(text) when displaying values.

        res.send(htmlPage('YOUR NAME Grocery Order List',
            '<h1>Order List</h1><p>TODO: implement Question 1.</p>'));
    } catch (err) {
        console.error('Unable to list orders:', err);
        res.status(500).send(htmlPage('Order List Error',
            '<h1>Unable to retrieve orders.</h1>'));
    } finally {
        // TODO (Q1): Close the connection: if (pool) await pool.close();
    }
});

module.exports = router;
