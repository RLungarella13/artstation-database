--RECENSIONE_MULTIMEDIALE
--trigger_function
CREATE 
OR REPLACE FUNCTION controllo_recensione_multimediale() RETURNS trigger AS $$ DECLARE num_artwork INTEGER;
num_medium INTEGER;
num_tipologia INTEGER;
num_tag INTEGER;
BEGIN 
SELECT 
  COUNT(*) INTO num_artwork 
FROM 
  artwork a 
WHERE 
  a.recensione_multimediale = NEW.id_recensione_multimediale;
SELECT 
  COUNT(*) INTO num_medium 
FROM 
  realizzazione r 
WHERE 
  r.recensione_multimediale = NEW.id_recensione_multimediale;
SELECT 
  COUNT(*) INTO num_tipologia 
FROM 
  contenuto c 
WHERE 
  c.recensione_multimediale = NEW.id_recensione_multimediale;
SELECT 
  COUNT(*) INTO num_tag 
FROM 
  tag_recensione tr 
WHERE 
  tr.recensione_multimediale = NEW.id_recensione_multimediale;
IF (num_artwork = 0) THEN RAISE EXCEPTION 'Impossibile inserire una recensione senza artwork';
END IF;
IF (num_medium = 0) THEN RAISE EXCEPTION 'Impossibile inserire una recensione senza specificare un medium';
END IF;
IF (num_tipologia = 0) THEN RAISE EXCEPTION 'Impossibile inserire una recensione senza specificare una tipologia';
END IF;
IF (num_artwork > 10) THEN RAISE EXCEPTION 'Impossibile inserire più di dieci artwork';
END IF;
IF (num_medium > 3) THEN RAISE EXCEPTION 'Impossibile inserire più di tre medium';
END IF;
IF (num_tipologia > 3) THEN RAISE EXCEPTION 'Impossibile inserire più di tre tipologie';
END IF;
IF (num_tag > 20) THEN RAISE EXCEPTION 'Impossibile inserire più di 20 tag';
END IF;
RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;
CREATE CONSTRAINT TRIGGER recensione_valida 
AFTER 
  INSERT ON recensione_multimediale DEFERRABLE INITIALLY DEFERRED 
  FOR EACH ROW EXECUTE PROCEDURE controllo_recensione_multimediale();

---------------------------------------------------------------
--MI_PIACE_COMMENTO
--trigger_function
CREATE 
OR REPLACE FUNCTION aggiungi_mi_piace_commento() RETURNS trigger AS $$ BEGIN 
UPDATE 
  commento 
SET 
  numero_mi_piace = numero_mi_piace + 1 
WHERE 
  id_commento = NEW.commento;
RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;
--trigger
CREATE TRIGGER aggiungi_commento 
AFTER 
  INSERT ON mi_piace_commento FOR EACH ROW EXECUTE PROCEDURE aggiungi_mi_piace_commento();

------------------------------------------------------------
--trigger_function
CREATE 
OR REPLACE FUNCTION elimina_mi_piace_commento() RETURNS trigger AS $$ BEGIN 
UPDATE 
  commento 
SET 
  numero_mi_piace = numero_mi_piace - 1 
WHERE 
  id_commento = OLD.commento;
RETURN OLD;
END;
$$ LANGUAGE PLPGSQL;
--trigger
CREATE TRIGGER elimina_mi_piace_commento 
AFTER 
  DELETE ON mi_piace_commento FOR EACH ROW EXECUTE PROCEDURE elimina_mi_piace_commento();

------------------------------------------------------------
--MI_PIACE_RECENSIONE
--trigger_function
CREATE 
OR REPLACE FUNCTION aggiungi_mi_piace_recensione() RETURNS trigger AS $$ BEGIN 
UPDATE 
  recensione_multimediale 
SET 
  numero_mi_piace = numero_mi_piace + 1 
WHERE 
  id_recensione_multimediale = NEW.recensione_multimediale;
RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;
--trigger
CREATE TRIGGER aggiungi_mi_piace_recensione 
AFTER 
  INSERT ON mi_piace_recensione FOR EACH ROW EXECUTE PROCEDURE aggiungi_mi_piace_recensione();


------------------------------------------------------------
--trigger_function
CREATE 
OR REPLACE FUNCTION elimina_mi_piace_recensione() RETURNS trigger AS $$ BEGIN 
UPDATE 
  recensione_multimediale 
SET 
  numero_mi_piace = numero_mi_piace - 1 
WHERE 
  id_recensione_multimediale = OLD.recensione_multimediale;
RETURN OLD;
END;
$$ LANGUAGE PLPGSQL;
--trigger
CREATE TRIGGER elimina_mi_piace_recensione 
AFTER 
  DELETE ON mi_piace_recensione FOR EACH ROW EXECUTE PROCEDURE elimina_mi_piace_recensione();

----------------------------------------------------------------------
--MI_PIACE_STUDIO
--trigger-function
CREATE OR REPLACE FUNCTION aggiorna_numero_mi_piace_studio()
RETURNS TRIGGER AS $$
DECLARE 
    studio_pubblicazione VARCHAR(30);
