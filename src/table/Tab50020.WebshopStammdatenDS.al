table 50020 "WebshopStammdaten- DS"
{

    fields
    {
        field(1; "Code"; Code[50])
        {
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
        }
        field(3; Ebene; Boolean)
        {
        }
        field(4; Produktkategorie; Boolean)
        {
        }
        field(5; Zubehoer; Boolean)
        {
        }
        field(6; Linie; Boolean)
        {
            Caption = 'Modell';
        }
        field(7; "Einsatz/Produktabschnitt"; Boolean)
        {
        }
        field(8; Produktgruppe; Boolean)
        {
        }
        field(9; "Bezeichnung-Zusatz"; Boolean)
        {
            Caption = 'Modelltyp';
        }
        field(10; Modellgroesse; Boolean)
        {
        }
        field(11; "Description(EN)"; Text[50])
        {
        }
        field(12; "Description(FR)"; Text[50])
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

