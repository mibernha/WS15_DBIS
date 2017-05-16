COLUMN AnzahlBuchungen FORMAT 9999;
COLUMN Nachname FORMAT A30;

/*SELECT COUNT (*) AS AnzahlBuchungen, k.KundenNr, k.Nachname
FROM Belegung b, Kunde k
WHERE b.Statusflag = 'Buchung' 
AND b.KundenNr = k.KundenNr 
AND k.Nachname = '&Name'
Group By k.KundenNr, k.Nachname;*/

/* nicht richtig gezählt
SELECT COUNT (*) AS AnzahlBuchungen, k.KundenNr, k.Nachname
FROM Belegung b right outer join Kunde k on (b.Statusflag = 'Buchung' AND b.KundenNr = k.KundenNr)
WHERE k.Nachname = '&Name'
Group By k.KundenNr, k.Nachname; */

SELECT COUNT (b.Statusflag) AS AnzahlBuchungen, k.KundenNr, k.Nachname
FROM Belegung b right outer join Kunde k on (b.Statusflag = 'Buchung' AND b.KundenNr = k.KundenNr)
WHERE k.Nachname = '&Name'
Group By k.KundenNr, k.Nachname;