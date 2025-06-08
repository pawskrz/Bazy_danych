CREATE OR REPLACE TABLE pracownicy(
    id INT AUTO_INCREMENT PRIMARY KEY,
    imię VARCHAR(55) NOT NULL,
    nazwisko VARCHAR(55) NOT NULL,
    dochód DECIMAL);

INSERT INTO pracownicy(imię, nazwisko, dochód) VALUES
    ("Ambroży", "Kleks", 1),
    ("Adam", "Niezgódka", 5000),
    ("Anna", "Zgódka", 4666),
    ("Yżorbma", "Skelk", 7000);

SELECT * FROM pracownicy;

SET GLOBAL event_scheduler = ON;

CREATE EVENT IF NOT EXISTS premia
    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 SECOND
    DO
        UPDATE pracownicy SET dochód = dochód +1;

CREATE EVENT IF NOT EXISTS redukcja
    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 SECOND
    DO
        DELETE FROM pracownicy WHERE id = 1;

SHOW EVENTS;

CREATE OR REPLACE TABLE redukcja(liczba INT);
INSERT INTO redukcja VALUES(0);

CREATE TRIGGER IF NOT EXISTS licz_redukcje
    AFTER DELETE ON pracownicy FOR EACH ROW
       UPDATE redukcja SET liczba = liczba +1;

SELECT * FROM redukcja;

CREATE OR REPLACE TABLE protest(slogan VARCHAR(55));

CREATE TRIGGER IF NOT EXISTS stop_redukcji
    AFTER DELETE ON pracownicy FOR EACH ROW
    INSERT INTO protest VALUES("STOP REDUKCJI");

SELECT * FROM protest;
SHOW TRIGGERS;