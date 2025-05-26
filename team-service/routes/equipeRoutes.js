const express = require('express');
const router = express.Router();
const equipeController = require('../controllers/equipeController');

router.put('/equipes/:id', equipeController.updateEquipe);
router.post('/equipes/:id/joueurs', equipeController.ajouterJoueur);

module.exports = router;
