table 50050 "Mapping Sach Deb Kred"
{

    fields
    {
        field(1; Art; Option)
        {
            Caption = 'Art';
            OptionCaption = 'Sachkonto,Debitor,Kreditor';
            OptionMembers = Sachkonto,Debitor,Kreditor;
        }
        field(2; "Konto Alt"; Code[20])
        {
            Caption = 'Konto Alt';
        }
        field(3; "Konto Neu"; Code[20])
        {
            Caption = 'Konto Neu';
        }
    }

    keys
    {
        key(Key1; Art, "Konto Alt")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

