const express = require('express');
const router = express.Router();
const { htmlPage } = require('../html');

router.get('/', (req, res) => {
    let numbers = '';
    for (let i = 1; i <= 5; i++) {
        numbers += `${i}\n`;
    }
    res.send(htmlPage('Hello World in Node.js',
        `<h1>Hello World Again!</h1><pre>${numbers}</pre>`));
});

module.exports = router;
