table 50035 "Production Group"
{
    // P0035 04.04.16 CCBIE.ARE New object

    Caption = 'Production Group';
    LookupPageID = "Production Groups";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(50130; "Print Action Released"; Option)
        {
            Caption = 'Print Action Released';
            OptionMembers = "mit Details","ohne Details","kein Druck",Listendruck;
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

