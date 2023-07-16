
--------------------------------------- SCRIPT DI POPOLAMENTO DATABASE----------------------------------------------

--Popolamento della tabella utente:
INSERT INTO utente (username, email, pwd, nome, cognome, data_di_nascita, "città", nazione)
VALUES ('mario_rossi', 'mario.rossi@example.com', 'password123', 'Mario', 'Rossi', '1985-05-10', 'Roma', 'Italia'),
       ('laura_bianchi', 'laura.bianchi@example.com', 'password456', 'Laura', 'Bianchi', '1990-08-25', 'Milano', 'Italia'),
       ('giuseppe_verdi', 'giuseppe.verdi@example.com', 'password789', 'Giuseppe', 'Verdi', '1980-12-15', 'Firenze', 'Italia'),
       ('marco_martelli', 'marco.martelli@example.com', 'password123', 'Marco', 'Martelli', '2001-06-05', 'Napoli', 'Italia'),
       ('alberto_marmo', 'alberto.marmo@example.com', 'password456', 'Alberto', 'Marmo', '2001-06-05', 'Torino', 'Italia'),
       ('stefano_massera', 'stefano.massera@example.com', 'password789', 'Stefano', 'Massera', '2001-06-05', 'Bologna', 'Italia'),
       ('raffaele_lungarella', 'raffaele.lungarella@example.com', 'password123', 'Raffaele', 'Lungarella', '2001-06-05', 'Palermo', 'Italia'),
       ('francesca_ferrari', 'francesca.ferrari@example.com', 'password123', 'Francesca', 'Ferrari', '1995-09-20', 'Genova', 'Italia'),
       ('giovanni_bianco', 'giovanni.bianco@example.com', 'password456', 'Giovanni', 'Bianco', '1992-07-15', 'Verona', 'Italia'),
       ('valentina_rosso', 'valentina.rosso@example.com', 'password789', 'Valentina', 'Rosso', '1998-03-28', 'Palermo', 'Italia');


--Popolamento della tabella artista:

INSERT INTO artista (utente, professione, descrizione)
VALUES ('mario_rossi', 'Artista 2D', 'Artista inesperto in cerca di lavoro'),
       ('marco_martelli', 'Pittore', 'Artista specializzato nella pittura ad olio.'),
       ('alberto_marmo', 'Scultore', 'Scultore che lavora principalmente con il marmo.'),
       ('laura_bianchi', 'Fotografa', 'Fotografa specializzata in ritratti e paesaggi.'),
       ('stefano_massera', 'Musicista', 'Chitarrista e compositore di musica classica.'),
       ('giuseppe_verdi', 'Artista Digitale', 'Artista che utilizza principalmente strumenti digitali per la creazione artistica.'),
       ('raffaele_lungarella', 'Artista 3D', 'Artista specializzato in creazione di opere e modelli 3D');

--Popolamento della tabella skills:

INSERT INTO skills (nome)
VALUES ('Digital Art'),
       ('2D Concept Art'),
       ('3D Modeling'),
       ('Sculpting'),
       ('Texturing'),
       ('Character Design'),
       ('Environment Design'),
       ('Illustration'),
       ('Matte Painting'),
       ('Visual Effects (VFX)'),
       ('Animation'),
       ('Storyboarding'),
       ('Graphic Design'),
       ('Motion Graphics'),
       ('Game Art');

--Popolamento della tabella software:

INSERT INTO software (nome)
VALUES ('Adobe Photoshop'),
       ('Procreate'),
       ('Corel Painter'),
       ('Autodesk Sketchbook'),
       ('Autodesk Maya'),
       ('Blender'),
       ('ZBrush'),
       ('Substance Painter'),
       ('Substance Designer'),
       ('Clip Studio Paint'),
       ('Adobe Illustrator'),
       ('Adobe After Effects'),
       ('Cinema 4D'),
       ('Houdini'),
       ('Marvelous Designer'),
       ('Unity'),
       ('Unreal Engine'),
       ('Marmoset Toolbag'),
       ('KeyShot'),
       ('Quixel Suite');

--Popolamento della tabella esperienza:

INSERT INTO esperienza (nome_skill, artista)
VALUES ('Digital Art', 'mario_rossi'),
       ('2D Concept Art', 'laura_bianchi'),
       ('3D Modeling', 'giuseppe_verdi'),
       ('Sculpting', 'marco_martelli'),
       ('Texturing', 'alberto_marmo'),
       ('Character Design', 'stefano_massera'),
       ('Environment Design', 'raffaele_lungarella'),
       ('Matte Painting', 'marco_martelli'),
       ('Visual Effects (VFX)', 'stefano_massera');

