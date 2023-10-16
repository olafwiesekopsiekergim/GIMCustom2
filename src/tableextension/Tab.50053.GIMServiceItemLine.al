/// <summary>
/// TableExtension "GIMServiceItemLine" (ID 50053) extends Record Service Item Line.
/// </summary>
tableextension 50053 GIMServiceItemLine extends "Service Item Line"
{
    fields
    {
        // Add changes to table fields here
        field(50001; Servicebarcode; Code[10])
        {
            Description = '#AT';
        }
        field(50002; SignatureName; Text[50])
        {
            Caption = 'Name Signature';
            Description = '#AT';
        }
        field(50003; "Gebäude"; Text[50])
        {
            CalcFormula = Lookup("Service Item"."Gebäude" WHERE("No." = FIELD("Service Item No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50004; Ebene; Text[30])
        {
            CalcFormula = Lookup("Service Item".Ebene WHERE("No." = FIELD("Service Item No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50005; Raum; Text[30])
        {
            CalcFormula = Lookup("Service Item".Raum WHERE("No." = FIELD("Service Item No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50006; Standort; Text[30])
        {
            CalcFormula = Lookup("Service Item"."Location of Service Item" WHERE("No." = FIELD("Service Item No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50010; InternerKommentar; Integer)
        {
            CalcFormula = Count("Service Comment Line" WHERE("No." = FIELD("Document No."),
                                                              Type = CONST(Internal),
                                                              "Table Line No." = FIELD("Line No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50020; Modelnr; Code[20])
        {
            CalcFormula = Lookup("Service Item".Model WHERE("No." = FIELD("Service Item No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50021; Seriennr; Code[50])
        {
            CalcFormula = Lookup("Service Item"."Serial No." WHERE("No." = FIELD("Service Item No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50022; "Customer Service ID"; Code[20])
        {
            CalcFormula = Lookup("Service Item"."Customer Service ID" WHERE("No." = FIELD("Service Item No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50100; Servicebetrag; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}