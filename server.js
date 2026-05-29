const express = require('express');
const path = require('path');
const app = express();

// Use the port provided by Render, or default to 3000 locally
const PORT = process.env.PORT || 3000;

// Serve all static files from the current directory
app.use(express.static(path.join(__dirname)));

// Fallback route to serve your specific index.html if someone hits the root URL
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'demos', 'butcher', 'index.html'));
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running!`);
    console.log(`Local access: http://localhost:${PORT}/demos/butcher/index.html`);
});