--Popolamento della tabella competenza:

INSERT INTO competenza (nome_competenza, artista)
VALUES ('Adobe Photoshop', 'mario_rossi'),
       ('Procreate', 'mario_rossi'),
       ('Corel Painter', 'laura_bianchi'),
       ('Autodesk Sketchbook', 'laura_bianchi'),
       ('Autodesk Maya', 'giuseppe_verdi'),
       ('Blender', 'giuseppe_verdi'),
       ('ZBrush', 'marco_martelli'),
       ('Substance Painter', 'marco_martelli'),
       ('Substance Designer', 'alberto_marmo'),
       ('Clip Studio Paint', 'alberto_marmo'),
       ('Adobe Illustrator', 'stefano_massera'),
       ('Adobe After Effects', 'stefano_massera'),
       ('Cinema 4D', 'raffaele_lungarella'),
       ('Houdini', 'raffaele_lungarella'),
       ('Marvelous Designer', 'marco_martelli'),
       ('Unity', 'alberto_marmo'),
       ('Unreal Engine', 'stefano_massera'),
       ('Marmoset Toolbag', 'raffaele_lungarella'),
       ('KeyShot', 'marco_martelli'),
       ('Quixel Suite', 'stefano_massera');

--Popolamento della tabella recensione_multimediale:

