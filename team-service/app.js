const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());

// Routes
app.use('/api/equipe', require('./routes/equipeRoutes'));

app.listen(port, () => {
  console.log(`🚀 Serveur démarré sur http://localhost:${port}`);
});
