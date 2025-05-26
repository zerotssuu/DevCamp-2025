const StatsDAO = require('./dao/StatsDAO');
const cron = require('node-cron');

// Toutes les 15 minutes
cron.schedule('*/15 * * * *', async () => {
    await StatsDAO.refreshStats();
});

const express = require('express');
const app = express();

app.get('/stats', async (req, res) => {
    const stats = await StatsDAO.getStats();
    res.json(stats);
});

app.listen(3000, () => {
    console.log('Server running on http://localhost:3000');
});
