/*------------------------------------------*/
/* Oracle 12c 								*/
/* insert initial data for DBIS				*/ 
/* Author: 	Michael Bernhardt, 291599		*/
/* 			Viktoria Maier, 292140			*/
/* Last modified: 04.12.2015				*/
/*------------------------------------------*/

-- Set the used date format for the session disable recyclebin
ALTER SESSION SET NLS_DATE_FORMAT = 'DD.MM.YYYY';
PURGE recyclebin;
ALTER SESSION SET recyclebin = OFF;

/* Commit the running transaction (if any) */
COMMIT;

ALTER TABLE Ort DISABLE CONSTRAINT FK_Ort_Flughafen;
ALTER TABLE Bankverbindung DISABLE CONSTRAINT FK_Bankverbindung_Kunde;

/* DML statements to insert sample data into table Land */
INSERT INTO Land (ISOCode, Name) VALUES ('DEU', 'Deutschland');
INSERT INTO Land (ISOCode, Name) VALUES ('FRA', 'Frankreich');
INSERT INTO Land (ISOCode, Name) VALUES ('TUR', 'Tuerkei');
INSERT INTO Land (ISOCode, Name) VALUES ('ESP', 'Spanien');
INSERT INTO Land (ISOCode, Name) VALUES ('CHE', 'Schweiz');

/* DML statements to insert sample data into table Fluggesellschaft */
INSERT INTO Fluggesellschaft (Name, Servicequalitaetskennzahl) VALUES ('Lufthansa', 1);
INSERT INTO Fluggesellschaft (Name, Servicequalitaetskennzahl) VALUES ('German Wings', 4);
INSERT INTO Fluggesellschaft (Name, Servicequalitaetskennzahl) VALUES ('Thomas Cook', 8);
INSERT INTO Fluggesellschaft (Name, Servicequalitaetskennzahl) VALUES ('Hapag Loyd', 9);

/* DML statements to insert sample data into table Bankverbindung */
INSERT INTO Bankverbindung (IBAN, KontoNr, BLZ, BIC, KundenNr) VALUES ('DE01692717237823212', 7823212, '69271723', 'BIC01', 1);
INSERT INTO Bankverbindung (IBAN, KontoNr, BLZ, BIC, KundenNr) VALUES ('DE02327939688929368', 8929368, '32793968', 'BIC02', 2);
INSERT INTO Bankverbindung (IBAN, KontoNr, BLZ, BIC, KundenNr) VALUES ('DE01692717231347291', 1347291, '69271723', 'BIC01', 3);
INSERT INTO Bankverbindung (IBAN, KontoNr, BLZ, BIC, KundenNr) VALUES ('DE01692717237322890', 7322890, '69271723', 'BIC01', 6);
INSERT INTO Bankverbindung (IBAN, KontoNr, BLZ, BIC, KundenNr) VALUES ('CH03297884318792978', 8792978, '29788431', 'BIC03', 4);
INSERT INTO Bankverbindung (IBAN, KontoNr, BLZ, BIC, KundenNr) VALUES ('CH04908278087890271', 9082780, '87890271', 'BIC04', 5);


/* DML statements to insert sample data into table Zusatzausstattung */
INSERT INTO Zusatzausstattung (Beschreibung) VALUES ('Schwimmbad');
INSERT INTO Zusatzausstattung (Beschreibung) VALUES ('Sauna');
INSERT INTO Zusatzausstattung (Beschreibung) VALUES ('Autoabstellplatz');
INSERT INTO Zusatzausstattung (Beschreibung) VALUES ('Aufzug');
INSERT INTO Zusatzausstattung (Beschreibung) VALUES ('Kinderbetreuung');
INSERT INTO Zusatzausstattung (Beschreibung) VALUES ('Sat-Tv');
INSERT INTO Zusatzausstattung (Beschreibung) VALUES ('Reinigung');
INSERT INTO Zusatzausstattung (Beschreibung) VALUES ('Dachterrasse');
INSERT INTO Zusatzausstattung (Beschreibung) VALUES ('Garage');

