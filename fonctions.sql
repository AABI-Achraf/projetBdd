DELIMITER $$

-- Fonction 1 : calc_travel_time
-- Calcule la durée (en minutes) entre deux timestamps (départ et arrivée)
CREATE FUNCTION calc_travel_time(depart TIMESTAMP, arrivee TIMESTAMP)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(MINUTE, depart, arrivee);
END$$

-- Fonction 2 : get_cumulative_hours
-- Calcule le cumul des heures de trajet d'un train en additionnant la différence en minutes de tous ses trajets et en convertissant le résultat en heures.
CREATE FUNCTION get_cumulative_hours(train_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_minutes INT;
    SELECT IFNULL(SUM(TIMESTAMPDIFF(MINUTE, horaire_départ, horaire_arrivée)), 0)
      INTO total_minutes
      FROM Trajet
      WHERE id_train = train_id;
    RETURN total_minutes / 60;
END$$

-- Fonction 3 : get_incident_count
-- Retourne le nombre total d'incidents associés à un train donné
CREATE FUNCTION get_incident_count(train_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE nb INT;
    SELECT IFNULL(COUNT(*), 0)
      INTO nb
      FROM Incident
      WHERE id_train = train_id;
    RETURN nb;
END$$

-- Fonction 4 : is_train_maintenance_needed
-- Indique si un train nécessite une maintenance (retourne 1 si oui, 0 sinon).
-- Critère : heures_cumulées > 1000 ou nombre d'incidents >= 3.
CREATE FUNCTION is_train_maintenance_needed(train_id INT)
RETURNS TINYINT
DETERMINISTIC
BEGIN
    DECLARE cumulative DECIMAL(10,2);
    DECLARE incidents INT;
    SET cumulative = get_cumulative_hours(train_id);
    SET incidents = get_incident_count(train_id);
    IF cumulative > 1000 OR incidents >= 3 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END$$

-- Fonction 5 : get_average_wait_time
-- Calcule le temps d'attente moyen pour une ligne donnée, à partir de la table Passage.
CREATE FUNCTION get_average_wait_time(line_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avg_wait DECIMAL(10,2);
    SELECT IFNULL(AVG(temps_attente_moyen), 0)
      INTO avg_wait
      FROM Passage
      WHERE id_ligne = line_id;
    RETURN avg_wait;
END$$

-- Fonction 6 : get_next_departure
-- Retourne l'horaire de départ le plus proche pour une ligne donnée à partir d'un station et d'un temps courant.
-- Pour simplifier, on recherche dans la table Trajet, en considérant uniquement l'heure de départ.
CREATE FUNCTION get_next_departure(station_id INT, line_id INT, current_time TIMESTAMP)
RETURNS TIMESTAMP
DETERMINISTIC
BEGIN
  DECLARE next_dep TIMESTAMP;
  SELECT MIN(horaire_départ)
  INTO next_dep
  FROM Trajet
  WHERE id_ligne = line_id
    AND horaire_départ > current_time
    -- On suppose que le train qui part à ce moment-là dessert la station station_id (contrainte simplifiée)
  LIMIT 1;
  RETURN next_dep;
END$$

-- Fonction 7 : get_station_capacity_utilization
-- Calcule le taux d'occupation d'une gare en pourcentage, en supposant l'existence d'une table Flux (id_gare, nb_passagers).
CREATE FUNCTION get_station_capacity_utilization(gare_id INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
  DECLARE nb_pass INT;
  DECLARE capacity INT;
  DECLARE utilization DECIMAL(5,2);
  
  -- On récupère le nombre de passagers enregistrés pour la gare (table Flux)
  SELECT nb_passagers INTO nb_pass FROM Flux WHERE id_gare = gare_id LIMIT 1;
  -- On récupère la capacité maximale de la gare
  SELECT capacité_max INTO capacity FROM Gare WHERE id_gare = gare_id;
  -- Calcul du taux d'occupation en pourcentage
  SET utilization = (nb_pass / capacity) * 100;
  RETURN utilization;
END$$

DELIMITER ;
