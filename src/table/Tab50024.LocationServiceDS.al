table 50024 "Location Service-DS"
{

    fields
    {
        field(1; "Lfd.-Nr"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No.";
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item."No.";
            ValidateTableRelation = false;
        }
        field(4; Location; Text[100])
        {
            Caption = 'Location';
        }
        field(5; "Prod. Order No."; Text[100])
        {
            Caption = 'Serial No.';
        }
    }

    keys
    {
        key(Key1; "Lfd.-Nr")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

