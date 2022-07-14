table 50001 "Stammdaten_Übergabe"
{
    // P0004 15.02.16 DEBIE.ARE NAV2015 Modus changes
    // 
    // +--------------------------------------------------------------+
    // |                  Copyright MODUS Consult AG                  |
    // |                          Customizing                         |
    // +--------------------------------------------------------------+
    // Modul     Date      User      Description
    // MC        11.09.15  OK        Fields added: 100..120
    // MC        29.09.15  DT        Fields added: 33..38

    DrillDownPageID = "Hanning Stammdatenübergabe";
    LookupPageID = "Hanning Stammdatenübergabe";

    fields
    {
        field(1; Zeitstempel; DateTime)
        {
        }
        field(2; Konto_qual; Code[1])
        {
        }
        field(3; Konto_nummer; Code[20])
        {
        }
        field(10; Name; Text[50])
        {
        }
        field(11; Suchbegriff; Text[50])
        {
        }
        field(12; Name2; Text[50])
        {
        }
        field(13; Adresse; Text[50])
        {
        }
        field(14; Adresse2; Text[50])
        {
        }
        field(15; PLZ_Code; Text[20])
        {
        }
        field(16; Ort; Text[30])
        {
        }
        field(17; Land; Text[10])
        {
            TableRelation = "Country/Region";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(18; Telefon; Text[30])
        {
        }
        field(19; Fax; Text[30])
        {
        }
        field(20; e_Mail; Text[80])
        {
        }
        field(21; Homepage; Text[80])
        {
        }
        field(22; Zlg_Bedingungscode; Text[10])
        {
            TableRelation = "Payment Terms";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(23; "Verkäufer_Einkäufer"; Text[10])
        {
            TableRelation = "Salesperson/Purchaser";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(24; UST_ID; Text[20])
        {
        }
        field(25; "Geschäftsbuchungsgruppe"; Text[10])
        {
        }
        field(26; "MWST_Geschäftsbuchungsgruppe"; Text[10])
        {
        }
        field(27; DEB_KRED_Buchungsgruppe; Text[10])
        {
            TableRelation = IF (Konto_qual = CONST('D')) "Customer Posting Group".Code
            ELSE
            IF (Konto_qual = CONST('K')) "Vendor Posting Group".Code;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(28; Bankname; Text[30])
        {
        }
        field(29; BLZ; Text[20])
        {
        }
        field(30; Bankkontonummer; Text[34])
        {
        }
        field(31; IBAN; Text[50])
        {
        }
        field(32; Swift; Text[20])
        {
        }
        field(33; Kreditlimit; Decimal)
        {
        }
        field(34; "Währungscode"; Code[10])
        {
        }
        field(35; Buchungssperre; Integer)
        {
        }
        field(36; Mahnsperre; Integer)
        {
        }
        field(37; Regulierungssperre; Integer)
        {
        }
        field(38; Auslandskreditversicherung; Code[20])
        {
        }
        field(40; Sprache; Code[10])
        {
        }
        field(41; "Unsere Kontonr."; Text[20])
        {
        }
        field(42; "Geschäftsbereich"; Code[20])
        {
        }
        field(43; "Kostenträger"; Code[20])
        {
        }
        field(100; "Check OK"; Boolean)
        {
            Caption = 'Check OK';
            Description = 'MC';
        }
        field(110; "Error exists"; Boolean)
        {
            Caption = 'Error exists';
            Description = 'MC';
        }
        field(120; "Error No."; Integer)
        {
            Caption = 'Error No.';
            Description = 'MC';
        }
        field(130; "Transfered to NAV"; Boolean)
        {
            Caption = 'Transfered to NAV';
            Description = 'MC';
        }
    }

    keys
    {
        key(Key1; Zeitstempel, Konto_qual, Konto_nummer)
        {
            Clustered = true;
        }
        key(Key2; "Check OK")
        {
        }
        key(Key3; "Transfered to NAV", "Error exists", "Check OK")
        {
        }
    }

    fieldgroups
    {
    }
}

