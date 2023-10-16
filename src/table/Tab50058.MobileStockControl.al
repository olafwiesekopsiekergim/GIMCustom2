table 50058 "Mobile Stock Control"
{
    Caption = 'Mobile Stock Control';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = false;
            Caption = 'Entry No.';
            Editable = true;
        }
        field(10; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(20; "Zone Code"; Code[20])
        {
            Caption = 'Zone Code';
            TableRelation = Zone.Code WHERE("Location Code" = FIELD("Location Code"));
        }
        field(30; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("Location Code"));
        }
        field(40; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(50; "Variant Code"; Code[20])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Item No."));
        }
        field(60; "Lot No."; Code[20])
        {
            Caption = 'Lot No.';
        }
        field(70; "Serial No."; Code[20])
        {
            Caption = 'Serial No.';
        }
        field(80; "User Id"; Code[20])
        {
            Caption = 'User ID';
        }
        field(90; "Date From"; Date)
        {
            Caption = 'Date From';
        }
        field(100; "Date To"; Date)
        {
            Caption = 'Date To';
        }
        field(110; "Function Name"; Code[20])
        {
            Caption = 'Function Name';
            TableRelation = "Mobile Stock Control Function";
        }
        field(111; "Blocking Reason"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

