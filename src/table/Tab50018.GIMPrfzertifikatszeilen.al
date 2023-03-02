/// <summary>
/// Table GIMPrüfzertifikatszeilen (ID 50018).
/// </summary>
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
        field(28; "Seriennr."; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Debitorennr."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; LiefAnCode; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(31; Standort; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Gebäude"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(33; Ebene; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(34; Raum; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Customer Service ID"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(36; Servicebarcode; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Letzter Service am"; Date)
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