/* DML statements to insert sample data into table Ort */
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (1, 'Konstanz', 'DEU', 'FRA'); 
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (2, 'Stuttgart', 'DEU', 'FRA');
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (3, 'Heidelberg', 'DEU', 'FRA');
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (4, 'Rust', 'DEU', 'FRA');
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (5, 'Bern', 'CHE', 'ZRH');
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (6, 'Zuerich', 'CHE', 'ZRH');
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (7, 'Chur', 'CHE', 'ZRH');
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (8, 'Flims-Laax', 'CHE', 'ZRH');
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (9, 'Oeludeniz', 'TUR', 'IST');
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (10, 'Antalya', 'TUR', 'IST');
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (11, 'Bordeaux', 'FRA', 'PAR');
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (12, 'Paris', 'FRA', 'PAR');
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (13, 'Disneyland', 'FRA', 'PAR');
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (14, 'Barcelona', 'ESP', 'BCN');
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (15, 'Frankfurt', 'DEU', 'FRA');
INSERT INTO Ort (OrtsID, Ortsname, ISOCode, IATACode) VALUES (16, 'Istanbul', 'TUR', 'IST');

/* DML statements to insert sample data into table Adresse */
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (1, 'Reutestr.', '104', '78467', 1);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (2, 'Hauptstr.', '12', '69115', 3);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (3, 'Schlossstr.', '54', '70173', 2);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (4, 'Alpenstr.', '11', '3001', 5);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (5, 'Seeweg', '23', '8001', 6);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (6, 'Rheingutstr.', '14', '78462', 1);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (7, 'Highway', '5', '2349', 9);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (8, 'Markgraftenstr.', '33', '78461', 1);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (9, 'Zur Piste', '189', '2234', 7);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (10, 'rue Monsieur', '980', '8234', 11);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (11, 'rue de gaulle', '22', '8787', 13);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (12, 'rue de la Maison Blanche', '32', '8792', 12);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (13, 'rue liberte', '78', '8792', 12);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (14, 'Strandweg', '90', '2321', 10);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (15, 'Strandweg', '91', '2321', 10);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (16, 'Calle del torro', '821', '5221', 14);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (17, 'Strandweg', '45', '2321', 10);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (18, 'Europapark', '1', '78231', 4);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (19, 'Seestr.', '12', '78463', 1);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (20, 'Bergweg', '78', '2371', 8);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (21, 'GreenOne', '29', '1352', 6);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (22, 'rue de gaulle', '10', '8787', 13);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (23, 'Am Flughafen', '2', '60541', 15);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (24, 'Sabiha Goekcen', '1', '1452', 16);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (25, 'Flughafen-Allee', '100', '5098', 6);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (26, 'Charles de Gaulle', '1', '8792', 12);
INSERT INTO Adresse (AdressID, Strasse, HausNr, PLZ, OrtsID) VALUES (27, 'Aeropuerto des Barcelona', '10', '08820', 14);

/* DML statements to insert sample data into table Touristenattraktion */
INSERT INTO Touristenattraktion (AttraktionsID, Name, Art, Beschreibung, AdressID) VALUES (1, 'Europapark', 'Freizeitpark', 'Deutschlands Nr. 1', 18);
INSERT INTO Touristenattraktion (AttraktionsID, Name, Art, Beschreibung, AdressID) VALUES (2, 'Hoernle', 'Badestrand', 'Bodensee-Strandbad', 19);
INSERT INTO Touristenattraktion (AttraktionsID, Name, Art, Beschreibung, AdressID) VALUES (3, 'Flims-Laax Arena', 'Skigebiet', NULL, 20);
INSERT INTO Touristenattraktion (AttraktionsID, Name, Art, Beschreibung, AdressID) VALUES (4, 'GreenOne', 'Golfplatz', NULL, 21);
INSERT INTO Touristenattraktion (AttraktionsID, Name, Art, Beschreibung, AdressID) VALUES (5, 'Disneyland', 'Freizeitpark', NULL, 22);

