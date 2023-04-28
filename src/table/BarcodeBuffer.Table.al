table 50005 "Barcode Buffer"
{

    fields
    {
        field(1; CharA; Code[10])
        {
            Caption = 'CharA';
        }
        field(2; CharB; Code[10])
        {
            Caption = 'CharB';
        }
        field(3; CharC; Code[10])
        {
            Caption = 'CharC';
        }
        field(4; Value; Code[3])
        {
            Caption = 'Value';
        }
        field(5; Encoding; Code[20])
        {
            Caption = 'Encoding';
        }
    }

    keys
    {
        key(Key1; CharA)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

