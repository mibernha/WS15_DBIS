COLUMN WohnungsID FORMAT 999;

--Ferienwohnung in der Türkei von 01.05.2015-21.05.2015 frei
(
SELECT f.WohnungsID 
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
)
MINUS
(
SELECT f.WohnungsID
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
	(b.bis BETWEEN '01.05.2015' AND '21.05.2015'))
);