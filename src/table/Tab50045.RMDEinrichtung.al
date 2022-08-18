table 50045 "RMD Einrichtung"
{
    // P0001-02 22.11.16 DEBIE.ARE RMDUmlagerung nicht buchen
    // P0001-01 09.06.16 DEBIE.ARE Update Qty
    // P0001 29.03.16 DEBIE.ARE New object
    // 
    // //c/gw/10092013 Anpassung in Funktion FTP_Control_RM
    //                 Erstellung und Start des RMDGet.bat jetzt IMMER nicht nur wenn keine .rms vorhanden sind
    //                 DURCH SETZEN VON SEMIKOLON NACH -> IF NOT FileRec.FIND('-') THEN  ; // <- Semikolon Signifikant ...
    //                                                      Start(TRUE, '*.*');
    // 
    // //c/wa/230513: - siehe in Funktion: RMs_Ggf_ZuerstBuchen
    //                  betreff Hidensetzung gewisser Dialoge wegen NAS
    // 
    // ©©©©©©©©©©©©©©©©©©©©©©©©©©©©©©
    // Comsol Unternehmenslösungen AG
    // ©©©©©©©©©©©©©©©©©©©©©©©©©©©©©©
    //   c/gw/100513   >>>  Update V4 -> V6.02 <<
    // 
    // ------------------------------------------------------------------------------------------------------------------------------------
    // c/gw/210911: - LASTERRORTEXT
    //              > Ergänzug in ...
    //                ...  RM_Change_RMD_History(CodeVal : Code[20];ProblemDescription : Text[1024])
    //                     .                                         ------------------
    //                     + ProblemDescription;  // ........................................................ ZUSATZ AM c/gw/210911
    // 
    // 
    // ftp://143-ZAF-RMD:32-JohDa54-dp@www.r-m-d-clients.com
    // //DUE400
    // > Logistikanbindung RMD
    // 
    // ------------------------------------------------------------------------------------------------------------------------------------
    // Beschreibung der Anbindung
    // 
    // Allgemein:
    //    Düperthal setzt den signifikanten "RMD Status" in Lagerkommissionierungen   früher (2.60) Packzettel
    //                                                   in RMD Umlagerungs Buch-Blättern  - interne Kommissionsläger -
    // 
    //    "RMD Status"=freigegeben heißt...
    //    ... wird durch rhythmisch über den Job Scheduler aufgerufenen speziellen Dataport auf dem RMD-ftp-Server bereitgestellt
    //    "RMD Status"=übertragen heißt...
    //    ... wurde durch den rhythmisch über den Job Scheduler aufgerufenen speziellen Dataport auf dem RMD-ftp-Server bereitgestellt
    //    "RMD Status"=rückgemeldet heißt...
    //    ... wurde durch den rhythmisch über den Job Scheduler aufgerufenen speziellen Dataport vom RMD-ftp-Server geholt
    //    "RMD Status"=fehlerhaft rückgemeldet heißt...
    //    ... wurde durch den rhythmisch über den Job Scheduler aufgerufenen speziellen Dataport vom RMD-ftp-Server geholt
    // 
    //    Es werden bestimmte Textfiles an RMD geschickt oder von dort abgeholt...
    //    ... Files mit der Extesion .VA  sind zu versendente <V>ersand<A>ufträge
    //        - aus "Lagerkomissionierungen" oder "RMD Umlagerungs Buch-Blättern"
    //    ... Files mit der Extension .rm sind abzuholende <R>ück<M>eldungen
    //        - mit diesen werden "Lagerkomissionierungen" oder "RMD Umlagerungs Buch-Blättern" rückgemeldet oder fehlerhaft rückgemeldet -
    // 
    //    "RMD Status"="rückgemeldet" bewirkt...
    //    ... bei Lagerkommissionierungen werden Aufträge modifiziert und gebuchte Lieferscheine erzeugt  /  also gebucht
    //        anschliessend wird die jeweilige Lagerkommissionierung gelöscht.
    //    ... bei Umlagerungsbuchblättern  wird die Umlagerung gebucht
    // 
    //    "RMD Status"="fehlerhaft rückgemeldet" heißt...
    //    ... es wird nicht gebucht  - manuele Schritte erforderlich -
    //        HIER KAN MAN IN DER RMD-Historie im Bereich:fehlerhaft GGF. GRÜNDE FÜR DAS FEHLERHAFTE ERKENNEN
    // 
    //    Mit Dataport...
    //       ...50045 RMD.va-Export VersandAuftr-PZ - werden PZ's zu RMD geschickt
    //       ...50046 RMD.rm-Import RückMeldung -PZ-  werden Rückmeldungen von PZ's verarbeitet
    // 
    //       ...50047 RMD.art-Export Artikelstamm werden periodisch Artikeldaten zu RMD geschickt
    // 
    //       ...50048 RMD.bk-Import Best.-Kontrolle werden Bestände abgeglichen, d.h. von RMD
    //          werden die Informationen geholt und den Düperthal-Beständen gegenübergestellt.
    // 
    //       ...50049 RMD.va-Export VersandAuftr-UM- werden die Inhalte von speziellen Umlagerungs-Buchblättern zu RMD geschickt
    //       ...50050 RMD.rm-Import RückMeldung -UM- werden Rückmldungen von speziellen Umlagerungs-Buchblättern verarbeitet
    // 
    //       ...50051 RMD.ova-Import VA-Kontrolle werden offene VA's bei RMD mit denen bei Düperthal angeglichen
    // 
    //    Im RMD-ftp-Verzeichnis
    //       ...DP2RMD landen alle von Düpertal geschickten Files  (Stand:Ende August 2007)
    //       ...RMD2DP werden von Düperthal alle Files abgeholt die von RMD dort bereitgestellt wurden
    // 
    //    Die lokalen Verzeichnisse bei Düperthal sind genauso in die "RMD Einrichtung" einzugeben wie die 2 oben bereits erwähnten
    //    Remote-Verzeichnisse.
    // 
    //    Zum Schicken und Abholen gibt es bei Düperthal sogenannte Allgeine-Verzeichnisse die können z.B. wie folgt heißen
    //    ... EXPORT   hier werden alle ausgehenden Files zuerst gespeichert
    //    ... IMPORT   hier werden alle eingehenden Files zuerst gespeichert
    //    ... ERRORS   nach der fehlhaften Verarbeitung von Rückmeldungen landen diese hier
    // 
    //    ferner gibt es noch Archiv-Verzeichnisse für
    //    ... ARTIKELSTAMM           ... hier landen die Files die zu RMD geschickt wurden   (betreffend Artikelstamm)
    //    ... BESTANDSKONTROLLE      ... hier landen die Files die von RMD geschickt wurden  (betreffend Bestandskontrolle)
    //                                   und eine weitere Verarbeitungsdatei welche beim Abholen der ersten Datei
    //                                   erzeugt wird in der entsprechende Düperthal-Daten den RMD-Daten gegenüber gestellt werden
    //    ... OFFENE-VA KONTROLLE    ... hier landen die Files die von RMD geschickt wurden  (betreffend Kontrolle offener VA's)
    //                                   und eine weitere Verarbeitungsdatei welche beim Abholen der ersten Datei
    //                                   erzeugt wird in der entsprechende Düperthal-Daten den RMD-Daten gegenüber gestellt werden
    //    ... VA-PACKZETTEL          ... hier werden verschickte Lagekommissionierungen(Packzettel) archiviert
    //    ... VA-UMLAGERUNG          ... hier werden verschickte Inhalte aus Umlagerungs-Buch-Blättern archiviert
    //    ... RM-PACKZETTEL          ... hier werden FEHLERFREI rückgemeldete Lagekommissionierungen(Packzettel) archiviert
    //    ... RM-UMLAGERUNG          ... hier werden FEHLERFREI rückgemeldete Inhalte aus Umlagerungs-Buch-Blättern archiviert
    // 
    // ------------------------------------------------------------------------------------------------------------------------------------
    // Spezielle Bemerkungen   !!!  Wichtig  !!! Wichtig  !!!  Wichtig  !!!  Wichtig  !!!  Wichtig  !!!  Wichtig  !!!
    // 
    // 1...
    //    ...Die Rückmeldungen bzw. das Buchen von rückgemeldeten Packzetteln und Umlagerungsbuchblättern geschieht in mehreren Schritten
    // 
    //       Der jeweilge Dataport geht folgend vor ...
    //       ... es wird gepüft ob es rückgemeldete Sachen gibt
    //           WENN JA werden diese gebucht
    //           ANDERNFALLS...
    //                      ... wird geprüft ob es im Allgemeinen Importverzeichnis zu verarbeitende Rückmeldungen gibt
    //                          WENN JA werden diese rückgemeldet
    //                          ANDERNFALLS...
    //                                     ... wird geprüft ob es im RMD-Remotedirectory etwas abzuholen gibt, das im
    //                                         lokalen Importverzeichnis bereitzustellen ist
    //       !!! ES WIRD IN EINEM JOB SCHEDULER STEP ALSO IMMER NUR EINES DER BESCHRIEBENEN DINGE GEMACHT !!!
    // 
    // 2...
    //     ... Die ftp-Zugriffsparameter ( Host, Login und Passwort ) sind hier in diesem Objekt in den Textkonstanten zu finden
    // 
    // 3...
    //     ... Weiteres zukünftig wissenswerte
    //         ...
    //         ...
    //         ...
    //         ...
    // 
    // ES FOLGT EINE AUFLISTUNG ALLER VON DER RMD-ANBINDUNG BETROFFENER OBJEKTE
    // ------------------------------------------------------------------------------------------------------------------------------------
    // > Tanierte Objekte
    // 1 27 Item
    // 1 36 Sales Header
    // 1 82 Item Journal Template
    // 1 83 Item Journal Line
    // 1 110 Sales Shipment Header
    // 1 233 Item Journal Batch
    // 1 5766 Warehouse Activity Header
    // 1 5767 Warehouse Activity Line
    // 1 5770 Warehouse Comment Line
    // 1 5980 Job Scheduler Mgt. Setup
    // 1 5981 Job Scheduler Setup
    // 1 5982 Job Scheduler Log
    // 1 50045 RMD Einrichtung
    // 1 50046 RMDHist Erfolgreich&Fehlerhaft
    // 1 50047 RMD Labelanweisung
    // 1 5005157 RMD Uml.-BuchBlatt-Bemerkungen
    // 2 30Item Card
    // 2 42Sales Order
    // 2 102Item Journal Templates
    // 2 262Item Journal Batches
    // 2 6090Job Scheduler Mgt. Setup
    // 2 6091Job Scheduler Setup
    // 2 6092Job Scheduler Setup List
    // 2 6093Job Scheduler Overview
    // 2 6094Job Scheduler Management
    // 2 6095Job Scheduler Log
    // 2 6097 Error Checking
    // 2 7377 Inventory Pick
    // 2 50044 RMDHist Fehlerhaft
    // 2 50045 RMD Einrichtung
    // 2 50046 RMDHist Erfolgreich
    // 2 50047 RMD Labelanweisung
    // 2 50048 RMD Umlagerungs BuchBlatt
    // 2 50050 RMD Item Journal Templates
    // 2 50051 RMD Item Journal Template List
    // 2 50051 66RMD Uml.-BuchBlatt-Bemerkungen
    // 3 6050 Delete Job Scheduler Log
    // 4 50045 RMD.va-Export VersandAuftr-PZ-
    // 4 50046 RMD.rm-Import RückMeldung -PZ-
    // 4 50047 RMD.art-Export Artikelstamm
    // 4 50048 RMD.bk-Import Best.-Kontrolle
    // 4 50049 RMD.va-Export VersandAuftr-UM-
    // 4 50050 RMD.rm-Import RückMeldung -UM-
    // 4 50051 RMD.ova-Import VA-Kontrolle
    // 5 23 Item Jnl.-Post Batch
    // 5 240 ItemJnlManagement
    // 5 241 Item Jnl.-Post
    // 5 242 Item Jnl.-Post+Print
    // 5 596 1JobScheduler-Run Object
    // 
    // c/gw/261107 RMD-Uml.-Buchblatt Probl.-wird nicht autogebucht
    //             ...  Stichwort:Type  komma
    // 
    // c/gw/210208: - A17068 Katalogversand
    //              > Neue Felder
    //                . 50000 Catalog Order No. Series
    //                . 50001 Special Order Customer No.
    //                . 50002 Catalog Interaction Group code
    //                . 50003 Catalog Interaction Templ.Code
    //                . 50004 Catalog Item
    //                . 50005 Altern. Spec. Order No. Series
    //                . 50006 Altern. Interaction Group Code
    //                . 50007 Altern. Interaction Templ.Code
    // 
    // c/gw/130308: - A17104
    //              > neues Feld
    //                . 50008 Special Order Def.Ship. Agent
    //              > TANGIERTE OBJEKTE ...
    //                ... Table 5050 Contact
    //                ... Table 50045 RMD Einrichtung
    //                ... Form  50045 REM Einrichtung
    // 
    // c/gw/290109: - A17711 "Import Bestellung WÜRTH"
    //              > neues Feld ...
    //                ... 50010 "Bestellung EMail-Import"
    //                ... 50011 "Bestellung Archivpfad"
    // 
    // c/gw/100610: - A19165 Fehlerhandling RMD                                         - Ergänzung: EMailBenachrichtigung an Mitarbeiter -
    //              > Objversand10.06 nach SMTP-Einrichtung gestern durch Herrn Radloff - inkl. Herrn Beermann (DüSi EXTERN) -
    // c/wa/210311: - Feldlänge für Felder mit Tableralation auf USER von 10 auf 20 Zchn. vergrößert


    fields
    {
        field(1; "Primärschlüssel"; Code[10])
        {
        }
        field(2; Erstellungsuser; Code[20])
        {
            Description = 'c/wa/210311 (erweitert auf 20)';
        }
        field(3; Erstellungsdatum; Date)
        {
        }
        field(4; Erstellungszeit; Time)
        {
        }
        field(5; "Änderungsuser"; Code[20])
        {
            Description = 'c/wa/210311 (erweitert auf 20)';
        }
        field(6; "Änderungsdatum"; Date)
        {
        }
        field(7; "Änderungszeit"; Time)
        {
        }
        field(100; "Root Directory"; Code[50])
        {
            Description = 'Dies WAR das LW auf dem sich die RMD-Verzeichnisse beainden  /  AKTUELLER( 5/2013 ) "Root Directory" -> \\s-ts1\        früher->  Lokaler Laufwerksbuchstabe  = C in VorVersion = Code(1)';

            trigger OnValidate()
            begin
                if "Root Directory" = '' then
                    "Root Directory" := 'C';
            end;
        }
        field(105; "NCFTP Directory"; Code[200])
        {
            Description = 'Dies ist das LW auf dem die FTP-Software intalliert ist';

            trigger OnValidate()
            begin
                //c/gw/150513 rausgenommen weils OHNE AUCH GEHT und ich nicht genau weiß ob der BackSlash stört
                /*
                 'IF COPYSTR("NCFTP Directory", STRLEN("NCFTP Directory"),1) <> '\' THEN'
                 '  "NCFTP Directory" := COPYSTR("NCFTP Directory", 1 , MAXSTRLEN("NCFTP Directory")-1) + '\';'
                */

            end;
        }
        field(110; "RemoteDirectory DÜPERTHALtoRMD"; Code[200])
        {
            Description = 'Dies ist das Remote Verzeichnis für Düperthal-Exports';

            trigger OnValidate()
            begin
                if "RemoteDirectory DÜPERTHALtoRMD" = '' then
                    "RemoteDirectory DÜPERTHALtoRMD" := 'DP2RMD';
            end;
        }
        field(120; "RemoteDirectory RMDtoDÜPERTHAL"; Code[200])
        {
            Description = 'Dies ist das Remote Verzeichnis für Düperthal-Imports';

            trigger OnValidate()
            begin
                if "RemoteDirectory RMDtoDÜPERTHAL" = '' then
                    "RemoteDirectory RMDtoDÜPERTHAL" := 'RMD2DP';
            end;
        }
        field(1000; "Allgemeiner Exportpfad"; Code[200])
        {
            Description = 'Hier wird zuerst alles was exportiert werden soll erzeugt';

            trigger OnValidate()
            begin
                if "Allgemeiner Exportpfad" <> '' then begin
                    if ("Allgemeiner Exportpfad" = "VA Archivpfad (Pakzettel)") or
                       ("Allgemeiner Exportpfad" = "VA Archivpfad (Umlagerung)") or
                       ("Allgemeiner Exportpfad" = "RM Archivpfad (Pakzettel)") or
                       ("Allgemeiner Exportpfad" = "RM Archivpfad (Umlagerung)") or
                       ("Allgemeiner Exportpfad" = "ART Archivpfad") or
                       ("Allgemeiner Exportpfad" = "BK Archivpfad") or
                       ("Allgemeiner Exportpfad" = "oVA Archivpfad") or
                       ("Allgemeiner Exportpfad" = "Allgemeiner Pfad  (Fehler)") or
                       ("Allgemeiner Exportpfad" = "Allgemeiner Importpfad")

                       or ("Allgemeiner Exportpfad" = "Bestellung EMail-Importpfad")
                     then
                        Error('Der "Allgemeine Exportpfad" muß ungleich allen anderen Pfaden sein');

                    if CopyStr("Allgemeiner Exportpfad", StrLen("Allgemeiner Exportpfad"), 1) <> '\' then
                        "Allgemeiner Exportpfad" := CopyStr("Allgemeiner Exportpfad", 1, MaxStrLen("Allgemeiner Exportpfad") - 1) + '\';

                end;
            end;
        }
        field(1010; "Allgemeiner Importpfad"; Code[200])
        {
            Description = 'Hier wird zuerst alles was importiert werden soll reingestellt';

            trigger OnValidate()
            begin
                if "Allgemeiner Importpfad" <> '' then begin

                    if ("Allgemeiner Importpfad" = "VA Archivpfad (Pakzettel)") or
                       ("Allgemeiner Importpfad" = "VA Archivpfad (Umlagerung)") or
                       ("Allgemeiner Importpfad" = "RM Archivpfad (Pakzettel)") or
                       ("Allgemeiner Importpfad" = "RM Archivpfad (Umlagerung)") or
                       ("Allgemeiner Importpfad" = "ART Archivpfad") or
                       ("Allgemeiner Importpfad" = "BK Archivpfad") or
                       ("Allgemeiner Importpfad" = "oVA Archivpfad") or
                       ("Allgemeiner Importpfad" = "Allgemeiner Pfad  (Fehler)") or
                       ("Allgemeiner Importpfad" = "Allgemeiner Exportpfad")

                       or ("Allgemeiner Importpfad" = "Bestellung EMail-Importpfad")
                    then
                        Error('Der "Allgemeine Importpfad" muß ungleich allen anderen Pfaden sein');

                    if CopyStr("Allgemeiner Importpfad", StrLen("Allgemeiner Importpfad"), 1) <> '\' then
                        "Allgemeiner Importpfad" := CopyStr("Allgemeiner Importpfad", 1, MaxStrLen("Allgemeiner Importpfad") - 1) + '\';

                end;
            end;
        }
        field(1015; "Allgemeiner Pfad  (Fehler)"; Code[200])
        {
            Description = 'Hierher werden alle fehlerhaften Import-Dateien verschoben';

            trigger OnValidate()
            begin
                if "Allgemeiner Pfad  (Fehler)" <> '' then begin

                    if ("Allgemeiner Pfad  (Fehler)" = "VA Archivpfad (Pakzettel)") or
                       ("Allgemeiner Pfad  (Fehler)" = "VA Archivpfad (Umlagerung)") or
                       ("Allgemeiner Pfad  (Fehler)" = "RM Archivpfad (Pakzettel)") or
                       ("Allgemeiner Pfad  (Fehler)" = "RM Archivpfad (Umlagerung)") or
                       ("Allgemeiner Pfad  (Fehler)" = "ART Archivpfad") or
                       ("Allgemeiner Pfad  (Fehler)" = "BK Archivpfad") or
                       ("Allgemeiner Pfad  (Fehler)" = "oVA Archivpfad") or
                       ("Allgemeiner Pfad  (Fehler)" = "Allgemeiner Importpfad") or
                       ("Allgemeiner Pfad  (Fehler)" = "Allgemeiner Exportpfad")

                       or ("Allgemeiner Pfad  (Fehler)" = "Bestellung EMail-Importpfad")
                    then
                        Error('Der "Allgemeiner Pfad  (Fehler)" muß ungleich allen anderen Pfaden sein');

                    if CopyStr("Allgemeiner Pfad  (Fehler)", StrLen("Allgemeiner Pfad  (Fehler)"), 1) <> '\' then
                        "Allgemeiner Pfad  (Fehler)" := CopyStr("Allgemeiner Pfad  (Fehler)", 1, MaxStrLen("Allgemeiner Pfad  (Fehler)") - 1) + '\';

                end;
            end;
        }
        field(1020; "Letzte verarbeitete Datei"; Text[30])
        {
        }
        field(1030; "Letzte Verarbeitung Datum"; Date)
        {
        }
        field(1040; "Letzte Verarbeitung Zeit"; Time)
        {
        }
        field(2000; "VA Datei-Matchcode"; Text[5])
        {
            Description = 'VA = <Versand> <A>uftrag';
        }
        field(2010; "VA Aktuelle/Letzte Datei"; Text[30])
        {
        }
        field(2030; "VA Letzte Verarbeitung Datum"; Date)
        {
        }
        field(2040; "VA Letzte Verarbeitung Zeit"; Time)
        {
        }
        field(2050; "VA Archivpfad (Pakzettel)"; Code[200])
        {
            Description = 'Dies ist das Verzeichnis in dem "exportierte VA`s aus Packzetteln" archiviert werden';

            trigger OnValidate()
            begin
                if "VA Archivpfad (Pakzettel)" <> '' then begin

                    if ("VA Archivpfad (Pakzettel)" = "Allgemeiner Exportpfad") or
                       ("VA Archivpfad (Pakzettel)" = "Allgemeiner Importpfad") or
                       ("VA Archivpfad (Pakzettel)" = "Allgemeiner Pfad  (Fehler)")
                    then
                        Error('Der "Archivpfad" muß unleich den Allgemeinen Pfaden sein');

                    if CopyStr("VA Archivpfad (Pakzettel)", StrLen("VA Archivpfad (Pakzettel)"), 1) <> '\' then
                        "VA Archivpfad (Pakzettel)" := CopyStr("VA Archivpfad (Pakzettel)", 1, MaxStrLen("VA Archivpfad (Pakzettel)") - 1) + '\';
                end;
            end;
        }
        field(2060; "VA Archivpfad (Umlagerung)"; Code[200])
        {
            Description = 'Dies ist das Verzeichnis in dem "exportierte VA`s aus Umlagerungsbuchblättern" archiviert werden';

            trigger OnValidate()
            begin
                if "VA Archivpfad (Umlagerung)" <> '' then begin

                    if ("VA Archivpfad (Umlagerung)" = "Allgemeiner Exportpfad") or
                       ("VA Archivpfad (Umlagerung)" = "Allgemeiner Importpfad") or
                       ("VA Archivpfad (Umlagerung)" = "Allgemeiner Pfad  (Fehler)")
                    then
                        Error('Der "Archivpfad" muß unleich den Allgemeinen Pfaden sein');

                    if CopyStr("VA Archivpfad (Umlagerung)", StrLen("VA Archivpfad (Umlagerung)"), 1) <> '\' then
                        "VA Archivpfad (Umlagerung)" := CopyStr("VA Archivpfad (Umlagerung)", 1, MaxStrLen("VA Archivpfad (Umlagerung)") - 1) + '\';
                end;
            end;
        }
        field(2070; "VA Anzahl Datenzeilen"; Integer)
        {
        }
        field(2090; "VA Verarbeitungsstatus"; Option)
        {
            OptionMembers = " ",Erfolgreich,Fehlerhaft;
        }
        field(2500; "VA EMail Zuordnungsnr."; Integer)
        {
            Description = 'c-gw-200410: - A19165';
            TableRelation = "EMail per RMD-Beleg Setup";
        }
        field(3000; "RM Datei-Matchcode"; Text[5])
        {
            Description = 'RM = Rückmeldung';
        }
        field(3010; "RM Aktuelle/Letzte Datei"; Text[30])
        {
        }
        field(3030; "RM Letzte Verarbeitung Datum"; Date)
        {
        }
        field(3040; "RM Letzte Verarbeitung Zeit"; Time)
        {
        }
        field(3050; "RM Archivpfad (Pakzettel)"; Code[200])
        {
            Description = 'Dies ist das Verzeichnis in dem "importierte Rückmeldungen aus Packzetteln" archiviert werden';

            trigger OnValidate()
            begin
                if "RM Archivpfad (Pakzettel)" <> '' then begin

                    if ("RM Archivpfad (Pakzettel)" = "Allgemeiner Exportpfad") or
                       ("RM Archivpfad (Pakzettel)" = "Allgemeiner Importpfad") or
                       ("RM Archivpfad (Pakzettel)" = "Allgemeiner Pfad  (Fehler)")
                    then
                        Error('Der "Archivpfad" muß unleich den Allgemeinen Pfaden sein');

                    if CopyStr("RM Archivpfad (Pakzettel)", StrLen("RM Archivpfad (Pakzettel)"), 1) <> '\' then
                        "RM Archivpfad (Pakzettel)" := CopyStr("RM Archivpfad (Pakzettel)", 1, MaxStrLen("RM Archivpfad (Pakzettel)") - 1) + '\';
                end;
            end;
        }
        field(3060; "RM Archivpfad (Umlagerung)"; Code[200])
        {
            Description = 'Dies ist das Verzeichnis in dem "importierte Rückmeldungen aus Umlagerungsbuchblättern" archiviert werden';

            trigger OnValidate()
            begin
                if "RM Archivpfad (Umlagerung)" <> '' then begin

                    if ("RM Archivpfad (Umlagerung)" = "Allgemeiner Exportpfad") or
                       ("RM Archivpfad (Umlagerung)" = "Allgemeiner Importpfad") or
                       ("RM Archivpfad (Umlagerung)" = "Allgemeiner Pfad  (Fehler)")
                    then
                        Error('Der "Archivpfad" muß unleich den Allgemeinen Pfaden sein');

                    if CopyStr("RM Archivpfad (Umlagerung)", StrLen("RM Archivpfad (Umlagerung)"), 1) <> '\' then
                        "RM Archivpfad (Umlagerung)" := CopyStr("RM Archivpfad (Umlagerung)", 1, MaxStrLen("RM Archivpfad (Umlagerung)") - 1) + '\';
                end;
            end;
        }
        field(3070; "RM Anzahl Datenzeilen"; Integer)
        {
        }
        field(3090; "RM Verarbeitungsstatus"; Option)
        {
            OptionMembers = " ",Erfolgreich,Fehlerhaft;
        }
        field(3100; "RM Gewicht (RMD)"; Decimal)
        {
            Description = 'wird in RM''s von RMD zurückgemeldet';
        }
        field(3110; "RM Anzahl Colli (RMD)"; Integer)
        {
            Description = 'wird in RM''s von RMD zurückgemeldet';
        }
        field(3120; "RM Paketnr. (RMD)"; Text[30])
        {
            Description = 'wird in RM''s von RMD zurückgemeldet';
        }
        field(3130; "RM Zusteller (RMD)"; Code[10])
        {
            Description = 'wird in RM''s von RMD zurückgemeldet';
        }
        field(3140; "RM Lieferscheinnr. (RMD)"; Code[20])
        {
            Description = 'wird in RM''s von RMD zurückgemeldet';
        }
        field(3500; "RM EMail Zuordnungsnr."; Integer)
        {
            Description = 'c-gw-200410: - A19165';
            TableRelation = "EMail per RMD-Beleg Setup";
        }
        field(4000; "ART Datei-Matchcode"; Text[5])
        {
            Description = 'ART = Artkelstamm';
        }
        field(4010; "ART Aktuelle/Letzte Datei"; Text[30])
        {
        }
        field(4030; "ART Letzte Verarbeitung Datum"; Date)
        {
        }
        field(4040; "ART Letzte Verarbeitung Zeit"; Time)
        {
        }
        field(4050; "ART Archivpfad"; Code[200])
        {
            Description = 'Dies ist das Verzeichnis in dem "importierte Bestandskontroll-Dateien" archiviert werden';

            trigger OnValidate()
            begin
                if "ART Archivpfad" <> '' then begin

                    if ("ART Archivpfad" = "Allgemeiner Exportpfad") or
                       ("ART Archivpfad" = "Allgemeiner Importpfad") or
                       ("ART Archivpfad" = "Allgemeiner Pfad  (Fehler)")
                    then
                        Error('Der "Archivpfad" muß unleich den Allgemeinen Pfaden sein');

                    if CopyStr("ART Archivpfad", StrLen("ART Archivpfad"), 1) <> '\' then
                        "ART Archivpfad" := CopyStr("ART Archivpfad", 1, MaxStrLen("ART Archivpfad") - 1) + '\';
                end;
            end;
        }
        field(4060; "ART Letzte Jounalnr."; Code[20])
        {
        }
        field(4070; "ART Anzahl Datenzeilen"; Integer)
        {
        }
        field(4090; "ART Verarbeitungsstatus"; Option)
        {
            OptionMembers = " ",Erfolgreich,Fehlerhaft;
        }
        field(4500; "ART EMail Zuordnungsnr."; Integer)
        {
            Description = 'c-gw-200410: - A19165';
            TableRelation = "EMail per RMD-Beleg Setup";
        }
        field(5000; "BK Datei-Matchcode"; Text[5])
        {
            Description = 'BK = Bestandskontrolle';
        }
        field(5005; "BK Extension (Auswertung)"; Text[5])
        {
        }
        field(5010; "BK Aktuelle/Letzte Datei"; Text[30])
        {
        }
        field(5030; "BK Letzte Verarbeitung Datum"; Date)
        {
        }
        field(5040; "BK Letzte Verarbeitung Zeit"; Time)
        {
        }
        field(5050; "BK Archivpfad"; Code[200])
        {

            trigger OnValidate()
            begin
                if "BK Archivpfad" <> '' then begin

                    if ("BK Archivpfad" = "Allgemeiner Exportpfad") or
                       ("BK Archivpfad" = "Allgemeiner Importpfad") or
                       ("BK Archivpfad" = "Allgemeiner Pfad  (Fehler)")
                    then
                        Error('Der "Archivpfad" muß unleich den Allgemeinen Pfaden sein');

                    if CopyStr("BK Archivpfad", StrLen("BK Archivpfad"), 1) <> '\' then
                        "BK Archivpfad" := CopyStr("BK Archivpfad", 1, MaxStrLen("BK Archivpfad") - 1) + '\';
                end;
            end;
        }
        field(5070; "BK Anzahl Datenzeilen"; Integer)
        {
        }
        field(5090; "BK Verarbeitungsstatus"; Option)
        {
            OptionMembers = " ",Erfolgreich,Fehlerhaft;
        }
        field(5500; "BK EMail Zuordnungsnr."; Integer)
        {
            Description = 'c-gw-200410: - A19165';
            TableRelation = "EMail per RMD-Beleg Setup";
        }
        field(6000; "oVA Datei-Matchcode"; Text[5])
        {
            Description = 'oVA = <o>ffene <V>ersand <A>ufträge';
        }
        field(6005; "oVA Extension (Auswertung)"; Text[5])
        {
        }
        field(6010; "oVA Aktuelle/Letzte Datei"; Text[30])
        {
        }
        field(6030; "oVA Letzte Verarbeitung Datum"; Date)
        {
        }
        field(6040; "oVA Letzte Verarbeitung Zeit"; Time)
        {
        }
        field(6050; "oVA Archivpfad"; Code[200])
        {

            trigger OnValidate()
            begin
                if "oVA Archivpfad" <> '' then begin

                    if ("oVA Archivpfad" = "Allgemeiner Exportpfad") or
                       ("oVA Archivpfad" = "Allgemeiner Importpfad") or
                       ("oVA Archivpfad" = "Allgemeiner Pfad  (Fehler)")
                    then
                        Error('Der "Archivpfad" muß unleich den Allgemeinen Pfaden sein');

                    if CopyStr("oVA Archivpfad", StrLen("oVA Archivpfad"), 1) <> '\' then
                        "oVA Archivpfad" := CopyStr("oVA Archivpfad", 1, MaxStrLen("oVA Archivpfad") - 1) + '\';
                end;
            end;
        }
        field(6070; "oVA Anzahl Datenzeilen"; Integer)
        {
        }
        field(6090; "oVA Verarbeitungsstatus"; Option)
        {
            OptionMembers = " ",Erfolgreich,Fehlerhaft;
        }
        field(6500; "oVA EMail Zuordnungsnr."; Integer)
        {
            Description = 'c-gw-200410: - A19165';
            TableRelation = "EMail per RMD-Beleg Setup";
        }
        field(50000; "Catalog Order No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Description = 'c-gw-210208: - A17068';
            TableRelation = "No. Series";
        }
        field(50001; "Special Order Customer No."; Code[20])
        {
            Caption = 'Special Order Customer No.';
            Description = 'c-gw-210208: - A17068';
            TableRelation = Customer;
        }
        field(50002; "Catalog Interaction Group Code"; Code[10])
        {
            Caption = 'Interaction Group Code';
            Description = 'c-gw-210208: - A17068';
            TableRelation = "Interaction Group";
        }
        field(50003; "Catalog Interaction Templ.Code"; Code[10])
        {
            Caption = 'Catalog Interaction Template Code';
            Description = 'c-gw-210208: - A17068';
            TableRelation = "Interaction Template";

            trigger OnValidate()
            begin
                if ("Catalog Interaction Templ.Code" <> '') and ("Catalog Interaction Templ.Code" = "Altern. Interaction Templ.Code") then
                    Error(LocalTxt50001, FieldCaption("Catalog Interaction Templ.Code"), FieldCaption("Altern. Interaction Templ.Code"));
            end;
        }
        field(50004; "Catalog Item"; Code[20])
        {
            Caption = 'Current Catalog Item';
            Description = 'c-gw-210208: - A17068';
            TableRelation = Item;
        }
        field(50005; "Altern. Spec. Order No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Description = 'c-gw-210208: - A17068';
            TableRelation = "No. Series";
        }
        field(50006; "Altern. Interaction Group Code"; Code[10])
        {
            Caption = 'Interaction Group Code';
            Description = 'c-gw-210208: - A17068';
            TableRelation = "Interaction Group";
        }
        field(50007; "Altern. Interaction Templ.Code"; Code[10])
        {
            Caption = 'Alternate Interaction Template Code';
            Description = 'c-gw-210208: - A17068';
            TableRelation = "Interaction Template";

            trigger OnValidate()
            begin
                if ("Altern. Interaction Templ.Code" <> '') and ("Altern. Interaction Templ.Code" = "Catalog Interaction Templ.Code") then
                    Error(LocalTxt50001, FieldCaption("Altern. Interaction Templ.Code"), FieldCaption("Catalog Interaction Templ.Code"));
            end;
        }
        field(50008; "Special Order Def.Ship. Agent"; Code[10])
        {
            Caption = 'Special Order Default Shipping Agent';
            Description = 'c-gw-130308: - A';
            TableRelation = "Shipping Agent";
        }
        field(50010; "Bestellung EMail-Importpfad"; Code[200])
        {
            Description = 'c-gw-290109: - A17711';

            trigger OnValidate()
            begin
                if "Bestellung EMail-Importpfad" <> '' then begin

                    if ("Bestellung EMail-Importpfad" = "VA Archivpfad (Pakzettel)") or
                       ("Bestellung EMail-Importpfad" = "VA Archivpfad (Umlagerung)") or
                       ("Bestellung EMail-Importpfad" = "RM Archivpfad (Pakzettel)") or
                       ("Bestellung EMail-Importpfad" = "RM Archivpfad (Umlagerung)") or
                       ("Bestellung EMail-Importpfad" = "ART Archivpfad") or
                       ("Bestellung EMail-Importpfad" = "BK Archivpfad") or
                       ("Bestellung EMail-Importpfad" = "oVA Archivpfad") or
                       ("Bestellung EMail-Importpfad" = "Allgemeiner Pfad  (Fehler)") or
                       ("Bestellung EMail-Importpfad" = "Allgemeiner Exportpfad")

                       or ("Bestellung EMail-Importpfad" = "Allgemeiner Importpfad")
                    then
                        Error('Der "Bestellung EMail-Importpfad" muß ungleich allen anderen Pfaden sein');

                    if CopyStr("Bestellung EMail-Importpfad", StrLen("Bestellung EMail-Importpfad"), 1) <> '\' then
                        "Bestellung EMail-Importpfad" := CopyStr("Bestellung EMail-Importpfad", 1, MaxStrLen("Bestellung EMail-Importpfad") - 1) + '\';

                end;
            end;
        }
        field(50011; "Bestellung Archivpfad"; Code[200])
        {
            Description = 'c-gw-290109: - A17711';

            trigger OnValidate()
            begin
                if "Bestellung Archivpfad" <> '' then begin

                    if ("Bestellung Archivpfad" = "Allgemeiner Exportpfad") or
                       ("Bestellung Archivpfad" = "Allgemeiner Importpfad") or
                       ("Bestellung Archivpfad" = "Allgemeiner Pfad  (Fehler)")
                    then
                        Error('Der "Archivpfad" muß unleich den Allgemeinen Pfaden sein');

                    if CopyStr("Bestellung Archivpfad", StrLen("Bestellung Archivpfad"), 1) <> '\' then
                        "Bestellung Archivpfad" :=
                          CopyStr("Bestellung Archivpfad", 1, MaxStrLen("Bestellung Archivpfad") - 1) + '\';
                end;
            end;
        }
        field(50510; "Spec Order EMail Zuordnungsnr."; Integer)
        {
            Description = 'c-gw-200410: - A19165';
            TableRelation = "EMail per RMD-Beleg Setup";
        }
        field(50520; "Bestellung EMail Zuordnungsnr."; Integer)
        {
            Description = 'c-gw-200410: - A19165';
            TableRelation = "EMail per RMD-Beleg Setup";
        }
    }

    keys
    {
        key(Key1; "Primärschlüssel")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Error('');
    end;

    trigger OnInsert()
    begin
        TestField(Primärschlüssel, '');
        Erstellungsuser := UserId;
        Erstellungsdatum := Today;
        Erstellungszeit := Time;
        "Root Directory" := 'C';
        "RemoteDirectory DÜPERTHALtoRMD" := 'DP2RMD';
        "RemoteDirectory RMDtoDÜPERTHAL" := 'RMD2DP';
        "VA Datei-Matchcode" := '*.va';
        "RM Datei-Matchcode" := '*.rm';
        "ART Datei-Matchcode" := '*.art';
        "BK Datei-Matchcode" := '*.bk';
        "ART Letzte Jounalnr." := '00000000000000000000';
    end;

    trigger OnModify()
    begin
        Änderungsuser := UserId;
        Änderungsdatum := Today;
        Änderungszeit := Time;
    end;

    var
        Host: Label 'ftp://webvftvqb.wh.hosting.zone';
        Login: Label 'webvftvqb_f6snta';
        Passwort: Label '5(g5uH4J)o';
        //"c-gw-210208: - A17068": ;
        LocalTxt50001: Label '1% may not be equal to 2%';
        laufwerkObsolete: Label '\\s-ts1\';
        Test: Label 'ftp://home119525691.1and1-data.host';

    //[Scope('OnPrem')]
    // procedure FTP_Control_ART()
    // var
    //     FileRec: Record File;
    // begin
    //     ClearDirectory(FileRec);
    //     FileRec.SetRange(Path, StrSubstNo('%1%2', "Root Directory", "Allgemeiner Exportpfad"));
    //     FileRec.SetRange("Is a file", true);
    //     FileRec.SetFilter(Name, StrSubstNo('%1%2', '@', "ART Datei-Matchcode"));
    //     if FileRec.Find('-') then
    //         repeat
    //             StartFile(false, FileRec.Path + FileRec.Name, FileRec.Name); // FALSE = not Import

    //             if FILE.Copy(FileRec.Path + FileRec.Name, StrSubstNo('%1%2%3', "Root Directory", "ART Archivpfad", FileRec.Name)) then
    //                 Erase(FileRec.Path + FileRec.Name);
    //         until FileRec.Next = 0;
    // end;

    //[Scope('OnPrem')]
    // procedure FTP_Control_VA()
    // var
    //     FileRec: Record File;
    //     ArtikelBuchBlattVorlageRec: Record "Item Journal Template";
    // begin
    //     ClearDirectory(FileRec);
    //     FileRec.SetRange(Path, StrSubstNo('%1%2', "Root Directory", "Allgemeiner Exportpfad"));
    //     FileRec.SetRange("Is a file", true);
    //     FileRec.SetFilter(Name, StrSubstNo('%1%2', '@', "VA Datei-Matchcode"));
    //     if FileRec.Find('-') then
    //         repeat
    //             StartFile(false, FileRec.Path + FileRec.Name, FileRec.Name);

    //             ArtikelBuchBlattVorlageRec.SetRange(Type, ArtikelBuchBlattVorlageRec.Type::RMDUmlagerung);
    //             if ArtikelBuchBlattVorlageRec.Get(DelChr(CopyStr(FileRec.Name, 1, 10), '>', '_')) then begin

    //                 if FILE.Copy(FileRec.Path + FileRec.Name
    //                             , StrSubstNo('%1%2%3', "Root Directory", "VA Archivpfad (Umlagerung)", FileRec.Name))
    //                 then
    //                     Erase(FileRec.Path + FileRec.Name);
    //             end else begin

    //                 if FILE.Copy(FileRec.Path + FileRec.Name
    //                             , StrSubstNo('%1%2%3', "Root Directory", "VA Archivpfad (Pakzettel)", FileRec.Name))
    //                 then
    //                     Erase(FileRec.Path + FileRec.Name);
    //             end;
    //         until FileRec.Next = 0;
    // end;

    //[Scope('OnPrem')]
    // procedure FTP_Control_RM(var FileRec: Record File): Boolean
    // var
    //     ArtikelBuchBlattVorlageRec: Record "Item Journal Template";
    // begin
    //     RMs_Ggf_ZuerstBuchen;   // <- betreff ältere bereits rückgemeldete

    //     ClearDirectory(FileRec);
    //     FileRec.SetRange(Path, StrSubstNo('%1%2', "Root Directory", "Allgemeiner Importpfad"));
    //     FileRec.SetRange("Is a file", true);
    //     FileRec.SetFilter(Name, StrSubstNo('%1%2', '@', "RM Datei-Matchcode"));
    //     if not FileRec.Find('-') then; // <- Semikolon Signifikant   // Habe es eingesetzt weil sonst nicht von RMD abgeholt wird,
    //     StartFiles(true, '*.*', '');                                          // z. B. (wie passiert) Umbuchungen manuell erledigt (gebucht) werden
    //                                                                           // und das zurückkommende .rm-File im Import nicht manuell verschoben
    //     ClearDirectory(FileRec);                                       // wird, dort sozusagen hängen bleibt   >>>   //c/gw/10092013   <<<
    //     FileRec.SetRange(Path, StrSubstNo('%1%2', "Root Directory", "Allgemeiner Importpfad"));
    //     FileRec.SetRange("Is a file", true);
    //     FileRec.SetFilter(Name, StrSubstNo('%1%2', '@', "RM Datei-Matchcode"));
    //     exit(FileRec.Find('-'));
    // end;

    //[Scope('OnPrem')]
    procedure RMs_Ggf_ZuerstBuchen()
    var
        WhseActivityPostCU: Codeunit "Whse.-Activity-Post";
        WarehouseActivityHeaderRec: Record "Warehouse Activity Header";
        WarehouseActivityLineRec: Record "Warehouse Activity Line";
        WarehouseActivityLineUpd: Record "Warehouse Activity Line";
        WarehouseActivityHeaderBuchRec: Record "Warehouse Activity Header";
        ArtikelBuchBlattVorlageRec: Record "Item Journal Template";
        ArtikelBuchBlattNameRec: Record "Item Journal Batch";
        ArtikelBuchBlattNameRec2: Record "Item Journal Batch";
        ArtikelBuchBlattzeileRec: Record "Item Journal Line";
        Item: Record Item;
    begin
        begin // Kommissionierung
            WarehouseActivityHeaderRec.SetCurrentKey("RMD Status");
            WarehouseActivityHeaderRec.SetRange("RMD Status", WarehouseActivityHeaderRec."RMD Status"::"rückgemeldet");
            WarehouseActivityHeaderRec.SetRange(Type, WarehouseActivityHeaderRec.Type::"Invt. Pick");
            if WarehouseActivityHeaderRec.Find('-') then begin
                repeat
                    // >> P0001-01
                    WarehouseActivityLineUpd.SetRange("Activity Type", WarehouseActivityHeaderRec.Type);
                    WarehouseActivityLineUpd.SetRange("No.", WarehouseActivityHeaderRec."No.");
                    WarehouseActivityLineUpd.SetFilter("Qty. Outstanding", '>%1', 0);
                    if WarehouseActivityLineUpd.FindSet then begin
                        repeat
                            if WarehouseActivityLineUpd."Qty. to Handle" <> WarehouseActivityLineUpd."Qty. Outstanding" then begin
                                Item.Get(WarehouseActivityLineUpd."Item No.");
                                if Item."Without Inventory Control" then begin
                                    WarehouseActivityLineUpd.Validate("Qty. to Handle", WarehouseActivityLineUpd."Qty. Outstanding");
                                    WarehouseActivityLineUpd.Modify(true);
                                end;
                            end;
                        until WarehouseActivityLineUpd.Next = 0;
                    end;
                    Commit;
                    // << P0001-01

                    WarehouseActivityHeaderBuchRec.SetRange("No.", WarehouseActivityHeaderRec."No.");
                    WarehouseActivityHeaderBuchRec.SetRange(Type, WarehouseActivityHeaderRec.Type::"Invt. Pick");

                    Clear(WhseActivityPostCU);
                    WarehouseActivityLineRec.SetRange(WarehouseActivityLineRec."Activity Type", WarehouseActivityHeaderRec.Type);
                    WarehouseActivityLineRec.SetRange(WarehouseActivityLineRec."No.", WarehouseActivityHeaderRec."No.");
                    if WarehouseActivityLineRec.Find('-') then; // *** important ***
                    WhseActivityPostCU.SetInvoiceSourceDoc(false);
                    WhseActivityPostCU.PrintDocument(false);
                    WhseActivityPostCU.ShowHideDialog(true);  //c/wa/230513
                    if not (WhseActivityPostCU.Run(WarehouseActivityLineRec)) then begin
                        WarehouseActivityHeaderRec."RMD Status" := WarehouseActivityHeaderRec."RMD Status"::"fehlerhaft rückgemeldet";
                        WarehouseActivityHeaderRec.Modify;
                        RM_Change_RMD_History(WarehouseActivityHeaderRec."No.", GetLastErrorText);
                    end;
                    Commit;
                until WarehouseActivityHeaderRec.Next = 0;
            end;
        end; // Kommissionierung

        // >> P0001-02
        // BEGIN // RMDUmlagerung Artikel Buch.-blätter
        //  ArtikelBuchBlattVorlageRec.SETRANGE(Type, ArtikelBuchBlattVorlageRec.Type::RMDUmlagerung);
        //  IF ArtikelBuchBlattVorlageRec.FIND('-') THEN
        //    REPEAT
        //      ArtikelBuchBlattNameRec.SETRANGE("Journal Template Name", ArtikelBuchBlattVorlageRec.Name);
        //      IF ArtikelBuchBlattNameRec.FIND('-') THEN
        //        REPEAT
        //          IF ArtikelBuchBlattNameRec."RMD Status" = ArtikelBuchBlattNameRec."RMD Status"::rückgemeldet THEN BEGIN
        //
        //            ArtikelBuchBlattNameRec2 := ArtikelBuchBlattNameRec;
        //
        //            ArtikelBuchBlattzeileRec.SETRANGE("Journal Template Name", ArtikelBuchBlattNameRec."Journal Template Name");
        //            ArtikelBuchBlattzeileRec.SETRANGE("Journal Batch Name", ArtikelBuchBlattNameRec.Name);
        //            IF ArtikelBuchBlattzeileRec.FIND('-') THEN BEGIN
        //              IF NOT CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post Batch",ArtikelBuchBlattzeileRec) THEN BEGIN
        //                IF ArtikelBuchBlattNameRec2.FIND('-') THEN BEGIN
        //                  RM_Change_RMD_History(STRSUBSTNO( '%1%2'
        //                                                  , PADSTR(ArtikelBuchBlattNameRec."Journal Template Name", 10, '_')
        //                                                  , PADSTR(ArtikelBuchBlattNameRec.Name, 10, '_') ), GETLASTERRORTEXT);
        //                  ArtikelBuchBlattNameRec2."RMD Status" := ArtikelBuchBlattNameRec."RMD Status"::"fehlerhaft rückgemeldet";
        //                  ArtikelBuchBlattNameRec2.MODIFY;
        //                  COMMIT;
        //                END;
        //              END;
        //            END;
        //          END;
        //        UNTIL ArtikelBuchBlattNameRec.NEXT = 0;
        //    UNTIL ArtikelBuchBlattVorlageRec.NEXT = 0;
        // END; // RMDUmlagerung Artikel Buch.-blätter
        // << P0001-02
    end;

    //[Scope('OnPrem')]
    procedure RM_Change_RMD_History(CodeVal: Code[20]; ProblemDescription: Text[1024])
    var
        RMDHistRec: Record "RMDHist Erfolgreich&Fehlerhaft";
        RMDHistTempRec: Record "RMDHist Erfolgreich&Fehlerhaft" temporary;
        LastHistNo: Integer;
    begin
        RMDHistRec.SetCurrentKey(Relationcode, Richtung, Datum, Zeit);
        RMDHistRec.Ascending := false;       // < ****** because *********
        RMDHistRec.SetRange(Relationcode, CodeVal);                  //  *
        RMDHistRec.SetRange(Richtung, RMDHistRec.Richtung::Import);  //  *
        if RMDHistRec.Find('-') then begin     /*- Findet den zuletzt importortierten Rec mit entspr. Relationscode (eigentlich Unique)*/
            RMDHistTempRec := RMDHistRec;        /*- Der Form halber temporär                                                            */
            RMDHistTempRec."Record Type" := RMDHistTempRec."Record Type"::Fehlerhaft;  // < *******
                                                                                       // STRING                   Length
            if StrLen(ProblemDescription) > MaxStrLen(RMDHistTempRec.Bemerkung) - 25 then begin  // < ---- desh. 25-------   ------
                ProblemDescription :=                                                            //
                  CopyStr(ProblemDescription, 1, MaxStrLen(RMDHistTempRec.Bemerkung) - 25) + '...';// '...'                    =  3
            end;                                                                               //                             .
            RMDHistTempRec.Bemerkung := 'Fehler beim Buchen!!! '                     // *      // 'Fehler beim Buchen!!! ' = 22 Totallength=25
                                      + ProblemDescription;                          //   ZUSATZ AM c/gw/210911                  =============
            if RMDHistRec.Delete then begin      /*- weil Primary = "Record Type", "Lfd.-Nr"       *                                     */
                Clear(RMDHistRec);                                                              //  *
                RMDHistRec.SetRange("Record Type", RMDHistTempRec."Record Type");        // < *******
                if not RMDHistRec.Find('+') then
                    Clear(RMDHistRec);
                RMDHistTempRec."Lfd.-Nr" := RMDHistRec."Lfd.-Nr" + 1;
                if FILE.Copy(StrSubstNo('%1%2%3', "Root Directory", RMDHistTempRec."Pfad  (Archivierung)", RMDHistTempRec.Datei)
                            , StrSubstNo('%1%2%3', "Root Directory", "Allgemeiner Pfad  (Fehler)", RMDHistTempRec.Datei))
                then
                    Erase(StrSubstNo('%1%2%3', "Root Directory", RMDHistTempRec."Pfad  (Archivierung)", RMDHistTempRec.Datei));
                RMDHistTempRec."Pfad  (Archivierung)" := "Allgemeiner Pfad  (Fehler)";
                RMDHistRec := RMDHistTempRec;
                // Test ARE
                RMDHistRec.Insert(true);
            end;
        end;

    end;

    //[Scope('OnPrem')]
    // procedure FTP_Control_BK(var FileRec: Record File): Boolean
    // begin
    //     ClearDirectory(FileRec);
    //     FileRec.SetRange(Path, StrSubstNo('%1%2', "Root Directory", "Allgemeiner Importpfad"));
    //     FileRec.SetRange("Is a file", true);
    //     FileRec.SetFilter(Name, StrSubstNo('%1*%2', '@', "RM Datei-Matchcode"));
    //     if not FileRec.Find('-') then begin

    //         ClearDirectory(FileRec);
    //         FileRec.SetRange(Path, StrSubstNo('%1%2', "Root Directory", "Allgemeiner Importpfad"));
    //         FileRec.SetRange("Is a file", true);
    //         FileRec.SetFilter(Name, StrSubstNo('%1%2', '@', "BK Datei-Matchcode"));
    //         if not FileRec.Find('-') then begin
    //             StartFiles(true, '*.*', '');

    //             ClearDirectory(FileRec);
    //             FileRec.SetRange(Path, StrSubstNo('%1%2', "Root Directory", "Allgemeiner Importpfad"));
    //             FileRec.SetRange("Is a file", true);
    //             FileRec.SetFilter(Name, StrSubstNo('%1*%2', '@', "RM Datei-Matchcode"));
    //             if not FileRec.Find('-') then begin

    //                 ClearDirectory(FileRec);
    //                 FileRec.SetRange(Path, StrSubstNo('%1%2', "Root Directory", "Allgemeiner Importpfad"));
    //                 FileRec.SetRange("Is a file", true);
    //                 FileRec.SetFilter(Name, StrSubstNo('%1*%2', '@', "BK Datei-Matchcode"));
    //                 exit(FileRec.Find('-'));

    //             end else
    //                 exit(false); // Weil erst einmal alle anderen Sachen bearbeitet werden müssen  · am Ende kommt BK zu Zuge

    //         end else
    //             exit(true);

    //     end else
    //         exit(false); // Weil erst einmal alle anderen Sachen bearbeitet werden müssen  · am Ende kommt BK zu Zuge
    // end;

    //[Scope('OnPrem')]
    // procedure FTP_Control_oVA(var FileRec: Record File): Boolean
    // begin
    //     ClearDirectory(FileRec);
    //     FileRec.SetRange(Path, StrSubstNo('%1%2', "Root Directory", "Allgemeiner Importpfad"));
    //     FileRec.SetRange("Is a file", true);
    //     FileRec.SetFilter(Name, StrSubstNo('%1*%2', '@', "RM Datei-Matchcode"));
    //     if not FileRec.Find('-') then begin

    //         ClearDirectory(FileRec);
    //         FileRec.SetRange(Path, StrSubstNo('%1%2', "Root Directory", "Allgemeiner Importpfad"));
    //         FileRec.SetRange("Is a file", true);
    //         FileRec.SetFilter(Name, StrSubstNo('%1%2', '@', "oVA Datei-Matchcode"));
    //         if not FileRec.Find('-') then begin
    //             StartFiles(true, '*.*', '');

    //             ClearDirectory(FileRec);
    //             FileRec.SetRange(Path, StrSubstNo('%1%2', "Root Directory", "Allgemeiner Importpfad"));
    //             FileRec.SetRange("Is a file", true);
    //             FileRec.SetFilter(Name, StrSubstNo('%1*%2', '@', "RM Datei-Matchcode"));
    //             if not FileRec.Find('-') then begin
    //                 ClearDirectory(FileRec);
    //                 FileRec.SetRange(Path, StrSubstNo('%1%2', "Root Directory", "Allgemeiner Importpfad"));
    //                 FileRec.SetRange("Is a file", true);
    //                 FileRec.SetFilter(Name, StrSubstNo('%1*%2', '@', "oVA Datei-Matchcode"));
    //                 exit(FileRec.Find('-'));

    //             end else
    //                 exit(false); // Weil erst einmal alle anderen Sachen bearbeitet werden müssen  · am Ende kommt BK zu Zuge

    //         end else
    //             exit(true);

    //     end else
    //         exit(false); // Weil erst einmal alle anderen Sachen bearbeitet werden müssen  · am Ende kommt BK zu Zuge
    // end;

    //[Scope('OnPrem')]
    // procedure StartFile(Import: Boolean; FileList: Text; FileName: Text)
    // var
    //     Dummy: Integer;
    //     StartBatch: File;
    //     WshShell: Automation;
    //     WshMode: Integer;
    //     WaitForEndOfCommand: Boolean;
    //     ReturnCode: Integer;
    //     ConstDiskFileName: Text[1024];
    //     FromDiskFileName: Text[1024];
    //     FileMgt: Codeunit "File Management";
    // begin
    //     if Import then
    //         DownloadFile(Host + '/' + "RemoteDirectory RMDtoDÜPERTHAL" + '/' + FileName, FileList, Login, Passwort, true)
    //     else
    //         UploadFile(FileList, Host + '/' + "RemoteDirectory DÜPERTHALtoRMD" + '/' + FileName, Login, Passwort);
    // end;

    //[Scope('OnPrem')]
    // procedure StartFiles(Import: Boolean; FileList: Text; FileName: Text)
    // var
    //     Dummy: Integer;
    //     StartBatch: File;
    //     WshShell: Automation;
    //     WshMode: Integer;
    //     WaitForEndOfCommand: Boolean;
    //     ReturnCode: Integer;
    //     ConstDiskFileName: Text[1024];
    //     FromDiskFileName: Text[1024];
    //     FileMgt: Codeunit "File Management";
    // begin
    //     if Import then
    //         DownloadFiles(Host + '/' + "RemoteDirectory RMDtoDÜPERTHAL" + '/', "Root Directory" + '/' + "Allgemeiner Importpfad", Login, Passwort)
    //     else
    //         UploadFiles(FileList, Host + '/' + "RemoteDirectory DÜPERTHALtoRMD", Login, Passwort);
    // end;

    //[Scope('OnPrem')]
    // procedure ClearDirectory(var FileRec: Record File)
    // begin
    //     FileRec.SetRange(Path, 'C:\');
    //     FileRec.SetRange(Name, '*.*');
    //     if FileRec.Find('-') then;     // FIND ist hier wichtig unbedingt drinlassen
    // end;

    // //[Scope('OnPrem')]
    // procedure "------------------------------"()
    // begin
    // end;

    // //[Scope('OnPrem')]
    // procedure Transfer2GailingFTP(FileList: Text[250])
    // var
    //     Dummy: Integer;
    //     StartBatch: File;
    //     SalesReceivablesSetupRec: Record "Sales & Receivables Setup";
    //     GAILING: Label 'ftp://217.5.203.42/dueperthal';
    //     Host: Label '217.5.203.42';
    //     Login: Label 'dueperthalftp';
    //     PW: Label 'ki37ut2p';
    //     "RemoteDirectory DUEP2GAILING": Label 'ftp:/düperthal';
    // begin
    //     SalesReceivablesSetupRec.Get;
    //     StartBatch.WriteMode(true);
    //     StartBatch.TextMode(true);
    //     StartBatch.Create(StrSubstNo('%1GailPut.bat', SalesReceivablesSetupRec.Datenbereitstellungspfad));
    //     StartBatch.Write('@setlocal');
    //     StartBatch.Write('set confirm-close=no');
    //     StartBatch.Write('set NCFTPDIR=' + "NCFTP Directory"); // kann doch ins Feld mit rein, desh. HIER RAUS -> + 'Users'...'Users-Test');
    //     StartBatch.Write('@echo off');
    //     StartBatch.Write('ncftpput.exe'
    //                     + ' -u ' + Login
    //                     + ' -p ' + Passwort
    //                     + ' -a'
    //                     + ' ' + Host
    //                     + ' ' + "RemoteDirectory DUEP2GAILING"
    //                     + ' ' + FileList);
    //     StartBatch.Write('@echo on');
    //     StartBatch.Write('@endlocal');
    //     StartBatch.Close;

    //     if Shell(StrSubstNo('%1GailPut.bat', "Root Directory", SalesReceivablesSetupRec.Datenbereitstellungspfad)) = Dummy then;
    // end;

    //[Scope('OnPrem')]
    // procedure ____________________()
    // begin
    // end;

    // //[Scope('OnPrem')]
    // procedure KOMMENTAR()
    // begin
    // end;

    //     local procedure UploadFile(FileNameToUpload: Text; UploadToFtp: Text; Login: Text; Password: Text)
    //     var
    //         FTPRequest: DotNet FtpWebRequest;
    //         Credentials: DotNet NetworkCredential;
    //         RealFileStream: DotNet FileStream;
    //         FileStream: DotNet File;
    //         SimpleStream: DotNet Stream;
    //     begin
    //         FTPRequest := FTPRequest.Create(UploadToFtp);
    //         Credentials := Credentials.NetworkCredential(Login, Password);
    //         FTPRequest.Credentials := Credentials;

    //         FTPRequest.KeepAlive := true;
    //         FTPRequest.Method := 'STOR';
    //         FTPRequest.UsePassive := true;
    //         FTPRequest.UseBinary := true;
    //         FTPRequest.UsePassive := false;

    //         RealFileStream := FileStream.OpenRead(FileNameToUpload);
    //         SimpleStream := FTPRequest.GetRequestStream;
    //         RealFileStream.CopyTo(SimpleStream);
    //         SimpleStream.Close;
    //         RealFileStream.Close;
    //     end;

    //     //[Scope('OnPrem')]
    //     procedure DownloadFile(FTPAddressFile: Text; DownloadToFile: Text; Login: Text; Password: Text; DeleteAfterDownload: Boolean)
    //     var
    //         FTPRequest: DotNet FtpWebRequest;
    //         Credentials: DotNet NetworkCredential;
    //         FileStream: DotNet File;
    //         SimpleStream: DotNet Stream;
    //         FTPResponse: DotNet FtpWebResponse;
    //         ResponseStream: DotNet Stream;
    //     begin
    //         if IsFolder(FTPAddressFile) then
    //             exit;

    //         FTPRequest := FTPRequest.Create(FTPAddressFile);
    //         Credentials := Credentials.NetworkCredential(Login, Password);
    //         FTPRequest.Credentials := Credentials;

    //         FTPRequest.KeepAlive := true;
    //         FTPRequest.Method := 'RETR';
    //         FTPRequest.UsePassive := true;
    //         FTPRequest.UseBinary := true;
    //         FTPRequest.UsePassive := false;

    //         FTPResponse := FTPRequest.GetResponse;
    //         ResponseStream := FTPResponse.GetResponseStream();
    //         SimpleStream := FileStream.Create(DownloadToFile);
    //         ResponseStream.CopyTo(SimpleStream);
    //         SimpleStream.Close;
    //         ResponseStream.Close;
    //         FTPResponse.Close;
    //         if DeleteAfterDownload then begin
    //             DeleteFile(FTPAddressFile, Login, Password);
    //         end;
    //     end;

    //     //[Scope('OnPrem')]
    //     procedure DownloadFiles(FTPAddressWithFolder: Text; DownloadToFolder: Text; FTPUserID: Text; FTPPassword: Text)
    //     var
    //         Counter: Integer;
    //         FilesCount: Integer;
    //         FilesList: DotNet ArrayList;
    //     begin
    //         FilesCount := GetFilesList(FTPAddressWithFolder, FTPUserID, FTPPassword, FilesList);
    //         if FilesCount > 0 then begin
    //             for Counter := 0 to FilesCount - 1 do begin
    //                 DownloadFile(FTPAddressWithFolder + GetFilename(Counter, FilesList), DownloadToFolder + GetFilename(Counter, FilesList), FTPUserID, FTPPassword, true);//TRUE TO DELETE
    //             end;
    //         end;
    //     end;

    //     //[Scope('OnPrem')]
    //     procedure UploadFiles(UploadFromFolder: Text; UploadToFTPAddressWithFolder: Text; FTPUserID: Text; FTPPassword: Text)
    //     var
    //         Files: Record File;
    //     begin
    //         Files.Reset;
    //         Files.SetRange(Path, UploadFromFolder);
    //         Files.SetRange("Is a file", true);
    //         if Files.Find('-') then begin
    //             repeat
    //                 UploadFile(Files.Path + Files.Name, UploadToFTPAddressWithFolder + Files.Name, FTPUserID, FTPPassword);
    //             until Files.Next = 0;
    //         end;
    //     end;

    //     //[Scope('OnPrem')]
    //     procedure DeleteFile(FTPAddressFile: Text; Login: Text; Password: Text): Boolean
    //     var
    //         Deleted: Boolean;
    //         FTPRequest: DotNet FtpWebRequest;
    //         Credentials: DotNet NetworkCredential;
    //         StatusCode: DotNet FtpStatusCode;
    //         FTPResponse: DotNet FtpWebResponse;
    //     begin
    //         Clear(Deleted);
    //         FTPRequest := FTPRequest.Create(FTPAddressFile);
    //         Credentials := Credentials.NetworkCredential(Login, Password);
    //         FTPRequest.Credentials := Credentials;

    //         FTPRequest.KeepAlive := true;
    //         FTPRequest.Method := 'DELE';
    //         FTPRequest.UsePassive := true;
    //         FTPRequest.UseBinary := true;
    //         FTPRequest.UsePassive := false;

    //         FTPResponse := FTPRequest.GetResponse;
    //         StatusCode := FTPResponse.StatusCode;

    //         if FTPResponse.StatusCode.ToString() = StatusCode.FileActionOK.ToString() then begin
    //             Deleted := true;
    //         end;
    //         FTPResponse.Close;
    //         exit(Deleted);
    //     end;

    //     //[Scope('OnPrem')]
    //     procedure GetFilesList(FTPAddress: Text; Login: Text; Password: Text; var FilesList: DotNet ArrayList): Integer
    //     var
    //         FTPRequest: DotNet FtpWebRequest;
    //         Credentials: DotNet NetworkCredential;
    //         FTPResponse: DotNet FtpWebResponse;
    //         ResponseStream: DotNet Stream;
    //         StreamReader: DotNet StreamReader;
    //     begin
    //         FTPRequest := FTPRequest.Create(FTPAddress);
    //         Credentials := Credentials.NetworkCredential(Login, Password);
    //         FTPRequest.Credentials := Credentials;

    //         FTPRequest.Method := 'NLST';
    //         FTPRequest.UseBinary := true;
    //         FTPRequest.KeepAlive := false;
    //         FTPRequest.UsePassive := false;
    //         FTPResponse := FTPRequest.GetResponse;
    //         ResponseStream := FTPResponse.GetResponseStream();
    //         StreamReader := StreamReader.StreamReader(ResponseStream);
    //         FilesList := FilesList.ArrayList;
    //         while not StreamReader.EndOfStream do begin
    //             FilesList.Add(StreamReader.ReadLine);
    //         end;

    //         StreamReader.Close;
    //         ResponseStream.Close;
    //         FTPResponse.Close;
    //         exit(FilesList.Count);
    //     end;

    //     //[Scope('OnPrem')]
    //     procedure GetFilename(Index: Integer; var FilesList: DotNet ArrayList): Text
    //     begin
    //         exit(Format(FilesList.Item(Index)));
    //     end;

    //     local procedure IsFolder(NameTocheck: Text): Boolean
    //     var
    //         NameLength: Integer;
    //     begin
    //         NameLength := StrLen(NameTocheck);
    //         if NameLength = 0 then
    //             exit(true);
    //         exit(CopyStr(NameTocheck, NameLength) in ['/', '.']);
    //     end;
}

