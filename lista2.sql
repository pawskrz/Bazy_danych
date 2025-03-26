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
SELECT description, title, film_id
FROM film
WHERE ((description LIKE '% dog %'
OR description LIKE '% dog'
OR description LIKE 'dog %')
AND (title LIKE '% wolves %'
or title LIKE '% wolves'
or title LIKE 'wolves %'));

SELECT actor_id
FROM film_actor
WHERE film_id LIKE '%316%';

SELECT first_name, last_name
FROM actor
WHERE (actor_id LIKE '5'
OR actor_id LIKE '58'
OR actor_id LIKE '82'
OR actor_id LIKE '117'
OR actor_id LIKE '143');

-- zadanie 7 --
SELECT phone
FROM address
ORDER BY phone;

SELECT phone
FROM address
ORDER BY phone DESC
LIMIT 1;

-- zadanie 8 --
SELECT title
FROM film
WHERE film_id IN(
    SELECT film_id
    FROM film_category
    WHERE category_id <= 12
    AND film_id IN(
        SELECT film_id
        FROM film
        WHERE((description LIKE '% dog %'
        OR description LIKE '% dog'
        OR description LIKE 'dog %')
        OR (description LIKE '% dogs %'
        OR description LIKE '% dogs'
        OR description LIKE 'dogs %')
        OR (description LIKE '% cat %'
        OR description LIKE '% cat'
        OR description LIKE 'cat %')
        OR(description LIKE '% cats %'
        OR description LIKE '% cats'
        OR description LIKE 'cats %'))));

-- zadanie 9 --
SELECT title, film_id
FROM film
WHERE film_id IN(
    SELECT film_id
    FROM film_category
    WHERE category_id <= 12
    AND film_id IN(
        SELECT film_id
        FROM film
        WHERE((description LIKE '% dog %'
        OR description LIKE '% dog'
        OR description LIKE 'dog %')
        OR (description LIKE '% dogs %'
        OR description LIKE '% dogs'
        OR description LIKE 'dogs %')
        OR (description LIKE '% cat %'
        OR description LIKE '% cat'
        OR description LIKE 'cat %')
        OR(description LIKE '% cats %'
        OR description LIKE '% cats'
        OR description LIKE 'cats %'))))
AND special_features NOT LIKE '%deleted scenes%'
ORDER BY length DESC
LIMIT 1;

-- zadanie 10 --
SELECT COUNT(*)
FROM rental
WHERE inventory_id IN(
    SELECT inventory_id
    FROM inventory
    WHERE film_id = 182);

SELECT DISTINCT store_id
FROM inventory
WHERE film_id = 182;

-- zadanie 11 --
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM rental
    WHERE inventory_id IN(
        SELECT inventory_id
        FROM inventory
        WHERE film_id = 182));

-- zadanie 12 --

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM rental
    WHERE inventory_id IN(
        SELECT inventory_id
        FROM inventory
        WHERE film_id = 182))
AND active =1;

-- zadanie 13 -- 
SELECT phone
FROM address
WHERE address_id IN(
    SELECT address_id
    FROM customer
    WHERE customer_id IN(
        SELECT customer_id
        FROM rental
        WHERE inventory_id IN(
            SELECT inventory_id
            FROM inventory
            WHERE film_id = 182))
    AND active =1);

-- zadanie 14 --
SELECT actor_id
FROM actor
WHERE first_name LIKE '%PENELOPE%';

SELECT COUNT(*)
FROM film_actor
WHERE actor_id =1;

SELECT COUNT(*)
FROM film_actor
WHERE actor_id =54;

SELECT COUNT(*)
FROM film_actor
WHERE actor_id =104 ;

SELECT COUNT(*)
FROM film_actor
WHERE actor_id =120;

SELECT first_name
FROM actor
WHERE actor_id = 104;

-- zadanie 15 --

SELECT *
FROM payment
