INSERT INTO miejsce_koncertu (id, miasto, nazwa_obiektu) VALUES
(1, 'Poznań', 'Aula Uniwersytetu im. Adama Mickiewicza'),
(2, 'Gdańsk', 'B90'),
(3, 'Warszawa', 'Progresja'),
(4, 'Katowice', 'Katowicki Park Leśny'),
(5, 'Kołobrzeg', 'Lotnisko Kołobrzeg Podczele');

INSERT INTO miejsce_zamieszkania (nazwa_miasta) VALUES ('Gdańsk'), ('Warszawa'), ('Poznań'), ('Kraków'), ('Wrocław');

INSERT INTO koncert (id, nazwa, data_wydarzenia, godzina, miejsce_koncertu_id) VALUES
(1111, 'TV Girl and the Traveling All-Star Band', '2024-08-26', '20:00', 3),
(2222, 'ABBA i INNI Symfonicznie', '2024-10-14', '19:00', 1),
(3333, 'MYSLOVITZ FESTIVAL - 25 lat MIŁOŚCI W CZASACH POPKULTURY', '2024-11-30', '20:30', 2),
(4444, 'SBM FFestival 2024', '2024-08-29', '15:00', 3),
(5555, 'Max & Iggor Cavalera', '2024-06-22', '18:00', 2);

INSERT INTO klient (nr, imie, nazwisko, email, miasto) VALUES
(121211, 'Oliwia', 'Zając', 'olizajac88@gmail.com', 'Poznań'),
(131311, 'Konrad', 'Kowalik', 'konradkowal019249@wp.pl', 'Poznań'),
(141411, 'Natalia', 'Brzęczek', 'brzeczek.nati@outlook.com', 'Gdańsk'),
(151511, 'Helena', 'Woźniak', 'helena.w8@gmail.com', 'Warszawa'),
(161611, 'Adrian', 'Woźniak', 'adrian.wozniak@o2.pl', 'Kraków');

INSERT INTO bilet (id, cena, data_sprzedazy, typ, koncert_id, klient_nr) VALUES
(119374, 479.99, '2024-04-26', 'VIP', 1111, 141411),
(637281, 85.35, '2024-08-03', 'ULGOWY', 3333, 131311),
(928364, 147.00, '2024-05-13', 'NORMALNY', 2222, 121211),
(254873, 145.69, '2024-05-28', 'ULGOWY', 1111, 131311),
(715282, 479.99, '2024-05-29', 'NORMALNY', 4444, 151511);

INSERT INTO przychod (id, opis, kwota, koncert_id) VALUES
(9991, 'Bilety', 132453.87, 3333),
(8882, 'Bilety', 73475.00, 1111),
(7773, 'Merch', 18675.50, 1111),
(6664, 'Gastro', 44891.43, 2222),
(5555, 'Merch', 5887.95, 2222),
(4446, NULL, 9928.88, 4444);

INSERT INTO artysta (id, imie, nazwisko, miasto) VALUES
(121, 'Michajlo', 'Dimow', 'Kraków'),
(232, 'Artur', 'Rojek', 'Gdańsk'),
(343, 'Brad', 'Petering', 'Poznań'),
(454, 'Young', 'Leosia', 'Warszawa'),
(565, 'Young', 'Igi', 'Gdańsk');

INSERT INTO zastepstwo (id, imie, nazwisko, data_zastepstwa, artysta_id) VALUES
(565, 'Diana', 'Chorna', '2024-10-14', 121),
(676, 'Wojciech', 'Powaga', '2024-11-30', 232),
(787, 'Jason', 'Wyman', '2024-08-26', 343);

INSERT INTO rodzaj_muzyki (nazwa) VALUES ('Indie'), ('Pop'), ('Rock'), ('House'), ('Hip-hop');

INSERT INTO koncert_artysta (koncert_id, artysta_id) VALUES
(2222, 121),
(3333, 121),
(3333, 232),
(1111, 343),
(5555, 565);

INSERT INTO artysta_rodzaj_muzyki (artysta_id, rodzaj_muzyki_nazwa) VALUES
(121, 'Pop'),
(232, 'Rock'),
(343, 'Indie'),
(343, 'Rock'),
(454, 'Hip-hop');