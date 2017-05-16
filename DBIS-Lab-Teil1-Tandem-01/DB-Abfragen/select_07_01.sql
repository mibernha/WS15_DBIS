COLUMN WohnungsID FORMAT 999;

-- keine Buchung, keine Reservierung, keine Belegung
(
	SELECT f.WohnungsID
	FROM Ferienwohnung f, Ort o, Adresse a, Land l,Zusatzausstattung z, besitzen be
	-- Land = Frankreich
	WHERE f.AdressID = a.AdressID
	AND a.OrtsID = o.OrtsID
	AND o.ISOCode = l.ISOCode
	AND l.Name = 'Frankreich'
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
	AND l.Name = 'Frankreich'
	-- Zusatzausstattung = Schwimmbad
	AND f.WohnungsID = be.WohnungsID
	AND be.Beschreibung = z.Beschreibung
	AND z.Beschreibung = 'Schwimmbad'
	-- min. eine Reservierung
	AND f.WohnungsID = b.WohnungsID
	AND b.StatusFlag = 'Buchung'
);


(
	SELECT f.WohnungsID
	FROM Ferienwohnung f, Ort o, Adresse a, Land l,Zusatzausstattung z, besitzen be
	-- Land = Frankreich
	WHERE f.AdressID = a.AdressID
	AND a.OrtsID = o.OrtsID
	AND o.ISOCode = l.ISOCode
	AND l.Name = 'Frankreich'
	-- Zusatzausstattung = Schwimmbad
	AND f.WohnungsID = be.WohnungsID
	AND be.Beschreibung = z.Beschreibung
	AND z.Beschreibung = 'Schwimmbad'
)
MINUS
(
	SELECT b.WohnungsID
	FROM Belegung b
	WHERE b.StatusFlag = 'Buchung'
);





SELECT f.*
	FROM Ferienwohnung f, Ort o, Adresse a, Land l,Zusatzausstattung z, besitzen be
	-- Land = Frankreich
	WHERE f.AdressID = a.AdressID
	AND a.OrtsID = o.OrtsID
	AND o.ISOCode = l.ISOCode
	AND l.Name = 'Frankreich'
	-- Zusatzausstattung = Schwimmbad
	AND f.WohnungsID = be.WohnungsID
	AND be.Beschreibung = z.Beschreibung
	AND z.Beschreibung = 'Schwimmbad'
	AND f.WohnungsID NOT IN (SELECT b.WohnungsID FROM Belegung b WHERE b.StatusFlag = 'Buchung');