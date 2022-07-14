table 50014 "Kategorie"
{
    DataCaptionFields = Kategorie, Description;

    fields
    {
        field(1; Kategorie; Code[30])
        {
            Caption = 'Kategorie';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Beschreibung';
        }
        field(3; "Vimeo-ID"; Text[30])
        {
        }
        field(4; "Vimeo-ID2"; Text[30])
        {
            Caption = '<Vimeo-ID ENU>';
        }
    }

    keys
    {
        key(Key1; Kategorie)
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

