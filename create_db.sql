SET client_encoding='utf-8';

CREATE TABLE miejsce_koncertu
(
    id                      INT             PRIMARY KEY,
    miasto                  VARCHAR(50)     NOT NULL,
    nazwa_obiektu           VARCHAR(50)     NOT NULL
);

CREATE TABLE miejsce_zamieszkania
(
    nazwa_miasta            VARCHAR(50)     PRIMARY KEY
);

CREATE TABLE koncert
(
    id                      INT             PRIMARY KEY,
    nazwa                   VARCHAR(100)    NOT NULL,
    data_wydarzenia         DATE            NOT NULL,
    godzina                 TIME            NOT NULL,
    miejsce_koncertu_id     INT             NOT NULL,
    FOREIGN KEY (miejsce_koncertu_id) REFERENCES miejsce_koncertu(id)
);

CREATE TABLE klient
(
    nr                      INT             PRIMARY KEY,
    imie                    VARCHAR(50)     NOT NULL,
    nazwisko                VARCHAR(50)     NOT NULL,
    email                  VARCHAR(100)     NOT NULL,
    miasto                  VARCHAR(50)     NOT NULL,
    FOREIGN KEY (miasto) REFERENCES miejsce_zamieszkania(nazwa_miasta)
);

CREATE TABLE bilet
(
    id                      INT             PRIMARY KEY,
    cena                    DECIMAL(12,2)   NOT NULL,
    data_sprzedazy          DATE            NOT NULL,
    typ                     VARCHAR(12)     NOT NULL,
    koncert_id              INT             NOT NULL,
    klient_nr               INT             NOT NULL,
    FOREIGN KEY (koncert_id) REFERENCES koncert(id),
    FOREIGN KEY (klient_nr) REFERENCES klient(nr)
);

CREATE TABLE przychod
(
    id                      INT             PRIMARY KEY,
    opis                    VARCHAR(255),
    kwota                   DECIMAL(12,2)   NOT NULL,
    koncert_id              INT             NOT NULL,
    FOREIGN KEY (koncert_id) REFERENCES koncert(id)
);

CREATE TABLE artysta
(
    id                      INT             PRIMARY KEY,
    imie                    VARCHAR(50)     NOT NULL,
    nazwisko                VARCHAR(50)     NOT NULL,
    miasto                  VARCHAR(50)     NOT NULL,
    FOREIGN KEY (miasto) REFERENCES miejsce_zamieszkania(nazwa_miasta)
);

CREATE TABLE zastepstwo
(
    id                      INT             PRIMARY KEY,
    imie                    VARCHAR(50)     NOT NULL,
    nazwisko                VARCHAR(50)     NOT NULL,
    data_zastepstwa         DATE            NOT NULL,
    artysta_id              INT             NOT NULl        UNIQUE,
    FOREIGN KEY (artysta_id) REFERENCES artysta(id)
);

CREATE TABLE rodzaj_muzyki
(
    nazwa                   VARCHAR(50)     PRIMARY KEY
);

CREATE TABLE koncert_artysta
(
    koncert_id              INT,
    artysta_id              INT,
    PRIMARY KEY (koncert_id, artysta_id),
    FOREIGN KEY (koncert_id) REFERENCES koncert(id),
    FOREIGN KEY (artysta_id) REFERENCES artysta(id)
);

CREATE TABLE artysta_rodzaj_muzyki
(
    artysta_id              INT,
    rodzaj_muzyki_nazwa     VARCHAR(50),
    PRIMARY KEY (artysta_id, rodzaj_muzyki_nazwa),
    FOREIGN KEY (artysta_id) REFERENCES artysta(id),
    FOREIGN KEY (rodzaj_muzyki_nazwa) REFERENCES rodzaj_muzyki(nazwa)
);