BEGIN
    SELECT i.studio INTO studio_pubblicazione 
    FROM recensione_multimediale r
    JOIN impiego i ON i.artista = r.artista
    JOIN studio s ON s.codice_fiscale_azienda = i.studio
    WHERE
        CASE
            WHEN i.data_fine IS NULL THEN r.data_pubblicazione > i.data_inizio AND r.opera_personale = 'f'
            WHEN i.data_fine IS NOT NULL THEN r.data_pubblicazione > i.data_inizio AND r.data_pubblicazione < i.data_fine AND r.opera_personale = 'f'
        END
        AND r.id_recensione_multimediale = NEW.id_recensione_multimediale;
    
    IF studio_pubblicazione IS NOT NULL THEN
        UPDATE studio
        SET numero_mi_piace = (
            SELECT SUM(r.numero_mi_piace)
            FROM recensione_multimediale r
            JOIN impiego i ON i.artista = r.artista
            JOIN studio s ON s.codice_fiscale_azienda = i.studio
            WHERE
                CASE
                    WHEN i.data_fine IS NULL THEN r.data_pubblicazione > i.data_inizio AND r.opera_personale = 'f'
                    WHEN i.data_fine IS NOT NULL THEN r.data_pubblicazione > i.data_inizio AND r.data_pubblicazione < i.data_fine AND r.opera_personale = 'f'
                END
                AND s.codice_fiscale_azienda = studio_pubblicazione
            GROUP BY s.codice_fiscale_azienda
        )
        WHERE codice_fiscale_azienda = studio_pubblicazione;
    END IF;
    
    RETURN NULL;
END;
$$ LANGUAGE PLPGSQL;

--trigger
CREATE CONSTRAINT TRIGGER aggiorna_numero_mi_piace_studio
AFTER UPDATE OF numero_mi_piace
ON recensione_multimediale
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE PROCEDURE aggiorna_numero_mi_piace_studio();
----------------------------------------------------------------------
--COMMENTO
--trigger-function
CREATE OR REPLACE FUNCTION controlla_risposta()
    RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.risposta IS NOT NULL THEN
        IF (SELECT risposta FROM commento WHERE id_commento = NEW.risposta) IS NOT NULL THEN
            RAISE EXCEPTION 'Non puoi inserire una risposta ad una risposta id_commento=%', NEW.id_commento;
        END IF;
		IF (SELECT recensione_multimediale FROM commento WHERE id_commento = NEW.risposta) <> NEW.recensione_multimediale THEN
			RAISE EXCEPTION 'La recensione_multimediale della risposta non corrisponde alla recensione_multimediale del commento principale con id_commento=%', NEW.id_commento;
    	END IF;
	END IF;
    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;
-- trigger
CREATE TRIGGER controlla_risposta 
AFTER INSERT OR UPDATE ON commento
FOR EACH ROW
EXECUTE PROCEDURE controlla_risposta();

-----------------------------------------------------------------------
--OPERA_PERSONALE
-- trigger function
CREATE OR REPLACE FUNCTION controllo_opera_personale()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.opera_personale = 'f' THEN
        IF NOT EXISTS (
            SELECT *
            FROM studio s
            JOIN impiego i ON s.codice_fiscale_azienda = i.studio
            WHERE i.artista = NEW.artista
                AND (
                    (i.data_fine IS NULL AND NEW.data_pubblicazione > i.data_inizio)
                    OR (i.data_fine IS NOT NULL AND NEW.data_pubblicazione > i.data_inizio AND NEW.data_pubblicazione < i.data_fine)
                )
        ) THEN
            RAISE EXCEPTION 'Impossibile inserire l''opera con ID % come non personale se l''artista non è associato a uno studio nella data di pubblicazione', NEW.id_recensione_multimediale;
        END IF;
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE PLPGSQL;
CREATE CONSTRAINT TRIGGER controllo_opera_personale
AFTER INSERT OR UPDATE OF opera_personale ON recensione_multimediale
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE PROCEDURE controllo_opera_personale();

----------------------------------------------------------------------
--IMPIEGATI_STUDIO
-- trigger function
CREATE OR REPLACE FUNCTION controllo_impiegati_studio() 
RETURNS TRIGGER AS
$$
BEGIN
	IF NOT EXISTS (
		SELECT * FROM impiego i WHERE NEW.codice_fiscale_azienda = i.studio 
	) THEN
		RAISE EXCEPTION 'Lo studio "%", con codice fiscale "%", deve avere almeno un impiegato', NEW.nome, NEW.codice_fiscale_azienda;
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE PLPGSQL;
-- trigger
CREATE CONSTRAINT TRIGGER studio_valido
AFTER INSERT ON studio
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE PROCEDURE controllo_impiegati_studio();

---------------------------------------------------------------------
--ARTISTA
-- trigger function
CREATE OR REPLACE FUNCTION controllo_artista()
RETURNS TRIGGER AS
$$
BEGIN
	IF NOT EXISTS (
		SELECT * FROM recensione_multimediale r WHERE NEW.utente = r.artista
	) THEN
		RAISE EXCEPTION 'L''artista "%" deve aver pubblicato almeno una recensione multimediale', NEW.utente;
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE PLPGSQL;
-- trigger
CREATE CONSTRAINT TRIGGER artista_valido
AFTER INSERT ON artista
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE PROCEDURE controllo_artista();

---------------------------------------------------------------------
--ARTWORK
-- trigger function
CREATE OR REPLACE FUNCTION aggiungi_numero_artwork()
RETURNS TRIGGER AS
$$
BEGIN
	NEW.numero_artwork := (
		SELECT COUNT(*) + 1
		FROM artwork
		WHERE recensione_multimediale = NEW.recensione_multimediale
	  );
	  RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;
-- trigger
CREATE TRIGGER aggiungi_numero_artwork
BEFORE INSERT ON artwork
FOR EACH ROW
EXECUTE PROCEDURE aggiungi_numero_artwork();
	