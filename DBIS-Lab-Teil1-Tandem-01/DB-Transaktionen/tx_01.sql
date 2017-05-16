INSERT INTO Adresse (AdressID, Strasse, HausNR, PLZ, OrtsID) VALUES (28, 'Highway', '6', '2349', (SELECT o.OrtsID FROM Ort o WHERE o.Ortsname = 'Oeludeniz'));  
INSERT INTO Ferienwohnung (WohnungsID, Zimmeranzahl, GroesseQM, PreisTag, Beschreibung, AdressID) VALUES (999, 4, 100, 100, 'Sea View', (SELECT a.AdressID FROM Adresse a WHERE a.PLZ = '2349' AND a.Strasse = 'Highway' AND a.HAUSNR = '6'));
INSERT INTO Zusatzausstattung (Beschreibung) VALUES ('Whirpool');
INSERT INTO Zusatzausstattung (Beschreibung) VALUES ('Garten');
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Whirpool', 999);
INSERT INTO besitzen (Beschreibung, WohnungsID) VALUES ('Garten', 999);
COMMIT;