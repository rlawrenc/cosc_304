const express = require('express');
const router = express.Router();
const { sql, getConnection } = require('../db');
const { escapeHtml, formatCurrency, htmlPage } = require('../html');

router.post('/', async (req, res) => {
    const customerId = req.body.customerId;
    const products = Object.values(req.session.productList || {});
    let pool;

    try {
        // TODO (Q2): Check that customerId is a valid integer and exists in
        //       customer. Reject missing/nonexistent IDs with an error message.
        // TODO: Display an error if products.length === 0.
        // TODO: Connect to the orders database using await getConnection().
        // TODO: INSERT into ordersummary and retrieve the generated orderId.
        //       SQL Server supports OUTPUT INSERTED.orderId on an INSERT.
        //       Use SQL parameters rather than string concatenation.
        // TODO: Loop through products; each has id, name, price, and quantity.
        //       INSERT each item into orderproduct using the new orderId.
        // TODO: UPDATE ordersummary.totalAmount for the new order.
        //       Consider a SQL transaction so all inserts succeed or all roll back.
        // TODO: Display the order ID, purchased products, and total.
        // TODO: Clear req.session.productList ONLY after a successful order.
        // Use escapeHtml(...) for text and formatCurrency(...) for money.

        res.send(htmlPage('YOUR NAME Grocery Order Processing',
            '<h1>Order Processing</h1><p>TODO: implement Question 2.</p>'));
    } catch (err) {
        console.error('Unable to process order:', err);
        res.status(500).send(htmlPage('Order Processing Error',
            '<h1>Unable to process the order.</h1>'));
    } finally {
        // TODO (Q2): Close the connection: if (pool) await pool.close();
    }
});

module.exports = router;
