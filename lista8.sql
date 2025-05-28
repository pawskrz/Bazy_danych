-- zadanie 1 --
CREATE OR REPLACE TEMPORARY TABLE actor_275924(
    actor_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    last_update TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP)

INSERT INTO actor_275924(first_name, last_name)
SELECT first_name, last_name
FROM sakila.actor

-- zadanie 2 --
