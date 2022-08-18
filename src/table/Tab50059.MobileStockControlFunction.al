table 50059 "Mobile Stock Control Function"
{
    Caption = 'Mobile Stock Control Function';
    // DrillDownPageID = 70004;
    // LookupPageID = 70004;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
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

