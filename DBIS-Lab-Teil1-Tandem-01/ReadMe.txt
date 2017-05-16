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
	3.2 Daten einfügen
	3.3 Daten löschen
	3.4 Datenbank-Schema löschen

4. SQL-Abfragen auf die Datenbank
	
5. SQL-Statements für Transaktionen 



###########################################################################
2.		Grundlegende Hinweise
###########################################################################


Diese ReadMe erhebt keinen Anspruch auf Vollständigkeit.

Alle Skripte sind im Dateiformat einer SQL-Datei und sind nur voll funktionsfähig 
auf einem Oracle-Server mit der Version 12c. 

Um die Skripte ausführen zu können benötigen Sie SQL*Plus, hierbei melden Sie sich bitte mit
einem gültigen Benutzernamen und Kennwort auf dem Oracle Server an.
Tippen Sie nun das '@'-Zeichen (Ohne Hochkommas) in die Konsole und fügen Sie per Drag&Drop
die gewünschte SQL-Datei ein und führen diese dann mit drücken der Eingabetaste aus. 
Ggf. ist es nötig die Dateien vorher Lokal abzuspeichern und zu entpacken, da es mit 
externen Laufwerken zu Problem kommen kann.


###########################################################################
3.		Datenbank-Implementierung
###########################################################################


Öffnen Sie den Ordner "DB-Implementierung"

3.1 Datenbank-Schema erstellen
	Führen Sie wie oben beschrieben die Datei "create_db_schema.sql" aus.
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

3.2 Daten einfügen
	(Notwendig hierfür ist das erfolgreiche Ausführen von 3.1)
	Führen Sie wie oben beschrieben die Datei "insert_initial_data.sql" aus.
	Hierbei werden die in 3.1 erstellten Tabellen mit Beispieldaten befüllt.

3.3 Daten löschen
	(Notwendig hierfür ist das erfolgreiche Ausführen von 3.1)
	Führen Sie wie oben beschrieben die Datei "delete_all_data.sql" aus.
	Hierbei werden alle Daten aus den in 3.1 genannten Tabellen gelöscht, 
	es bleibt nur das Schema inklusive Views bestehen.

3.4 Datenbank-Schema löschen
	Führen Sie wie oben beschrieben die Datei "drop_db_schema.sql" aus.
	Hierbei wird das in 3.1 erstellte Schema gelöscht, die Datenbank ist damit
	leer, es existieren keine der in 3.1 angelegten Tabellen oder Views mehr.


###########################################################################
4.		SQL-Abfragen auf die Datenbank
###########################################################################


(Notwendig hierfür ist das erfolgreiche Ausführen von 3.1 und 3.2)

Öffnen Sie den Ordner "DB-Abfragen".
Gehen Sie entsprechend der Anleitung weiter oben vor und fügen Sie die gewünschte Abfrage
in die Konsole von SQL*Plus ein (SQLPLUS> @select_<Nummer der Abfrage>.sql) und führen
Sie diese aus.


###########################################################################
5. 		SQL-Statements für Transaktionen 
###########################################################################

(Notwendig hierfür ist das erfolgreiche Ausführen von 3.1 und 3.2)

Öffnen Sie den Ordner "DB-Transaktionen".
Führen Sie die Datei tx_01 aus um die Datensätze der Aufgabenstellung hinzuzufügen.
Führen Sie die Datei tx_02 aus um die Datensätze der Aufgabenstellung upzudaten.
Führen Sie die Datei tx_03 aus um die Datensätze der Aufgabenstellung zu löschen.


