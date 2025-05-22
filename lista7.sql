-- zadanie 1 --
SELECT first_name, last_name, email, address, phone
FROM staff INNER JOIN address
ON address.address_id = staff.address_id;

-- zadanie 2 --
SELECT city, country
FROM city INNER JOIN country
ON city.country_id = country.country_id;

-- zadanie 3 --
SELECT address, city, country
FROM address INNER JOIN city INNER JOIN country
ON address.city_id = city.city_id AND city.country_id = country.country_id;

-- zadanie 4 --
SELECT first_name, last_name, email, address, phone, city, country
FROM address INNER JOIN city INNER JOIN country INNER JOIN staff
ON address.address_id = staff.address_id AND address.city_id = city.city_id AND city.country_id = country.country_id;

-- zadanie 5 --
SELECT store_id, staff_id, COUNT(rental_id)
FROM rental INNER JOIN inventory
ON rental.inventory_id = inventory.inventory_id
GROUP BY store_id, staff_id;

-- zadanie 6 --
SELECT first_name, last_name, GROUP_CONCAT(title)
FROM actor INNER JOIN film INNER JOIN film_actor
ON( actor.actor_id = film_actor.actor_id AND film.film_id = film_actor.film_id)
GROUP BY actor.actor_id;

-- zadanie 7 --
SELECT GROUP_CONCAT(first_name), GROUP_CONCAT(last_name), title
FROM actor INNER JOIN film INNER JOIN film_actor
ON (actor.actor_id = film_actor.actor_id AND film.film_id = film_actor.film_id AND film.title LIKE "%BLOOD%")
GROUP BY film.title;

-- zadanie 8 --
SELECT customer.first_name, customer.last_name, customer.email, phone, address, city, country, staff.first_name, staff.last_name
FROM customer INNER JOIN address INNER JOIN city INNER JOIN country INNER JOIN staff
ON( customer.first_name = "CAROLYN" AND customer.last_name = "PEREZ" AND address.address_id = customer.address_id
AND  address.city_id = city.city_id AND city.country_id = country.country_id AND customer.store_id = staff.store_id);

-- zadanie 9 --
SELECT rental_date, title, return_date, amount, payment_date
FROM customer INNER JOIN inventory INNER JOIN film INNER JOIN rental INNER JOIN payment
ON (customer.first_name = "CAROLYN" AND customer.last_name = "PEREZ"
AND customer.customer_id = rental.customer_id AND rental.inventory_id = inventory.inventory_id
AND inventory.film_id = film.film_id AND rental.rental_id = payment.rental_id);

-- zadanie 10 --
SELECT film.film_id
FROM film INNER JOIN rental INNER JOIN inventory
ON inventory.film_id = film.film_id AND rental.inventory_id = inventory.inventory_id
WHERE film.film_id = (SELECT film.film_id
        FROM film INNER JOIN film_category
        ON film.film_id = film_category.film_id
        AND ((description LIKE '% dog %'
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
                OR description LIKE 'cats %'))
        AND category_id <= 12
        AND special_features NOT LIKE "%deleted scenes%"
        ORDER BY length DESC
        LIMIT 1)
;

-- zadanie 11 --
SELECT first_name, last_name, actor_id
FROM film_actor INNER JOIN rental INNER JOIN inventory INNER JOIN customer
ON rental.customer_id = (
        SELECT customer.customer_id
        FROM customer INNER JOIN payment
        WHERE customer.customer_id = payment.customer_id
        GROUP BY customer.customer_id
        ORDER BY SUM(amount) DESC
        LIMIT 1)
AND customer.customer_id = rental.customer_id
AND inventory.inventory_id = rental.inventory_id AND film_actor.film_id = inventory.film_id
GROUP BY actor_id
ORDER BY COUNT(film_actor.film_id) DESC
LIMIT 1;

-- zadanie 12 --
SELECT city, inventory.store_id, SUM(amount)
FROM customer INNER JOIN payment INNER JOIN address INNER JOIN inventory INNER JOIN rental INNER JOIN city
ON payment.customer_id = customer.customer_id AND address.address_id = customer.address_id
AND rental.rental_id = payment.rental_id AND inventory.inventory_id = rental.inventory_id
AND city.city_id = address.city_id
GROUP BY address.city_id, inventory.store_id
ORDER BY SUM(amount) DESC;

-- zadanie 13 --
SELECT address_id
FROM customer
WHERE active=0;