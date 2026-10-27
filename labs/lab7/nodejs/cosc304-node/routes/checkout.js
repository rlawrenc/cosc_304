const express = require('express');
const router = express.Router();
const { htmlPage } = require('../html');

router.get('/', (req, res) => {
    res.send(htmlPage('Grocery Store Checkout', `
        <h1>Checkout</h1>
        <p>Enter your customer ID to complete the transaction:</p>
        <form method="post" action="/order">
            <label for="customerId">Customer ID:</label>
            <input type="text" id="customerId" name="customerId" required>
            <input type="submit" value="Place Order">
        </form>
        <p><a href="/showcart">Return to Shopping Cart</a></p>`));
});

module.exports = router;