INSERT INTO recensione_multimediale (id_recensione_multimediale, descrizione, titolo, numero_visualizzazioni, artista, data_pubblicazione, opera_personale)
VALUES
  (2, 'Un viaggio immersivo in un mondo fantastico!', 'Esplorazioni oniriche', 40, 'mario_rossi', '2023-02-15 14:45:00', 'f'),
  (3, 'Un ritratto epico che cattura l''essenza dell''avventura!', 'Eroe senza tempo', 55, 'laura_bianchi', '2023-03-20 11:20:00', 'f'),
  (4, 'Un''opera d''arte che lascia senza parole!', 'Armonia tra colori e forme', 60, 'laura_bianchi', '2023-04-25 16:10:00', 'f'),
  (5, 'Un''opera magistrale che spinge i limiti della creatività!', 'Sogni di mezzanotte', 45, 'giuseppe_verdi', '2023-04-01 13:25:00', 'f'),
  (6, 'Un universo tridimensionale che si anima davanti ai tuoi occhi!', 'Sfere di realtà', 48, 'giuseppe_verdi', '2023-05-05 10:15:00', 'f'),
  (7, 'Una creazione digitale che trasmette emozioni uniche!', 'La magia dell''immaginazione', 35, 'marco_martelli', '2023-06-05 10:15:00', 'f'),
  (8, 'Un paesaggio fantastico che ti cattura fin dal primo sguardo!', 'L''incanto della natura', 40, 'alberto_marmo', '2023-06-07 12:40:00', 'f'),
  (9, 'Un''animazione mozzafiato che ti lascerà senza fiato!', 'In volo verso l''infinito', 52, 'stefano_massera', '2023-06-07 09:55:00', 'f'),
  (10, 'Un''esperienza visiva che ti farà sognare ad occhi aperti!', 'Visioni astratte', 58, 'raffaele_lungarella', '2023-06-07 14:30:00', 't'),
  (11, 'Un''emozionante viaggio nell''arte digitale!', 'Mondi virtuali', 30, 'mario_rossi', '2022-11-07 11:45:00', 'f'),
  (12, 'Un''esplorazione tra le sfumature del colore!', 'Arte cromatica', 25, 'laura_bianchi', '2022-12-07 16:35:00', 'f'),
  (13, 'Un''opera tridimensionale che prende vita!', 'Sculpting virtuoso', 20, 'giuseppe_verdi', '2022-12-31 13:50:00', 'f'),
  (14, 'Un capolavoro di illustrazione nello stile Giapponese!', 'Uno dei miei lavori migliori', 30, 'alberto_marmo', '2023-05-10 09:30:00', 't'),
  (15, 'Un opera emozionante che cattura l anima dello spettatore!', 'Riflessioni dell anima', 30, 'laura_bianchi', '2023-06-07 16:20:00', 't'),
  (16, 'Un lavoro innovativo che rompe gli schemi tradizionali!', 'Sperimentazioni digitali', 28, 'mario_rossi', '2023-06-07 10:55:00', 't'),
  (17, 'Un opera visivamente stupefacente che mescola stili e tecniche!', 'Caleidoscopio artistico', 40, 'giuseppe_verdi', '2023-06-07 15:10:00', 't'),
  (18, 'Un viaggio nel tempo attraverso l arte e la storia!', 'Rinascita: un tributo all arte classica', 50, 'marco_martelli', '2023-06-07 11:45:00', 't'),
  (19, 'Un opera audace che sfida le convenzioni artistiche!', 'Espressione ribelle', 32, 'stefano_massera', '2023-06-07 14:15:00', 't'),
  (20, 'Un opera suggestiva che esplora le profondità dell inconscio!', 'Viaggio nell abisso', 39, 'raffaele_lungarella', '2023-06-07 09:30:00', 't'),
  (21, 'Un opera intrigante che sfida la percezione!', 'Illusioni ottiche', 45, 'mario_rossi', '2023-06-07 12:30:00', 't'),
  (22, 'Un esperienza audiovisiva avvolgente e coinvolgente!', 'Sinestesia sensoriale', 52, 'laura_bianchi', '2023-06-07 14:45:00', 't'),
  (23, 'Un opera che celebra la bellezza della natura!', 'Armonia organica', 38, 'giuseppe_verdi', '2023-06-07 17:00:00', 't'),
  (24, 'Un opera minimalista che cattura l essenza del soggetto!', 'Essenzialità', 32, 'marco_martelli', '2023-06-07 10:15:00', 'f'),
  (25, 'Un opera astratta che apre le porte all interpretazione!', 'Visioni senza confini', 35, 'alberto_marmo', '2023-06-07 11:30:00', 't'),
  (1, 'Un capolavoro di creatività e abilità artistica!', 'Il mio ultimo lavoro', 50, 'mario_rossi', '2023-01-10 09:30:00', 'f'),
  (26, 'Un''avventura epica che ti terrà incollato allo schermo!', 'Il regno perduto', 48, 'giuseppe_verdi', '2023-04-07 12:00:00', 'f'),
  (27, 'Un''esperienza immersiva che ti farà sognare ad occhi aperti!', 'Viaggi nel tempo', 52, 'giuseppe_verdi', '2023-04-07 13:15:00', 'f'),
  (28, 'Un''opera d''arte digitale che ti lascerà senza fiato!', 'L''essenza dell''immateriale', 45, 'giuseppe_verdi', '2023-04-07 14:30:00', 'f'),
  (29, 'Un''opera visivamente stupefacente che mescola stili e tecniche!', 'Esplosioni di colore', 40, 'giuseppe_verdi', '2023-04-07 15:45:00', 'f'),
  (69, 'Un capolavoro di creatività e abilità artistica!', 'Il mio ultimo lavoro', 50, 'mario_rossi', '2023-01-10 09:30:00', 't');

--Popolamento della tabella commento:

