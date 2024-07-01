-- Wyzwalacz przy dodaniu nowego koncertu
CREATE FUNCTION powiadomienie_nowy_koncert() 
    RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Nowy koncert dodany: %', NEW.nazwa;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER powiadomienie_nowy_koncert
    AFTER INSERT ON koncert
FOR EACH ROW EXECUTE PROCEDURE powiadomienie_nowy_koncert();

-- Wyzwalacz przy próbie usunięcia Klienta z aktywnymi biletami
CREATE FUNCTION sprawdz_aktywne_bilety()
    RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM bilet WHERE klient_nr = OLD.nr) THEN
        RAISE EXCEPTION 'Klient ma aktywne bilety.';
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_aktywne_bilety
    BEFORE DELETE ON klient
FOR EACH ROW EXECUTE PROCEDURE sprawdz_aktywne_bilety();