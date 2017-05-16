COLUMN WohnungsID FORMAT 999;

/*SELECT f.WohnungsID
FROM Ferienwohnung f, Ort o1, Ort o2, Adresse a1, Adresse a2, Touristenattraktion t, entferntVon v, Land l
WHERE 
(
f.AdressID = a1.AdressID 
AND a1.OrtsID = o1.OrtsID
AND o1.ISOCode = l.ISOCode
AND l.Name = 'Frankreich'
AND t.Name = 'Disneyland'
AND t.AdressID = a2.AdressID
AND a2.OrtsID = o2.OrtsID
AND o2.OrtsID = v.StartOrt
AND v.ZielOrt = o1.OrtsID
AND v.km <= 100
)
OR
(
f.AdressID = a1.AdressID 
AND a1.OrtsID = o1.OrtsID
AND o1.ISOCode = l.ISOCode
AND l.Name = 'Frankreich'
AND t.Name = 'Disneyland'
AND t.AdressID = a2.AdressID
AND a2.OrtsID = o2.OrtsID
AND o2.OrtsID = v.ZielOrt
AND v.StartOrt = o1.OrtsID
AND v.km <= 100
)
ORDER By f.WohnungsID asc;*/


SELECT f.WohnungsID
FROM Ferienwohnung f, Ort o1, Ort o2, Adresse a1, Adresse a2, Touristenattraktion t, entferntVon v, Land l
WHERE f.AdressID = a1.AdressID 
AND a1.OrtsID = o1.OrtsID
AND o1.ISOCode = l.ISOCode
AND l.Name = 'Frankreich'
AND t.Name = 'Disneyland'
AND t.AdressID = a2.AdressID
AND a2.OrtsID = o2.OrtsID
AND ((o2.OrtsID = v.StartOrt AND v.ZielOrt = o1.OrtsID) OR (o1.OrtsID = v.StartOrt AND v.ZielOrt = o2.OrtsID))
AND v.km <= 100
ORDER By f.WohnungsID asc;