COLUMN WohnungsID FORMAT 999;
COLUMN von FORMAT A10;
COLUMN bis FORMAT A10;
--Ferienwohnung in der Türkei von 01.05.2015-21.05.2015 belegt

SELECT DISTINCT f.*
FROM Ferienwohnung f, Ort o, Adresse a, Land l, Belegung b, Zusatzausstattung z, besitzen be
-- Land = Frankreich
WHERE f.AdressID = a.AdressID
AND a.OrtsID = o.OrtsID
AND o.ISOCode = l.ISOCode
AND l.Name = 'Tuerkei'
-- Zusatzausstattung = Schwimmbad
AND f.WohnungsID = be.WohnungsID
AND be.Beschreibung = z.Beschreibung
AND z.Beschreibung = 'Schwimmbad'
AND b.WohnungsID = f.WohnungsID
AND ((b.StatusFlag = 'Reservierung') OR (b.StatusFlag = 'Buchung'))
-- Belegung im gewünschten Zeitraum
AND ((b.von BETWEEN '01.05.2015' AND '21.05.2015') OR
	(b.bis BETWEEN '01.05.2015' AND '21.05.2015') OR 
	(b.von <= '01.05.2015' AND b.bis >= '21.05.2015'));