INSERT INTO commento (id_commento, testo, data_di_pubblicazione, artista, recensione_multimediale, risposta)
VALUES
(21, 'Adoro il tuo stile unico e innovativo!', '2023-05-30 00:00:00', 'mario_rossi', 3, NULL),
(20, 'Mi piace l uso audace del colore nelle tue creazioni.', '2023-06-03 00:00:00', 'alberto_marmo', 2, NULL),
(13, 'Apprezzo il tuo supporto! Continuerò a creare con passione.', '2023-05-27 00:00:00', 'marco_martelli', 12, 3),
(8, 'Mi piace il tuo stile audace.', '2023-05-22 00:00:00', 'alberto_marmo', 4, NULL),
(12, 'Sono d''accordo! L''arte è un modo meraviglioso per esprimersi.', '2023-05-26 00:00:00', 'giuseppe_verdi', 9, 2),
(6, 'Mi piace l''atmosfera che hai creato.', '2023-05-20 00:00:00', 'giuseppe_verdi', 5, NULL),
(26, 'Concordo Verdi è il degno erede di Caravaggio!', '2023-05-16 16:55:32', 'raffaele_lungarella', 5, 15),
(25, 'La tua creatività è davvero fuori dal comune!', '2023-06-04 00:00:00', 'stefano_massera', 6, NULL),
(24, 'Le tue opere sono veramente suggestive!', '2023-06-07 00:00:00', 'giuseppe_verdi', 7, NULL),
(22, 'Mi hai trasportato in un mondo fantastico con le tue opere.', '2023-06-05 00:00:00', 'raffaele_lungarella', 5, NULL),
(19, 'Hai un talento eccezionale per la rappresentazione dei dettagli.', '2023-06-02 00:00:00', 'marco_martelli', 10, NULL),
(23, 'Grazie per aver condiviso il tuo talento con il mondo!', '2023-06-06 00:00:00', 'laura_bianchi', 11, NULL),
(14, 'Il tuo lavoro è straordinario, mi lascia senza parole!', '2023-06-07 00:00:00', 'marco_martelli', 4, NULL),
(27, 'Vero i suoi tutorial sono oro!', '2023-03-16 17:30:15', 'alberto_marmo', 15, 5),
(16, 'Le tue creazioni mi ispirano a esplorare nuove forme di espressione artistica.', '2023-06-09 00:00:00', 'stefano_massera', 6, NULL),
(17, 'Sei una grande fonte di ispirazione per me.', '2023-05-31 00:00:00', 'laura_bianchi', 7, NULL),
(18, 'Le tue opere mi trasmettono emozioni profonde.', '2023-06-01 00:00:00', 'giuseppe_verdi', 8, NULL),
(15, 'Mi piace come hai usato la luce e l''ombra nelle tue opere.', '2023-06-08 00:00:00', 'alberto_marmo', 5, NULL),
(5, 'Impressionante! Mi hai ispirato a migliorare le mie abilità.', '2023-05-19 00:00:00', 'giuseppe_verdi', 15, NULL),
(4, 'Continua così! Hai un talento straordinario.', '2023-05-18 00:00:00', 'laura_bianchi', 14, NULL),
(28, 'In realtà è più comune di quanto credi', '2023-05-16 01:30:15', 'laura_bianchi', 9, 2),
(2, 'Mi piace molto il tuo stile unico.', '2023-05-16 00:00:00', 'mario_rossi', 9, NULL),
(3, 'Fantastico! Vorrei poter creare qualcosa di simile.', '2023-05-17 00:00:00', 'laura_bianchi', 12, NULL),
(10, 'Mi hai fatto viaggiare con la tua arte.', '2023-05-24 00:00:00', 'raffaele_lungarella', 23, NULL),
(7, 'Hai un talento unico! Non vedo l''ora di vedere le tue prossime creazioni.', '2023-05-21 00:00:00', 'marco_martelli', 22, NULL),
(9, 'Complimenti per l''animazione fluida!', '2023-05-23 00:00:00', 'stefano_massera', 23, NULL),
(11, 'Grazie per il tuo commento! Sono felice che ti piaccia il mio lavoro.', '2023-05-25 00:00:00', 'giuseppe_verdi', 1, 1),
(29, 'Incantevole!', '2023-05-16 04:00:03', 'raffaele_lungarella', 8, NULL),
(1,  'Grande lavoro! Hai davvero colto l''essenza del tema.', '2023-05-15 00:00:00', 'mario_rossi', 1, NULL);

--Popolamento della tabella mi piace commento:

INSERT INTO mi_piace_commento (utente, commento)
VALUES
('giuseppe_verdi', 4),
('mario_rossi', 5),
('laura_bianchi', 6),
('giuseppe_verdi', 7),
('mario_rossi', 8),
('laura_bianchi', 9),
('giuseppe_verdi', 10),
('mario_rossi', 11),
('laura_bianchi', 12),
('giuseppe_verdi', 13),
('alberto_marmo', 1),
('marco_martelli', 3),
('stefano_massera', 4),
('francesca_ferrari', 2),
('giovanni_bianco', 3),
('valentina_rosso', 5),
('raffaele_lungarella', 6),
('marco_martelli', 7),
('stefano_massera', 8),
('francesca_ferrari', 9),
('giovanni_bianco', 10),
('valentina_rosso', 11),
('raffaele_lungarella', 12),
('marco_martelli', 13),
('stefano_massera', 14),
('francesca_ferrari', 15),
('giovanni_bianco', 16),
('valentina_rosso', 17),
('raffaele_lungarella', 18),
('marco_martelli', 19),
('stefano_massera', 20),
('francesca_ferrari', 21),
('giovanni_bianco', 22);

--Popolamento della tabella mi piace recensione:

