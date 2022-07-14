table 50023 "Reason"
{
    // P0005 16.02.16 CCBIE.ARE New object

    Caption = 'Reason';
    DrillDownPageID = Reasons;
    LookupPageID = Reasons;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; Reason; Text[30])
        {
            Caption = 'Reason';
        }
        field(4; Win; Boolean)
        {
            Caption = 'Win';
        }
    }

    keys
    {
        key(Key1; "Code", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; Win)
        {
        }
    }

    fieldgroups
    {
    }
}

