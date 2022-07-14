table 50007 "EMail per RMD-Beleg Setup"
{
    // P0001 15.02.16 DEBIE.ARE New object

    LookupPageID = "EMail per RMD-Beleg Setup";

    fields
    {
        field(1; Zuordnung; Integer)
        {
            AutoIncrement = true;
            Description = 'AutoIncrement=Yes in enstsprechender Form Editable=No Stand:20.04.10';
        }
        field(2; "EMail An"; Text[250])
        {
        }
        field(3; "EMail Kopie"; Text[250])
        {
        }
        field(4; "EMail Blind Kopie"; Text[250])
        {
            Description = 'in entsprechender Form DEFAULT:Visible=TRUE Stand:20.04.10';
        }
        field(5; "EMail Betreff"; Text[250])
        {
        }
        field(6; "EMail Text"; Text[250])
        {
        }
        field(7; "EMail Text2"; Text[250])
        {
        }
        field(8; "EMail Text3"; Text[250])
        {
        }
        field(9; "EMail Text4"; Text[250])
        {
        }
        field(10; "EMail Dateiname"; Text[250])
        {
            Description = 'in entsprechender Form DEFAULT:Visible=TRUE Stand:20.04.10';
        }
        field(11; SofortVersand; Boolean)
        {
            Description = 'in entsprechender Form nicht vorhanden Stand:20.04.10';
            InitValue = true;
        }
        field(12; Beschreibung; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; Zuordnung)
        {
            Clustered = true;
        }
        key(Key2; Beschreibung)
        {
        }
    }

    fieldgroups
    {
    }
}

