table 50004 "VIPPS Interface Entries"
{
    // P0004 28.04.16 DEBIE.ARE Field 205 "Transfered UserID" leght changed (old 20/new 50)
    // P0004 15.02.16 DEBIE.ARE NAV2015 Modus changes
    // 
    // +--------------------------------------------------------------+
    // |                  Copyright MODUS Consult AG                  |
    // |                          Customizing                         |
    // +--------------------------------------------------------------+
    // Modul     Date      User      Description
    // MC        17.09.15  OK        Object created
    // 
    // 
    // Cosmo Consult GmbH
    // CC01      26.08.16 CCBIE-ARE New felds 1033 - 1043

    Caption = 'VIPPS Interface Entries';
    DrillDownPageID = "VIPPS Interface Entries";
    LookupPageID = "VIPPS Interface Entries";

    fields
    {
        field(5; "Entry No."; BigInteger)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(10; Sourcetype; Option)
        {
            Caption = 'Source Type';
            OptionCaption = 'Master Data,Ledger Entry';
            OptionMembers = "Master Data","Ledger Entry";
        }
        field(20; "Processed at"; DateTime)
        {
            Caption = 'Processed at';
        }
        field(30; "Processed by"; Code[100])
        {
            Caption = 'Processed by';
        }
        field(100; Zeitstempel; DateTime)
        {
        }
        field(102; Konto_Qual; Code[20])
        {
        }
        field(103; Konto_Nummer; Code[20])
        {
        }
        field(104; Belegnummer; Code[20])
        {
        }
        field(105; Positions_Nummer; Integer)
        {
        }
        field(106; Rech_Gut; Text[20])
        {
        }
        field(111; Betrag_incl_MWST; Decimal)
        {
        }
        field(112; "MWST_Betrag_Prüfen"; Decimal)
        {
        }
        field(113; Nettobetrag; Decimal)
        {
        }
        field(114; "Währungkennzeichen"; Code[10])
        {
        }
        field(115; Belegdatum; Date)
        {
        }
        field(116; Buchungsdatum; Date)
        {
        }
        field(117; ZLG_Bed; Code[10])
        {
        }
        field(118; "Fälligkeitsdatum"; Date)
        {
        }
        field(119; Skontodatum; Date)
        {
        }
        field(120; Skonto_Proz; Decimal)
        {
        }
        field(121; Dim1_Kostst; Code[10])
        {
        }
        field(122; Dim2_Kosttr; Code[10])
        {
        }
        field(123; Mwst_Proz; Decimal)
        {
        }
        field(124; Mwst_Art; Code[1])
        {
        }
        field(125; Mwst_Bemessungsgrundlage; Decimal)
        {
        }
        field(126; Mwst_Betrag; Decimal)
        {
        }
        field(127; Buchungsgruppe; Code[10])
        {
        }
        field(128; "Geschäftsbuchungsgruppe"; Code[10])
        {
        }
        field(129; "Mwst_Geschäftsbuchungsgruppe"; Code[10])
        {
        }
        field(130; Abwarten; Code[3])
        {
            Description = 'Sperrkennzeichen';
        }
        field(131; Externe_Belegnummer; Code[30])
        {
        }
        field(132; Buchungsart; Code[20])
        {
        }
        field(133; Produktbuchungsgruppe; Code[10])
        {
        }
        field(134; Mwst_Produktbuchungsgruppe; Code[10])
        {
        }
        field(135; Barcode; Code[30])
        {
        }
        field(136; Betriebsauftragsnummer; Integer)
        {
        }
        field(137; Arbeitsgang; Integer)
        {
        }
        field(138; Interner_Auftrag; Integer)
        {
        }
        field(139; Kundenauftrag; Integer)
        {
        }
        field(140; Kundenauftragsposition; Integer)
        {
        }
        field(141; Bestellanforderung; Integer)
        {
        }
        field(142; Bestellanforderungsposition; Integer)
        {
        }
        field(143; Buchungs_Text; Text[50])
        {
        }
        field(144; Hanning_projekt; Integer)
        {
        }
        field(145; "Geschäftsbereich"; Integer)
        {
        }
        field(146; Gegenkonto; Code[20])
        {
            Description = 'falls einzeiliger Beleg';
        }
        field(147; Vertreter; Code[10])
        {
        }
        field(148; Sachbearbeiter; Code[10])
        {
        }
        field(149; Provision; Decimal)
        {
        }
        field(150; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';

            trigger OnValidate()
            var
                VATRegNoFormat: Record "VAT Registration No. Format";
            begin
            end;
        }
        field(200; "Transfered to NAV"; Boolean)
        {
            Caption = 'Transfered to NAV';
            Description = 'MC';
        }
        field(205; "Transfered UserID"; Code[50])
        {
            Description = 'P0004';
        }
        field(210; "Transfered DateTime"; DateTime)
        {
        }
        field(1002; ST_Konto_qual; Code[1])
        {
        }
        field(1003; ST_Konto_nummer; Code[20])
        {
        }
        field(1010; ST_Name; Text[50])
        {
        }
        field(1011; ST_Suchbegriff; Text[50])
        {
        }
        field(1012; ST_Name2; Text[50])
        {
        }
        field(1013; ST_Adresse; Text[50])
        {
        }
        field(1014; ST_Adresse2; Text[50])
        {
        }
        field(1015; ST_PLZ_Code; Text[20])
        {
        }
        field(1016; ST_Ort; Text[30])
        {
        }
        field(1017; ST_Land; Text[10])
        {
            TableRelation = "Country/Region";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(1018; ST_Telefon; Text[30])
        {
        }
        field(1019; ST_Fax; Text[30])
        {
        }
        field(1020; ST_e_Mail; Text[80])
        {
        }
        field(1021; ST_Homepage; Text[80])
        {
        }
        field(1022; ST_Zlg_Bedingungscode; Text[10])
        {
            TableRelation = "Payment Terms";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(1023; "ST_Verkäufer_Einkäufer"; Text[10])
        {
            TableRelation = "Salesperson/Purchaser";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(1024; ST_UST_ID; Text[20])
        {
        }
        field(1025; "ST_Geschäftsbuchungsgruppe"; Text[10])
        {
        }
        field(1026; "ST_MWST_Geschäftsbuchungsgrp"; Text[10])
        {
        }
        field(1027; ST_DEB_KRED_Buchungsgruppe; Text[10])
        {
            TableRelation = IF (Konto_Qual = CONST('D')) "Customer Posting Group".Code
            ELSE
            IF (Konto_Qual = CONST('K')) "Vendor Posting Group".Code;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(1028; ST_Bankname; Text[30])
        {
        }
        field(1029; ST_BLZ; Text[20])
        {
        }
        field(1030; ST_Bankkontonummer; Text[34])
        {
        }
        field(1031; ST_IBAN; Text[50])
        {
        }
        field(1032; ST_Swift; Text[20])
        {
        }
        field(1033; ST_Kreditlimit; Decimal)
        {
            Description = 'CC01';
        }
        field(1034; "ST_Währungscode"; Code[10])
        {
            Description = 'CC01';
        }
        field(1035; ST_Buchungssperre; Integer)
        {
            Description = 'CC01';
        }
        field(1036; ST_Mahnsperre; Integer)
        {
            Description = 'CC01';
        }
        field(1037; ST_Regulierungssperre; Integer)
        {
            Description = 'CC01';
        }
        field(1038; ST_Auslandskreditversicherung; Code[20])
        {
            Description = 'CC01';
        }
        field(1040; ST_Sprache; Code[10])
        {
            Description = 'CC01';
        }
        field(1041; "ST_Unsere Kontonr."; Text[20])
        {
            Description = 'CC01';
        }
        field(1042; "ST_Geschäftsbereich"; Code[20])
        {
            Description = 'CC01';
        }
        field(1043; "ST_Kostenträger"; Code[20])
        {
            Description = 'CC01';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Processed at" := CurrentDateTime;
        "Processed by" := UserId;
    end;
}

