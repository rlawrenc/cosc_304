const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
    const { id, name, price } = req.query;
    const productId = String(id ?? '');
    const productName = String(name ?? '');
    const productPrice = Number(price);

    if (!/^[1-9]\d*$/.test(productId) || !productName.trim() ||
        price === undefined || !Number.isFinite(productPrice) || productPrice < 0) {
        return res.status(400).send('Invalid product information. <a href="/listprod">Return to products</a>');
    }

    // Cart is an object keyed by product ID (not a sparse JavaScript array).
    const cart = req.session.productList || {};
    if (cart[productId]) {
        cart[productId].quantity += 1;
    } else {
        cart[productId] = { id: productId, name: productName,
            price: productPrice, quantity: 1 };
    }

    req.session.productList = cart;
    res.redirect('/showcart');
});

module.exports = router;