INSERT INTO mi_piace_recensione (utente, recensione_multimediale)
VALUES
('giuseppe_verdi', 4),
('mario_rossi', 5),
('laura_bianchi', 6),
('giuseppe_verdi', 7),
('mario_rossi', 8),
('laura_bianchi', 9),
('giuseppe_verdi', 10),
('mario_rossi', 11),
('laura_bianchi', 12),
('giuseppe_verdi', 13),
('marco_martelli', 1),
('stefano_massera', 2),
('raffaele_lungarella', 3),
('valentina_rosso', 4),
('marco_martelli', 5),
('stefano_massera', 6),
('raffaele_lungarella', 7),
('valentina_rosso', 8),
('marco_martelli', 9),
('stefano_massera', 10),
('raffaele_lungarella', 11),
('valentina_rosso', 12),
('marco_martelli', 13),
('stefano_massera', 14),
('raffaele_lungarella', 15),
('valentina_rosso', 16),
('marco_martelli', 17),
('stefano_massera', 18),
('raffaele_lungarella', 19),
('valentina_rosso', 20),
('marco_martelli', 21),
('stefano_massera', 22),
('raffaele_lungarella', 23),
('valentina_rosso', 24);

--Popolamento della tabella artwork:

INSERT INTO artwork (recensione_multimediale, didascalia, binary_data, risoluzione_orizzontale, risoluzione_verticale, mime_type, profilo_colore)
VALUES
  (1, 'Ritratto astratto', E'\\x0123456789abcdef', 1200, 800, 'image/jpeg', 'sRGB'),
  (1, 'Nuovo Ritratto astratto', E'\\x0123456789abcdef', 1200, 800, 'image/jpeg', 'sRGB'),
  (1, 'Illustrazione digitale rinnovata', E'\\x0123456789abcdef', 1600, 1200, 'image/jpeg', 'sRGB'),
  (1, 'Scultura in bronzo originale', E'\\x0123456789abcdef', 1000, 1000, 'image/jpeg', 'sRGB'),
  (2, 'Illustrazione digitale', E'\\x0123456789abcdef', 1600, 1200, 'image/jpeg', 'sRGB'),
  (3, 'Scultura in bronzo', E'\\x0123456789abcdef', 1000, 1000, 'image/jpeg', 'sRGB'),
  (4, 'Concept art del personaggio principale', E'\\x0123456789abcdef', 2000, 1500, 'image/jpeg', 'sRGB'),
  (5, 'Rendering 3D dell''ambiente', E'\\x0123456789abcdef', 2400, 1800, 'image/jpeg', 'sRGB'),
  (6, 'Illuminazione e texture dettagliate', E'\\x0123456789abcdef', 1400, 1000, 'image/jpeg', 'sRGB'),
  (7, 'Concept art del personaggio principale', E'\\x0123456789abcdef', 1800, 1200, 'image/jpeg', 'sRGB'),
  (8, 'Illustrazione digitale', E'\\x0123456789abcdef', 1600, 1600, 'image/jpeg', 'sRGB'),
  (9, 'Scatto in bianco e nero', E'\\x0123456789abcdef', 1200, 1200, 'image/jpeg', 'sRGB'),
  (10, 'Rendering 3D dell''ambiente', E'\\x0123456789abcdef', 2000, 1500, 'image/jpeg', 'sRGB'),
  (11, 'Ritratto astratto', E'\\x0123456789abcdef', 1200, 800, 'image/jpeg', 'sRGB'),
  (12, 'Illustrazione digitale', E'\\x0123456789abcdef', 1600, 1200, 'image/jpeg', 'sRGB'),
  (13, 'Scultura in bronzo', E'\\x0123456789abcdef', 1000, 1000, 'image/jpeg', 'sRGB'),
  (14, 'Concept art del personaggio principale', E'\\x0123456789abcdef', 2000, 1500, 'image/jpeg', 'sRGB'),
  (15, 'Rendering 3D dell''ambiente', E'\\x0123456789abcdef', 2400, 1800, 'image/jpeg', 'sRGB'),
  (15, 'Illustrazione fatata', E'\\x0123456789abcdef', 1600, 1200, 'image/jpeg', 'sRGB'),
  (16, 'Illuminazione e texture dettagliate', E'\\x0123456789abcdef', 1400, 1000, 'image/jpeg', 'sRGB'),
  (17, 'Concept art del personaggio principale', E'\\x0123456789abcdef', 1800, 1200, 'image/jpeg', 'sRGB'),
  (18, 'Illustrazione digitale', E'\\x0123456789abcdef', 1600, 1600, 'image/jpeg', 'sRGB'),
  (19, 'Scatto in bianco e nero', E'\\x0123456789abcdef', 1200, 1200, 'image/jpeg', 'sRGB'),
  (20, 'Rendering 3D dell''ambiente', E'\\x0123456789abcdef', 2000, 1500, 'image/jpeg', 'sRGB'),
  (20, 'Rendering astratto', E'\\x0123456789abcdef', 1200, 800, 'image/jpeg', 'sRGB'),
  (20, 'Illustrazione spaziale', E'\\x0123456789abcdef', 1600, 1200, 'image/jpeg', 'sRGB'),
  (21, 'Ritratto astratto', E'\\x0123456789abcdef', 1200, 800, 'image/jpeg', 'sRGB'),
  (22, 'Illustrazione digitale', E'\\x0123456789abcdef', 1600, 1200, 'image/jpeg', 'sRGB'),
  (23, 'Scultura in bronzo', E'\\x0123456789abcdef', 1000, 1000, 'image/jpeg', 'sRGB'),
  (24, 'Concept art del personaggio principale', E'\\x0123456789abcdef', 2000, 1500, 'image/jpeg', 'sRGB'),
  (25, 'Rendering 3D dell''ambiente', E'\\x0123456789abcdef', 2400, 1800, 'image/jpeg', 'sRGB'),
  (26, 'Ritratto astratto', E'\x0123456789abcdef', 1200, 800, 'image/jpeg', 'sRGB'),
  (27, 'Illustrazione digitale', E'\x0123456789abcdef', 1600, 1200, 'image/jpeg', 'sRGB'),
  (28, 'Scultura in bronzo', E'\x0123456789abcdef', 1000, 1000, 'image/jpeg', 'sRGB'),
  (29, 'Concept art del personaggio principale', E'\x0123456789abcdef', 2000, 1500, 'image/jpeg', 'sRGB'),
  (69, 'Ritratto astratto', E'\\x0123456789abcdef', 1200, 800, 'image/jpeg', 'sRGB');

