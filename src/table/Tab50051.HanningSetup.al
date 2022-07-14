table 50051 "Hanning Setup"
{
    // #AT1.0 11.03.19 TRIA New Field 75 Betriebsauftragsnummer
    // P0033 05.04.16 DEBIE.ARE New fields 80 "Default Bank Account Code", 90 "VAT Prod. Post. Group Code MP"
    // P0004 15.02.16 DEBIE.ARE NAV2015 Modus changes
    // 
    // +--------------------------------------------------------------+
    // |                  Copyright MODUS Consult AG                  |
    // |                          Customizing                         |
    // +--------------------------------------------------------------+
    // Modul     Date      User      Description
    // MC        11.09.15  OK        Object created

    LookupPageID = "Hanning Setup";

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; "Einkauf Vorlage Registrierung"; Code[10])
        {
            Caption = 'Einkauf Buch.-Blatt Template Registrierung';
            TableRelation = "Gen. Journal Template".Name WHERE(Type = CONST(General));
        }
        field(10; "Einkauf Buchblatt Registr."; Code[10])
        {
            Caption = 'Einkauf Buch.-Blatt Name Registr.';
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Einkauf Vorlage Registrierung"));
        }
        field(11; "Verkauf Vorlage"; Code[10])
        {
            Caption = 'Verkauf Buch.-Blatt Template';
            TableRelation = "Gen. Journal Template".Name WHERE(Type = CONST(General));
        }
        field(12; "Verkauf Buchblatt"; Code[10])
        {
            Caption = 'Verkauf Buch.-Blatt Name';
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Verkauf Vorlage"));
        }
        field(13; "Einkauf Vorlage Prüfung"; Code[10])
        {
            Caption = 'Einkauf Buch.-Blatt Template Prüfung';
            TableRelation = "Gen. Journal Template".Name WHERE(Type = CONST(General));
        }
        field(14; "Einkauf Buchblatt Prüfung"; Code[10])
        {
            Caption = 'Einkauf Buch.-Blatt Name Prüfung';
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Einkauf Vorlage Prüfung"));
        }
        field(15; "Default Value On Hold"; Code[3])
        {
            Caption = 'Default Value On Hold';
        }
        field(20; KST; Code[20])
        {
            TableRelation = Dimension;
        }
        field(25; KTR; Code[20])
        {
            TableRelation = Dimension;
        }
        field(30; "Kunden-Auftrag"; Code[20])
        {
            TableRelation = Dimension;
        }
        field(35; "Interner-Auftrag"; Code[20])
        {
            TableRelation = Dimension;
        }
        field(40; "Projekt-Nummer"; Code[20])
        {
            TableRelation = Dimension;
        }
        field(45; "Geschäftsbereich"; Code[20])
        {
            TableRelation = Dimension;
        }
        field(50; Vertreter; Code[20])
        {
            TableRelation = Dimension;
        }
        field(55; Sachbearbeiter; Code[20])
        {
            TableRelation = Dimension;
        }
        field(60; "Kunden-Auftrags-Position"; Code[20])
        {
            TableRelation = Dimension;
        }
        field(65; Standardmahnmethode; Code[10])
        {
            TableRelation = "Reminder Terms".Code;
        }
        field(70; "Kred.-Bank VIPPS nicht prüfen"; Boolean)
        {
        }
        field(75; Betriebsauftragsnummer; Code[20])
        {
            Description = '#AT';
            TableRelation = Dimension;
        }
        field(80; "Default Bank Account Code"; Code[10])
        {
            Caption = 'Default Bank Account Code';
            Description = 'P0033';
        }
        field(90; "VAT Prod. Post. Group Code MP"; Code[10])
        {
            Caption = 'VAT Product Posting Group Code for Manually Pretax';
            Description = 'P0033';
            TableRelation = "VAT Product Posting Group";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

