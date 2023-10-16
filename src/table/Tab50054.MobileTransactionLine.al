table 50054 "Mobile Transaction Line"
{
    // L-MOBILE LM2.00
    //   object defined
    // 
    // L-MOBILE LM2.00.05
    //   key
    //     Transaction No.,No.
    //   definied
    //   set tablerelations to standard master data tables
    // 
    // L-MOBILE LM2.00.07
    //   deleting related Mobile Transaction Records added

    Caption = 'Mobile Transaction Line';

    fields
    {
        field(10; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(20; "Main Posting No."; Integer)
        {
            Caption = 'Main Posting No.';
        }
        field(30; "Transaction No."; Integer)
        {
            Caption = 'Transaction No.';
        }
        field(40; "Posting Type"; Text[50])
        {
            Caption = 'Posting Type';
        }
        field(50; Status; Integer)
        {
            Caption = 'Status';
        }
        field(60; "Message Type"; Option)
        {
            Caption = 'Message Type';
            OptionCaption = 'Info,Warning,Error';
            OptionMembers = Info,Warning,Error;
        }
        field(70; "Message Text"; Text[250])
        {
            Caption = 'Message Text';
        }
        field(80; "Printer Name"; Text[250])
        {
            Caption = 'Printer Name';
        }
        field(90; "Printed Copies"; Integer)
        {
            Caption = 'Printed Copies';
        }
        field(100; "Site Code"; Code[10])
        {
            Caption = 'Site Code';
            Description = 'not use';
        }
        field(110; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(115; "Location Code Bin Code"; Code[30])
        {
            Caption = 'Location Code Bin Code';
            TableRelation = Bin."Location Code" WHERE("Location Code" = FIELD("Location Code"));
        }
        field(116; "Location Key Location Code"; Code[10])
        {
            Caption = 'Location Key Location Code';
            TableRelation = Location;
        }
        field(117; "Location Key Bin Code"; Code[20])
        {
            Caption = 'Location Key Bin Code';
            TableRelation = Bin."Location Code" WHERE("Location Code" = FIELD("Location Key Location Code"));
        }
        field(120; "Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
            TableRelation = Zone.Code WHERE("Location Code" = FIELD("Location Code"));
        }
        field(130; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("Location Code"));
        }
        field(140; "New Site Code"; Code[10])
        {
            Caption = 'New Site Code';
            Description = 'not use';
        }
        field(150; "New Location Code"; Code[10])
        {
            Caption = 'New Location Code';
            TableRelation = Location;
        }
        field(155; "New Location Code Bin Code"; Code[30])
        {
            Caption = 'New Location Code Bin Code';
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("New Location Code"));
        }
        field(156; "New Location Key Location Code"; Code[10])
        {
            Caption = 'New Location Key Location Code';
            TableRelation = Location;
        }
        field(157; "New Location Key Bin Code"; Code[20])
        {
            Caption = 'New Location Key Bin Code';
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("New Location Key Location Code"));
        }
        field(160; "New Zone Code"; Code[10])
        {
            Caption = 'New Zone Code';
            TableRelation = Zone.Code WHERE("Location Code" = FIELD("New Location Code"));
        }
        field(170; "New Bin Code"; Code[20])
        {
            Caption = 'New Bin Code';
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("New Location Code"));
        }
        field(180; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(190; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Item No."));
        }
        field(200; "Lot No."; Code[20])
        {
            Caption = 'Lot No.';
        }
        field(205; "Serial No."; Code[20])
        {
            Caption = 'Serial No.';
        }
        field(210; "Expiration Date"; Datetime)
        {
            Caption = 'Expiration Date';
        }
        field(220; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(230; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Item No."));
        }
        field(240; "Source Document No."; Code[20])
        {
            Caption = 'Source Document No.';
        }
        field(250; "Source Document Line No."; Integer)
        {
            Caption = 'Source Document Line No.';
        }
        field(260; "Prod. Order Line No."; Integer)
        {
            Caption = 'Prod. Order Line No.';
        }
        field(270; "Batch Name"; Code[10])
        {
            Caption = 'Batch Name';
            Description = 'LM2.00.03';
        }
        field(271; "Template Name"; Code[10])
        {
            Caption = 'Template Name';
            Description = 'LM2.00.03';
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
        field(1040; "NAV User ID"; Code[50])
        {
            Caption = 'NAV User ID';
            Description = 'LM2.00.03';
        }
        field(1100; "Stock Key Item No."; Code[20])
        {
            Caption = 'Stock Key Item No.';
            TableRelation = Item;
        }
        field(1110; "Stock Key Variant Code"; Code[10])
        {
            Caption = 'Stock Key Variant Code';
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Stock Key Item No."));
        }
        field(1120; "Stock Key Location Code"; Code[10])
        {
            Caption = 'Stock Key Location Code';
            TableRelation = Location;
        }
        field(1130; "Stock Key Bin Code"; Code[20])
        {
            Caption = 'Stock Key Bin Code';
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("Stock Key Location Code"));
        }
        field(1140; "Stock Key Lot No."; Code[20])
        {
            Caption = 'Stock Key Lot No.';
        }
        field(1150; "Stock Key Serial No."; Code[20])
        {
            Caption = 'Stock Key Serial No.';
        }
        field(1160; "Stock Key Unit of Measure Code"; Code[10])
        {
            Caption = 'Stock Key Unit of Measure Code';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Stock Key Item No."));
        }
        field(1200; "Inventory Position Key Line No"; Integer)
        {
            Caption = 'Inventory Position Key Line No';
        }
        field(1210; "Inventory No."; Code[10])
        {
            Caption = 'Inventory No.';
        }
        field(1220; "Recording No."; Integer)
        {
            Caption = 'Recording No.';
        }
        field(1300; Weight; Decimal)
        {
            Caption = 'Weight';
        }
        field(1310; "Weight Unit of Measure Code"; Code[10])
        {
            Caption = 'Weight Unit of Measure Code';
            TableRelation = "Unit of Measure";
        }
        field(1400; BooleanField_1; Boolean)
        {
            Caption = 'BooleanField_1';
        }
        field(1410; BooleanField_2; Boolean)
        {
            Caption = 'BooleanField_2';
        }
        field(1420; BooleanField_3; Boolean)
        {
            Caption = 'BooleanField_3';
        }
        field(1430; BooleanField_4; Boolean)
        {
            Caption = 'BooleanField_4';
        }
        field(1440; BooleanField_5; Boolean)
        {
            Caption = 'BooleanField_5';
        }
        field(1450; BooleanField_6; Boolean)
        {
            Caption = 'BooleanField_6';
        }
        field(1460; BooleanField_7; Boolean)
        {
            Caption = 'BooleanField_7';
        }
        field(1470; BooleanField_8; Boolean)
        {
            Caption = 'BooleanField_8';
        }
        field(1480; BooleanField_9; Boolean)
        {
            Caption = 'BooleanField_9';
        }
        field(1500; IntegerField_1; Integer)
        {
            Caption = 'IntegerField_1';
        }
        field(1510; IntegerField_2; Integer)
        {
            Caption = 'IntegerField_2';
        }
        field(1520; IntegerField_3; Integer)
        {
            Caption = 'IntegerField_3';
        }
        field(1530; IntegerField_4; Integer)
        {
            Caption = 'IntegerField_4';
        }
        field(1540; IntegerField_5; Integer)
        {
            Caption = 'IntegerField_5';
        }
        field(1550; IntegerField_6; Integer)
        {
            Caption = 'IntegerField_6';
        }
        field(1560; IntegerField_7; Integer)
        {
            Caption = 'IntegerField_7';
        }
        field(1570; IntegerField_8; Integer)
        {
            Caption = 'IntegerField_8';
        }
        field(1580; IntegerField_9; Integer)
        {
            Caption = 'IntegerField_9';
        }
        field(1600; NumberField_1; Decimal)
        {
            Caption = 'NumberField_1';
        }
        field(1610; NumberField_2; Decimal)
        {
            Caption = 'NumberField_2';
        }
        field(1620; NumberField_3; Decimal)
        {
            Caption = 'NumberField_3';
        }
        field(1630; NumberField_4; Decimal)
        {
            Caption = 'NumberField_4';
        }
        field(1640; NumberField_5; Decimal)
        {
            Caption = 'NumberField_5';
        }
        field(1650; NumberField_6; Decimal)
        {
            Caption = 'NumberField_6';
        }
        field(1660; NumberField_7; Decimal)
        {
            Caption = 'NumberField_7';
        }
        field(1670; NumberField_8; Decimal)
        {
            Caption = 'NumberField_8';
        }
        field(1680; NumberField_9; Decimal)
        {
            Caption = 'NumberField_9';
        }
        field(1700; DateField_1; Datetime)
        {
            Caption = 'DateField_1';
        }
        field(1710; DateField_2; Datetime)
        {
            Caption = 'DateField_2';
        }
        field(1720; DateField_3; Datetime)
        {
            Caption = 'DateField_3';
        }
        field(1730; DateField_4; Datetime)
        {
            Caption = 'DateField_4';
        }
        field(1740; DateField_5; Datetime)
        {
            Caption = 'DateField_5';
        }
        field(1750; DateField_6; Datetime)
        {
            Caption = 'DateField_6';
        }
        field(1760; DateField_7; Datetime)
        {
            Caption = 'DateField_7';
        }
        field(1770; DateField_8; Datetime)
        {
            Caption = 'DateField_8';
        }
        field(1780; DateField_9; Datetime)
        {
            Caption = 'DateField_9';
        }
        field(1800; StringField_1; Text[30])
        {
            Caption = 'StringField_1';
        }
        field(1810; StringField_2; Text[30])
        {
            Caption = 'StringField_2';
        }
        field(1820; StringField_3; Text[30])
        {
            Caption = 'StringField_3';
        }
        field(1830; StringField_4; Text[30])
        {
            Caption = 'StringField_4';
        }
        field(1840; StringField_5; Text[30])
        {
            Caption = 'StringField_5';
        }
        field(1850; StringField_6; Text[30])
        {
            Caption = 'StringField_6';
        }
        field(1860; StringField_7; Text[30])
        {
            Caption = 'StringField_7';
        }
        field(1870; StringField_8; Text[30])
        {
            Caption = 'StringField_8';
        }
        field(1880; StringField_9; Text[30])
        {
            Caption = 'StringField_9';
        }
        field(1900; Comment; Text[30])
        {
            Caption = 'Comment';
        }
        field(1910; "Close Order"; Boolean)
        {
            Caption = 'Close Order';
        }
        field(2000; "Move List Key"; Code[20])
        {
            Caption = 'Move List Key';
        }
        field(2010; "Move Key List Key"; Code[20])
        {
            Caption = 'Move Key List Key';
        }
        field(2020; "Move Key Move Key"; Integer)
        {
            Caption = 'Move Key Move Key';
        }
        field(5000; "Qa Pending Quantity"; Decimal)
        {
            Caption = 'Qa Pending Quantity';
            Description = 'PROD';
        }
        field(5001; "Scrap Quantity"; Decimal)
        {
            Caption = 'Scrap Quantity';
            Description = 'PROD';
        }
        field(5002; "To Qa Pending"; Boolean)
        {
            Caption = 'To Qa Pending';
            Description = 'PROD';
        }
        field(5003; "Grouped Operation Key"; Integer)
        {
            Caption = 'Grouped Operation Key';
            Description = 'PROD';
        }
        field(5004; "Tool Key"; Code[20])
        {
            Caption = 'Tool Key';
            Description = 'PROD';
        }
        field(5005; "Workplace Key"; Code[20])
        {
            Caption = 'Workplace Key';
            Description = 'PROD';
        }
        field(5006; "Posting Code"; Integer)
        {
            Caption = 'Posting Code';
            Description = 'PROD';
        }
        field(5007; "Document Date"; Date)
        {
            Caption = 'Document Date';
            Description = 'PROD';
        }
        field(5008; "Document Key"; Code[20])
        {
            Caption = 'Document Key';
            Description = 'PROD';
        }
        field(5009; "Partner No."; Code[20])
        {
            Caption = 'Partner No.';
            Description = 'PROD';
        }
        field(5010; "Order Operation Key"; Code[20])
        {
            Caption = 'Order Operation Key';
            Description = 'PROD';
        }
        field(5011; "Person Key"; Code[50])
        {
            Caption = 'Person Key';
            Description = 'PROD';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Transaction No.", "No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        MobileTransactionEffect: Record "Mobile Transaction Effect";
    begin
        //+LM2.00.07
        MobileTransactionEffect.SetRange("Posting No.", "No.");
        MobileTransactionEffect.DeleteAll(true);
        //-LM2.00.07
    end;
}

