UPDATE Adresse
SET Strasse = 'Schloßstraße', Hausnr = '1', PLZ = '69115', OrtsID = (SELECT o.OrtsID FROM Ort o WHERE o.Ortsname = 'Heidelberg')
WHERE AdressID = (SELECT k.AdressID FROM Kunde k WHERE k.KundenNr = 1);

UPDATE Kunde
SET Telefonnummer = '06221-546372'
WHERE Kundennr = 1;
COMMIT;