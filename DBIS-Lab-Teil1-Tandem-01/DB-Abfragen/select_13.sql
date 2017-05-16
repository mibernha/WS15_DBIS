COLUMN StartFl FORMAT A3;
COLUMN ZielFL FORMAT A3;
COLUMN Name FORMAT A30;
COLUMN Servicequalitaetskennzahl 99;

SELECT fa.StartFl, fa. ZielFl, flg.Name, flg.Servicequalitaetskennzahl
FROM Flughafen fl1, Flughafen fl2, Ferienwohnung f, Ort o1, Ort o2, Adresse a1, Adresse a2, Fluggesellschaft flg, fliegtAn fa, Land l1, Land l2
-- alle Orte die einen StartFlughafen haben mit dem man an die gewählte ZielWohnung fliegen kann
WHERE f.WohnungsID = &WohnungsID
AND f.AdressID = a1.AdressID
AND a1.OrtsID = o1.OrtsID
AND o1.ISOCode = l1.ISOCode
AND l1.Name <> l2.Name
AND l2.ISOCode = o2.ISOCode
AND o2.OrtsID = a2.OrtsID
AND a2.AdressID = fl2.AdressID
AND fl2.IATACode = fa.StartFL
AND fa.FGS = flg.Name
AND fl1.IATACode = fa.ZielFL
AND fl1.IATACode = o1.IATACode;

