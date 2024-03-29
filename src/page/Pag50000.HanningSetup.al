page 50000 "Hanning Setup"
{
    // #AT1.0 12.03.19 TRIA Added new field "Betriebsauftrag"
    // P0033 05.04.16 DEBIE.ARE New fields "Default Bank Account Code", "VAT Prod. Post. Group Code MP"
    // P0004 15.02.16 DEBIE.ARE NAV2015 Modus changes
    // 
    // +--------------------------------------------------------------+
    // |                  Copyright MODUS Consult AG                  |
    // |                          Customizing                         |
    // +--------------------------------------------------------------+
    // Modul     Date      User      Description
    // MC        10.09.15  OK        Object created
    // MC        11.09.15  OK        Fields added
    // MC        29.09.15  DT        Name GMI/GIM

    Caption = 'Hanning Setup';
    PageType = Card;
    SourceTable = "Hanning Setup";

    layout
    {
        area(content)
        {
            group(Allgemein)
            {
                field("Einkauf Vorlage Registrierung"; Rec."Einkauf Vorlage Registrierung")
                {
                    ApplicationArea = All;
                }
                field("Einkauf Buchblatt Registr."; Rec."Einkauf Buchblatt Registr.")
                {
                    ApplicationArea = All;
                }
                field("Einkauf Vorlage Prüfung"; Rec."Einkauf Vorlage Prüfung")
                {
                    ApplicationArea = All;
                }
                field("Einkauf Buchblatt Prüfung"; Rec."Einkauf Buchblatt Prüfung")
                {
                    ApplicationArea = All;
                }
                field("Verkauf Vorlage"; Rec."Verkauf Vorlage")
                {
                    ApplicationArea = All;
                }
                field("Verkauf Buchblatt"; Rec."Verkauf Buchblatt")
                {
                    ApplicationArea = All;
                }
                field("Default Value On Hold"; Rec."Default Value On Hold")
                {
                    ApplicationArea = All;
                }
                field(Standardmahnmethode; Rec.Standardmahnmethode)
                {
                    ApplicationArea = All;
                }
                field(KST; Rec.KST)
                {
                    ApplicationArea = All;
                }
                field(KTR; Rec.KTR)
                {
                    ApplicationArea = All;
                }
                field("Kunden-Auftrag"; Rec."Kunden-Auftrag")
                {
                    ApplicationArea = All;
                }
                field("Kunden-Auftrags-Position"; Rec."Kunden-Auftrags-Position")
                {
                    ApplicationArea = All;
                }
                field("Interner-Auftrag"; Rec."Interner-Auftrag")
                {
                    ApplicationArea = All;
                }
                field("Projekt-Nummer"; Rec."Projekt-Nummer")
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
                field(Betriebsauftragsnummer; Rec.Betriebsauftragsnummer)
                {
                    ApplicationArea = All;
                }
                field("Kred.-Bank VIPPS nicht prüfen"; Rec."Kred.-Bank VIPPS nicht prüfen")
                {
                    ApplicationArea = All;
                }
                field("Default Bank Account Code"; Rec."Default Bank Account Code")
                {
                    Description = 'P0033';
                    ApplicationArea = All;
                }
                field("VAT Prod. Post. Group Code MP"; Rec."VAT Prod. Post. Group Code MP")
                {
                    Description = 'P0033';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get then
            Rec.Insert;
    end;
}

