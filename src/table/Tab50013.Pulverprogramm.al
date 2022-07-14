table 50013 "Pulverprogramm"
{
    DataCaptionFields = Pulverprogrammno, Description;
    DrillDownPageID = Pulverprogramm;
    LookupPageID = Pulverprogramm;

    fields
    {
        field(1; Pulverprogrammno; Code[20])
        {
            Caption = 'Pulverprogrammnr';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Beschreibung';
        }
    }

    keys
    {
        key(Key1; Pulverprogrammno)
        {
            Clustered = true;
        }
        key(Key2; Description)
        {
        }
    }

    fieldgroups
    {
    }
}

