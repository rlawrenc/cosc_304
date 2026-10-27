const express = require('express');
const session = require('express-session');
const path = require('path');

const app = express();

// Read submitted checkout forms and provide a cart for each browser session.
// The default in-memory session store is suitable for this local lab only.
app.use(express.urlencoded({ extended: false }));
app.use(session({
    secret: process.env.SESSION_SECRET || 'cosc304-local-lab-session-secret',
    resave: false,
    saveUninitialized: false,
    cookie: { httpOnly: true, sameSite: 'lax', secure: false }
}));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'index.html'));
});

app.use('/loaddata', require('./routes/loaddata'));
app.use('/listorder', require('./routes/listorder'));
app.use('/listprod', require('./routes/listprod'));
app.use('/addcart', require('./routes/addcart'));
app.use('/showcart', require('./routes/showcart'));
app.use('/checkout', require('./routes/checkout'));
app.use('/order', require('./routes/order'));

// Optional exercises share the same running web app and SQL Server.
app.use('/examples', require('./examples'));

app.listen(3000, () => console.log('COSC 304 store listening on port 3000'));
