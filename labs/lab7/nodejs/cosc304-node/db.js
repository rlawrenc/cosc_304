// Shared database connection configuration for the assignment and examples.
// A new pool is opened for each request; close it in a finally block.
const sql = require('mssql');

function databaseConfig(database = 'orders') {
    return {
        user: process.env.DB_USER || 'sa',
        password: process.env.DB_PASSWORD || '304#sa#pw',
        server: process.env.DB_HOST || 'cosc304_sqlserver',
        database,
        options: {
            encrypt: true,
            trustServerCertificate: true
        }
    };
}

async function getConnection(database = 'orders') {
    const pool = new sql.ConnectionPool(databaseConfig(database));
    return pool.connect();
}

module.exports = { sql, getConnection };
