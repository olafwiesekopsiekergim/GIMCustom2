table 50017 "Frachtcodes (Fracht2)"
{
    // P0006 16.02.16 CCBIE.ARE New object

    DrillDownPageID = "Frachtcodes für Fracht2";
    LookupPageID = "Frachtcodes für Fracht2";

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Bezeichnung; Text[30])
        {
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