/* DML statements to insert sample data into table Flughafen */
INSERT INTO Flughafen (IATACode, Name, AdressID) VALUES ('FRA', 'Frankfurt', 23);
INSERT INTO Flughafen (IATACode, Name, AdressID) VALUES ('IST', 'Istanbul', 24);
INSERT INTO Flughafen (IATACode, Name, AdressID) VALUES ('PAR', 'Paris', 26);
INSERT INTO Flughafen (IATACode, Name, AdressID) VALUES ('BCN', 'Barcelona', 27);
INSERT INTO Flughafen (IATACode, Name, AdressID) VALUES ('ZRH', 'Zürich', 25);

/* DML statements to insert sample data into table Kunde */
INSERT INTO Kunde (KundenNr, Vorname, Nachname, Geburtsdatum, EMailAdresse, Telefonnummer, AdressID) VALUES (1, 'Karl', 'Napf', '01.01.1960', 'knapf@gmx.de', '07531-123456', 1); 
INSERT INTO Kunde (KundenNr, Vorname, Nachname, Geburtsdatum, EMailAdresse, Telefonnummer, AdressID) VALUES (2, 'Hans', 'Meier', '02.01.1975', 'meiers.hans@t-online.de', '06221-999888', 2); 
INSERT INTO Kunde (KundenNr, Vorname, Nachname, Geburtsdatum, EMailAdresse, Telefonnummer, AdressID) VALUES (3, 'Franz', 'Huber', '03.01.1980', 'huber@t-online.de', '0711-554673', 3); 
INSERT INTO Kunde (KundenNr, Vorname, Nachname, Geburtsdatum, EMailAdresse, Telefonnummer, AdressID) VALUES (4, 'Klaus', 'Eber', '04.01.1985', 'eber@bluewin.ch', '+41-171-9864785', 4); 
INSERT INTO Kunde (KundenNr, Vorname, Nachname, Geburtsdatum, EMailAdresse, Telefonnummer, AdressID) VALUES (5, 'Egon', 'Mooser', '05.01.1990', 'mooser@gmail. com', '+41-171-9864785', 5); 
INSERT INTO Kunde (KundenNr, Vorname, Nachname, Geburtsdatum, EMailAdresse, Telefonnummer, AdressID) VALUES (6, 'Jim', 'Knopf', '06.01.1995', 'jim.knopf@gmx.net', '0171-9876543', 6); 

/* DML statements to insert sample data into table Ferienwohnung */
INSERT INTO Ferienwohnung (WohnungsID, Zimmeranzahl, GroesseQM, PreisTag, Beschreibung, AdressID) VALUES (1 , 6, 200, '349,00', 'Finka', 7);
INSERT INTO Ferienwohnung (WohnungsID, Zimmeranzahl, GroesseQM, PreisTag, Beschreibung, AdressID) VALUES (2 , 2, 45, '120,00', 'Ferienwohnung mit Seeblick', 8);
INSERT INTO Ferienwohnung (WohnungsID, Zimmeranzahl, GroesseQM, PreisTag, Beschreibung, AdressID) VALUES (3 , 3, 150, '249,00', 'im Schnee', 9);
INSERT INTO Ferienwohnung (WohnungsID, Zimmeranzahl, GroesseQM, PreisTag, Beschreibung, AdressID) VALUES (4 , 4, 100, '249,00', 'direkt am Meer', 10);
INSERT INTO Ferienwohnung (WohnungsID, Zimmeranzahl, GroesseQM, PreisTag, Beschreibung, AdressID) VALUES (5 , 3, 110, '289,00', 'direkt am Park', 11);
INSERT INTO Ferienwohnung (WohnungsID, Zimmeranzahl, GroesseQM, PreisTag, Beschreibung, AdressID) VALUES (6 , 2, 70, '549,00', 'mit Blick auf Eiffelturm', 12);
INSERT INTO Ferienwohnung (WohnungsID, Zimmeranzahl, GroesseQM, PreisTag, Beschreibung, AdressID) VALUES (7 , 6, 110, '159,00', 'Dachterrassewohnung zentral', 13);
INSERT INTO Ferienwohnung (WohnungsID, Zimmeranzahl, GroesseQM, PreisTag, Beschreibung, AdressID) VALUES (8 , 12, 200, '240,00', 'zweigeschoessiges Haus', 14);
INSERT INTO Ferienwohnung (WohnungsID, Zimmeranzahl, GroesseQM, PreisTag, Beschreibung, AdressID) VALUES (9 , 5, 111, '159,00', 'Topvilla am Strand', 15);
INSERT INTO Ferienwohnung (WohnungsID, Zimmeranzahl, GroesseQM, PreisTag, Beschreibung, AdressID) VALUES (10 , 4, 100, '299,00', 'Ferienhaus am Strand', 16);
INSERT INTO Ferienwohnung (WohnungsID, Zimmeranzahl, GroesseQM, PreisTag, Beschreibung, AdressID) VALUES (11 , 4, 100, '150,00', 'Strandbungalow', 17);

