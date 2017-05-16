/*------------------------------------------*/
/* Oracle 12c 								*/
/* create database schema for DBIS			*/ 
/* Author: 	Michael Bernhardt, 291599		*/
/* 			Viktoria Maier, 292140			*/
/* Last modified: 04.12.2015				*/
/*------------------------------------------*/

ALTER SESSION SET NLS_DATE_FORMAT = 'DD.MM.YYYY';
PURGE recyclebin;
ALTER SESSION SET recyclebin = OFF;


/* DDL Statement to create table Land */
CREATE TABLE Land (
	ISOCode varchar2(3) PRIMARY KEY,
	Name varchar2(40) NOT NULL);
	
/* DDL Statement to create table Fluggesellschaft */
CREATE TABLE Fluggesellschaft (
	Name varchar2(40) PRIMARY KEY,
	Servicequalitaetskennzahl NUMBER(2) CHECK (0 < Servicequalitaetskennzahl AND Servicequalitaetskennzahl < 11));
	
/* DDL Statement to create table Bankverbindung */
CREATE TABLE Bankverbindung (
	IBAN varchar2(34) PRIMARY KEY,
	KontoNr number(30) NOT NULL,
	BLZ varchar2(10) NOT NULL,
	BIC varchar2(11) NOT NULL,
	KundenNr number(10) NOT NULL);
	
/* DDL Statement to create table Zusatzausstattung */
CREATE TABLE Zusatzausstattung (
	Beschreibung varchar2(40) PRIMARY KEY);
	
/* DDL Statement to create table Ort */
CREATE TABLE Ort (
	OrtsID number(11) PRIMARY KEY,
	Ortsname varchar2(40) NOT NULL,
	ISOCode varchar2(3) NOT NULL,
	IATACode varchar2(3) NOT NULL,
	CONSTRAINT FK_Ort_Land FOREIGN KEY (ISOCode) REFERENCES Land (ISOCode));
	
/* DDL Statement to create table Adresse */
CREATE TABLE Adresse (
	AdressID number(20) PRIMARY KEY,
	Strasse varchar2(40) NOT NULL,
	HausNr varchar2(6) NOT NULL,
	PLZ varchar2(10) NOT NULL,
	OrtsID number(11) NOT NULL,
	CONSTRAINT FK_Adresse_Ort FOREIGN KEY (OrtsID) REFERENCES Ort (OrtsID));
	
/* DDL Statement to create table Touristenattraktion */
CREATE TABLE Touristenattraktion (
	AttraktionsID number(5) PRIMARY KEY,
	Name varchar2(40) UNIQUE NOT NULL,
	Art varchar2(40) NOT NULL,
	Beschreibung varchar2(2000),
	AdressID number(20) UNIQUE NOT NULL,
	CONSTRAINT FK_Touristenattraktion_Adresse FOREIGN KEY (AdressID) REFERENCES Adresse (AdressID));	
	
/* DDL Statement to create table Flughafen */
CREATE TABLE Flughafen (
	IATACode varchar2(3) PRIMARY KEY,
	Name varchar2(40) NOT NULL,
	AdressID number(20) UNIQUE NOT NULL,
	CONSTRAINT FK_Flughafen_Adresse FOREIGN KEY (AdressID) REFERENCES Adresse (AdressID));
	
/* DDL Statement to create table Kunde */
CREATE TABLE Kunde (
	KundenNr number(10) PRIMARY KEY,
	Vorname varchar2(40) NOT NULL,
	Nachname varchar2(40) NOT NULL,
	Geburtsdatum date NOT NULL,
	EMailAdresse varchar2(40) NOT NULL,
	Telefonnummer varchar2(20) NOT NULL,
	AdressID number(20) UNIQUE NOT NULL,
	CONSTRAINT FK_Kunde_Adresse FOREIGN KEY (AdressID) REFERENCES Adresse (AdressID));
	
/* DDL Statement to create table Ferienwohnung */
CREATE TABLE Ferienwohnung (
	WohnungsID number(6) PRIMARY KEY,
	Zimmeranzahl number(2) CHECK (Zimmeranzahl > 0),
	GroesseQM number(4) CHECK (GroesseQM > 0),
	PreisTag decimal(5,2) CHECK (PreisTag > 0),
	Beschreibung varchar2(2000),
	AdressID number(20) UNIQUE NOT NULL,
	CONSTRAINT FK_Ferienwohnung_Adresse FOREIGN KEY (AdressID) REFERENCES Adresse (AdressID));

/* DDL Statement to create table Belegung */
CREATE TABLE Belegung (
	BelegungsID number(12) PRIMARY KEY,
	von date NOT NULL,
	bis date NOT NULL,
	StatusFlag varchar2(12) NOT NULL CHECK (StatusFlag IN ('Reservierung', 'Buchung')),
	Belegungsdatum date NOT NULL,
	KundenNr number(10) NOT NULL,
	WohnungsID number(6) NOT NULL,
	CONSTRAINT FK_Belegung_Kunde FOREIGN KEY (KundenNr) REFERENCES Kunde (KundenNr),
	CONSTRAINT FK_Belegung_Wohnung FOREIGN KEY (WohnungsID) REFERENCES Ferienwohnung (WohnungsID));

