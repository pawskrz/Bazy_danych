-- zadanie 1 --
SELECT GROUP_CONCAT(' ',last_name ORDER BY last_name) AS "Aktorzy o dwuliterowych imionach"
FROM actor
WHERE CHAR_LENGTH(first_name)=2;

-- zadanie 2 -- Varisty trip, zaczynać się od action-packed
SELECT title, SUBSTRING(description, 2)
FROM film
WHERE description NOT LIKE '%BORING%'
ORDER BY description;

-- zadanie 3 --
SELECT customer_id, CONCAT(COUNT(customer_id) * 0.5, '$') AS 'DOPŁATA'
FROM rental
WHERE rental_date BETWEEN '2005-07-01' AND '2005-08-31 23:59:59'  AND return_date >= '2005-09-01'
GROUP BY customer_id;

-- zadanie 4 --
SELECT city_id, GROUP_CONCAT(district ORDER BY district SEPARATOR ' oraz ') AS 'dystrykty'
FROM address
GROUP BY city_id HAVING COUNT(DISTINCT district) > 1
ORDER BY city_id DESC;

-- zadanie 5 --
SELECT amount, staff_id, SUM(amount) AS 'zarobek'
FROM payment
GROUP BY amount, staff_id
ORDER BY zarobek DESC;

-- zadanie 6 --
SELECT EXTRACT(DAY_HOUR FROM MAX(TIMEDIFF(return_date, rental_date))) AS 'najdłużej',
EXTRACT(DAY_HOUR FROM MIN(TIMEDIFF(return_date, rental_date))) AS 'najkrócej'
FROM rental
WHERE return_date IS NOT NULL;

-- zadanie 7 --
SELECT customer_id, EXTRACT(DAY_SECOND FROM SEC_TO_TIME(AVG(TIMESTAMPDIFF(SECOND, rental_date, return_date))))
FROM rental
WHERE return_date IS NOT NULL
GROUP BY customer_id
ORDER BY AVG(TIMEDIFF(return_date, rental_date)) DESC
LIMIT 1;

-- zadanie 8 --
SELECT customer_id, 
CONCAT(ROUND(SUM(TIMESTAMPDIFF(SECOND, rental_date, return_date))/86400), " dni ",
ROUND((SUM(TIMESTAMPDIFF(SECOND, rental_date, return_date))/86400)%ROUND((SUM(TIMESTAMPDIFF(SECOND, rental_date, return_date))/86400))*24), " godziny ")
FROM rental
GROUP BY customer_id
ORDER BY SUM(TIMEDIFF(return_date, rental_date)) DESC
LIMIT 1;