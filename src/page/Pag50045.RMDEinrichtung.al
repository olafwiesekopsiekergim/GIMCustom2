page 50045 "RMD Einrichtung"
{
    // P0001 02.03.16 CCBIE.ARE New object

    PageType = Card;
    SourceTable = "RMD Einrichtung";

    layout
    {
        area(content)
        {
            field(RootDirectoryHeader; Rec."Root Directory")
            {
                Caption = 'Root Directory';
                Editable = false;
            }
            group(Allgemein)
            {
                field("NCFTP Directory"; Rec."NCFTP Directory")
                {
                }
                field("RemoteDirectory DÜPERTHALtoRMD"; Rec."RemoteDirectory DÜPERTHALtoRMD")
                {
                    Caption = 'RemoteDirectory DÜPERTHALtoRMD      ftp:/';
                }
                field("RemoteDirectory RMDtoDÜPERTHAL"; Rec."RemoteDirectory RMDtoDÜPERTHAL")
                {
                    Caption = 'RemoteDirectory RMDtoDÜPERTHAL      ftp:/';
                }
                field("Root Directory"; Rec."Root Directory")
                {
                    Caption = 'Root Directory';
                    StyleExpr = TRUE;
                }
                field("Allgemeiner Exportpfad"; Rec."Allgemeiner Exportpfad")
                {
                    Caption = '<Allgemeiner Exportpfad>';
                }
                field("Allgemeiner Importpfad"; Rec."Allgemeiner Importpfad")
                {
                }
                field("Allgemeiner Pfad  (Fehler)"; Rec."Allgemeiner Pfad  (Fehler)")
                {
                }
                field("Letzte verarbeitete Datei"; Rec."Letzte verarbeitete Datei")
                {
                    Editable = false;
                }
                field("Letzte Verarbeitung Datum"; Rec."Letzte Verarbeitung Datum")
                {
                    Editable = false;
                }
                field("Letzte Verarbeitung Zeit"; Rec."Letzte Verarbeitung Zeit")
                {
                    Editable = false;
                }
            }
            group("Versand Auftrag")
            {
                field("VA Datei-Matchcode"; Rec."VA Datei-Matchcode")
                {
                }
                field("VA Archivpfad (Pakzettel)"; Rec."VA Archivpfad (Pakzettel)")
                {
                }
                field("VA Archivpfad (Umlagerung)"; Rec."VA Archivpfad (Umlagerung)")
                {
                }
                field("VA Aktuelle/Letzte Datei"; Rec."VA Aktuelle/Letzte Datei")
                {
                    Editable = false;
                }
                field("VA Letzte Verarbeitung Datum"; Rec."VA Letzte Verarbeitung Datum")
                {
                    Editable = false;
                }
                field("VA Letzte Verarbeitung Zeit"; Rec."VA Letzte Verarbeitung Zeit")
                {
                    Editable = false;
                }
                field("VA Anzahl Datenzeilen"; Rec."VA Anzahl Datenzeilen")
                {
                    Editable = false;
                }
                field("VA Verarbeitungsstatus"; Rec."VA Verarbeitungsstatus")
                {
                    Editable = false;
                }
                field("VA EMail Zuordnungsnr."; Rec."VA EMail Zuordnungsnr.")
                {
                }
                field("getZuornungsbeschreibung(""VA EMail Zuordnungsnr."")"; getZuornungsbeschreibung(Rec."VA EMail Zuordnungsnr."))
                {
                    Editable = false;
                    StyleExpr = vaZuornungsbeschreibungStyle;
                }
            }
            group("Rückmeldung")
            {
                field("RM Datei-Matchcode"; Rec."RM Datei-Matchcode")
                {
                }
                field("RM Archivpfad (Pakzettel)"; Rec."RM Archivpfad (Pakzettel)")
                {
                }
                field("RM Archivpfad (Umlagerung)"; Rec."RM Archivpfad (Umlagerung)")
                {
                }
                field("RM Gewicht (RMD)"; Rec."RM Gewicht (RMD)")
                {
                    Editable = false;
                }
                field("RM Anzahl Colli (RMD)"; Rec."RM Anzahl Colli (RMD)")
                {
                    Editable = false;
                }
                field("RM Paketnr. (RMD)"; Rec."RM Paketnr. (RMD)")
                {
                    Editable = false;
                }
                field("RM Zusteller (RMD)"; Rec."RM Zusteller (RMD)")
                {
                    Editable = false;
                }
                field("RM Lieferscheinnr. (RMD)"; Rec."RM Lieferscheinnr. (RMD)")
                {
                    Editable = false;
                }
                field("RM Aktuelle/Letzte Datei"; Rec."RM Aktuelle/Letzte Datei")
                {
                    Editable = false;
                }
                field("RM Letzte Verarbeitung Datum"; Rec."RM Letzte Verarbeitung Datum")
                {
                    Editable = false;
                }
                field("RM Letzte Verarbeitung Zeit"; Rec."RM Letzte Verarbeitung Zeit")
                {
                    Editable = false;
                }
                field("RM Anzahl Datenzeilen"; Rec."RM Anzahl Datenzeilen")
                {
                    Editable = false;
                }
                field("RM Verarbeitungsstatus"; Rec."RM Verarbeitungsstatus")
                {
                    Editable = false;
                }
                field("RM EMail Zuordnungsnr."; Rec."RM EMail Zuordnungsnr.")
                {
                }
                field("getZuornungsbeschreibung(""RM EMail Zuordnungsnr."")"; getZuornungsbeschreibung(Rec."RM EMail Zuordnungsnr."))
                {
                    Editable = false;
                    StyleExpr = RMZuornungsbeschreibungStyle;
                }
            }
            group(Artikelstamm)
            {
                field("ART Datei-Matchcode"; Rec."ART Datei-Matchcode")
                {
                }
                field("ART Archivpfad"; Rec."ART Archivpfad")
                {
                }
                field("ART Letzte Jounalnr."; Rec."ART Letzte Jounalnr.")
                {
                    Editable = false;
                }
                field("ART Aktuelle/Letzte Datei"; Rec."ART Aktuelle/Letzte Datei")
                {
                    Editable = false;
                }
                field("ART Letzte Verarbeitung Datum"; Rec."ART Letzte Verarbeitung Datum")
                {
                    Editable = false;
                }
                field("ART Letzte Verarbeitung Zeit"; Rec."ART Letzte Verarbeitung Zeit")
                {
                    Editable = false;
                }
                field("ART Anzahl Datenzeilen"; Rec."ART Anzahl Datenzeilen")
                {
                    Editable = false;
                }
                field("ART Verarbeitungsstatus"; Rec."ART Verarbeitungsstatus")
                {
                    Editable = false;
                }
                field("ART EMail Zuordnungsnr."; Rec."ART EMail Zuordnungsnr.")
                {
                }
                field("getZuornungsbeschreibung(""ART EMail Zuordnungsnr."")"; getZuornungsbeschreibung(Rec."ART EMail Zuordnungsnr."))
                {
                    Editable = false;
                    StyleExpr = ARTZuornungsbeschreibungStyle;
                }
            }
            group(Bestandskontrolle)
            {
                field("BK Datei-Matchcode"; Rec."BK Datei-Matchcode")
                {
                }
                field("BK Archivpfad"; Rec."BK Archivpfad")
                {
                }
                field("BK Extension (Auswertung)"; Rec."BK Extension (Auswertung)")
                {
                }
                field("BK Aktuelle/Letzte Datei"; Rec."BK Aktuelle/Letzte Datei")
                {
                    Editable = false;
                }
                field("BK Letzte Verarbeitung Datum"; Rec."BK Letzte Verarbeitung Datum")
                {
                    Editable = false;
                }
                field("BK Letzte Verarbeitung Zeit"; Rec."BK Letzte Verarbeitung Zeit")
                {
                    Editable = false;
                }
                field("BK Anzahl Datenzeilen"; Rec."BK Anzahl Datenzeilen")
                {
                    Editable = false;
                }
                field("BK Verarbeitungsstatus"; Rec."BK Verarbeitungsstatus")
                {
                    Editable = false;
                }
                field("BK EMail Zuordnungsnr."; Rec."BK EMail Zuordnungsnr.")
                {
                }
                field("getZuornungsbeschreibung(""BK EMail Zuordnungsnr."")"; getZuornungsbeschreibung(Rec."BK EMail Zuordnungsnr."))
                {
                    Editable = false;
                    StyleExpr = BKZuornungsbeschreibungStyle;
                }
            }
            group("Offene VA-Kontrolle")
            {
                field("oVA Datei-Matchcode"; Rec."oVA Datei-Matchcode")
                {
                }
                field("oVA Archivpfad"; Rec."oVA Archivpfad")
                {
                }
                field("oVA Extension (Auswertung)"; Rec."oVA Extension (Auswertung)")
                {
                }
                field("oVA Aktuelle/Letzte Datei"; Rec."oVA Aktuelle/Letzte Datei")
                {
                    Editable = false;
                }
                field("oVA Letzte Verarbeitung Datum"; Rec."oVA Letzte Verarbeitung Datum")
                {
                    Editable = false;
                }
                field("oVA Letzte Verarbeitung Zeit"; Rec."oVA Letzte Verarbeitung Zeit")
                {
                    Editable = false;
                }
                field("oVA Anzahl Datenzeilen"; Rec."oVA Anzahl Datenzeilen")
                {
                    Editable = false;
                }
                field("oVA Verarbeitungsstatus"; Rec."oVA Verarbeitungsstatus")
                {
                    Editable = false;
                }
                field("oVA EMail Zuordnungsnr."; Rec."oVA EMail Zuordnungsnr.")
                {
                }
                field("getZuornungsbeschreibung(""oVA EMail Zuordnungsnr."")"; getZuornungsbeschreibung(Rec."oVA EMail Zuordnungsnr."))
                {
                    Editable = false;
                    StyleExpr = OVAZuornungsbeschreibungStyle;
                }
            }
            group("[SPEZIALAUFTRAG]")
            {
                field("Special Order Customer No."; Rec."Special Order Customer No.")
                {
                    Caption = 'Special Order Customer No.';
                }
                field("Special Order Def.Ship. Agent"; Rec."Special Order Def.Ship. Agent")
                {
                    Caption = 'Special Order Default Shipping Agent';
                }
                field("Catalog Item"; Rec."Catalog Item")
                {
                }
                field("Catalog Interaction Group Code"; Rec."Catalog Interaction Group Code")
                {
                    Caption = 'Interaction Group Code';
                }
                field("Catalog Interaction Templ.Code"; Rec."Catalog Interaction Templ.Code")
                {
                    Caption = 'Catalog Interaction Template Code';
                }
                field("Catalog Order No. Series"; Rec."Catalog Order No. Series")
                {
                    Caption = 'No. Series';
                }
                field("Altern. Interaction Group Code"; Rec."Altern. Interaction Group Code")
                {
                    Caption = 'Interaction Group Code';
                }
                field("Altern. Interaction Templ.Code"; Rec."Altern. Interaction Templ.Code")
                {
                    Caption = 'Alternate Interaction Template Code';
                }
                field("Altern. Spec. Order No. Series"; Rec."Altern. Spec. Order No. Series")
                {
                    Caption = 'No. Series';
                }
                field("Spec Order EMail Zuordnungsnr."; Rec."Spec Order EMail Zuordnungsnr.")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field("getZuornungsbeschreibung(""Spec Order EMail Zuordnungsnr."")"; getZuornungsbeschreibung(Rec."Spec Order EMail Zuordnungsnr."))
                {
                    Editable = false;
                    StyleExpr = SAZuornungsbeschreibungStyle;
                    Visible = false;
                }
            }
            group("[BESTELLUNG]")
            {
                field("Bestellung EMail-Importpfad"; Rec."Bestellung EMail-Importpfad")
                {
                }
                field("Bestellung Archivpfad"; Rec."Bestellung Archivpfad")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Bestellung EMail Zuordnungsnr."; Rec."Bestellung EMail Zuordnungsnr.")
                {
                    Visible = false;
                }
                field("getZuornungsbeschreibung(""Bestellung EMail Zuordnungsnr."")"; getZuornungsbeschreibung(Rec."Bestellung EMail Zuordnungsnr."))
                {
                    StyleExpr = BestZuornungsbeschreibungStyle;
                    Visible = false;
                }
            }
            fixed(Control1106900107)
            {
                ShowCaption = false;
                field(ImportantText; ImportantText)
                {
                    ColumnSpan = 3;
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Versandauftrag)
            {
                Caption = 'Versandauftrag';
                action("Benachrishtigungs-EMail: Zuordnung anlegen")
                {
                    Caption = 'Benachrishtigungs-EMail: Zuordnung anlegen';
                    Image = Link;

                    trigger OnAction()
                    begin
                        EMailZuordnung('Versandauftrag');
                    end;
                }
            }
            group(Action1106900091)
            {
                Caption = 'Rückmeldung';
                action(Action1106900092)
                {
                    Caption = 'Benachrishtigungs-EMail: Zuordnung anlegen';
                    Image = Link;

                    trigger OnAction()
                    begin
                        EMailZuordnung('Rückmeldung');
                    end;
                }
            }
            group(Action1106900093)
            {
                Caption = 'Artikelstamm';
                action(Action1106900094)
                {
                    Caption = 'Benachrishtigungs-EMail: Zuordnung anlegen';
                    Image = Link;

                    trigger OnAction()
                    begin
                        EMailZuordnung('Artikelstamm');
                    end;
                }
                separator(Action1106900095)
                {
                }
                action("Nächstes Mal Alle Artikel übergeben")
                {
                    Caption = 'Nächstes Mal Alle Artikel übergeben';
                    Image = Copy;

                    trigger OnAction()
                    begin
                        NextTimeAllItemslToRMD;
                    end;
                }
            }
            group(Action1106900097)
            {
                Caption = 'Bestandskontrolle';
                action(Action1106900098)
                {
                    Caption = 'Benachrishtigungs-EMail: Zuordnung anlegen';
                    Image = Link;

                    trigger OnAction()
                    begin
                        EMailZuordnung('Bestandskontrolle');
                    end;
                }
            }
            group(Action1106900099)
            {
                Caption = 'Offene VA-Kontrolle';
                action(Action1106900100)
                {
                    Caption = 'Benachrishtigungs-EMail: Zuordnung anlegen';
                    Image = Link;

                    trigger OnAction()
                    begin
                        EMailZuordnung('Offene VA-Kontrolle');
                    end;
                }
            }
            group(Action1106900101)
            {
                Caption = '[SPEZIALAUFTRAG]';
                Visible = false;
                action(Action1106900102)
                {
                    Caption = 'Benachrishtigungs-EMail: Zuordnung anlegen';
                    Image = Link;

                    trigger OnAction()
                    begin
                        EMailZuordnung('SPEZIALAUFTRAG');
                    end;
                }
            }
            group(Action1106900103)
            {
                Caption = '[BESTELLUNG]';
                action(Action1106900104)
                {
                    Caption = 'Benachrishtigungs-EMail: Zuordnung anlegen';
                    Image = Link;

                    trigger OnAction()
                    begin
                        EMailZuordnung('BESTELLUNG');
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        lText: Text;
    begin
        lText := getZuornungsbeschreibung(Rec."VA EMail Zuordnungsnr.");
        if StrPos(lText, Achtung_TC) = 1 then
            VAZuornungsbeschreibungStyle := 'Unfavorable'
        else
            VAZuornungsbeschreibungStyle := 'Standard';

        lText := getZuornungsbeschreibung(Rec."RM EMail Zuordnungsnr.");
        if StrPos(lText, Achtung_TC) = 1 then
            RMZuornungsbeschreibungStyle := 'Unfavorable'
        else
            RMZuornungsbeschreibungStyle := 'Standard';

        lText := getZuornungsbeschreibung(Rec."ART EMail Zuordnungsnr.");
        if StrPos(lText, Achtung_TC) = 1 then
            ARTZuornungsbeschreibungStyle := 'Unfavorable'
        else
            ARTZuornungsbeschreibungStyle := 'Standard';

        lText := getZuornungsbeschreibung(Rec."BK EMail Zuordnungsnr.");
        if StrPos(lText, Achtung_TC) = 1 then
            BKZuornungsbeschreibungStyle := 'Unfavorable'
        else
            BKZuornungsbeschreibungStyle := 'Standard';

        lText := getZuornungsbeschreibung(Rec."oVA EMail Zuordnungsnr.");
        if StrPos(lText, Achtung_TC) = 1 then
            OVAZuornungsbeschreibungStyle := 'Unfavorable'
        else
            OVAZuornungsbeschreibungStyle := 'Standard';

        lText := getZuornungsbeschreibung(Rec."Spec Order EMail Zuordnungsnr.");
        if StrPos(lText, Achtung_TC) = 1 then
            SAZuornungsbeschreibungStyle := 'Unfavorable'
        else
            SAZuornungsbeschreibungStyle := 'Standard';

        lText := getZuornungsbeschreibung(Rec."Bestellung EMail Zuordnungsnr.");
        if StrPos(lText, Achtung_TC) = 1 then
            BestZuornungsbeschreibungStyle := 'Unfavorable'
        else
            BestZuornungsbeschreibungStyle := 'Standard';
    end;

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert(true);
        end;
    end;

    var
        Achtung_TC: Label 'Achtung!';
        ZuordnungNichtVorhanden_TC: Label 'Zuordnung nicht vorhanden';
        VAZuornungsbeschreibungStyle: Text;
        RMZuornungsbeschreibungStyle: Text;
        ARTZuornungsbeschreibungStyle: Text;
        BKZuornungsbeschreibungStyle: Text;
        OVAZuornungsbeschreibungStyle: Text;
        SAZuornungsbeschreibungStyle: Text;
        BestZuornungsbeschreibungStyle: Text;
        ImportantText: Label 'Hinweis: Nur die Register mit Bezeichnung OHNE [eckige Klammern] haben mit RMD zu tun';

    local procedure getZuornungsbeschreibung(pInComing: Integer) OutGoing: Text
    var
        EMailperRMDBelegSetup: Record "EMail per RMD-Beleg Setup";
    begin
        if pInComing > 0 then begin
            if not EMailperRMDBelegSetup.Get(pInComing) then
                OutGoing := StrSubstNo('%1 %2', Achtung_TC, ZuordnungNichtVorhanden_TC)
            else
                OutGoing := EMailperRMDBelegSetup.Beschreibung;
        end;
    end;

    local procedure EMailZuordnung(pIncoming: Text)
    var
        EMailperRMDBelegSetup: Page "EMail per RMD-Beleg Setup";
    begin
        EMailperRMDBelegSetup.Caption(pIncoming);
        EMailperRMDBelegSetup.Editable(true);
        EMailperRMDBelegSetup.RunModal;
    end;

    local procedure NextTimeAllItemslToRMD()
    begin
        Clear(Rec."ART Letzte Verarbeitung Datum");
        Clear(Rec."ART Letzte Verarbeitung Zeit");
        CurrPage.Update(true);
    end;
}

