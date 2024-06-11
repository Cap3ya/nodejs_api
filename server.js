const express = require('express');
const app = express();
const port = process.env.DB_PORT || 3000;

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Import database connection (make sure this is set up correctly)
require('./model/db');

// Import and register routes
const routes = require('./routes/appRoutes');
routes(app);

app.listen(port, () => {
    console.log('API server started on: http://127.0.0.1:' + port);
});
