DELETE FROM Rechnung
WHERE RechnungsNr IN (SELECT r.RechnungsNr FROM Rechnung r, Belegung b
						WHERE r.BelegungsID = b.BelegungsID AND b.WohnungsID = 4);
						
DELETE FROM Belegung 
WHERE WohnungsID = 4;

DELETE FROM Bilder
WHERE WohnungsID = 4;

DELETE FROM besitzen
WHERE WohnungsID = 4;

DELETE FROM Adresse
WHERE AdressID = (SELECT a.AdressID 
    FROM Adresse a, Ferienwohnung f
    WHERE a.AdressID = f.AdressID AND f.WohnungsID = 4);
	
DELETE FROM Ferienwohnung
WHERE WohnungsID = 4;
COMMIT;