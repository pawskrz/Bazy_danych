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
    WHERE film_id = 182)
AND return_date IS NOT NULL;

SELECT DISTINCT store_id
FROM inventory
WHERE inventory_id IN(
    SELECT inventory_id
    FROM rental
    WHERE inventory_id IN(
        SELECT inventory_id
        FROM inventory
        WHERE film_id = 182)
    AND return_date IS NOT NULL
);

-- zadanie 11 --
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM rental
    WHERE inventory_id IN(
        SELECT inventory_id
        FROM inventory
        WHERE film_id = 182)
    AND return_date IS NOT NULL);

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM rental
    WHERE inventory_id IN(
        SELECT inventory_id
        FROM inventory
        WHERE film_id = 182)
    AND return_date IS NULL);

-- zadanie 12 --

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM rental
    WHERE inventory_id IN(
        SELECT inventory_id
        FROM inventory
        WHERE film_id = 182)
    AND return_date IS NOT NULL)
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
            WHERE film_id = 182)
        AND return_date IS NOT NULL)
    AND active =1);

-- zadanie 14 --
SELECT actor_id, COUNT(film_id) AS licz
FROM film_actor
GROUP BY actor_id HAVING actor_id IN(
    SELECT actor_id
    FROM actor
    WHERE first_name LIKE '%PENELOPE%')
ORDER BY licz DESC
LIMIT 1;

SELECT last_name
FROM actor
WHERE actor_id = 104;

-- zadanie 15 --

SELECT staff_id, SUM(amount)
FROM payment
GROUP BY staff_id
ORDER BY SUM(amount) DESC
LIMIT 1;

-- zadanie 16 --

SELECT staff_id, SUM(amount)
FROM payment
WHERE payment_date BETWEEN '2005-07-01' AND '2005-08-31'
GROUP BY staff_id
ORDER BY SUM(amount) DESC
LIMIT 1;

-- zadanie 17 --

SELECT COUNT(DISTINCT email)
FROM customer
WHERE email NOT LIKE '%sakilacustomer.org%';

-- zadanie 18 --

SELECT COUNT(customer_id), store_id
FROM customer
WHERE active=1
GROUP BY store_id;

-- zadanie 19 --

SELECT COUNT(rental_date)- COUNT(return_date) AS ile, staff_id
FROM rental
GROUP BY staff_id;

-- zadanie 20 --

SELECT customer_id, rental_date
FROM rental
WHERE return_date IS NULL
ORDER BY rental_date ASC
LIMIT 1;

SELECT phone
FROM address
WHERE address_id IN(
    SELECT address_id
    FROM customer
    WHERE customer_id = 554
);

SELECT staff_id
FROM rental;