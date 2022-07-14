page 50001 "Hanning Stammdatenübergabe"
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

    Caption = 'Hanning Stammdatenübergabe';
    PageType = List;
    SourceTable = "Stammdaten_Übergabe";

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
                field(Konto_qual; Rec.Konto_qual)
                {
                }
                field(Konto_nummer; Rec.Konto_nummer)
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Suchbegriff; Rec.Suchbegriff)
                {
                }
                field(Name2; Rec.Name2)
                {
                }
                field(Adresse; Rec.Adresse)
                {
                }
                field(Adresse2; Rec.Adresse2)
                {
                }
                field(PLZ_Code; Rec.PLZ_Code)
                {
                }
                field(Ort; Rec.Ort)
                {
                }
                field(Land; Rec.Land)
                {
                }
                field(Telefon; Rec.Telefon)
                {
                }
                field(Fax; Rec.Fax)
                {
                }
                field(e_Mail; Rec.e_Mail)
                {
                }
                field(Homepage; Rec.Homepage)
                {
                }
                field(Zlg_Bedingungscode; Rec.Zlg_Bedingungscode)
                {
                }
                field("Verkäufer_Einkäufer"; Rec.Verkäufer_Einkäufer)
                {
                }
                field(UST_ID; Rec.UST_ID)
                {
                }
                field("Geschäftsbuchungsgruppe"; Rec.Geschäftsbuchungsgruppe)
                {
                }
                field("MWST_Geschäftsbuchungsgruppe"; Rec.MWST_Geschäftsbuchungsgruppe)
                {
                }
                field(DEB_KRED_Buchungsgruppe; Rec.DEB_KRED_Buchungsgruppe)
                {
                }
                field(Sprache; Rec.Sprache)
                {
                }
                field("Unsere Kontonr."; Rec."Unsere Kontonr.")
                {
                }
                field("Geschäftsbereich"; Rec.Geschäftsbereich)
                {
                }
                field("Kostenträger"; Rec.Kostenträger)
                {
                }
                field(Bankname; Rec.Bankname)
                {
                }
                field(BLZ; Rec.BLZ)
                {
                }
                field(Bankkontonummer; Rec.Bankkontonummer)
                {
                }
                field(IBAN; Rec.IBAN)
                {
                }
                field(Swift; Rec.Swift)
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
            action("Stammdaten überprüfen")
            {
                Image = Check;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    "StammdatenÜbergabeL": Record "Stammdaten_Übergabe";
                begin
                    StammdatenÜbergabeL.Reset;
                    //StammdatenÜbergabeL.SETRANGE(Zeitstempel, Zeitstempel);
                    //StammdatenÜbergabeL.SETRANGE(Konto_qual, Konto_qual);
                    //StammdatenÜbergabeL.SETRANGE(Konto_nummer, Konto_nummer);
                    REPORT.RunModal(50100, true, false, StammdatenÜbergabeL);
                end;
            }
            action("Stammdaten übernehmen")
            {
                Image = Migration;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    "StammdatenÜbergabeL": Record "Stammdaten_Übergabe";
                begin
                    StammdatenÜbergabeL.Reset;
                    //StammdatenÜbergabeL.SETRANGE(Zeitstempel, Zeitstempel);
                    //StammdatenÜbergabeL.SETRANGE(Konto_qual, Konto_qual);
                    //StammdatenÜbergabeL.SETRANGE(Konto_nummer, Konto_nummer);
                    //StammdatenÜbergabeL.SETRANGE("Transfered to NAV",FALSE);
                    //StammdatenÜbergabeL.SETRANGE("Error exists", FALSE);
                    //StammdatenÜbergabeL.SETRANGE("Check OK", TRUE);
                    REPORT.RunModal(50102, true, false, StammdatenÜbergabeL);
                end;
            }
        }
    }
}

