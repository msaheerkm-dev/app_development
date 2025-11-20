const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const calcRoutes = require('./routes/calcRoutes');

const app = express();
const PORT = 3000;



// Enable CORS for all routes
app.use(cors());

// Root route
app.get('/', (req, res) => {
    res.send('Welcome to the Calculator API!');
});

app.use(bodyParser.json());
app.use('/api/calc', calcRoutes);

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});