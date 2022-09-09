page 50002 "Hanning Belegübergabe"
{
    // P0004 16.03.16 DEBIE.ARE NAV2015 Modus changes
    // 
    // +--------------------------------------------------------------+
    // |                  Copyright MODUS Consult AG                  |
    // |                          Customizing                         |
    // +--------------------------------------------------------------+
    // Modul     Date      User      Description
    // MC        10.09.15  OK        Object created
    // MC        29.09.15  DT        Name GMI/GIM

    Caption = 'Hanning Belegübergabe';
    PageType = List;
    SourceTable = "Beleg_Übergabe";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Check OK"; Rec."Check OK")
                {
                    ApplicationArea = All;
                }
                field("Error exists"; Rec."Error exists")
                {
                    ApplicationArea = All;
                }
                field("Error No."; Rec."Error No.")
                {
                    ApplicationArea = All;
                }
                field(Zeitstempel; Rec.Zeitstempel)
                {
                    ApplicationArea = All;
                }
                field(Konto_Qual; Rec.Konto_Qual)
                {
                    ApplicationArea = All;
                }
                field(Konto_Nummer; Rec.Konto_Nummer)
                {
                    ApplicationArea = All;
                }
                field(Belegnummer; Rec.Belegnummer)
                {
                    ApplicationArea = All;
                }
                field(Positions_Nummer; Rec.Positions_Nummer)
                {
                    ApplicationArea = All;
                }
                field(Rech_Gut; Rec.Rech_Gut)
                {
                    ApplicationArea = All;
                }
                field(Betrag_incl_MWST; Rec.Betrag_incl_MWST)
                {
                    ApplicationArea = All;
                }
                field("MWST_Betrag_Prüfen"; Rec.MWST_Betrag_Prüfen)
                {
                    ApplicationArea = All;
                }
                field(Nettobetrag; Rec.Nettobetrag)
                {
                    ApplicationArea = All;
                }
                field("Währungkennzeichen"; Rec.Währungkennzeichen)
                {
                    ApplicationArea = All;
                }
                field(Gegenkonto; Rec.Gegenkonto)
                {
                    ApplicationArea = All;
                }
                field(Belegdatum; Rec.Belegdatum)
                {
                    ApplicationArea = All;
                }
                field(Buchungsdatum; Rec.Buchungsdatum)
                {
                    ApplicationArea = All;
                }
                field(ZLG_Bed; Rec.ZLG_Bed)
                {
                    ApplicationArea = All;
                }
                field("Fälligkeitsdatum"; Rec.Fälligkeitsdatum)
                {
                    ApplicationArea = All;
                }
                field(Skontodatum; Rec.Skontodatum)
                {
                    ApplicationArea = All;
                }
                field(Skonto_Proz; Rec.Skonto_Proz)
                {
                    ApplicationArea = All;
                }
                field(Dim1_Kostst; Rec.Dim1_Kostst)
                {
                    ApplicationArea = All;
                }
                field(Dim2_Kosttr; Rec.Dim2_Kosttr)
                {
                    ApplicationArea = All;
                }
                field(Mwst_Proz; Rec.Mwst_Proz)
                {
                    ApplicationArea = All;
                }
                field(Mwst_Art; Rec.Mwst_Art)
                {
                    ApplicationArea = All;
                }
                field(Mwst_Bemessungsgrundlage; Rec.Mwst_Bemessungsgrundlage)
                {
                    ApplicationArea = All;
                }
                field(Mwst_Betrag; Rec.Mwst_Betrag)
                {
                    ApplicationArea = All;
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = All;
                }
                field(Buchungsgruppe; Rec.Buchungsgruppe)
                {
                    ApplicationArea = All;
                }
                field("Geschäftsbuchungsgruppe"; Rec.Geschäftsbuchungsgruppe)
                {
                    ApplicationArea = All;
                }
                field("Mwst_Geschäftsbuchungsgruppe"; Rec.Mwst_Geschäftsbuchungsgruppe)
                {
                    ApplicationArea = All;
                }
                field(Abwarten; Rec.Abwarten)
                {
                    ApplicationArea = All;
                }
                field(Externe_Belegnummer; Rec.Externe_Belegnummer)
                {
                    ApplicationArea = All;
                }
                field(Buchungsart; Rec.Buchungsart)
                {
                    ApplicationArea = All;
                }
                field(Produktbuchungsgruppe; Rec.Produktbuchungsgruppe)
                {
                    ApplicationArea = All;
                }
                field(Mwst_Produktbuchungsgruppe; Rec.Mwst_Produktbuchungsgruppe)
                {
                    ApplicationArea = All;
                }
                field(Barcode; Rec.Barcode)
                {
                    ApplicationArea = All;
                }
                field(Betriebsauftragsnummer; Rec.Betriebsauftragsnummer)
                {
                    ApplicationArea = All;
                }
                field(Arbeitsgang; Rec.Arbeitsgang)
                {
                    ApplicationArea = All;
                }
                field(Interner_Auftrag; Rec.Interner_Auftrag)
                {
                    ApplicationArea = All;
                }
                field(Kundenauftrag; Rec.Kundenauftrag)
                {
                    ApplicationArea = All;
                }
                field(Kundenauftragsposition; Rec.Kundenauftragsposition)
                {
                    ApplicationArea = All;
                }
                field(Bestellanforderung; Rec.Bestellanforderung)
                {
                    ApplicationArea = All;
                }
                field(Bestellanforderungsposition; Rec.Bestellanforderungsposition)
                {
                    ApplicationArea = All;
                }
                field(Buchungs_Text; Rec.Buchungs_Text)
                {
                    ApplicationArea = All;
                }
                field(Hanning_projekt; Rec.Hanning_projekt)
                {
                    ApplicationArea = All;
                }
                field("Geschäftsbereich"; Rec.Geschäftsbereich)
                {
                    ApplicationArea = All;
                }
                field(Vertreter; Rec.Vertreter)
                {
                    ApplicationArea = All;
                }
                field(Sachbearbeiter; Rec.Sachbearbeiter)
                {
                    ApplicationArea = All;
                }
                field(Provision; Rec.Provision)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Fehlerprotokoll)
            {
                Image = ErrorLog;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Error Log";
                RunPageLink = "Error No." = FIELD("Error No.");
                RunPageView = SORTING("Error No.");
                ApplicationArea = All;
            }
            action("Bewegungsdaten überprüfen")
            {
                Image = Check;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    "BelegÜbergabeL": Record "Beleg_Übergabe";
                begin
                    BelegÜbergabeL.Reset;
                    //BelegÜbergabeL.SETRANGE(Zeitstempel, Zeitstempel);
                    //BelegÜbergabeL.SETRANGE(Konto_Qual, Konto_Qual);
                    //BelegÜbergabeL.SETRANGE(Konto_Nummer, Konto_Nummer);
                    //BelegÜbergabeL.SETRANGE(Belegnummer,Belegnummer);
                    //BelegÜbergabeL.SETRANGE(Positions_Nummer,Positions_Nummer);
                    REPORT.RunModal(50101, true, false, BelegÜbergabeL);
                end;
            }
            action("Bewegungsdaten übernehmen")
            {
                Image = Migration;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    "BelegÜbergabeL": Record "Beleg_Übergabe";
                begin
                    BelegÜbergabeL.Reset;
                    //BelegÜbergabeL.SETRANGE(Zeitstempel, Zeitstempel);
                    //BelegÜbergabeL.SETRANGE(Konto_Qual, Konto_Qual);
                    //BelegÜbergabeL.SETRANGE(Konto_Nummer, Konto_Nummer);
                    //BelegÜbergabeL.SETRANGE(Belegnummer, Belegnummer);
                    //BelegÜbergabeL.SETRANGE("Transfered to NAV",FALSE);
                    //BelegÜbergabeL.SETRANGE("Error exists", FALSE);
                    //BelegÜbergabeL.SETRANGE("Check OK", TRUE);
                    REPORT.RunModal(50103, true, false, BelegÜbergabeL);
                end;
            }
        }
    }
}

