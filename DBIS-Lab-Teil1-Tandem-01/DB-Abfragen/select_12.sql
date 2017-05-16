COLUMN WohnungsID FORMAT 999;
COLUMN Anzahl FORMAT 9999;

SELECT tmp.WohnungsID, tmp.Anzahl
FROM (	SELECT f.WohnungsID, count(*) as Anzahl
		FROM Ferienwohnung f, Ort o, Land l, Adresse a, Belegung b
		WHERE f.WohnungsID = b.WohnungsID
		AND f.AdressID = a.AdressID
		AND a.OrtsID = o.OrtsID
		AND o.ISOCode = l.ISOCode
		AND l.Name = 'Frankreich'
		GROUP BY f.WohnungsID) tmp
WHERE tmp.Anzahl > 1;	

SELECT f.WohnungsID, count(*) as Anzahl
		FROM Ferienwohnung f, Ort o, Land l, Adresse a, Belegung b
		WHERE f.WohnungsID = b.WohnungsID
		AND f.AdressID = a.AdressID
		AND a.OrtsID = o.OrtsID
		AND o.ISOCode = l.ISOCode
		AND l.Name = 'Frankreich'
		GROUP BY f.WohnungsID
        HAVING count(*) > 1;			

