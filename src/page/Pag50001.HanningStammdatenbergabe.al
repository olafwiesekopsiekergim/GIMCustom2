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
                field(Konto_qual; Rec.Konto_qual)
                {
                    ApplicationArea = All;
                }
                field(Konto_nummer; Rec.Konto_nummer)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Suchbegriff; Rec.Suchbegriff)
                {
                    ApplicationArea = All;
                }
                field(Name2; Rec.Name2)
                {
                    ApplicationArea = All;
                }
                field(Adresse; Rec.Adresse)
                {
                    ApplicationArea = All;
                }
                field(Adresse2; Rec.Adresse2)
                {
                    ApplicationArea = All;
                }
                field(PLZ_Code; Rec.PLZ_Code)
                {
                    ApplicationArea = All;
                }
                field(Ort; Rec.Ort)
                {
                    ApplicationArea = All;
                }
                field(Land; Rec.Land)
                {
                    ApplicationArea = All;
                }
                field(Telefon; Rec.Telefon)
                {
                    ApplicationArea = All;
                }
                field(Fax; Rec.Fax)
                {
                    ApplicationArea = All;
                }
                field(e_Mail; Rec.e_Mail)
                {
                    ApplicationArea = All;
                }
                field(Homepage; Rec.Homepage)
                {
                    ApplicationArea = All;
                }
                field(Zlg_Bedingungscode; Rec.Zlg_Bedingungscode)
                {
                    ApplicationArea = All;
                }
                field("Verkäufer_Einkäufer"; Rec.Verkäufer_Einkäufer)
                {
                    ApplicationArea = All;
                }
                field(UST_ID; Rec.UST_ID)
                {
                    ApplicationArea = All;
                }
                field("Geschäftsbuchungsgruppe"; Rec.Geschäftsbuchungsgruppe)
                {
                    ApplicationArea = All;
                }
                field("MWST_Geschäftsbuchungsgruppe"; Rec.MWST_Geschäftsbuchungsgruppe)
                {
                    ApplicationArea = All;
                }
                field(DEB_KRED_Buchungsgruppe; Rec.DEB_KRED_Buchungsgruppe)
                {
                    ApplicationArea = All;
                }
                field(Sprache; Rec.Sprache)
                {
                    ApplicationArea = All;
                }
                field("Unsere Kontonr."; Rec."Unsere Kontonr.")
                {
                    ApplicationArea = All;
                }
                field("Geschäftsbereich"; Rec.Geschäftsbereich)
                {
                    ApplicationArea = All;
                }
                field("Kostenträger"; Rec.Kostenträger)
                {
                    ApplicationArea = All;
                }
                field(Bankname; Rec.Bankname)
                {
                    ApplicationArea = All;
                }
                field(BLZ; Rec.BLZ)
                {
                    ApplicationArea = All;
                }
                field(Bankkontonummer; Rec.Bankkontonummer)
                {
                    ApplicationArea = All;
                }
                field(IBAN; Rec.IBAN)
                {
                    ApplicationArea = All;
                }
                field(Swift; Rec.Swift)
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
            action("Stammdaten überprüfen")
            {
                Image = Check;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

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
                ApplicationArea = All;

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

