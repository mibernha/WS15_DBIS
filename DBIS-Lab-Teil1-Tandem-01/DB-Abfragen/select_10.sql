COLUMN Name FORMAT A30;
COLUMN AnzahlFws FORMAT 999;

SELECT l.Name, count(buchungen.BelegungsID) AS AnzahlFws
FROM Land l
LEFT OUTER JOIN
(
SELECT la.Name, b.BelegungsID
FROM Ferienwohnung f, Belegung b, Land la, Ort o, Adresse a
-- alle Wohnungen eines Landes
WHERE la.ISOCode = o.ISOCode
AND o.OrtsID = a.OrtsID
AND a.AdressID = f.AdressID
-- alle die eine Belegung haben
AND f.WohnungsID = b.WohnungsID
AND b.StatusFlag IS NOT NULL
) buchungen
ON l.Name = buchungen.Name
GROUP BY l.Name;



