/*------------------------------------------*/
/* Oracle 12c 								*/
/* delete database schema for DBIS			*/ 
/* Author: 	Michael Bernhardt, 291599		*/
/* 			Viktoria Maier, 292140			*/
/* Last modified: 04.12.2015				*/
/*------------------------------------------*/
-- Set the used date format for the session disable recyclebin
ALTER SESSION SET NLS_DATE_FORMAT = 'DD.MM.YYYY';
PURGE recyclebin;
ALTER SESSION SET recyclebin = OFF;

ALTER TABLE Ort DROP CONSTRAINT FK_Ort_Land;
ALTER TABLE Ort DROP CONSTRAINT FK_Ort_Flughafen;
ALTER TABLE Adresse DROP CONSTRAINT FK_Adresse_Ort;
ALTER TABLE Flughafen DROP CONSTRAINT FK_Flughafen_Adresse;
ALTER TABLE Bankverbindung DROP CONSTRAINT FK_Bankverbindung_Kunde;

DROP TRIGGER Buchungsloeschung;

DROP FUNCTION preis;

DROP SEQUENCE autoInkrStorno;

DROP VIEW Buchung;
DROP VIEW Reservierung;
DROP VIEW UebersichtKunden;
DROP VIEW Zahlungstatus;
DROP VIEW MidAgeKunden;


DROP TABLE StornierteBuchungen;
DROP TABLE besitzen;
DROP TABLE fliegtAn;
DROP TABLE entferntVon;
DROP TABLE Bilder;
DROP TABLE Rechnung;
DROP TABLE Belegung;
DROP TABLE Ferienwohnung;
DROP TABLE Kunde;
DROP TABLE Flughafen;
DROP TABLE Touristenattraktion;
DROP TABLE Adresse;
DROP TABLE Ort;
DROP TABLE Zusatzausstattung;
DROP TABLE Bankverbindung;
DROP TABLE Fluggesellschaft;
DROP TABLE Land;





