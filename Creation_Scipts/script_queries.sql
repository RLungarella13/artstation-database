----------------------------------- VISTE ---------------------------------------
CREATE OR REPLACE VIEW recensione_studio AS (
  SELECT 
    r.id_recensione_multimediale, 
    r.titolo, 
    r.descrizione, 
    r.artista, 
    s.nome as "studio_di_pubblicazione", 
    s.codice_fiscale_azienda as "codice_fiscale_studio", 
    r.data_pubblicazione, 
    r.numero_mi_piace, 
    r.numero_visualizzazioni 
  FROM 
    recensione_multimediale r 
    JOIN impiego i ON i.artista = r.artista 
    JOIN studio s ON s.codice_fiscale_azienda = i.studio 
  WHERE 
    CASE WHEN i.data_fine IS NULL THEN r.data_pubblicazione > i.data_inizio 
    AND r.opera_personale = 'f' WHEN i.data_fine IS NOT NULL THEN r.data_pubblicazione > i.data_inizio 
    AND r.data_pubblicazione < i.data_fine 
    AND r.opera_personale = 'f' END
);

-----------------------
CREATE OR REPLACE VIEW stato_studio AS 
SELECT 
  s.codice_fiscale_azienda, 
  s.nome, 
  COUNT(
    CASE WHEN i.data_fine IS NULL THEN 1 END
  ) AS "#dipendenti_presenti", 
  COUNT(
    CASE WHEN i.data_fine IS NOT NULL THEN 1 END
  ) AS "#dipendenti_passati", 
  s.numero_mi_piace AS "#numero_mi_piace", 
  SUM(rs.numero_visualizzazioni) AS "#numero_visualizzazioni", 
  COUNT(
    DISTINCT rs.id_recensione_multimediale
  ) 
FROM 
  studio AS s 
  JOIN impiego AS i ON i.studio = s.codice_fiscale_azienda 
  LEFT JOIN recensione_studio AS rs ON rs.codice_fiscale_studio = s.codice_fiscale_azienda 
GROUP BY 
  s.codice_fiscale_azienda, 
  s.nome;
  
----------------------------------- QUERY ---------------------------------------
-- QUERY CON VISTA
-- Questa query, basata sulla vista recensione_studio, restituisce l'artista più produttivo all'interno di uno studio specifico. 
-- Identifica l'impiegato che ha pubblicato il maggior numero di opere sulla piattaforma, fornendo anche il nome dello studio associato 
-- a tali pubblicazioni e il conteggio esatto delle opere pubblicate.

SELECT 
  studio_di_pubblicazione, 
  artista AS "impiegato_più_produttivo", 
  COUNT(
    DISTINCT id_recensione_multimediale
  ) AS "numero_di_opere_pubblicate" 
FROM 
  recensione_studio 
GROUP BY 
  studio_di_pubblicazione, 
  artista 
HAVING 
  COUNT(
    DISTINCT id_recensione_multimediale
  ) = (
    SELECT 
      MAX(recensioni_pubblicate) 
    FROM 
      (
        SELECT 
          COUNT(
            DISTINCT id_recensione_multimediale
          ) AS recensioni_pubblicate 
        FROM 
          recensione_studio r 
        GROUP BY 
          artista
      ) AS numero_recensioni_per_impiegato
  );

-- La query esegue un'operazione di join tra diverse tabelle per ottenere una classifica degli impiegati correnti del mese in vari studi. 
-- La classifica viene calcolata utilizzando la media dei "Mi piace" ricevuti sulle recensioni multimediali pubblicate sotto ciascuno studio
-- , la media dei "Mi piace" ricevuti dai commenti su tali recensioni e la media delle visualizzazioni delle recensioni stesse.

SELECT 
  rm.artista, 
  u.nome, 
  u.cognome, 
  u.data_di_nascita as "data di nascita", 
  s.nome "studio", 
  Round(
    Avg(rm.numero_mi_piace),2
  ) AS avg_mipiacerecensione, 
  Round(
    Avg(c.numero_mi_piace),2
  ) AS avg_mipiacecommenti, 
  Round(
    Avg(numero_visualizzazioni),2
  ) AS avg_visualizzazionerecensione 
