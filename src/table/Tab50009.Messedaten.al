table 50009 "Messedaten"
{
    DrillDownPageID = "Messeübersicht";
    LookupPageID = "Messeübersicht";

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; Name; Text[50])
        {
            Description = 'Name';
        }
        field(3; Beginn; Date)
        {
        }
        field(4; Ende; Date)
        {
        }
        field(50101; Erstellungsdatum; Date)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Erstellungsdatum := WorkDate;
    end;
}

