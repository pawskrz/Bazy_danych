-- zadanie 1 --
CREATE OR REPLACE TEMPORARY TABLE actor_275924(
    actor_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    last_update TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP);

INSERT INTO actor_275924(first_name, last_name)
SELECT first_name, last_name
FROM sakila.actor;

-- zadanie 2 --
CREATE OR REPLACE TEMPORARY TABLE film_275924 AS
    SELECT *
    FROM sakila.film;

CREATE OR REPLACE TEMPORARY TABLE film_actor_275924 AS
    SELECT *
    FROM sakila.film_actor;

CREATE OR REPLACE TEMPORARY TABLE category_275924 AS
    SELECT *
    FROM sakila.category;

CREATE OR REPLACE TEMPORARY TABLE film_category_275924 AS
    SELECT *
    FROM sakila.film_category;

CREATE OR REPLACE TEMPORARY TABLE customer_275924 AS
    SELECT *
    FROM sakila.customer;

-- zadanie 3 --
INSERT into actor_275924 (first_name, last_name) VALUES
    ("TOM", "CRUISE"),
    ("BRAD", "PITT");

-- zadanie 4 --
CREATE OR REPLACE TEMPORARY TABLE fav_film_fans_275924(
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL);

INSERT INTO fav_film_fans_275924(first_name, last_name)
SELECT sakila.customer.first_name, sakila.customer.last_name
FROM sakila.customer INNER JOIN sakila.inventory INNER JOIN sakila.rental
ON customer.customer_id = rental.customer_id AND rental.inventory_id = inventory.inventory_id AND inventory.film_id=19;

-- zadanie 5 --
CREATE OR REPLACE TEMPORARY TABLE fav_film_fans_275924(
    film_fan_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL);

-- zadanie 6 --
UPDATE actor_275924 SET
    last_name = (SELECT last_name FROM actor_275924 WHERE actor_id = 25)
WHERE first_name = "Sandra" AND last_name = "Kilmer";

-- zadanie 7 --
ALTER TABLE actor_275924
ADD `played in 19` INT UNSIGNED NOT NULL DEFAULT 0;

UPDATE actor_275924
SET `played in 19` = 1
WHERE actor_id IN (SELECT actor_id FROM sakila.film_actor WHERE film_id = 19);

-- zadanie 8 --
CREATE OR REPLACE TEMPORARY TABLE rental_valentine_275924 AS
    SELECT *
    FROM sakila.rental
    WHERE rental_date LIKE '%2006-02-14%';

UPDATE rental_valentine_275924
SET return_date = CURRENT_TIMESTAMP
WHERE inventory_id IN 
    (SELECT rental.inventory_id FROM sakila.rental INNER JOIN sakila.inventory INNER JOIN sakila.film
    ON rental.inventory_id = inventory.inventory_id AND inventory.film_id = film.film_id AND film.title = "CREATURES SHAKESPEARE");

-- zadanie 9 --
UPDATE film_275924
SET rental_rate = ROUND(rental_rate*1.2, 1) -0.01;

-- zadanie 10 --
UPDATE customer_275924
SET active = 0
WHERE customer_id NOT IN (SELECT customer_id FROM sakila.rental WHERE rental_date LIKE "2006-02-14");

-- zadanie 11 --
DELETE FROM actor_275924 WHERE first_name = "BRAD" AND last_name = "PITT";

-- zadanie 12 --
DELETE FROM film_275924 WHERE film_id IN
    (SELECT film_275924.film_id FROM film_275924 INNER JOIN category_275924 INNER JOIN film_category_275924
    ON film_275924.film_id = film_category_275924.film_id AND film_category_275924.category_id = category_275924.category_id AND category_275924.name LIKE "DRAMA"
);

-- zadanie 13 --
DELETE FROM actor_275924
WHERE actor_id NOT IN (SELECT actor_id FROM film_actor_275924);

-- zdanie 14 --

DELETE FROM actor_275924
WHERE SUBSTR(first_name, 1,1) = SUBSTR(last_name, 1, 1);

DELETE FROM film_actor_275924
WHERE actor_id NOT IN (SELECT actor_id FROM actor_275924);