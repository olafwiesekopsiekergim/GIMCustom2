table 50056 "Mobile Transaction Effect"
{
    // L-MOBILE LM2.00
    //   object defined
    // 
    // L-MOBILE LM2.00.07
    //   key
    //     Posting No.
    //   definied

    Caption = 'Mobile Transaction Effect';

    fields
    {
        field(10; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(15; Kind; Integer)
        {
            Caption = 'Kind';
        }
        field(20; "Posting No."; Integer)
        {
            Caption = 'Posting No.';
        }
        field(30; Status; Integer)
        {
            Caption = 'Status';
        }
        field(40; "Source Type"; Text[64])
        {
            Caption = 'Source Type';
        }
        field(50; "Source Document No."; Code[20])
        {
            Caption = 'Source Document No.';
        }
        field(60; "Source Document Line No."; Integer)
        {
            Caption = 'Source Document Line No.';
        }
        field(70; "Prod_ Order Line No."; Integer)
        {
            Caption = 'Prod_ Order Line No.';
        }
        field(80; "Delta Quantity"; Decimal)
        {
            Caption = 'Delta Quantity';
        }
        field(82; "Delta QA Pending Quantity"; Decimal)
        {
            Caption = 'Delta QA Pending Quantity';
        }
        field(85; "Delta QA Blocked Quantity"; Decimal)
        {
            Caption = 'Delta QA Blocked Quantity';
        }
        field(87; "Order Will Be Closed"; Boolean)
        {
            Caption = 'Order Will Be Closed';
        }
        field(88; "Delta Reserved Quantity"; Decimal)
        {
            Caption = 'Delta Reserved Quantity';
        }
        field(90; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(100; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
        }
        field(200; "Stock Key Location Code"; Code[10])
        {
            Caption = 'Stock Key Location Code';
        }
        field(210; "Stock Key Bin Code"; Code[20])
        {
            Caption = 'Stock Key Bin Code';
        }
        field(220; "Stock Key Item No."; Code[20])
        {
            Caption = 'Stock Key Item No.';
        }
        field(230; "Stock Key Variant Code"; Code[10])
        {
            Caption = 'Stock Key Variant Code';
        }
        field(240; "Stock Key Lot No."; Code[20])
        {
            Caption = 'Stock Key Lot No.';
        }
        field(250; "Stock Key Serial No."; Code[20])
        {
            Caption = 'Stock Key Serial No.';
        }
        field(260; "Stock Key Unit of Measure Code"; Code[10])
        {
            Caption = 'Stock Key Unit of Measure Code';
        }
        field(300; "Location Key Location Code"; Code[10])
        {
            Caption = 'Location Key Location Code';
        }
        field(310; "Location Key Bin Code"; Code[20])
        {
            Caption = 'Location Key Bin Code';
        }
        field(1000; "Create Date"; DateTime)
        {
            Caption = 'Create Date';
        }
        field(1010; "Create User Id"; Code[20])
        {
            Caption = 'Create User Id';
        }
        field(1020; "Modify Date"; DateTime)
        {
            Caption = 'Modify Date';
        }
        field(1030; "Modify User Id"; Code[20])
        {
            Caption = 'Modify User Id';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Posting No.")
        {
        }
    }

    fieldgroups
    {
    }
}