--Popolamento della tabella tipologia:

INSERT INTO tipologia (nome)
VALUES
  ('Character Design'),
  ('Concept Art'),
  ('Environment Design'),
  ('Creature Design'),
  ('Vehicle Design'),
  ('Prop Design'),
  ('Illustration'),
  ('Digital Painting'),
  ('3D Modeling'),
  ('Sculpting'),
  ('Texturing');

--Popolamento della tabella medium:

INSERT INTO medium (nome)
VALUES
  ('Digital 2D'),
  ('Digital 3D'),
  ('Animation'),
  ('Real-Time'),
  ('Live Action CG/VFX'),
  ('3D Printing'),
  ('Traditional Ink'),
  ('Traditional Dry Media'),
  ('Traditional Paint'),
  ('Traditional Sculpture'),
  ('Mixed Media');

--Popolamento della tabella realizzazione:

INSERT INTO realizzazione (nome_medium, recensione_multimediale)
VALUES
  ('Digital 2D', 1),
  ('Digital 3D', 2),
  ('Animation', 3),
  ('Real-Time', 4),
  ('Live Action CG/VFX', 5),
  ('3D Printing', 6),
  ('Traditional Ink', 7),
  ('Traditional Dry Media', 8),
  ('Traditional Paint', 9),
  ('Traditional Sculpture', 10),
  ('Mixed Media', 11),
  ('Traditional Dry Media', 12),
  ('Digital 3D', 13),
  ('Traditional Ink', 14),
  ('Live Action CG/VFX', 15),
  ('Mixed Media', 16),
  ('Digital 2D', 17),
  ('Real-Time', 18),
  ('3D Printing', 19),
  ('Animation', 20),
  ('Traditional Paint', 21),
  ('Traditional Sculpture', 22),
  ('Traditional Dry Media', 23),
  ('Digital 3D', 24),
  ('Traditional Ink', 25),
  ('Digital 3D', 1),
  ('Digital 2D', 2),
  ('Mixed Media', 6),
  ('Traditional Paint', 7),
  ('Traditional Ink', 9),
  ('Traditional Ink', 10),
  ('Animation', 14),
  ('Real-Time', 15),
  ('Traditional Dry Media', 18),
  ('Traditional Ink', 19),
  ('Traditional Ink', 20),
  ('Traditional Ink', 21),
  ('Mixed Media', 22),
  ('Digital 2D', 24),
  ('Animation', 25),
  ('Digital 2D', 26),
  ('Real-Time', 27),
  ('Real-Time', 28),
  ('Real-Time', 29),
  ('Animation', 69);

