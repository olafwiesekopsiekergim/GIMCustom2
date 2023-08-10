table 50046 "RMDHist Erfolgreich&Fehlerhaft"
{
    // P0001 15.02.16 DEBIE.ARE New object
    // 
    // //DUE400
    // > Logistikanbindung RMD
    // 
    //       WAS RMD BETRIFFT siehe auch in Documentation der Tabelle RMD Einrichtung    !!!      ALLE RMD-TANGIERTEN ENTHALTEN
    //     - dort stehen u.a. die irgendwie von der Logistikanbindung RMD tangierten Objekte -    'RMD' IN DER VERSIONSLISTE!!!
    // ------------------------------------------------------------------------------------------------------------------------
    // 
    // c/gw/290109: - A17711 "Import Bestellung WÜRTH"
    //              > Neuer Optionstring Feld 6 Art
    //                NEU Art = VA-Packzettel,VA-Umlagerung,RM-Packzettel,RM-Umlagerung,Artikelstamm,Bestandskontrolle,offene-VA-Kontrolle
    //                          ,Bestellung    <= kam hinzu
    // 
    // c/gw/030209: - A17711 Nacharbeit
    //              > Feld Datei von 30 auf 200 Byte erweitert
    //                es gab Probleme  weil Namen sich im Ablauf
    //                der Bestellung-Schnittstelle ändern - länger werden -
    // 
    // c/gw/200410: - A19165 "Fehlerhandling RMD"
    //              > Funktion:SendEMail ...
    //                ... Aufruf in OnInsert
    //              > Funktion:URLErstellung ...
    //                ... Aufruf inFunktion:SendEMail
    //              > weitere neue Funktionen
    //                ... GetEmail_An
    //                ... GetEmail_Kopie
    //                ... GetEmail_BlindKopie
    //                ... GetEmail_Betreff
    //                ... GetEmail_Zeilen
    //                ... GetEmail_URL
    //                ... GetEmail_LinkText
    //                ... GetEmail_Dateiname
    //                ... GetEMail_SofortVersand
    // 
    // c/gw/100610: - A19165 Fehlerhandling RMD                                         - Ergänzung: EMailBenachrichtigung an Mitarbeiter -
    //              > Objversand10.06 nach SMTP-Einrichtung gestern durch Herrn Radloff - inkl. Herrn Beermann (DüSi EXTERN) -
    // 
    // c/gw/210911 - Feld 20 Bemerkung von 100 auf 250 erweitert
    //             > Grund: 'Fehler beim Buchen!!! ' mit 6.0-Fnktion -> GETLASTERRORTEXT erweitert!

    Caption = 'Historie';

    fields
    {
        field(1; "Lfd.-Nr"; Integer)
        {
        }
        field(2; Richtung; Option)
        {
            OptionMembers = Export,Import;
        }
        field(3; "Pfad  (Archivierung)"; Code[200])
        {
        }
        field(4; Matchcode; Text[5])
        {
        }
        field(5; Datei; Text[200])
        {
        }
        field(6; Art; Option)
        {
            Description = 'VA-Packzettel,VA-Umlagerung,RM-Packzettel,RM-Umlagerung,Artikelstamm,Bestandskontrolle,offene-VA-Kontrolle,Bestellung';
            OptionMembers = "VA-Packzettel","VA-Umlagerung","RM-Packzettel","RM-Umlagerung",Artikelstamm,Bestandskontrolle,"offene-VA-Kontrolle",Bestellung;
        }
        field(7; Relationcode; Code[20])
        {
        }
        field(8; Datum; Date)
        {
        }
        field(9; Zeit; Time)
        {
        }
        field(10; "Record Type"; Option)
        {
            OptionMembers = " ",Erfolgreich,Fehlerhaft;
        }
        field(11; "Anzahl Datenzeilen"; Integer)
        {
        }
        field(12; "Pfad (Export/Import)"; Code[200])
        {
        }
        field(20; Bemerkung; Text[250])
        {
            Description = 'c/gw/210911 Feld von 100 auf 250 erweitert';
        }
        field(2100; "RMD Status Auftrag"; Option)
        {
            Description = 'c/gw/Juni2005: - Projekt:1342 wird an RMD geliefert';
            OptionMembers = normal,"Abruf gesperrt","Vorkasse gesperrt",Gesamtauftrag,Musterauftrag,Sammelrechnung,Montageauftrag,Vorabrechnung,Einlagerung,Sonderkommission,Feinabstimmung;
        }
        field(2110; "RMD Rückinfo an Düperthal"; Boolean)
        {
            Description = 'c/gw/Juni2005: - Projekt:1342 wird an RMD geliefert';
        }
        field(2120; "RMD Sammelsendung"; Boolean)
        {
            Description = 'c/gw/Juni2005: - Projekt:1342 wird an RMD geliefert';
        }
        field(2130; "RMD Deb.-KD-Nr. bei Spedition"; Text[30])
        {
            Description = 'c/gw/Juni2005: - Projekt:1342 wird an RMD geliefert';
        }
        field(3100; "RM Gewicht (RMD)"; Decimal)
        {
            Description = 'c/gw/Juni2005: - Projekt:1342 wird von RMD rückgeliefert';
        }
        field(3110; "RM Anzahl Colli (RMD)"; Integer)
        {
            Description = 'c/gw/Juni2005: - Projekt:1342 wird von RMD rückgeliefert';
        }
        field(3120; "RM Paketnr. (RMD)"; Text[30])
        {
            Description = 'c/gw/Juni2005: - Projekt:1342 wird von RMD rückgeliefert';
        }
        field(3130; "RM Zusteller (RMD)"; Code[10])
        {
            Description = 'c/gw/Juni2005: - Projekt:1342 wird von RMD rückgeliefert';
        }
        field(3140; "RM Lieferscheinnr. (RMD)"; Code[20])
        {
            Description = 'c/gw/Juni2005: - Projekt:1342 wird von RMD rückgeliefert';
        }
    }

    keys
    {
        key(Key1; "Record Type", "Lfd.-Nr")
        {
            Clustered = true;
        }
        key(Key2; Datum, Zeit, Relationcode, Art)
        {
        }
        key(Key3; Relationcode, Richtung, Datum, Zeit)
        {
        }
    }

    fieldgroups
    {
    }

    // trigger OnInsert()
    // var
    //     lDoit: Boolean;
    // begin
    //     //c/gw/200410
    //     lDoit := (("Record Type" = "Record Type"::Fehlerhaft)
    //           or ((Art = Art::"offene-VA-Kontrolle") and (StrPos(Bemerkung, '!!! Differenzen !!!') = 1))
    //           or ((Art = Art::Bestandskontrolle) and (StrPos(Bemerkung, '!!! Differenzen !!!') = 1)));
    //     if lDoit then
    //         SendEMail(Rec);
    // end;

    // //[Scope('OnPrem')]
    // procedure SendEMail("pRMDHistFehlerhafterEinträge": Record "RMDHist Erfolgreich&Fehlerhaft")
    // var
    //     RecRef: RecordRef;
    //     lRMDEinrichtungRec: Record "RMD Einrichtung";
    //     lZuordnungsnr: Integer;
    //     lMail: Codeunit "SMTP Mail";
    // begin
    //     exit;

    //     RecRef.GetTable(pRMDHistFehlerhafterEinträge);
    //     lRMDEinrichtungRec.Get;
    //     case pRMDHistFehlerhafterEinträge.Art of

    //         pRMDHistFehlerhafterEinträge.Art::"VA-Packzettel":
    //             lZuordnungsnr := lRMDEinrichtungRec."VA EMail Zuordnungsnr.";
    //         pRMDHistFehlerhafterEinträge.Art::"VA-Umlagerung":
    //             lZuordnungsnr := lRMDEinrichtungRec."VA EMail Zuordnungsnr.";

    //         pRMDHistFehlerhafterEinträge.Art::"RM-Packzettel":
    //             lZuordnungsnr := lRMDEinrichtungRec."RM EMail Zuordnungsnr.";
    //         pRMDHistFehlerhafterEinträge.Art::"RM-Umlagerung":
    //             lZuordnungsnr := lRMDEinrichtungRec."RM EMail Zuordnungsnr.";

    //         pRMDHistFehlerhafterEinträge.Art::Artikelstamm:
    //             lZuordnungsnr := lRMDEinrichtungRec."ART EMail Zuordnungsnr.";

    //         pRMDHistFehlerhafterEinträge.Art::Bestandskontrolle:
    //             lZuordnungsnr := lRMDEinrichtungRec."BK EMail Zuordnungsnr.";

    //         pRMDHistFehlerhafterEinträge.Art::"offene-VA-Kontrolle":
    //             lZuordnungsnr := lRMDEinrichtungRec."oVA EMail Zuordnungsnr.";

    //     //                                                                            --- [  S P E Z I E L L E S  ] ---
    //     // da gibts noch den SPEZIEALAUFTRAG     aber keine Art                   <- erst mal weggelassen Stand:20.04.10
    //     // da gibts noch die pRMDHistFehlerhafterEinträge.Art::Bestellung         <- erst mal weggelassen Stand:20.04.10
    //     //                                                                   Teile wie in anderen Bereichen aber schon eingebaut

    //     end;
    //     if lZuordnungsnr > 0 then begin
    //         //*--------------------------------------------------------------------------------- SMTP REIN

    //         //lMail.CreateMessage(SenderName,SenderAddress,Recipients,Subject,Body,HtmlFormatted)
    //         lMail.CreateMessage('RMD Server', 'navision@dueperthal.de', GetEmail_An(lZuordnungsnr), GetEmail_Betreff(lZuordnungsnr), '', true);
    //         lMail.AppendBody(GetEmail_Body(lZuordnungsnr
    //                                       , pRMDHistFehlerhafterEinträge
    //                                       , GetEmail_URL(PAGE::"RMDHist Erfolgreich", RecRef)
    //                                       , GetEmail_LinkText));
    //         if GetEmail_Kopie(lZuordnungsnr).Count <> 0 then
    //             lMail.AddCC(GetEmail_Kopie(lZuordnungsnr));
    //         if GetEmail_BlindKopie(lZuordnungsnr).count <> 0 then
    //             lMail.AddBCC(GetEmail_BlindKopie(lZuordnungsnr));
    //         // Test
    //         //IF GetEmail_Dateiname(lZuordnungsnr) <> '' THEN
    //         //  lMail.AddAttachment(GetEmail_Dateiname(lZuordnungsnr),'');
    //         lMail.Send();
    //         //*--------------------------------------------------------------------------------- SMTP REIN
    //         /* *--------------------------------------------------------------------------------- MAPI RAUS
    //           Mailversand( GetEmail_An(lZuordnungsnr)
    //                      , GetEmail_Kopie(lZuordnungsnr)
    //                      , GetEmail_BlindKopie(lZuordnungsnr)
    //                      , GetEmail_Betreff(lZuordnungsnr)
    //                      //, GetEmail_URL(FORM::"RMDHist Erfolgreich", RecRef)
    //                      , GetEmail_Body( lZuordnungsnr
    //                                     , pRMDHistFehlerhafterEinträge
    //                                     , GetEmail_URL(FORM::"RMDHist Erfolgreich", RecRef)
    //                                     , GetEmail_LinkText)
    //                      // , GetEmail_LinkText
    //                      , GetEmail_Dateiname(lZuordnungsnr)
    //                      , GetEMail_SofortVersand);
    //           *--------------------------------------------------------------------------------- MAPI RAUS */
    //     end;

    // end;

    //[Scope('OnPrem')]
    // procedure GetEmail_An(pZuordnungsnr: Integer): list of [text]
    // var
    //     lEMailPerRMDBelegSetupRec: Record "EMail per RMD-Beleg Setup";
    //     ret: List of [text];
    // begin
    //     lEMailPerRMDBelegSetupRec.Get(pZuordnungsnr);
    //     ret.add(lEMailPerRMDBelegSetupRec."EMail An");
    //     exit(ret);
    // end;

    // //[Scope('OnPrem')]
    // procedure GetEmail_Kopie(pZuordnungsnr: Integer): list of [text]
    // var
    //     lEMailPerRMDBelegSetupRec: Record "EMail per RMD-Beleg Setup";
    //     ret: List of [Text];
    // begin
    //     lEMailPerRMDBelegSetupRec.Get(pZuordnungsnr);
    //     ret.add(lEMailPerRMDBelegSetupRec."EMail Kopie");
    //     exit(ret);
    // end;

    //[Scope('OnPrem')]
    // procedure GetEmail_BlindKopie(pZuordnungsnr: Integer): list of [Text]
    // var
    //     lEMailPerRMDBelegSetupRec: Record "EMail per RMD-Beleg Setup";
    //     ret: List of [Text];
    // begin
    //     lEMailPerRMDBelegSetupRec.Get(pZuordnungsnr);
    //     ret.add(lEMailPerRMDBelegSetupRec."EMail Blind Kopie");
    //     exit(ret);
    // end;

    //[Scope('OnPrem')]
    procedure GetEmail_Betreff(pZuordnungsnr: Integer): Text[250]
    var
        lEMailPerRMDBelegSetupRec: Record "EMail per RMD-Beleg Setup";
    begin
        lEMailPerRMDBelegSetupRec.Get(pZuordnungsnr);
        exit(lEMailPerRMDBelegSetupRec."EMail Betreff");
    end;

    //[Scope('OnPrem')]
    procedure GetEmail_Body(pZuordnungsnr: Integer; pHistRec: Record "RMDHist Erfolgreich&Fehlerhaft"; pURLText: Text[1024]; pLinkText: Text[100]) RetVal: Text[1024]
    var
        lEMailPerRMDBelegSetupRec: Record "EMail per RMD-Beleg Setup";
        lHistRec: Record "RMDHist Erfolgreich&Fehlerhaft";
        lOccur: Integer;
        lCRLF: Text[2];
        lText: Text[250];
    begin
        lCRLF[1] := 13;
        lCRLF[2] := 10;
        lEMailPerRMDBelegSetupRec.Get(pZuordnungsnr);

        lEMailPerRMDBelegSetupRec."EMail Text2" := getEmail_AppendZeilen(pHistRec, 2, pURLText, pLinkText);
        lEMailPerRMDBelegSetupRec."EMail Text3" := getEmail_AppendZeilen(pHistRec, 3, pURLText, pLinkText);
        lEMailPerRMDBelegSetupRec."EMail Text4" := getEmail_AppendZeilen(pHistRec, 4, pURLText, pLinkText);

        for lOccur := 1 to 4 do begin
            case lOccur of
                1:
                    lText := lEMailPerRMDBelegSetupRec."EMail Text";
                2:
                    lText := lEMailPerRMDBelegSetupRec."EMail Text2";  // Diese Felder habe ich im neuen Rec mal angelegt, sie werden
                3:
                    lText := lEMailPerRMDBelegSetupRec."EMail Text3";  // hier zwar durch Funktion GetEMailAppendZeilen gefüllt -siehe oben-
                4:
                    lText := lEMailPerRMDBelegSetupRec."EMail Text4";  // aber HIER nur temporär (OHNE MODIFY) benutzt!!!
            end;
            if RetVal <> '' then
                if lText <> '' then
                    RetVal += lCRLF;
            RetVal += lText;
        end;
    end;

    //[Scope('OnPrem')]
    procedure getEmail_AppendZeilen(pHistRec: Record "RMDHist Erfolgreich&Fehlerhaft"; pPtr: Integer; pURLText: Text[1024]; pLinkText: Text[100]) RetVal: Text[250]
    var
        lCRLF: Text[2];
        lArr: array[9] of Text[250];
    begin
        lCRLF[1] := 13;
        lCRLF[2] := 10;
        case pPtr of
            2:
                begin
                    lArr[1] := StrSubstNo('%1:%2 %3%4', pHistRec.FieldCaption("Lfd.-Nr"), pHistRec."Lfd.-Nr", pHistRec."Record Type", lCRLF);
                    lArr[2] := StrSubstNo('%1 %2%3', pHistRec.Art, pHistRec.Relationcode, lCRLF);
                    lArr[3] := StrSubstNo('%1:%2', pHistRec.FieldCaption(Datum), pHistRec.Datum);
                    lArr[4] := StrSubstNo('%1:%2', pHistRec.FieldCaption(Zeit), pHistRec.Zeit);
                    RetVal := StrSubstNo('%1%2%3 %4', lArr[1], lArr[2], lArr[3], lArr[4]);
                end;
            3:
                begin
                    RetVal := lCRLF + pHistRec.Bemerkung + lCRLF;
                end;
            4:
                begin
                    RetVal := '<A href="' + pURLText + '">' + pLinkText + '</A>'; // Historie Erfolgreier&Fehlerhafter Actionen
                end;
        end;
    end;

    //[Scope('OnPrem')]
    // procedure GetEmail_URL(FormID: Integer; RecRef: RecordRef): Text[1024]
    // var
    //     TargetText: Text[250];
    //     ViewText: Text[250];
    //     SortingText: Text[250];
    //     KeyRef: KeyRef;
    //     "Zähler": Integer;
    //     FieldRef: FieldRef;
    //     WhereText: Text[1024];
    //     FilterVorhanden: Boolean;
    //     PositionText: Text[250];
    //     lURLText: Text[1024];
    // begin
    //     // neue Funktion, diese wird aus on insert ggf. aufgerufen
    //     /*
    //        URLErstellung
    //       'Quelle: MH\20.04.10     der Quelle sei Dank'
    //     */
    //     //  - http://msdn.microsoft.com/en-us/library/dd338856.aspx
    //     //  - http://msdn.microsoft.com/en-us/library/dd338670.aspx

    //     /*
    //     // Navision Links versenden - Beispielprogrammierung...
    //     Item.GET('1000');
    //     Recordref_.GETTABLE(Item);
    //     MESSAGE ('URL:_%1_',URLErstellung(FORM::"Item Card",Recordref_));
    //     */


    //     TargetText := 'target=Form ' + Format(FormID);
    //     ViewText := 'view=';
    //     SortingText := 'SORTING(';
    //     KeyRef := RecRef.KeyIndex(RecRef.CurrentKeyIndex);
    //     for Zähler := 1 to KeyRef.FieldCount do begin
    //         FieldRef := KeyRef.FieldIndex(Zähler);
    //         SortingText += 'Field' + Format(FieldRef.Number);
    //         if Zähler = KeyRef.FieldCount then
    //             SortingText += ')'
    //         else
    //             SortingText += ',';
    //     end;

    //     WhereText := '%20WHERE(';
    //     FilterVorhanden := false;
    //     if RecRef.HasFilter then begin
    //         for Zähler := 1 to RecRef.FieldCount do begin
    //             FieldRef := RecRef.FieldIndex(Zähler);
    //             if FieldRef.GetFilter <> '' then begin
    //                 WhereText += 'Field' + Format(FieldRef.Number) + '=1(' + FieldRef.GetFilter + '),';
    //             end;
    //             if Zähler = RecRef.FieldCount then
    //                 WhereText := DelStr(WhereText, StrLen(WhereText)) + ')';
    //         end;
    //     end else
    //         WhereText := '';
    //     PositionText := 'position=';
    //     KeyRef := RecRef.KeyIndex(1);
    //     for Zähler := 1 to KeyRef.FieldCount do begin
    //         FieldRef := KeyRef.FieldIndex(Zähler);
    //         PositionText += 'Field' + Format(FieldRef.Number) + '=0(' + Format(FieldRef.Value) + ')';
    //         if Zähler <> KeyRef.FieldCount then
    //             PositionText += ',';
    //     end;

    //     lURLText := GetNAVUrl + '&' + TargetText + '&' + ViewText + SortingText + WhereText + '&' + PositionText;
    //     while StrPos(lURLText, ' ') > 0 do
    //         lURLText := CopyStr(lURLText, 1, StrPos(lURLText, ' ') - 1) + '%20' + CopyStr(lURLText, StrPos(lURLText, ' ') + 1);
    //     while StrPos(lURLText, '&') > 0 do
    //         lURLText := CopyStr(lURLText, 1, StrPos(lURLText, '&') - 1) + '%26' + CopyStr(lURLText, StrPos(lURLText, '&') + 1);

    //     exit(DelChr(lURLText, '<>', ' '));

    // end;

    //[Scope('OnPrem')]
    procedure GetEmail_LinkText(): Text[100]
    var
        lLink_TC: Label 'Error-History: Click here';
    begin
        exit(lLink_TC);
    end;

    //[Scope('OnPrem')]
    procedure GetEmail_Dateiname(pZuordnungsnr: Integer): Text[1024]
    var
        lEMailPerRMDBelegSetupRec: Record "EMail per RMD-Beleg Setup";
    begin
        lEMailPerRMDBelegSetupRec.Get(pZuordnungsnr);
        exit(lEMailPerRMDBelegSetupRec."EMail Dateiname");
    end;

    // local procedure GetNAVUrl(): Text
    // var
    //     Uri: dotnet uri;
    //     UriPartial: DotNet UriPartial;
    //     UrlString: Text;
    // begin
    //     UrlString := GetUrl(CLIENTTYPE::Windows);
    //     Uri := Uri.Uri(UrlString);
    //     UrlString := Uri.GetLeftPart(UriPartial.Path) + Uri.Query;

    //     exit(UrlString);
    // end;
}

