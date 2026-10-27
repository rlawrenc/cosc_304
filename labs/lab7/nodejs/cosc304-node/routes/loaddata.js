const express = require('express');
const fs = require('fs/promises');
const path = require('path');
const router = express.Router();
const { getConnection } = require('../db');
const { htmlPage } = require('../html');

// Check connectivity without modifying any data.
async function counts() {
    let pool;
    try {
        pool = await getConnection();
        const result = await pool.request().query(`SELECT
            (SELECT COUNT(*) FROM customer) AS customers,
            (SELECT COUNT(*) FROM product) AS products,
            (SELECT COUNT(*) FROM ordersummary) AS orders`);
        return result.recordset[0];
    } finally {
        if (pool) await pool.close();
    }
}

function renderStatus(message, stats) {
    const summary = stats ? `<h3>Database connection successful.</h3>
        <p>Customers: ${stats.customers}</p><p>Products: ${stats.products}</p>
        <p>Orders: ${stats.orders}</p>` :
        '<p>Unable to access the store database. Check Docker and SQL Server logs.</p>';
    return htmlPage('COSC 304 Database Setup', `
        <h2>COSC 304 Store Database</h2>${message}${summary}<hr>
        <h3>Reset Database</h3>
        <p>Resetting deletes orders, customers, products, and other changes,
        and restores the original sample data.</p>
        <form method="post" action="/loaddata"
          onsubmit="return confirm('Reset database and delete existing data?');">
        <input type="submit" value="Reset Database"></form>
        <p><a href="/">Return to Store</a></p>`);
}

router.get('/', async (req, res) => {
    try {
        res.send(renderStatus('', await counts()));
    } catch (err) {
        console.error('Store database check failed:', err);
        res.status(503).send(renderStatus('', null));
    }
});

router.post('/', async (req, res) => {
    let pool;
    try {
        // GO separates T-SQL batches; splitting at semicolons breaks the DDL.
        const script = await fs.readFile(path.join(__dirname, '..', 'ddl',
            'SQLServer_orderdb.ddl'), 'utf8');
        const batches = script.split(/^\s*GO\s*$/gim).filter(s => s.trim());
        pool = await getConnection('master');
        for (let i = 0; i < batches.length; i++) {
            // The first batch creates the database; the second selects it.
            // Prefix remaining batches with USE because pool requests may run
            // on different physical connections.
            const batch = i >= 2 ? `USE orders;\n${batches[i]}` : batches[i];
            await pool.request().batch(batch);
        }
        await pool.close();
        pool = null;
        res.send(renderStatus('<p><strong>Database reset completed successfully.</strong></p>',
            await counts()));
    } catch (err) {
        console.error('Store database reset failed:', err);
        res.status(500).send(renderStatus(
            '<p><strong>Database reset failed.</strong> Check server logs.</p>', null));
    } finally {
        if (pool) await pool.close();
    }
});

module.exports = router;