--Popolamento della tabella contenuto:

INSERT INTO contenuto (nome_tipologia, recensione_multimediale)
VALUES
  ('Character Design', 1),
  ('Concept Art', 2),
  ('Environment Design', 3),
  ('Creature Design', 4),
  ('Vehicle Design', 5),
  ('Prop Design', 6),
  ('Illustration', 7),
  ('Digital Painting', 8),
  ('3D Modeling', 9),
  ('Sculpting', 10),
  ('Texturing', 11),
  ('Character Design', 12),
  ('Concept Art', 13),
  ('Environment Design', 14),
  ('Creature Design', 15),
  ('Vehicle Design', 16),
  ('Prop Design', 17),
  ('Illustration', 18),
  ('Digital Painting', 19),
  ('3D Modeling', 20),
  ('Sculpting', 21),
  ('Texturing', 22),
  ('Character Design', 23),
  ('Concept Art', 24),
  ('Environment Design', 25),
  ('Character Design', 26),
  ('Concept Art', 27),
  ('Environment Design', 28),
  ('3D Modeling', 29),
  ('3D Modeling', 69);

--Popolamento della tabella studio:

INSERT INTO studio (codice_fiscale_azienda, nome, descrizione, email, sito, "città", nazione)
VALUES
  ('CF123456789', 'Studio ArtVision', 'Uno studio di animazione specializzato in "Character Design" e "Animation".', 'studioartvision@example.com', 'www.studioartvision.com', 'Roma', 'Italia'),
  ('CF987654321', 'Studio DigitalDream', 'Uno studio di visual effects specializzato in "Real-Time" e "Live Action CG/VFX".', 'studiodigitaldream@example.com', 'www.studiodigitaldream.com', 'Milano', 'Italia'),
  ('CF456789123', 'Studio 3DPrint', 'Uno studio di stampa 3D che lavora con "Mixed Media" e "3D Printing".', 'studio3dprint@example.com', 'www.studio3dprint.com', 'Firenze', 'Italia'),
  ('CF789123456', 'Studio TraditionalArt', 'Uno studio di arte tradizionale specializzato in "Traditional Ink" e "Traditional Paint".', 'studiotraditionalart@example.com', 'www.studiotraditionalart.com', 'Napoli', 'Italia'),
  ('CF321654987', 'Studio SculptureMaster', 'Uno studio di scultura che lavora con "Traditional Sculpture" e "Mixed Media".', 'studiosculpturemaster@example.com', 'www.studiosculpturemaster.com', 'Torino', 'Italia'),
  ('CF654321987', 'Studio ConceptDesign', 'Uno studio di concept design specializzato in "Character Design" e "Environment Design".', 'studioconceptdesign@example.com', 'www.studioconceptdesign.com', 'Palermo', 'Italia'),
  ('CF234567890', 'Studio DigitalArt', 'Uno studio di arte digitale specializzato in "Digital Painting" e "Illustration".', 'studiodigitalart@example.com', 'www.studiodigitalart.com', 'Bologna', 'Italia'),
  ('CF789012345', 'Studio ConceptArt', 'Uno studio di concept art specializzato in "Character Design" e "Prop Design".', 'studioconceptart@example.com', 'www.studioconceptart.com', 'Verona', 'Italia'),
  ('CF901234567', 'Studio VisualEffects', 'Uno studio di effetti visivi specializzato in "VFX" e "CGI".', 'studiovisualeffects@example.com', 'www.studiovisualeffects.com', 'Genova', 'Italia');

--Popolamento della tabella impiego:

INSERT INTO impiego (data_inizio, data_fine, artista, studio)
VALUES
  ('2022-01-01', '2023-02-17', 'mario_rossi', 'CF123456789'),
  ('2022-02-01', '2022-02-28', 'laura_bianchi', 'CF123456789'),
