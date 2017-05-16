COLUMN WohnungsID FORMAT 999;

/*
Welche Ferienwohnungen mit Schwimmbad in Frankreich haben mindestens eine Reservierung (bzw. mindestens eine Buchung bzw. mindestens eine Reservierung oder Buchung)?
*/

SELECT DISTINCT f.*
FROM Ferienwohnung f, Ort o, Adresse a, Land l, Belegung b, Zusatzausstattung z, besitzen be
-- Land = Frankreich
WHERE f.AdressID = a.AdressID
AND a.OrtsID = o.OrtsID
AND o.ISOCode = l.ISOCode
AND l.Name = 'Frankreich'
-- Zusatzausstattung = Schwimmbad
AND f.WohnungsID = be.WohnungsID
AND be.Beschreibung = z.Beschreibung
AND z.Beschreibung = 'Schwimmbad'
-- min. eine Reservierung
AND f.WohnungsID = b.WohnungsID
AND b.StatusFlag = 'Reservierung';