/* DML statements to insert sample data into table Belegung */
INSERT INTO Belegung (BelegungsID, von, bis, StatusFlag, Belegungsdatum, KundenNr, WohnungsID) VALUES (1, '11.03.2015', '13.03.2015', 'Buchung', '12.02.2015', 2, 4);
INSERT INTO Belegung (BelegungsID, von, bis, StatusFlag, Belegungsdatum, KundenNr, WohnungsID) VALUES (2, '11.05.2015', '17.05.2015', 'Reservierung', '13.03.2015', 2, 5);
INSERT INTO Belegung (BelegungsID, von, bis, StatusFlag, Belegungsdatum, KundenNr, WohnungsID) VALUES (3, '03.04.2015', '23.04.2015', 'Reservierung', '10.02.2015', 3, 5);
INSERT INTO Belegung (BelegungsID, von, bis, StatusFlag, Belegungsdatum, KundenNr, WohnungsID) VALUES (4, '04.07.2015', '05.07.2015', 'Buchung', '09.02.2015', 4, 6);
INSERT INTO Belegung (BelegungsID, von, bis, StatusFlag, Belegungsdatum, KundenNr, WohnungsID) VALUES (5, '28.04.2015', '02.05.2015', 'Reservierung', '14.02.2015', 2, 10);
INSERT INTO Belegung (BelegungsID, von, bis, StatusFlag, Belegungsdatum, KundenNr, WohnungsID) VALUES (6, '04.05.2015', '22.05.2015', 'Buchung', '18.02.2015', 3, 8);
INSERT INTO Belegung (BelegungsID, von, bis, StatusFlag, Belegungsdatum, KundenNr, WohnungsID) VALUES (7, '07.05.2015', '08.05.2015', 'Buchung', '01.02.2015', 1, 2);
INSERT INTO Belegung (BelegungsID, von, bis, StatusFlag, Belegungsdatum, KundenNr, WohnungsID) VALUES (8, '22.05.2015', '28.05.2015', 'Buchung', '11.02.2015', 5, 9);
INSERT INTO Belegung (BelegungsID, von, bis, StatusFlag, Belegungsdatum, KundenNr, WohnungsID) VALUES (9, '03.07.2015', '08.07.2015', 'Buchung', '07.02.2015', 5, 10);
INSERT INTO Belegung (BelegungsID, von, bis, StatusFlag, Belegungsdatum, KundenNr, WohnungsID) VALUES (10, '01.05.2015', '24.05.2015', 'Reservierung', '10.02.2015', 4, 1);

/* DML statements to insert sample data into table Rechnung */
INSERT INTO Rechnung (RechnungsNr, Rechnungsdatum, Betrag, Zahlungseingangsdatum, BelegungsID) VALUES (1, '15.03.2015', '549,00', '18.03.2015', 1);
INSERT INTO Rechnung (RechnungsNr, Rechnungsdatum, Betrag, Zahlungseingangsdatum, BelegungsID) VALUES (2, '26.02.2015', '498,00', NULL, 4);