FROM 
  recensione_multimediale AS rm 
  JOIN commento c ON rm.id_recensione_multimediale = c.recensione_multimediale 
  AND risposta IS NULL 
  JOIN utente AS u ON u.username = rm.artista 
  JOIN impiego AS i ON i.artista = u.username 
  JOIN studio AS s ON s.codice_fiscale_azienda = i.studio 
WHERE 
  rm.opera_personale = false 
  AND i.data_fine IS NULL 
  AND rm.data_pubblicazione <= Now() 
  AND rm.data_pubblicazione >= Now() - interval '1 year' 
  AND c.data_di_pubblicazione <= now() 
  AND c.data_di_pubblicazione >= now() - interval '1 year' 
GROUP BY 
  rm.artista, 
  s.nome, 
  u.nome, 
  u.cognome, 
  u.data_di_nascita 
ORDER BY 
  avg_visualizzazionerecensione DESC, 
  avg_mipiacerecensione DESC, 
  avg_mipiacecommenti DESC;
  
-- La query ha come scopo quello di andare a selezionare, se presenti, tutti gli artisti (insieme alle loro specializzazioni), 
-- i quali sono stati impiegati almeno una volta in tutti gli studio della piattaforma.
SELECT a.utente, a.professione AS specializzazione
FROM artista a
WHERE NOT EXISTS (
    SELECT *
    FROM studio s
    WHERE NOT EXISTS (
        SELECT *
        FROM impiego i
        WHERE i.artista = a.utente AND i.studio = s.codice_fiscale_azienda
    )
);

-- Questa query restituisce l'elenco degli artisti che dimostrano un forte interesse nelle arti tradizionali. 
-- Vengono inclusi gli artisti che hanno interagito mettendo "mi piace" sia a recensioni che a commenti relativi a contenuti multimediali tradizionali, 
-- nonché quelli che hanno pubblicato recensioni multimediali tradizionali.

SELECT 
  utente, 
  real.nome_medium 
FROM 
  mi_piace_recensione AS mpr 
  JOIN recensione_multimediale AS r ON mpr.recensione_multimediale = r.id_recensione_multimediale 
  JOIN realizzazione AS real ON real.recensione_multimediale = r.id_recensione_multimediale 
WHERE 
  real.nome_medium LIKE 'Traditional%' 
INTERSECT 
SELECT 
  utente, 
  real.nome_medium 
FROM 
  mi_piace_commento AS mpc 
  JOIN commento AS c ON c.id_commento = mpc.commento 
  JOIN recensione_multimediale AS rm ON rm.id_recensione_multimediale = c.recensione_multimediale 
  JOIN realizzazione AS real ON real.recensione_multimediale = rm.id_recensione_multimediale 
WHERE 
  real.nome_medium LIKE 'Traditional%' 
INTERSECT 
SELECT 
  r.artista, 
  real.nome_medium 
FROM 
  recensione_multimediale AS r 
  JOIN realizzazione AS real ON r.id_recensione_multimediale = real.recensione_multimediale 
WHERE 
  real.nome_medium LIKE 'Traditional%';

-- 
-- Questa query seleziona gli utenti artisti che hanno competenze specifiche in software come 'Blender' e 'Cinema 4D',
-- escludendo coloro che hanno competenze nel campo del "Game Art".

SELECT u.username, u.nome, u.cognome
FROM utente u
JOIN artista a ON u.username = a.utente
JOIN competenza c ON a.utente = c.artista
WHERE c.nome_competenza IN ('Blender', 'Cinema 4D')

INTERSECT

SELECT u.username, u.nome, u.cognome
FROM utente u 
JOIN artista a ON u.username = a.utente
JOIN esperienza e ON a.utente = e.artista
JOIN skills s ON e.nome_skill = s.nome
WHERE s.nome <> 'Game Art';
