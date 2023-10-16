table 50025 ProdCompBuffer
{

    fields
    {
        field(1; "Item No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Bin Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Unit of Measure Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Quantity per"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23; CalcedQuantityAvailable; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24; QuantityNotAvailableOnBin; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Item No.", "Location Code", "Bin Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