('2022-03-01', '2022-03-30', 'laura_bianchi', 'CF987654321'),
('2022-04-01', '2022-04-30', 'laura_bianchi', 'CF456789123'),
('2022-05-01', '2022-05-30', 'laura_bianchi', 'CF789123456'),
('2022-06-01', '2022-06-30', 'laura_bianchi', 'CF321654987'),
('2022-07-01', '2022-07-30', 'laura_bianchi', 'CF654321987'),
('2022-08-01', '2022-08-30', 'laura_bianchi', 'CF234567890'),
('2022-09-01', '2023-03-30', 'laura_bianchi', 'CF789012345'),
('2023-04-01', '2023-04-30', 'laura_bianchi', 'CF901234567'),
  ('2022-03-01', '2023-05-31', 'giuseppe_verdi', 'CF456789123'),
  ('2022-04-01', '2022-12-31', 'marco_martelli', 'CF789123456'),
  ('2023-03-01', '2023-05-30', 'marco_martelli', 'CF654321987'),
  ('2022-07-01', '2022-12-31', 'stefano_massera', 'CF321654987'),
  ('2023-06-01', NULL, 'marco_martelli', 'CF234567890'),
  ('2022-09-01', NULL, 'alberto_marmo', 'CF789012345'),
  ('2022-10-01', NULL, 'stefano_massera', 'CF901234567');

--Popolamento della tabella tag:

INSERT INTO tag (nome, artista)
VALUES ('Cyberpunk', 'mario_rossi'),
       ('Sci-fi', 'laura_bianchi'),
       ('Character Design', 'giuseppe_verdi'),
       ('Concept Art', 'marco_martelli'),
       ('Beard', 'alberto_marmo'),
       ('Environment Design', 'stefano_massera'),
       ('Fighter', 'raffaele_lungarella'),
	   ('Fashion Photography', 'stefano_massera'),
	   ('Cityscapes', 'raffaele_lungarella'),
	   ('Modern Art', 'mario_rossi'),
	   ('Bronze Sculpture', 'marco_martelli'),
	   ('Nature Photography', 'laura_bianchi'),
	   ('Opera House', 'giuseppe_verdi'),
	   ('Abstract Art', 'alberto_marmo'),
	   ('Landscape', 'alberto_marmo'),
	   ('Opera', 'stefano_massera'),
	   ('Abstract', 'raffaele_lungarella'),
	   ('Sculpture', 'mario_rossi'),
	   ('Still Life', 'laura_bianchi'),
	   ('Photography', 'marco_martelli'),
	   ('Impressionism', 'marco_martelli');

--Popolamento della tabella tag recensione:

INSERT INTO tag_recensione (tag, recensione_multimediale)
VALUES 
    ('Landscape', 1),
    ('Landscape', 2),
    ('Landscape', 3),
    ('Opera', 7),
    ('Opera', 8),
    ('Opera', 9),
    ('Abstract', 10),
    ('Abstract', 11),
    ('Abstract', 12),
    ('Sculpture', 23),
    ('Sculpture', 24),
    ('Sculpture', 25),
    ('Still Life', 22),
    ('Still Life', 23),
    ('Still Life', 24),
    ('Photography', 18),
    ('Photography', 19),
    ('Photography', 20),
    ('Photography', 21),
    ('Abstract', 1),
    ('Abstract', 2),
    ('Abstract', 3),
    ('Abstract Art', 4),
    ('Abstract Art', 5),
    ('Abstract Art', 6),
    ('Beard', 3),
    ('Beard', 4),
    ('Beard', 5),
    ('Bronze Sculpture', 8),
    ('Bronze Sculpture', 9),
    ('Bronze Sculpture', 10),
    ('Character Design', 13),
    ('Character Design', 14),
    ('Character Design', 15),
    ('Cityscapes', 18),
    ('Cityscapes', 19),
    ('Cityscapes', 20),
    ('Concept Art', 3),
    ('Concept Art', 4),
    ('Concept Art', 5),
    ('Cyberpunk', 13),
    ('Cyberpunk', 14),
    ('Cyberpunk', 15),
    ('Environment Design', 16),
    ('Environment Design', 17),
    ('Environment Design', 18),
    ('Environment Design', 19),
    ('Environment Design', 20),
    ('Fashion Photography', 21),
	 ('Fighter', 3),
    ('Fighter', 4),
    ('Fighter', 5),
    ('Impressionism', 6),
    ('Impressionism', 7),
    ('Impressionism', 8),
    ('Landscape', 14),
    ('Landscape', 15),
    ('Modern Art', 19),
    ('Modern Art', 20),
    ('Modern Art', 21),
    ('Nature Photography', 1),
    ('Nature Photography', 2),
    ('Opera', 2),
    ('Opera', 3),
    ('Opera', 4),
    ('Opera House', 14),
    ('Opera House', 15);

