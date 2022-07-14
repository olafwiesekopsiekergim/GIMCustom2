table 50002 "Beleg_Übergabe"
{
    // P0004 28.04.16 DEBIE.ARE Field 135 "Transfered UserID" leght changed (old 20/new 50)
    // P0004 15.02.16 DEBIE.ARE NAV2015 Modus changes
    // 
    // +--------------------------------------------------------------+
    // |                  Copyright MODUS Consult AG                  |
    // |                          Customizing                         |
    // +--------------------------------------------------------------+
    // Modul     Date      User      Description
    // MC        11.09.15  OK        Fields added: 100..130
    // MC        29.09.15  DT        Fields 45/46

    DrillDownPageID = "Hanning Belegübergabe";
    LookupPageID = "Hanning Belegübergabe";

    fields
    {
        field(1; Zeitstempel; DateTime)
        {
        }
        field(2; Konto_Qual; Code[20])
        {
        }
        field(3; Konto_Nummer; Code[20])
        {
        }
        field(4; Belegnummer; Code[20])
        {
        }
        field(5; Positions_Nummer; Integer)
        {
        }
        field(10; Rech_Gut; Text[20])
        {
        }
        field(11; Betrag_incl_MWST; Decimal)
        {
        }
        field(12; "MWST_Betrag_Prüfen"; Decimal)
        {
        }
        field(13; Nettobetrag; Decimal)
        {
        }
        field(14; "Währungkennzeichen"; Code[10])
        {
        }
        field(15; Belegdatum; Date)
        {
        }
        field(16; Buchungsdatum; Date)
        {
        }
        field(17; ZLG_Bed; Code[10])
        {
        }
        field(18; "Fälligkeitsdatum"; Date)
        {
        }
        field(19; Skontodatum; Date)
        {
        }
        field(20; Skonto_Proz; Decimal)
        {
        }
        field(21; Dim1_Kostst; Code[10])
        {
        }
        field(22; Dim2_Kosttr; Code[10])
        {
        }
        field(23; Mwst_Proz; Decimal)
        {
        }
        field(24; Mwst_Art; Code[1])
        {
        }
        field(25; Mwst_Bemessungsgrundlage; Decimal)
        {
        }
        field(26; Mwst_Betrag; Decimal)
        {
        }
        field(27; Buchungsgruppe; Code[10])
        {
        }
        field(28; "Geschäftsbuchungsgruppe"; Code[10])
        {
        }
        field(29; "Mwst_Geschäftsbuchungsgruppe"; Code[10])
        {
        }
        field(30; Abwarten; Code[3])
        {
            Description = 'Sperrkennzeichen';
        }
        field(31; Externe_Belegnummer; Code[30])
        {
        }
        field(32; Buchungsart; Code[20])
        {
        }
        field(33; Produktbuchungsgruppe; Code[10])
        {
        }
        field(34; Mwst_Produktbuchungsgruppe; Code[10])
        {
        }
        field(35; Barcode; Code[30])
        {
        }
        field(36; Betriebsauftragsnummer; Integer)
        {
        }
        field(37; Arbeitsgang; Integer)
        {
        }
        field(38; Interner_Auftrag; Integer)
        {
        }
        field(39; Kundenauftrag; Integer)
        {
        }
        field(40; Kundenauftragsposition; Integer)
        {
        }
        field(41; Bestellanforderung; Integer)
        {
        }
        field(42; Bestellanforderungsposition; Integer)
        {
        }
        field(43; Buchungs_Text; Text[50])
        {
        }
        field(44; Hanning_projekt; Integer)
        {
        }
        field(45; "Geschäftsbereich"; Integer)
        {
        }
        field(46; Gegenkonto; Code[20])
        {
            Description = 'falls einzeiliger Beleg';
        }
        field(47; Vertreter; Code[10])
        {
        }
        field(48; Sachbearbeiter; Code[10])
        {
        }
        field(49; Provision; Decimal)
        {
        }
        field(50; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';

            trigger OnValidate()
            var
                VATRegNoFormat: Record "VAT Registration No. Format";
            begin
            end;
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
        field(135; "Transfered UserID"; Code[50])
        {
            Description = 'P0004';
        }
        field(140; "Transfered DateTime"; DateTime)
        {
        }
    }

    keys
    {
        key(Key1; Zeitstempel, Konto_Qual, Konto_Nummer, Belegnummer, Positions_Nummer)
        {
            Clustered = true;
        }
        key(Key2; Belegnummer, Belegdatum)
        {
            SumIndexFields = Betrag_incl_MWST, Nettobetrag;
        }
        key(Key3; "Transfered to NAV", "Error exists", "Check OK", Belegnummer, Positions_Nummer)
        {
        }
        key(Key4; Belegnummer, Positions_Nummer, Belegdatum, "Check OK", "Transfered to NAV", "Error exists")
        {
        }
    }

    fieldgroups
    {
    }
}

