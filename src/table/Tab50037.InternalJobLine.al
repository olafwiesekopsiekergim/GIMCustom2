table 50037 "Internal Job Line"
{
    // P0005 16.02.16 CCBIE.ARE New object
    // 
    // c/wa/290415: - Tablerelation zu neuer Tabelle 50000 hergestellt
    // c/gw/290911: - A20611, Erweiterung internes Projektmodul
    //              > neue Tabelle 50037, Internal Job Line
    //              > TANGIERTE OBJEKTE diehe in Doku der Tabelle 50022, Internal Job


    fields
    {
        field(50000; "Internal Job No."; Code[20])
        {
            Caption = 'Internal Job No.';
            Description = 'DEU=Interne Projektnummer;ENU=Internal Job No.';
            TableRelation = "Internal Job";
        }
        field(50010; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Description = 'DEU=Zeilennr.;ENU=Line No.';
        }
        field(50100; "Item category"; Code[10])
        {
            Caption = 'Item category';
            Description = 'DEU=Artikel Kategorie;ENU=Item category';
            TableRelation = "Job Item Category";

            trigger OnValidate()
            var
            //lProductGroupRec: Record "Product Group";
            begin
            end;
        }
        field(50120; Quantity; Decimal)
        {
            Caption = 'Quantity';
            Description = 'DEU=Menge;ENU=Quantity';
        }
        field(50200; Comment; Text[250])
        {
            Caption = 'Comment';
            Description = 'DEU=Kommentar;ENU=Comment';
        }
    }

    keys
    {
        key(Key1; "Internal Job No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        l001_C: Label '%1 is missing';
}

