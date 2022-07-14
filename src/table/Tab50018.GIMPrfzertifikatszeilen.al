table 50018 "GIMPrüfzertifikatszeilen"
{

    fields
    {
        field(1; PK; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(10; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Angebot,Auftrag';
            OptionMembers = Quote,"Order";
        }
        field(20; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21; Question; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(22; Answer; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Service Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; PK)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

