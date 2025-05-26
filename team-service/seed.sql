-- Création de la base
DROP DATABASE IF EXISTS devcamp;
CREATE DATABASE devcamp;
USE devcamp;

-- Table Equipe
CREATE TABLE Equipe (
  id INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(100) NOT NULL,
  nationalite VARCHAR(100),
  mot_cle VARCHAR(100),
  points INT DEFAULT 0,
  PRIMARY KEY (id)
);

-- Table Joueur
CREATE TABLE Joueur (
  id INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(100) NOT NULL,
  equipe_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (equipe_id) REFERENCES Equipe(id) ON DELETE SET NULL
);

-- Données initiales
INSERT INTO Equipe (nom, nationalite, mot_cle, points) VALUES
('Explorateurs', 'Canada', 'nature', 0),
('Chasseurs de trésors', 'France', 'or', 0),
('Team Nord', 'Suède', 'arctique', 0);

INSERT INTO Joueur (nom, equipe_id) VALUES
('Alice', 1),
('Bob', 1),
('Charlie', 3);