/* DML statements to insert sample data into table Bilder */
INSERT INTO Bilder (BID, Dateipfad, Beschreibung, WohnungsID) VALUES (1, '[1-1.jpg,Aussenansicht]', 'Aussenansicht1', 1);
INSERT INTO Bilder (BID, Dateipfad, Beschreibung, WohnungsID) VALUES (2, '[1-2.jpg,Innenansicht]', 'Innenansicht1', 1);
INSERT INTO Bilder (BID, Dateipfad, Beschreibung, WohnungsID) VALUES (3, '[2-1.jpg,Aussenansicht]', 'Aussenansicht2', 2);
INSERT INTO Bilder (BID, Dateipfad, Beschreibung, WohnungsID) VALUES (4, '[2-2.jpg,Innenansicht]', 'Innenansicht', 2);
INSERT INTO Bilder (BID, Dateipfad, Beschreibung, WohnungsID) VALUES (5, '[5-1.jpg,Garage]', 'Garage', 5);
INSERT INTO Bilder (BID, Dateipfad, Beschreibung, WohnungsID) VALUES (6, '[8.jpg,Dachterrasse]', 'Dachterrasse', 8);

/* DML statements to insert sample data into table entferntVon */
INSERT INTO entferntVon (Startort, Zielort, km) VALUES (1, 1, 0);
INSERT INTO entferntVon (Startort, Zielort, km) VALUES (1, 4, 180);
INSERT INTO entferntVon (Startort, Zielort, km) VALUES (7, 6, 120);
INSERT INTO entferntVon (Startort, Zielort, km) VALUES (7, 8, 40);
INSERT INTO entferntVon (Startort, Zielort, km) VALUES (11, 13, 420);
INSERT INTO entferntVon (Startort, Zielort, km) VALUES (13, 13, 0);
INSERT INTO entferntVon (Startort, Zielort, km) VALUES (12, 13, 30);

/* DML statements to insert sample data into table fliegtAn */
INSERT INTO fliegtAn (StartFl, ZielFL, FGS) VALUES ('FRA', 'BCN', 'Lufthansa');
INSERT INTO fliegtAn (StartFl, ZielFL, FGS) VALUES ('FRA', 'IST', 'German Wings');
INSERT INTO fliegtAn (StartFl, ZielFL, FGS) VALUES ('FRA', 'PAR', 'German Wings');
INSERT INTO fliegtAn (StartFl, ZielFL, FGS) VALUES ('FRA', 'PAR', 'Lufthansa');
INSERT INTO fliegtAn (StartFl, ZielFL, FGS) VALUES ('FRA', 'PAR', 'Thomas Cook');
INSERT INTO fliegtAn (StartFl, ZielFL, FGS) VALUES ('IST', 'BCN', 'Thomas Cook');
INSERT INTO fliegtAn (StartFl, ZielFL, FGS) VALUES ('PAR', 'BCN', 'Hapag Loyd');
INSERT INTO fliegtAn (StartFl, ZielFL, FGS) VALUES ('PAR', 'ZRH', 'German Wings');

/* DML statements to insert sample data into table besitzen */
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Schwimmbad', 1);
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Sauna', 1);
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Autoabstellplatz', 2);
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Aufzug', 2);
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Sauna', 3);
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Kinderbetreuung', 5);
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Schwimmbad', 5);
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Schwimmbad', 6);
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Schwimmbad', 7);
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Sat-Tv', 8);
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Reinigung', 8);
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Dachterrasse', 8);
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Garage', 9);
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Schwimmbad', 9);
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Schwimmbad', 11);

ALTER TABLE Ort ENABLE CONSTRAINT FK_Ort_Flughafen;
ALTER TABLE Bankverbindung ENABLE CONSTRAINT FK_Bankverbindung_Kunde;

/* Commit the transaction to persist the data inserted, i.e., make insertions durable */
COMMIT;