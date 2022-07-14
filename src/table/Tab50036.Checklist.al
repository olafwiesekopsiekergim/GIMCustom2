table 50036 "Checklist"
{
    // P0040 19.04.16 DEBIE.ARE Field added "VAT Registration No.". New object

    DrillDownPageID = "Checklist List";
    LookupPageID = "Checklist List";

    fields
    {
        field(1; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(50170; "Checklist Template"; Text[250])
        {
            Caption = 'Checklist Template';
        }
    }

    keys
    {
        key(Key1; "Language Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

