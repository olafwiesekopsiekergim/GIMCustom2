/// <summary>
/// Table Job Item Category (ID 50000).
/// </summary>
table 50000 "Job Item Category"
{
    // P0005 16.02.16 CCBIE.ARE New object
    // 
    // //c/mt/030614: - Überführung Felder aus Tabelle 94 Inventory Posting Group

    Caption = 'Job Item Category';
    LookupPageID = "Internal Job Item Category";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(3; Description; Text[30])
        {
            Caption = 'Description';
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

    trigger OnDelete()
    begin
        ProductGroup.SetRange(Code, Code);
        ProductGroup.Setrange(Indentation, 1);
        ProductGroup.DeleteAll;
    end;

    var
        ProductGroup: Record "Item Category";

}