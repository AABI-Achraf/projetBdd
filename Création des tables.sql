-- Création de la table Gare
CREATE TABLE Gare (
    id_gare INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    localisation POINT,
    équipements TEXT,
    nb_quais INT NOT NULL,
    capacité_max INT NOT NULL
) ENGINE=InnoDB;

-- Création de la table Ligne
CREATE TABLE Ligne (
    id_ligne INT AUTO_INCREMENT PRIMARY KEY,
    nom_ligne VARCHAR(100) NOT NULL,
    type_ligne VARCHAR(50)
) ENGINE=InnoDB;

-- Création de la table Train
CREATE TABLE Train (
    id_train INT AUTO_INCREMENT PRIMARY KEY,
    type_train VARCHAR(50) NOT NULL,
    capacité_passagers INT NOT NULL,
    date_maintenance DATE,
    heures_cumulées INT DEFAULT 0
) ENGINE=InnoDB;

-- Création de la table Incident
CREATE TABLE Incident (
    id_incident INT AUTO_INCREMENT PRIMARY KEY,
    type_incident VARCHAR(50) NOT NULL,
    date_heure TIMESTAMP NOT NULL,
    durée_retard INT,
    impact VARCHAR(100),
    id_train INT,
    id_ligne INT,
    id_gare INT,
    FOREIGN KEY (id_train) REFERENCES Train(id_train),
    FOREIGN KEY (id_ligne) REFERENCES Ligne(id_ligne),
    FOREIGN KEY (id_gare) REFERENCES Gare(id_gare)
) ENGINE=InnoDB;

-- Création de la table Trajet
CREATE TABLE Trajet (
    id_trajet INT AUTO_INCREMENT PRIMARY KEY,
    id_ligne INT NOT NULL,
    id_train INT NOT NULL,
    horaire_départ TIMESTAMP,
    horaire_arrivée TIMESTAMP,
    FOREIGN KEY (id_ligne) REFERENCES Ligne(id_ligne),
    FOREIGN KEY (id_train) REFERENCES Train(id_train)
) ENGINE=InnoDB;

-- Création de la table Segment
CREATE TABLE Segment (
    id_segment INT AUTO_INCREMENT PRIMARY KEY,
    id_gare_départ INT NOT NULL,
    id_gare_arrivée INT NOT NULL,
    temps_parcours INT NOT NULL,
    FOREIGN KEY (id_gare_départ) REFERENCES Gare(id_gare),
    FOREIGN KEY (id_gare_arrivée) REFERENCES Gare(id_gare)
) ENGINE=InnoDB;

-- Création de la table Passage
CREATE TABLE Passage (
    id_passage INT AUTO_INCREMENT PRIMARY KEY,
    id_ligne INT NOT NULL,
    id_gare INT NOT NULL,
    ordre_dans_ligne INT NOT NULL,
    temps_attente_moyen INT,
    FOREIGN KEY (id_ligne) REFERENCES Ligne(id_ligne),
    FOREIGN KEY (id_gare) REFERENCES Gare(id_gare)
) ENGINE=InnoDB;
