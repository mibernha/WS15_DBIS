COLUMN AnzahlBuchungen FORMAT 9999;
COLUMN Nachname FORMAT A30;

-- Kunde kann raus
SELECT COUNT (*) AS AnzahlBuchungen, k.Nachname
FROM Belegung b, Kunde k
WHERE b.Statusflag = 'Buchung' 
AND b.KundenNr = k.KundenNr 
AND k.KundenNr = &Nr
Group By k.Nachname;