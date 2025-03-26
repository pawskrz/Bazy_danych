-- zadanie 4 --
SELECT COUNT(description)
FROM film_text
WHERE (description LIKE '% SUMO %'
OR description LIKE "% SUMO"
OR description LIKE "SUMO %")
AND description NOT LIKE "%SUMO WRESTLER%";
-- zadanie 5 --
SELECT COUNT(*)
FROM film
WHERE description LIKE '% SUMO %'
AND title NOT LIKE "%A%"
AND film_id > length;
-- zadanie 6 --
