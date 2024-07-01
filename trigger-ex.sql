-- Przykład dodania nowego koncertu
INSERT INTO koncert (id, nazwa, data_wydarzenia, godzina, miejsce_koncertu_id)
VALUES (6666, 'Fun Lovin'' Criminals', '2024-07-06', '21:00', 1);

-- Przykład próby usunięcia klienta z aktywnymi biletami
DELETE FROM klient WHERE nr = 151511;