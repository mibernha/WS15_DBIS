/*----------------------------------------------*/
/* 	 			 		*/
/* Databases and Information Systems		*/ 
/* Author: 	Tandem 01			*/
/*		Michael Bernhardt, 291599	*/
/* 		Viktoria Maier, 292140		*/
/* Contact: 					*/
/*	michael.bernhardt@htwg-konstanz.de	*/
/*	viktoria.maier@htwg-konstanz.de		*/
/*----------------------------------------------*/

ReadMe zur Aufgabenstellung zum 1. Praktikumsabschnitt



###########################################################################
1.		Inhaltsverzeichnis
###########################################################################

1. Inhaltsverzeichnis

2. Grundlegende Hinweise

3. Datenbank-Implementierung
	3.1 Datenbank-Schema erstellen
	3.2 Daten einf�gen
	3.3 Daten l�schen
	3.4 Datenbank-Schema l�schen

4. SQL-Abfragen auf die Datenbank
	
5. SQL-Statements f�r Transaktionen 



###########################################################################
2.		Grundlegende Hinweise
###########################################################################


Diese ReadMe erhebt keinen Anspruch auf Vollst�ndigkeit.

Alle Skripte sind im Dateiformat einer SQL-Datei und sind nur voll funktionsf�hig 
auf einem Oracle-Server mit der Version 12c. 

Um die Skripte ausf�hren zu k�nnen ben�tigen Sie SQL*Plus, hierbei melden Sie sich bitte mit
einem g�ltigen Benutzernamen und Kennwort auf dem Oracle Server an.
Tippen Sie nun das '@'-Zeichen (Ohne Hochkommas) in die Konsole und f�gen Sie per Drag&Drop
die gew�nschte SQL-Datei ein und f�hren diese dann mit dr�cken der Eingabetaste aus. 
Ggf. ist es n�tig die Dateien vorher Lokal abzuspeichern und zu entpacken, da es mit 
externen Laufwerken zu Problem kommen kann.


###########################################################################
3.		Datenbank-Implementierung
###########################################################################


�ffnen Sie den Ordner "DB-Implementierung"

3.1 Datenbank-Schema erstellen
	F�hren Sie wie oben beschrieben die Datei "create_db_schema.sql" aus.
	Hierbei werden folgende Tabellen/Views angelegt:
	Tabellen: 
		- Land
		- Fluggesellschaft
		- Bankverbindung
		- Zusatzausstattung
		- Ort
		- Adresse
		- Touristenattraktion
		- Flughafen
		- Kunde
		- Ferienwohnung
		- Belegung
		- Rechnung
		- Bilder
		- entferntVon
		- fliegtAn
		- besitzen
	Views:
		- Buchung
		- Reservierung
		- UebersichtKunden
		- Zahlungstatus
		- MidAgeKunden

3.2 Daten einf�gen
	(Notwendig hierf�r ist das erfolgreiche Ausf�hren von 3.1)
	F�hren Sie wie oben beschrieben die Datei "insert_initial_data.sql" aus.
	Hierbei werden die in 3.1 erstellten Tabellen mit Beispieldaten bef�llt.

3.3 Daten l�schen
	(Notwendig hierf�r ist das erfolgreiche Ausf�hren von 3.1)
	F�hren Sie wie oben beschrieben die Datei "delete_all_data.sql" aus.
	Hierbei werden alle Daten aus den in 3.1 genannten Tabellen gel�scht, 
	es bleibt nur das Schema inklusive Views bestehen.

3.4 Datenbank-Schema l�schen
	F�hren Sie wie oben beschrieben die Datei "drop_db_schema.sql" aus.
	Hierbei wird das in 3.1 erstellte Schema gel�scht, die Datenbank ist damit
	leer, es existieren keine der in 3.1 angelegten Tabellen oder Views mehr.


###########################################################################
4.		SQL-Abfragen auf die Datenbank
###########################################################################


(Notwendig hierf�r ist das erfolgreiche Ausf�hren von 3.1 und 3.2)

�ffnen Sie den Ordner "DB-Abfragen".
Gehen Sie entsprechend der Anleitung weiter oben vor und f�gen Sie die gew�nschte Abfrage
in die Konsole von SQL*Plus ein (SQLPLUS> @select_<Nummer der Abfrage>.sql) und f�hren
Sie diese aus.


###########################################################################
5. 		SQL-Statements f�r Transaktionen 
###########################################################################

(Notwendig hierf�r ist das erfolgreiche Ausf�hren von 3.1 und 3.2)

�ffnen Sie den Ordner "DB-Transaktionen".
F�hren Sie die Datei tx_01 aus um die Datens�tze der Aufgabenstellung hinzuzuf�gen.
F�hren Sie die Datei tx_02 aus um die Datens�tze der Aufgabenstellung upzudaten.
F�hren Sie die Datei tx_03 aus um die Datens�tze der Aufgabenstellung zu l�schen.


