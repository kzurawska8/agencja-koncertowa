# BAZA DANYCH AGENCJI KONCERTOWEJ

Projekt bazy danych agencji koncertowej ma na celu zarządzanie informacjami o koncertach,
artystach, klientach, biletach oraz przychodach związanych z organizacją wydarzeń muzycznych.

## Encje i ich atrybuty

```
Koncert
- Atrybuty: ID, nazwa, data wydarzenia, godzina
```
```
Miejsce koncertu
- Atrybuty: ID, miasto, nazwa obiektu
```
```
Artysta
- Atrybuty: ID, imię, nazwisko
```
```
Zastępstwo
- Atrybuty: ID, imię, nazwisko, data zastępstwa
```
```
Bilet
- Atrybuty: ID, typ, cena, data sprzedaży
```
```
Klient
- Atrybuty: nr, imię, nazwisko, e-mail
```
```
Przychód
- Atrybuty: ID, opis, kwota
```
```
Miejsce zamieszkania
- Atrybuty: nazwa miasta
```
```
Rodzaj muzyki
- Atrybuty: nazwa
```

## Przykładowe zapytania

**Jakie koncerty odbędą się w mieście "Warszawa"?**
*SELECT nazwa, data_wydarzenia, godzina
FROM koncert INNER JOIN miejsce_koncertu
ON koncert.miejsce_koncertu_id = miejsce_koncertu.id
WHERE miejsce_koncertu.miasto = 'Warszawa';*

**Jacy artyści występują na koncercie “MYSLOVITZ FESTIVAL - 25 lat MIŁOŚCI W CZASACH POPKULTURY”?**

*SELECT imie, nazwisko
FROM artysta INNER JOIN koncert_artysta
ON artysta.id = koncert_artysta.artysta_id
INNER JOIN koncert
ON koncert_artysta.koncert_id = koncert.id
WHERE koncert.nazwa = 'MYSLOVITZ FESTIVAL - 25 lat MIŁOŚCI W CZASACH
POPKULTURY';*

**Jakie koncerty odbędą się w obiekcie o nazwie "Progresja"?**
*SELECT nazwa, data_wydarzenia, godzina
FROM koncert INNER JOIN miejsce_koncertu
ON koncert.miejsce_koncertu_id = miejsce_koncertu.id
WHERE miejsce_koncertu.nazwa_obiektu = 'Progresja';*

**Ilu artystów mieszka w Warszawie**
*SELECT COUNT(*) AS liczba_artystow FROM artysta
WHERE artysta.miasto = 'Warszawa';*