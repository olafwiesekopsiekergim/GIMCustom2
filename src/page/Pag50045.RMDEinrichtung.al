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
                ApplicationArea = All;
            }
            group(Allgemein)
            {
                field("NCFTP Directory"; Rec."NCFTP Directory")
                {
                    ApplicationArea = All;
                }
                field("RemoteDirectory DÜPERTHALtoRMD"; Rec."RemoteDirectory DÜPERTHALtoRMD")
                {
                    Caption = 'RemoteDirectory DÜPERTHALtoRMD      ftp:/';
                    ApplicationArea = All;
                }
                field("RemoteDirectory RMDtoDÜPERTHAL"; Rec."RemoteDirectory RMDtoDÜPERTHAL")
                {
                    Caption = 'RemoteDirectory RMDtoDÜPERTHAL      ftp:/';
                    ApplicationArea = All;
                }
                field("Root Directory"; Rec."Root Directory")
                {
                    Caption = 'Root Directory';
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field("Allgemeiner Exportpfad"; Rec."Allgemeiner Exportpfad")
                {
                    Caption = '<Allgemeiner Exportpfad>';
                    ApplicationArea = All;
                }
                field("Allgemeiner Importpfad"; Rec."Allgemeiner Importpfad")
                {
                    ApplicationArea = All;
                }
                field("Allgemeiner Pfad  (Fehler)"; Rec."Allgemeiner Pfad  (Fehler)")
                {
                    ApplicationArea = All;
                }
                field("Letzte verarbeitete Datei"; Rec."Letzte verarbeitete Datei")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Letzte Verarbeitung Datum"; Rec."Letzte Verarbeitung Datum")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Letzte Verarbeitung Zeit"; Rec."Letzte Verarbeitung Zeit")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group("Versand Auftrag")
            {
                field("VA Datei-Matchcode"; Rec."VA Datei-Matchcode")
                {
                    ApplicationArea = All;
                }
                field("VA Archivpfad (Pakzettel)"; Rec."VA Archivpfad (Pakzettel)")
                {
                    ApplicationArea = All;
                }
                field("VA Archivpfad (Umlagerung)"; Rec."VA Archivpfad (Umlagerung)")
                {
                    ApplicationArea = All;
                }
                field("VA Aktuelle/Letzte Datei"; Rec."VA Aktuelle/Letzte Datei")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("VA Letzte Verarbeitung Datum"; Rec."VA Letzte Verarbeitung Datum")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("VA Letzte Verarbeitung Zeit"; Rec."VA Letzte Verarbeitung Zeit")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("VA Anzahl Datenzeilen"; Rec."VA Anzahl Datenzeilen")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("VA Verarbeitungsstatus"; Rec."VA Verarbeitungsstatus")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("VA EMail Zuordnungsnr."; Rec."VA EMail Zuordnungsnr.")
                {
                    ApplicationArea = All;
                }
                field("getZuornungsbeschreibung(""VA EMail Zuordnungsnr."")"; getZuornungsbeschreibung(Rec."VA EMail Zuordnungsnr."))
                {
                    Editable = false;
                    StyleExpr = vaZuornungsbeschreibungStyle;
                    ApplicationArea = All;
                }
            }
            group("Rückmeldung")
            {
                field("RM Datei-Matchcode"; Rec."RM Datei-Matchcode")
                {
                    ApplicationArea = All;
                }
                field("RM Archivpfad (Pakzettel)"; Rec."RM Archivpfad (Pakzettel)")
                {
                    ApplicationArea = All;
                }
                field("RM Archivpfad (Umlagerung)"; Rec."RM Archivpfad (Umlagerung)")
                {
                    ApplicationArea = All;
                }
                field("RM Gewicht (RMD)"; Rec."RM Gewicht (RMD)")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("RM Anzahl Colli (RMD)"; Rec."RM Anzahl Colli (RMD)")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("RM Paketnr. (RMD)"; Rec."RM Paketnr. (RMD)")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("RM Zusteller (RMD)"; Rec."RM Zusteller (RMD)")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("RM Lieferscheinnr. (RMD)"; Rec."RM Lieferscheinnr. (RMD)")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("RM Aktuelle/Letzte Datei"; Rec."RM Aktuelle/Letzte Datei")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("RM Letzte Verarbeitung Datum"; Rec."RM Letzte Verarbeitung Datum")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("RM Letzte Verarbeitung Zeit"; Rec."RM Letzte Verarbeitung Zeit")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("RM Anzahl Datenzeilen"; Rec."RM Anzahl Datenzeilen")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("RM Verarbeitungsstatus"; Rec."RM Verarbeitungsstatus")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("RM EMail Zuordnungsnr."; Rec."RM EMail Zuordnungsnr.")
                {
                    ApplicationArea = All;
                }
                field("getZuornungsbeschreibung(""RM EMail Zuordnungsnr."")"; getZuornungsbeschreibung(Rec."RM EMail Zuordnungsnr."))
                {
                    Editable = false;
                    StyleExpr = RMZuornungsbeschreibungStyle;
                    ApplicationArea = All;
                }
            }
            group(Artikelstamm)
            {
                field("ART Datei-Matchcode"; Rec."ART Datei-Matchcode")
                {
                    ApplicationArea = All;
                }
                field("ART Archivpfad"; Rec."ART Archivpfad")
                {
                    ApplicationArea = All;
                }
                field("ART Letzte Jounalnr."; Rec."ART Letzte Jounalnr.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("ART Aktuelle/Letzte Datei"; Rec."ART Aktuelle/Letzte Datei")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("ART Letzte Verarbeitung Datum"; Rec."ART Letzte Verarbeitung Datum")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("ART Letzte Verarbeitung Zeit"; Rec."ART Letzte Verarbeitung Zeit")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("ART Anzahl Datenzeilen"; Rec."ART Anzahl Datenzeilen")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("ART Verarbeitungsstatus"; Rec."ART Verarbeitungsstatus")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("ART EMail Zuordnungsnr."; Rec."ART EMail Zuordnungsnr.")
                {
                    ApplicationArea = All;
                }
                field("getZuornungsbeschreibung(""ART EMail Zuordnungsnr."")"; getZuornungsbeschreibung(Rec."ART EMail Zuordnungsnr."))
                {
                    Editable = false;
                    StyleExpr = ARTZuornungsbeschreibungStyle;
                    ApplicationArea = All;
                }
            }
            group(Bestandskontrolle)
            {
                field("BK Datei-Matchcode"; Rec."BK Datei-Matchcode")
                {
                    ApplicationArea = All;
                }
                field("BK Archivpfad"; Rec."BK Archivpfad")
                {
                    ApplicationArea = All;
                }
                field("BK Extension (Auswertung)"; Rec."BK Extension (Auswertung)")
                {
                    ApplicationArea = All;
                }
                field("BK Aktuelle/Letzte Datei"; Rec."BK Aktuelle/Letzte Datei")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("BK Letzte Verarbeitung Datum"; Rec."BK Letzte Verarbeitung Datum")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("BK Letzte Verarbeitung Zeit"; Rec."BK Letzte Verarbeitung Zeit")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("BK Anzahl Datenzeilen"; Rec."BK Anzahl Datenzeilen")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("BK Verarbeitungsstatus"; Rec."BK Verarbeitungsstatus")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("BK EMail Zuordnungsnr."; Rec."BK EMail Zuordnungsnr.")
                {
                    ApplicationArea = All;
                }
                field("getZuornungsbeschreibung(""BK EMail Zuordnungsnr."")"; getZuornungsbeschreibung(Rec."BK EMail Zuordnungsnr."))
                {
                    Editable = false;
                    StyleExpr = BKZuornungsbeschreibungStyle;
                    ApplicationArea = All;
                }
            }
            group("Offene VA-Kontrolle")
            {
                field("oVA Datei-Matchcode"; Rec."oVA Datei-Matchcode")
                {
                    ApplicationArea = All;
                }
                field("oVA Archivpfad"; Rec."oVA Archivpfad")
                {
                    ApplicationArea = All;
                }
                field("oVA Extension (Auswertung)"; Rec."oVA Extension (Auswertung)")
                {
                    ApplicationArea = All;
                }
                field("oVA Aktuelle/Letzte Datei"; Rec."oVA Aktuelle/Letzte Datei")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("oVA Letzte Verarbeitung Datum"; Rec."oVA Letzte Verarbeitung Datum")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("oVA Letzte Verarbeitung Zeit"; Rec."oVA Letzte Verarbeitung Zeit")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("oVA Anzahl Datenzeilen"; Rec."oVA Anzahl Datenzeilen")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("oVA Verarbeitungsstatus"; Rec."oVA Verarbeitungsstatus")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("oVA EMail Zuordnungsnr."; Rec."oVA EMail Zuordnungsnr.")
                {
                    ApplicationArea = All;
                }
                field("getZuornungsbeschreibung(""oVA EMail Zuordnungsnr."")"; getZuornungsbeschreibung(Rec."oVA EMail Zuordnungsnr."))
                {
                    Editable = false;
                    StyleExpr = OVAZuornungsbeschreibungStyle;
                    ApplicationArea = All;
                }
            }
            group("[SPEZIALAUFTRAG]")
            {
                field("Special Order Customer No."; Rec."Special Order Customer No.")
                {
                    Caption = 'Special Order Customer No.';
                    ApplicationArea = All;
                }
                field("Special Order Def.Ship. Agent"; Rec."Special Order Def.Ship. Agent")
                {
                    Caption = 'Special Order Default Shipping Agent';
                    ApplicationArea = All;
                }
                field("Catalog Item"; Rec."Catalog Item")
                {
                    ApplicationArea = All;
                }
                field("Catalog Interaction Group Code"; Rec."Catalog Interaction Group Code")
                {
                    Caption = 'Interaction Group Code';
                    ApplicationArea = All;
                }
                field("Catalog Interaction Templ.Code"; Rec."Catalog Interaction Templ.Code")
                {
                    Caption = 'Catalog Interaction Template Code';
                    ApplicationArea = All;
                }
                field("Catalog Order No. Series"; Rec."Catalog Order No. Series")
                {
                    Caption = 'No. Series';
                    ApplicationArea = All;
                }
                field("Altern. Interaction Group Code"; Rec."Altern. Interaction Group Code")
                {
                    Caption = 'Interaction Group Code';
                    ApplicationArea = All;
                }
                field("Altern. Interaction Templ.Code"; Rec."Altern. Interaction Templ.Code")
                {
                    Caption = 'Alternate Interaction Template Code';
                    ApplicationArea = All;
                }
                field("Altern. Spec. Order No. Series"; Rec."Altern. Spec. Order No. Series")
                {
                    Caption = 'No. Series';
                    ApplicationArea = All;
                }
                field("Spec Order EMail Zuordnungsnr."; Rec."Spec Order EMail Zuordnungsnr.")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("getZuornungsbeschreibung(""Spec Order EMail Zuordnungsnr."")"; getZuornungsbeschreibung(Rec."Spec Order EMail Zuordnungsnr."))
                {
                    Editable = false;
                    StyleExpr = SAZuornungsbeschreibungStyle;
                    Visible = false;
                    ApplicationArea = All;
                }
            }
            group("[BESTELLUNG]")
            {
                field("Bestellung EMail-Importpfad"; Rec."Bestellung EMail-Importpfad")
                {
                    ApplicationArea = All;
                }
                field("Bestellung Archivpfad"; Rec."Bestellung Archivpfad")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field("Bestellung EMail Zuordnungsnr."; Rec."Bestellung EMail Zuordnungsnr.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("getZuornungsbeschreibung(""Bestellung EMail Zuordnungsnr."")"; getZuornungsbeschreibung(Rec."Bestellung EMail Zuordnungsnr."))
                {
                    StyleExpr = BestZuornungsbeschreibungStyle;
                    Visible = false;
                    ApplicationArea = All;
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
                    ApplicationArea = All;
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
                    ApplicationArea = All;

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
                    ApplicationArea = All;

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
                    ApplicationArea = All;

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
                    ApplicationArea = All;

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
                    ApplicationArea = All;

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
                    ApplicationArea = All;

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
                    ApplicationArea = All;

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
                    ApplicationArea = All;

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

