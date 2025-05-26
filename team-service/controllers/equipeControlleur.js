const db = require('../db');

// Modifier une équipe
exports.updateEquipe = async (req, res) => {
  const { id } = req.params;
  const { nom, nationalite, mot_cle, points } = req.body;

  try {
    const [result] = await db.execute(
      'UPDATE Equipe SET nom = ?, nationalite = ?, mot_cle = ?, points = ? WHERE id = ?',
      [nom, nationalite, mot_cle, points, id]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Équipe non trouvée.' });
    }

    res.json({ message: 'Équipe mise à jour avec succès.' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Ajouter un joueur à une équipe
exports.ajouterJoueur = async (req, res) => {
  const { id } = req.params; // ID de l'équipe
  const { nom } = req.body;

  try {
    const [result] = await db.execute(
      'INSERT INTO Joueur (nom, equipe_id) VALUES (?, ?)',
      [nom, id]
    );

    res.status(201).json({ message: 'Joueur ajouté.', joueurId: result.insertId });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
