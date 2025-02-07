CREATE DATABASE IF NOT EXISTS railway_network;
USE railway_network;

-- Création d'un utilisateur dédié (éviter d'utiliser 'root' pour plus de sécurité)
CREATE USER 'railway_admin'@'localhost' IDENTIFIED BY 'azerty';

-- Attribution des privilèges uniquement sur la base concernée
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER 
ON railway_network.* 
TO 'railway_admin'@'localhost';

-- Application des modifications des privilèges
FLUSH PRIVILEGES;