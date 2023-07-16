--------------------------------------- SCRIPT DI CREAZIONE DATABASE----------------------------------------------

-- NOTA: La relazione artwork utilizza un trigger before per assegnare il numero artwork che insieme alla recensione multimediale è PRIMARY KEY.
-- 		assicurarsi di creare il trigger prima del popolamento dei dati.
-- Creazione tabella utente

DROP TABLE IF EXISTS utente CASCADE;
CREATE TABLE utente(
	username VARCHAR(30) PRIMARY KEY,
	email VARCHAR(50) UNIQUE NOT NULL,
	pwd VARCHAR(128) NOT NULL,
	nome VARCHAR(20) NOT NULL,
	cognome VARCHAR(30) NOT NULL,
	data_di_nascita DATE NOT NULL,
	città VARCHAR(20) NOT NULL,
	nazione VARCHAR(20) NOT NULL,
	CONSTRAINT ck_utente_email CHECK (email LIKE '%_@__%.__%'),
	CONSTRAINT ck_data_di_nascita CHECK (Data_di_nascita > '1930-01-01' and data_di_nascita < CURRENT_DATE - 17*365)

);

-- Creazione tabella artista
DROP TABLE IF EXISTS artista CASCADE;
CREATE TABLE artista(
	utente VARCHAR(30) PRIMARY KEY,
	professione VARCHAR(40) NOT NULL,
	descrizione TEXT NOT NULL,
	CONSTRAINT fk_utente_artista FOREIGN KEY (utente) REFERENCES utente ON UPDATE CASCADE,
	CONSTRAINT ck_artista_descrizione_length CHECK (LENGTH(descrizione)<=500)

);
-- Creazione tabella skills
DROP TABLE IF EXISTS skills CASCADE;
CREATE TABLE skills(
	nome VARCHAR(40) PRIMARY KEY
	
);
-- Creazione tabella software
DROP TABLE IF EXISTS software CASCADE;
CREATE TABLE software(
	nome VARCHAR(40) PRIMARY KEY

);
-- Creazione tabella tag
DROP TABLE IF EXISTS tag CASCADE;
CREATE TABLE tag(
	nome VARCHAR(40) PRIMARY KEY,
	artista VARCHAR(30) NOT NULL,
   	CONSTRAINT fk_tag_artista FOREIGN KEY (artista) REFERENCES artista (utente) ON UPDATE CASCADE

);
-- Creazione tabella esprienza
DROP TABLE IF EXISTS esperienza CASCADE;
CREATE TABLE esperienza(
	nome_skill VARCHAR(40),
	artista VARCHAR(30),
	CONSTRAINT pk_esperienza PRIMARY KEY (nome_skill, artista),
    CONSTRAINT fk_esperienza_skills FOREIGN KEY (nome_skill) REFERENCES skills (nome) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_esperienza_artista FOREIGN KEY (artista) REFERENCES artista (utente) ON UPDATE CASCADE

);
-- Creazione tabella competenza
DROP TABLE IF EXISTS competenza CASCADE;
CREATE TABLE competenza(
	nome_competenza varchar(40),
	artista varchar(30),
	CONSTRAINT pk_competenza PRIMARY KEY(nome_competenza, artista),
	CONSTRAINT fk_nome_competenza_software FOREIGN KEY(nome_competenza) REFERENCES software(nome) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_esperienza_artista FOREIGN KEY (artista) REFERENCES artista (utente) ON UPDATE CASCADE

);
-- Creazione tabella recensione multimediale
DROP TABLE IF EXISTS recensione_multimediale CASCADE;
CREATE TABLE recensione_multimediale(
	id_recensione_multimediale SERIAL PRIMARY KEY,
	descrizione TEXT,
	titolo VARCHAR(50) NOT NULL,
	numero_mi_piace INTEGER DEFAULT 0,
	numero_visualizzazioni INTEGER DEFAULT 0,
	artista VARCHAR(30) NOT NULL,
	data_pubblicazione TIMESTAMP,
	opera_personale BOOLEAN DEFAULT true,
	CONSTRAINT ck_mipiace_visualizzazioni_numrecensione CHECK (numero_mi_piace >= 0 AND numero_visualizzazioni >= 0),
   	CONSTRAINT fk_recensione_multimediale_artista FOREIGN KEY (artista) REFERENCES artista (utente) ON UPDATE CASCADE,
	CONSTRAINT ck_recensione_multimediale_descrizione_length CHECK (LENGTH(descrizione)<=500)

);
-- Creazione tabella commento
DROP TABLE IF EXISTS commento CASCADE;
CREATE TABLE commento(
	id_commento SERIAL PRIMARY KEY,
	numero_mi_piace INTEGER DEFAULT 0,
	testo TEXT NOT NULL,
	data_di_pubblicazione TIMESTAMP NOT NULL,
	artista VARCHAR(30) NOT NULL,
	recensione_multimediale INTEGER NOT NULL,
	risposta INTEGER,
	CONSTRAINT ck_numero_mi_piace CHECK (numero_mi_piace >= 0),
	CONSTRAINT fk_commento_artista FOREIGN KEY (artista) REFERENCES artista (utente) ON UPDATE CASCADE,
	CONSTRAINT fk_commento_recensione FOREIGN KEY (recensione_multimediale) REFERENCES recensione_multimediale (id_recensione_multimediale) ON UPDATE CASCADE ON DELETE CASCADE,
 	CONSTRAINT fk_commento_risposta FOREIGN KEY (risposta) REFERENCES commento (id_commento) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT ck_commento_caratteri CHECK (LENGTH(testo) <= 500)

);
-- Creazione tabella mi_piace_commento
DROP TABLE IF EXISTS mi_piace_commento CASCADE;
CREATE TABLE mi_piace_commento (
    utente VARCHAR(30) NOT NULL,
    commento INTEGER NOT NULL,
    CONSTRAINT pk_mi_piace_commento PRIMARY KEY (utente, commento),
    CONSTRAINT fk_mi_piace_commento_utente FOREIGN KEY (utente) REFERENCES utente (username),
    CONSTRAINT fk_mi_piace_commento_commento FOREIGN KEY (commento) REFERENCES commento (id_commento) ON DELETE CASCADE

);
-- Creazione tabella mi_piace_recensione
DROP TABLE IF EXISTS mi_piace_recensione CASCADE;
CREATE TABLE mi_piace_recensione(
	utente VARCHAR(30),
    recensione_multimediale INTEGER,
    CONSTRAINT pk_mi_piace_recensione PRIMARY KEY (utente, recensione_multimediale),
    CONSTRAINT fk_mi_piace_recensione_utente FOREIGN KEY (utente) REFERENCES utente (username),
    CONSTRAINT fk_mi_piace_recensione_recensione FOREIGN KEY (recensione_multimediale) REFERENCES recensione_multimediale (id_recensione_multimediale)

);
-- Creazione tabella artwork
DROP TABLE IF EXISTS artwork CASCADE;
CREATE TABLE artwork(
	recensione_multimediale INTEGER,
    numero_artwork SMALLINT DEFAULT 1,
    didascalia TEXT,
    binary_data BYTEA,
    risoluzione_orizzontale INTEGER,
    risoluzione_verticale INTEGER,
    mime_type VARCHAR(15),
    profilo_colore VARCHAR(10),
    CONSTRAINT pk_artwork PRIMARY KEY (recensione_multimediale, numero_artwork),
    CONSTRAINT fk_artwork_recensione FOREIGN KEY (recensione_multimediale) REFERENCES
recensione_multimediale (id_recensione_multimediale) ON UPDATE CASCADE,
	CONSTRAINT ck_artwork_risoluzione CHECK(risoluzione_orizzontale <= 10000 AND risoluzione_verticale <= 10000),
	CONSTRAINT ck_artwork_dimensione CHECK(LENGTH(binary_data) <=1000000),
	CONSTRAINT ck_artwork_didascalia CHECK(LENGTH(didascalia) <= 500),
	CONSTRAINT ck_artwork_mimetype CHECK(mime_type IN ('image/jpeg', 'image/png', 'video/mp4'))

);
-- Creazione tabella tipologia
DROP TABLE IF EXISTS tipologia CASCADE;
CREATE TABLE tipologia(
    nome VARCHAR(40) PRIMARY KEY

);
-- Creazione tabella contenuto
DROP TABLE IF EXISTS contenuto CASCADE;
CREATE TABLE contenuto(
	nome_tipologia VARCHAR(40),
    recensione_multimediale INTEGER,
    CONSTRAINT pk_contenuto PRIMARY KEY (nome_tipologia, recensione_multimediale),
    CONSTRAINT fk_contenuto_tipologia FOREIGN KEY (nome_tipologia) REFERENCES tipologia (nome) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_contenuto_recensione FOREIGN KEY (recensione_multimediale) REFERENCES recensione_multimediale (id_recensione_multimediale) ON UPDATE CASCADE

);
-- Creazione tabella medium
DROP TABLE IF EXISTS medium CASCADE;
CREATE TABLE medium(
	nome VARCHAR(40) PRIMARY KEY

);
-- Creazione tabella realizzazione
DROP TABLE IF EXISTS realizzazione CASCADE;
CREATE TABLE realizzazione(
	nome_medium VARCHAR(40),
    recensione_multimediale INTEGER,
    CONSTRAINT pk_realizzazione PRIMARY KEY (nome_medium, recensione_multimediale),
    CONSTRAINT fk_realizzazione_medium FOREIGN KEY (nome_medium) REFERENCES medium (nome) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_realizzazione_recensione FOREIGN KEY (recensione_multimediale) REFERENCES recensione_multimediale (id_recensione_multimediale) ON UPDATE CASCADE

);
-- Creazione tabella studio
DROP TABLE IF EXISTS studio CASCADE;
CREATE TABLE studio(
	codice_fiscale_azienda VARCHAR(30) PRIMARY KEY,
   	nome VARCHAR(30) NOT NULL,
   	descrizione TEXT NOT NULL,
   	numero_mi_piace INTEGER DEFAULT 0,
   	email VARCHAR(50) NOT NULL,
   	sito VARCHAR(50) NOT NULL,
	città VARCHAR(20)NOT NULL,
   	nazione VARCHAR(20) NOT NULL,
	CONSTRAINT ck_studio_numero_mi_piace CHECK (numero_mi_piace >= 0),
	CONSTRAINT ck_studio_email CHECK (email LIKE '%_@__%.__%'),
	CONSTRAINT ck_studio_descrizione CHECK(LENGTH(descrizione) <= 500)

);
-- Creazione tabella impiego
DROP TABLE IF EXISTS impiego CASCADE;
CREATE TABLE impiego(
	data_inizio DATE,
	data_fine DATE,
	artista VARCHAR(30),
	studio VARCHAR(30) NOT NULL,
	CONSTRAINT pk_impiego PRIMARY KEY(data_inizio,artista),
	CONSTRAINT fk_impiego_artista FOREIGN KEY(artista) REFERENCES artista(utente) ON UPDATE CASCADE,
	CONSTRAINT fk_impiego_studio FOREIGN KEY(studio) REFERENCES studio(codice_fiscale_azienda) ON UPDATE CASCADE

);
-- Creazione tabella tag_recensione
DROP TABLE IF EXISTS tag_recensione CASCADE;
CREATE TABLE tag_recensione(
	tag VARCHAR(40),
    recensione_multimediale INTEGER,
    CONSTRAINT pk_tag_recensione PRIMARY KEY (tag, recensione_multimediale),
    CONSTRAINT fk_tag FOREIGN KEY (tag) REFERENCES tag(nome) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_tag_recensione FOREIGN KEY (recensione_multimediale) REFERENCES recensione_multimediale (id_recensione_multimediale) ON UPDATE CASCADE

);