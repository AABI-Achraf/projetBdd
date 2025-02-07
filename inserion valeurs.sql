-- =============================
-- Insertion script for sample data
-- =============================

-- Insertion into table Gare (10 rows)
INSERT INTO Gare (nom, localisation, équipements, nb_quais, capacité_max) VALUES 
('Paris-Nord', POINT(48.8809, 2.3553), '["WiFi", "Restauration"]', 20, 2000),
('Lyon-Part-Dieu', POINT(45.7578, 4.8598), '["Parking", "Boutiques"]', 15, 1500),
('Marseille-Saint-Charles', POINT(43.2965, 5.3698), '["Cafés", "WiFi"]', 18, 1800),
('Lille-Flandres', POINT(50.6369, 3.0634), '["Restauration"]', 12, 1200),
('Bordeaux-Saint-Jean', POINT(44.8378, -0.5792), '["WiFi", "Parking"]', 10, 1000),
('Strasbourg', POINT(48.5839, 7.7455), '["Boutiques", "Parking"]', 14, 1300),
('Nantes', POINT(47.2184, -1.5536), '["Restauration", "WiFi"]', 16, 1400),
('Rennes', POINT(48.1173, -1.6778), '["Parking"]', 8, 800),
('Nice', POINT(43.7102, 7.2620), '["Restauration"]', 9, 900),
('Toulouse', POINT(43.6047, 1.4442), '["WiFi", "Boutiques"]', 11, 1100);

-- Insertion into table Ligne (5 rows)
INSERT INTO Ligne (nom_ligne, type_ligne) VALUES 
('Ligne A', 'TGV'),
('Ligne B', 'TER'),
('Ligne C', 'Intercités'),
('Ligne D', 'RER'),
('Ligne E', 'TGV');

-- Insertion into table Train (10 rows)
INSERT INTO Train (type_train, capacité_passagers, date_maintenance, heures_cumulées) VALUES
('TGV', 500, '2023-01-15', 1200),
('TER', 200, '2023-02-10', 800),
('Intercités', 300, '2023-03-05', 950),
('TGV', 520, '2023-01-20', 1100),
('RER', 100, '2023-04-01', 500),
('TGV', 480, '2023-01-10', 1300),
('TER', 210, '2023-03-15', 750),
('Intercités', 320, '2023-02-20', 900),
('RER', 90, '2023-04-05', 450),
('TGV', 510, '2023-01-25', 1250);

-- Insertion into table Incident (25 rows)
-- First 10 rows
INSERT INTO Incident (type_incident, date_heure, durée_retard, impact, id_train, id_ligne, id_gare) VALUES
('Retard', '2023-04-10 08:30:00', 15, 'Mineur', 1, 1, 1),
('Panne', '2023-04-11 09:00:00', 30, 'Critique', 2, 2, 2),
('Retard', '2023-04-12 10:00:00', 10, 'Mineur', 3, 3, 3),
('Panne', '2023-04-13 11:00:00', 45, 'Critique', 4, 1, 4),
('Retard', '2023-04-14 12:00:00', 5, 'Mineur', 5, 2, 5),
('Retard', '2023-04-15 13:00:00', 20, 'Mineur', 6, 3, 6),
('Panne', '2023-04-16 14:00:00', 60, 'Critique', 7, 4, 7),
('Retard', '2023-04-17 15:00:00', 25, 'Mineur', 8, 5, 8),
('Retard', '2023-04-18 16:00:00', 10, 'Mineur', 9, 1, 9),
('Panne', '2023-04-19 17:00:00', 35, 'Critique', 10, 2, 10);

-- 15 additional rows
INSERT INTO Incident (type_incident, date_heure, durée_retard, impact, id_train, id_ligne, id_gare) VALUES
('Retard', '2023-04-20 08:30:00', 12, 'Mineur', 1, 3, 2),
('Panne', '2023-04-20 09:00:00', 40, 'Critique', 2, 4, 3),
('Retard', '2023-04-20 10:00:00', 8, 'Mineur', 3, 5, 4),
('Panne', '2023-04-20 11:00:00', 50, 'Critique', 4, 1, 5),
('Retard', '2023-04-20 12:00:00', 7, 'Mineur', 5, 2, 6),
('Retard', '2023-04-20 13:00:00', 18, 'Mineur', 6, 3, 7),
('Panne', '2023-04-20 14:00:00', 55, 'Critique', 7, 4, 8),
('Retard', '2023-04-20 15:00:00', 22, 'Mineur', 8, 5, 9),
('Retard', '2023-04-20 16:00:00', 9, 'Mineur', 9, 1, 10),
('Panne', '2023-04-20 17:00:00', 38, 'Critique', 10, 2, 1),
('Retard', '2023-04-21 08:30:00', 14, 'Mineur', 1, 3, 2),
('Panne', '2023-04-21 09:00:00', 45, 'Critique', 2, 4, 3),
('Retard', '2023-04-21 10:00:00', 11, 'Mineur', 3, 5, 4),
('Panne', '2023-04-21 11:00:00', 60, 'Critique', 4, 1, 5),
('Retard', '2023-04-21 12:00:00', 6, 'Mineur', 5, 2, 6);

-- Insertion into table Trajet (10 rows)
INSERT INTO Trajet (id_ligne, id_train, horaire_départ, horaire_arrivée) VALUES
(1, 1, '2023-04-10 07:00:00', '2023-04-10 08:00:00'),
(2, 2, '2023-04-10 07:30:00', '2023-04-10 08:30:00'),
(3, 3, '2023-04-10 08:00:00', '2023-04-10 09:00:00'),
(1, 4, '2023-04-10 08:30:00', '2023-04-10 09:30:00'),
(2, 5, '2023-04-10 09:00:00', '2023-04-10 10:00:00'),
(3, 6, '2023-04-10 09:30:00', '2023-04-10 10:30:00'),
(4, 7, '2023-04-10 10:00:00', '2023-04-10 11:00:00'),
(5, 8, '2023-04-10 10:30:00', '2023-04-10 11:30:00'),
(1, 9, '2023-04-10 11:00:00', '2023-04-10 12:00:00'),
(2, 10, '2023-04-10 11:30:00', '2023-04-10 12:30:00');

-- Insertion into table Segment (20 rows)
INSERT INTO Segment (id_gare_départ, id_gare_arrivée, temps_parcours) VALUES
(1, 2, 15),
(2, 3, 20),
(3, 4, 10),
(4, 5, 12),
(5, 6, 18),
(6, 7, 25),
(7, 8, 14),
(8, 9, 16),
(9, 10, 20),
(10, 1, 30),
(1, 3, 25),
(2, 4, 22),
(3, 5, 18),
(4, 6, 20),
(5, 7, 15),
(6, 8, 17),
(7, 9, 19),
(8, 10, 21),
(9, 1, 23),
(10, 2, 24);

-- Insertion into table Passage (20 rows)
INSERT INTO Passage (id_ligne, id_gare, ordre_dans_ligne, temps_attente_moyen) VALUES
(1, 1, 1, 5),
(1, 2, 2, 4),
(1, 3, 3, 6),
(1, 4, 4, 5),
(1, 5, 5, 7),
(2, 2, 1, 4),
(2, 3, 2, 5),
(2, 4, 3, 4),
(2, 5, 4, 6),
(2, 6, 5, 5),
(3, 3, 1, 6),
(3, 4, 2, 5),
(3, 5, 3, 7),
(3, 6, 4, 4),
(3, 7, 5, 6),
(4, 4, 1, 5),
(4, 5, 2, 6),
(4, 6, 3, 5),
(4, 7, 4, 4),
(4, 8, 5, 6);
