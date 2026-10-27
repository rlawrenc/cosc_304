const express = require('express');
const router = express.Router();
const { escapeHtml, formatCurrency, htmlPage } = require('../html');

router.get('/', (req, res) => {
    const products = Object.values(req.session.productList || {});

    if (products.length === 0) {
        return res.send(htmlPage('Your Shopping Cart',
            '<h1>Your shopping cart is empty!</h1><p><a href="/listprod">Continue Shopping</a></p>'));
    }

    let total = 0;
    const rows = products.map(product => {
        const subtotal = Number(product.quantity) * Number(product.price);
        total += subtotal;
        return `<tr><td>${escapeHtml(product.id)}</td><td>${escapeHtml(product.name)}</td>
            <td>${product.quantity}</td><td>${formatCurrency(product.price)}</td>
            <td>${formatCurrency(subtotal)}</td></tr>`;
    }).join('');

    res.send(htmlPage('Your Shopping Cart', `<h1>Your Shopping Cart</h1>
        <table border="1"><tr><th>Product ID</th><th>Product Name</th>
        <th>Quantity</th><th>Price</th><th>Subtotal</th></tr>
        ${rows}<tr><td colspan="4"><strong>Order Total</strong></td>
        <td>${formatCurrency(total)}</td></tr></table>
        <h2><a href="/checkout">Check Out</a></h2>
        <p><a href="/listprod">Continue Shopping</a></p>`));
});

module.exports = router;