/* DDL Statement to create table Rechnung */
CREATE TABLE Rechnung (
	RechnungsNr number(5) PRIMARY KEY,
	Rechnungsdatum date NOT NULL,
	Betrag decimal(8,2) NOT NULL,
	Zahlungseingangsdatum date,
	BelegungsID number(12) UNIQUE NOT NULL,
	CONSTRAINT FK_Rechnung_Belegung FOREIGN KEY (BelegungsID) REFERENCES Belegung (BelegungsID));

/* DDL Statement to create table Bilder */
CREATE TABLE Bilder (
	BID number(6) PRIMARY KEY,
	Dateipfad varchar2(40) NOT NULL,
	Beschreibung varchar2(2000) NOT NULL,
	WohnungsID number(6) NOT NULL,
	CONSTRAINT FK_Bilder_Ferienwohnung FOREIGN KEY (WohnungsID) REFERENCES Ferienwohnung (WohnungsID));	
	
/* DDL Statement to create table entferntVon */
CREATE TABLE entferntVon (
	Startort number(11),
	Zielort number(11),
	km number(4),
	PRIMARY KEY(Startort, Zielort),
	CONSTRAINT FK_StartEntferntVon_Ort FOREIGN KEY (Startort) REFERENCES Ort (OrtsID),
	CONSTRAINT FK_ZielEntferntVon_Ort FOREIGN KEY (Zielort) REFERENCES Ort (OrtsID));
	
/* DDL Statement to create table fliegtAn */
CREATE TABLE fliegtAn (
	StartFl varchar2(3),
	ZielFl varchar2(3),
	FGS varchar2(40),
	PRIMARY KEY(StartFl, ZielFl, FGS),
	CONSTRAINT FK_StartFl_Flughafen FOREIGN KEY (StartFl) REFERENCES Flughafen (IATACode),
	CONSTRAINT FK_ZielFl_Flughafen FOREIGN KEY (ZielFl) REFERENCES Flughafen (IATACode),
	CONSTRAINT FK_FGS_Flughafen FOREIGN KEY (FGS) REFERENCES Fluggesellschaft (Name));

/* DDL Statement to create table besitzen */
CREATE TABLE besitzen (
	Beschreibung varchar2(2000),
	WohnungsID number(6),
	PRIMARY KEY(Beschreibung, WohnungsID),
	CONSTRAINT FK_Beschreibung_Wohnung FOREIGN KEY (Beschreibung) REFERENCES Zusatzausstattung (Beschreibung),
	CONSTRAINT FK_WohnungsID_Wohnung FOREIGN KEY (WohnungsID) REFERENCES Ferienwohnung (WohnungsID));
	
/* DDL Statement to create missing Foreign Key for Ort/Flughafen */
ALTER TABLE Ort ADD CONSTRAINT FK_Ort_Flughafen FOREIGN KEY (IATACode) REFERENCES Flughafen (IATACode);
ALTER TABLE Bankverbindung ADD CONSTRAINT FK_Bankverbindung_Kunde FOREIGN KEY (KundenNr) REFERENCES Kunde (KundenNr);
	
CREATE OR REPLACE VIEW Buchung AS
	SELECT b.*
	FROM Belegung b
	WHERE b.StatusFlag = 'Buchung';
	
CREATE OR REPLACE VIEW Reservierung AS
	SELECT b.*
	FROM Belegung b
	WHERE b.StatusFlag = 'Reservierung';
	
CREATE OR REPLACE VIEW UebersichtKunden 
	(KNR, KName, KVName, APLZ, AStr, AHausNummer, BAIBAN, BEStatus, BEVon, BEBis, BEDatum, FNummer, FBeschreibung) AS
	SELECT k.KundenNr, k.Nachname, k.Vorname, a.PLZ, a.Strasse, a.HausNr, ba.IBAN, be.StatusFlag, be.Von, be.Bis, be.Belegungsdatum, f.WohnungsID, f.Beschreibung
	FROM Kunde k LEFT OUTER JOIN Belegung be ON be.KundenNr = k.KundenNr LEFT OUTER JOIN Ferienwohnung f ON f.WohnungsID = be.WohnungsID, Adresse a, Bankverbindung ba
	WHERE k.AdressID = a.AdressID AND k.KundenNr = ba.KundenNr;

CREATE OR REPLACE VIEW Zahlungstatus
	(FeWoID, FeWoBeschreibung, KNr, KName, ReNr, ReDatum, ReBetrag, ReZahlungseingangsdatum, ReStatus) AS  
  SELECT f.WohnungsID, f.Beschreibung, k.KundenNr, k.Nachname, r.RechnungsNr, r.Rechnungsdatum, r.Betrag, r.Zahlungseingangsdatum, 
	CASE WHEN r.Zahlungseingangsdatum IS NULL THEN 'offen'
	ELSE 'bezahlt'
	END "ReStatus"
	FROM Ferienwohnung f LEFT OUTER JOIN Belegung be ON f.WohnungsID = be.WohnungsID LEFT OUTER JOIN Rechnung r ON be.BelegungsID = r.BelegungsID, Kunde k
  WHERE be.KundenNr = k.KundenNr;
	
CREATE OR REPLACE VIEW MidAgeKunden 
	(KNr, KName, KVorname, KGeb, KAlter) AS 
	SELECT k.KundenNr, k.Nachname, k.Vorname, k.Geburtsdatum, Ceil((Months_Between(Current_Date, k.Geburtsdatum) / 12) - 1)
	FROM Kunde k
	WHERE (Ceil((Months_Between(Current_Date, k.Geburtsdatum) / 12) - 1) between 30 AND 40)
	WITH CHECK OPTION;
	
	
COMMIT;