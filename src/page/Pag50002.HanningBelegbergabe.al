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
                }
                field("Error exists"; Rec."Error exists")
                {
                }
                field("Error No."; Rec."Error No.")
                {
                }
                field(Zeitstempel; Rec.Zeitstempel)
                {
                }
                field(Konto_Qual; Rec.Konto_Qual)
                {
                }
                field(Konto_Nummer; Rec.Konto_Nummer)
                {
                }
                field(Belegnummer; Rec.Belegnummer)
                {
                }
                field(Positions_Nummer; Rec.Positions_Nummer)
                {
                }
                field(Rech_Gut; Rec.Rech_Gut)
                {
                }
                field(Betrag_incl_MWST; Rec.Betrag_incl_MWST)
                {
                }
                field("MWST_Betrag_Prüfen"; Rec.MWST_Betrag_Prüfen)
                {
                }
                field(Nettobetrag; Rec.Nettobetrag)
                {
                }
                field("Währungkennzeichen"; Rec.Währungkennzeichen)
                {
                }
                field(Gegenkonto; Rec.Gegenkonto)
                {
                }
                field(Belegdatum; Rec.Belegdatum)
                {
                }
                field(Buchungsdatum; Rec.Buchungsdatum)
                {
                }
                field(ZLG_Bed; Rec.ZLG_Bed)
                {
                }
                field("Fälligkeitsdatum"; Rec.Fälligkeitsdatum)
                {
                }
                field(Skontodatum; Rec.Skontodatum)
                {
                }
                field(Skonto_Proz; Rec.Skonto_Proz)
                {
                }
                field(Dim1_Kostst; Rec.Dim1_Kostst)
                {
                }
                field(Dim2_Kosttr; Rec.Dim2_Kosttr)
                {
                }
                field(Mwst_Proz; Rec.Mwst_Proz)
                {
                }
                field(Mwst_Art; Rec.Mwst_Art)
                {
                }
                field(Mwst_Bemessungsgrundlage; Rec.Mwst_Bemessungsgrundlage)
                {
                }
                field(Mwst_Betrag; Rec.Mwst_Betrag)
                {
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                }
                field(Buchungsgruppe; Rec.Buchungsgruppe)
                {
                }
                field("Geschäftsbuchungsgruppe"; Rec.Geschäftsbuchungsgruppe)
                {
                }
                field("Mwst_Geschäftsbuchungsgruppe"; Rec.Mwst_Geschäftsbuchungsgruppe)
                {
                }
                field(Abwarten; Rec.Abwarten)
                {
                }
                field(Externe_Belegnummer; Rec.Externe_Belegnummer)
                {
                }
                field(Buchungsart; Rec.Buchungsart)
                {
                }
                field(Produktbuchungsgruppe; Rec.Produktbuchungsgruppe)
                {
                }
                field(Mwst_Produktbuchungsgruppe; Rec.Mwst_Produktbuchungsgruppe)
                {
                }
                field(Barcode; Rec.Barcode)
                {
                }
                field(Betriebsauftragsnummer; Rec.Betriebsauftragsnummer)
                {
                }
                field(Arbeitsgang; Rec.Arbeitsgang)
                {
                }
                field(Interner_Auftrag; Rec.Interner_Auftrag)
                {
                }
                field(Kundenauftrag; Rec.Kundenauftrag)
                {
                }
                field(Kundenauftragsposition; Rec.Kundenauftragsposition)
                {
                }
                field(Bestellanforderung; Rec.Bestellanforderung)
                {
                }
                field(Bestellanforderungsposition; Rec.Bestellanforderungsposition)
                {
                }
                field(Buchungs_Text; Rec.Buchungs_Text)
                {
                }
                field(Hanning_projekt; Rec.Hanning_projekt)
                {
                }
                field("Geschäftsbereich"; Rec.Geschäftsbereich)
                {
                }
                field(Vertreter; Rec.Vertreter)
                {
                }
                field(Sachbearbeiter; Rec.Sachbearbeiter)
                {
                }
                field(Provision; Rec.Provision)
                {
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
            }
            action("Bewegungsdaten überprüfen")
            {
                Image = Check;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

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

