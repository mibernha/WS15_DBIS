COLUMN BelegungsID FORMAT 9999;
COLUMN von FORMAT A10;
COLUMN bis FORMAT A10;
COLUMN WohnungsID FORMAT 9999;

SELECT b.BelegungsID, b.von, b.bis, b.WohnungsID 
FROM Ferienwohnung f, Belegung b 
WHERE b.WohnungsID = f.WohnungsID 
AND b.WohnungsID = &id;

SELECT b.BelegungsID, b.von, b.bis, b.WohnungsID 
FROM Belegung b 
WHERE b.WohnungsID = &id;