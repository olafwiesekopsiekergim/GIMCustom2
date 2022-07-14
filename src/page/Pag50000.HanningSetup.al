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
                }
                field("Einkauf Buchblatt Registr."; Rec."Einkauf Buchblatt Registr.")
                {
                }
                field("Einkauf Vorlage Prüfung"; Rec."Einkauf Vorlage Prüfung")
                {
                }
                field("Einkauf Buchblatt Prüfung"; Rec."Einkauf Buchblatt Prüfung")
                {
                }
                field("Verkauf Vorlage"; Rec."Verkauf Vorlage")
                {
                }
                field("Verkauf Buchblatt"; Rec."Verkauf Buchblatt")
                {
                }
                field("Default Value On Hold"; Rec."Default Value On Hold")
                {
                }
                field(Standardmahnmethode; Rec.Standardmahnmethode)
                {
                }
                field(KST; Rec.KST)
                {
                }
                field(KTR; Rec.KTR)
                {
                }
                field("Kunden-Auftrag"; Rec."Kunden-Auftrag")
                {
                }
                field("Kunden-Auftrags-Position"; Rec."Kunden-Auftrags-Position")
                {
                }
                field("Interner-Auftrag"; Rec."Interner-Auftrag")
                {
                }
                field("Projekt-Nummer"; Rec."Projekt-Nummer")
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
                field(Betriebsauftragsnummer; Rec.Betriebsauftragsnummer)
                {
                }
                field("Kred.-Bank VIPPS nicht prüfen"; Rec."Kred.-Bank VIPPS nicht prüfen")
                {
                }
                field("Default Bank Account Code"; Rec."Default Bank Account Code")
                {
                    Description = 'P0033';
                }
                field("VAT Prod. Post. Group Code MP"; Rec."VAT Prod. Post. Group Code MP")
                {
                    Description = 'P0033';
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

