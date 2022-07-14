tableextension 50054 "GIMServiceLine" extends "Service Line"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "Service Item Servicebarcode"; Code[10])
        {
            Description = '#AT';

            trigger OnLookup()
            begin
                ServItemLine.Reset;
                ServItemLine.SetRange("Document Type", "Document Type");
                ServItemLine.SetRange("Document No.", "Document No.");
                ServItemLine.Servicebarcode := "Service Item Servicebarcode";
                if PAGE.RunModal(0, ServItemLine) = ACTION::LookupOK then
                    Validate("Service Item Line No.", ServItemLine."Line No.");
            end;

            trigger OnValidate()
            begin
                if "Service Item Serial No." <> '' then begin
                    ServItemLine.Reset;
                    ServItemLine.SetRange("Document Type", "Document Type");
                    ServItemLine.SetRange("Document No.", "Document No.");
                    ServItemLine.SetRange(Servicebarcode, "Service Item Servicebarcode");
                    ServItemLine.Find('-');
                    Validate("Service Item Line No.", ServItemLine."Line No.");
                end;
            end;
        }
        field(50002; Position; Text[5])
        {
            Description = '#AT';
        }
        field(50003; RepairStatusCode; Code[10])
        {
            CalcFormula = Lookup("Service Item Line"."Repair Status Code" WHERE("Document No." = FIELD("Document No."),
                                                                                 "Service Item No." = FIELD("Service Item No.")));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
        ServItemLine: Record "Service Item Line";
}