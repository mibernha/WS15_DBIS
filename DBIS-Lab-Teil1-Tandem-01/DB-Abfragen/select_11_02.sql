COLUMN WohnungsID FORMAT 999;
COLUMN AnzahlBuchungen FORMAT 9999;

SELECT f.WohnungsID, count(Wohnungen.WohnungsID) AS AnzahlBuchungen
FROM Ferienwohnung f
FULL OUTER JOIN
(
SELECT f.WohnungsID, b.StatusFlag
FROM Ferienwohnung f, Belegung b, Land la, Ort o, Adresse a
WHERE la.ISOCode = o.ISOCode
AND o.OrtsID = a.OrtsID
AND a.AdressID = f.AdressID
-- alle die eine Belegung haben
AND f.WohnungsID = b.WohnungsID
AND b.StatusFlag = 'Reservierung'
) Wohnungen
ON f.WohnungsID = Wohnungen.WohnungsID
GROUP BY f.WohnungsID
ORDER BY f.WohnungsID asc;