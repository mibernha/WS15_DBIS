/*------------------------------------------*/
/* Oracle 12c 								*/
/* delete initial data for DBIS				*/ 
/* Author: 	Michael Bernhardt, 291599		*/
/* 			Viktoria Maier, 292140			*/
/* Last modified: 04.12.2015				*/
/*------------------------------------------*/

-- Set the used date format for the session disable recyclebin
ALTER SESSION SET NLS_DATE_FORMAT = 'DD.MM.YYYY';
PURGE recyclebin;
ALTER SESSION SET recyclebin = OFF;



/* DML statements to delete sample data from table besitzen */
DELETE FROM besitzen;

/* DML statements to delete sample data from table fliegtAn */
DELETE FROM fliegtAn;

/* DML statements to delete sample data from table entferntVon */
DELETE FROM entferntVon;

/* DML statements to delete sample data from table Bilder */
DELETE FROM Bilder;

/* DML statements to delete sample data from table Rechnung */
DELETE FROM Rechnung;

/* DML statements to delete sample data from table Belegung */
DELETE FROM Belegung;

/* DML statements to delete sample data from table Ferienwohnung */
DELETE FROM Ferienwohnung;

/* DML statements to delete sample data from table StornierteBuchungen */
DELETE FROM StornierteBuchungen;

/* DML statements to delete sample data from table Kunde */
DELETE FROM Kunde;

/* DML statements to delete sample data from table Flughafen */
DELETE FROM Flughafen;

/* DML statements to delete sample data from table Touristenattraktion */
DELETE FROM Touristenattraktion;

/* DML statements to delete sample data from table Adresse */
DELETE FROM Adresse;

/* DML statements to delete sample data from table Ort */
DELETE FROM Ort;

/* DML statements to delete sample data from table Zusatzausstattung */
DELETE FROM Zusatzausstattung;

/* DML statements to delete sample data from table Bankverbindung */
DELETE FROM Bankverbindung;

/* DML statements to delete sample data from table Fluggesellschaft */
DELETE FROM Fluggesellschaft;

/* DML statements to delete sample data from table Land */
DELETE FROM Land;

COMMIT;