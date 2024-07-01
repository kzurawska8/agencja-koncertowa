-- Sprawdzenie numerów biletów Klientów.
SELECT imie, nazwisko, email, bilet.id AS bilet_id 
    FROM klient, bilet
    WHERE klient.nr = bilet.klient_nr
    ORDER BY nazwisko
;

SELECT imie, nazwisko, email, bilet.id AS bilet_id 
    FROM klient INNER JOIN bilet
    ON klient.nr = bilet.klient_nr
    ORDER BY nazwisko
;

-- Sprawdzenie którzy Klienci zakupili bilet/bilety.
SELECT DISTINCT imie, nazwisko
    FROM klient, bilet
    WHERE klient.nr = bilet.klient_nr
    ORDER BY nazwisko
;

SELECT DISTINCT imie, nazwisko
    FROM klient INNER JOIN bilet
    ON klient.nr = bilet.klient_nr
    ORDER BY nazwisko
;

-- Sprawdzenie czy powtarza się nazwisko u Klientów, wypisanie u których.
SELECT nazwisko FROM klient GROUP BY nazwisko HAVING COUNT(nazwisko) > 1
;

SELECT imie, nazwisko, miasto FROM klient 
    WHERE nazwisko IN (
        SELECT nazwisko FROM klient 
        GROUP BY nazwisko HAVING COUNT(nazwisko) > 1
        )
;

-- Sprawdzenie czy ceny biletów powtarzają się, wypisanie ich id, ceny, typu oraz id koncertu którego dotyczy, dodanie nazwy tego koncertu.
SELECT cena FROM bilet GROUP BY cena HAVING COUNT(cena) > 1;

SELECT bilet.id, cena, typ, koncert.id AS koncert_id, 
koncert.nazwa AS koncert_nazwa
    FROM bilet INNER JOIN koncert
    ON bilet.koncert_id = koncert.id
    WHERE cena IN (
        SELECT cena FROM bilet
        GROUP BY cena HAVING COUNT(cena) > 1
        )
    ORDER BY bilet.id, cena
;

-- Sprawdzenie ile dni przed datą koncertu został zakupiony bilet przez Klienta.
SELECT imie, nazwisko, koncert.nazwa, koncert.data_wydarzenia AS data_koncertu,
bilet.data_sprzedazy AS data_zakupu,
koncert.data_wydarzenia - bilet.data_sprzedazy AS ilość_dni
    FROM klient INNER JOIN bilet
    ON klient.nr = bilet.klient_nr
        INNER JOIN koncert 
        ON bilet.koncert_id = koncert.id
    ORDER BY ilość_dni
;

-- Użycie widoku (perspektywy, VIEW) dla powyższego zapytania.
CREATE VIEW ClientsDetailsWithDaysBeforeConcert AS
SELECT imie, nazwisko, koncert.nazwa, koncert.data_wydarzenia AS data_koncertu,
bilet.data_sprzedazy AS data_zakupu,
koncert.data_wydarzenia - bilet.data_sprzedazy AS ilość_dni
    FROM klient INNER JOIN bilet
    ON klient.nr = bilet.klient_nr
        INNER JOIN koncert 
        ON bilet.koncert_id = koncert.id
    ORDER BY ilość_dni
;

SELECT * FROM ClientsDetailsWithDaysBeforeConcert;

-- Wypisanie koncertów w których nazwie pojawia się słowo "festival".
SELECT * FROM koncert WHERE LOWER(nazwa) LIKE '%festival%';

-- Sprawdzenie, którzy Klienci nie zakupili żadnego biletu.
SELECT * FROM klient 
    WHERE NOT EXISTS (
        SELECT * FROM bilet WHERE klient.nr = bilet.klient_nr
        )      
;

-- Sprawdzenie w których miastach z bazy nie zamieszkuje żaden Klient.
SELECT nazwa_miasta FROM miejsce_zamieszkania
    LEFT JOIN klient
    ON miejsce_zamieszkania.nazwa_miasta = klient.miasto
        WHERE klient.nr IS NULL
;

-- Sprawdzenie id i kwoty przychodów, które nie posiadają opisu.
SELECT id, kwota FROM przychod WHERE opis IS NULL;

-- Przychodom nie posiadającym opisu zostanie dodany opis 'brak opisu'. 
UPDATE przychod SET opis = 'Brak opisu'
  WHERE opis IS NULL;

-- Usunięcie koncertów na, które nie został zakupiony żaden bilet.
DELETE FROM koncert_artysta
    WHERE koncert_id NOT IN (
        SELECT koncert_id FROM bilet
    )
;

DELETE FROM koncert 
    WHERE id NOT IN (
        SELECT koncert_id FROM bilet
    )
;