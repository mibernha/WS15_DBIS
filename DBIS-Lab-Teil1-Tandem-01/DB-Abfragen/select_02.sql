COLUMN Nachname FORMAT A20;
COLUMN Vorname FORMAT A20;
COLUMN WohnungsID FORMAT 999;
COLUMN StatusFlag Format A12;


-- FEWO raus
SELECT DISTINCT k.Nachname, k.Vorname, f.WohnungsID, b.StatusFlag
FROM Kunde k, Belegung b, Ferienwohnung f 
WHERE k.KundenNr = b.KundenNr 
AND f.WohnungsID = b.WohnungsID 
AND f.WohnungsID = &id 
AND b.Statusflag = 'Reservierung';