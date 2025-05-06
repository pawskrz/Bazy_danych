-- zadanie 1 --
SELECT first_name, last_name, email, address, phone
FROM staff INNER JOIN address
WHERE address.address_id = staff.address_id;

-- zadanie 2 --
SELECT city, country
FROM city INNER JOIN country
WHERE city.country_id = country.country_id;

-- zadanie 3 --
SELECT address, city, country
FROM address INNER JOIN city INNER JOIN country
WHERE address.city_id = city.city_id AND city.country_id = country.country_id;

-- zadanie 4 --
SELECT first_name, last_name, email, address, phone, city, country
FROM address INNER JOIN city INNER JOIN country INNER JOIN staff
WHERE address.address_id = staff.address_id AND address.city_id = city.city_id AND city.country_id = country.country_id;

-- zadanie 5 --
SELECT store_id, staff_id, COUNT(rental_id)
FROM rental INNER JOIN inventory
WHERE rental.inventory_id = inventory.inventory_id
GROUP BY store_id, staff_id;

-- zadanie 6 --
SELECT first_name, last_name, GROUP_CONCAT(title)
FROM actor INNER JOIN film INNER JOIN film_actor
WHERE actor.actor_id = film_actor.actor_id AND film.film_id = film_actor.film_id
GROUP BY actor.actor_id;

-- zadanie 7 --
SELECT GROUP_CONCAT(first_name), GROUP_CONCAT(last_name), title
FROM actor INNER JOIN film INNER JOIN film_actor
WHERE actor.actor_id = film_actor.actor_id AND film.film_id = film_actor.film_id AND film.title LIKE "%BLOOD%"
GROUP BY film.title;

-- zadanie 8 --
SELECT customer.first_name, customer.last_name, customer.email, phone, address, city, country, staff.first_name, staff.last_name
FROM customer INNER JOIN address INNER JOIN city INNER JOIN country INNER JOIN staff
WHERE customer.first_name = "CAROLYN" AND customer.last_name = "PEREZ" AND address.address_id = customer.address_id
AND  address.city_id = city.city_id AND city.country_id = country.country_id AND customer.store_id = staff.store_id;