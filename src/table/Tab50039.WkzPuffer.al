table 50039 "WkzPuffer"
{

    fields
    {
        field(1; "WkzNo."; Code[10])
        {
        }
        field(2; Anschaffungswert; Decimal)
        {
        }
        field(3; "EntryNo."; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "EntryNo.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

