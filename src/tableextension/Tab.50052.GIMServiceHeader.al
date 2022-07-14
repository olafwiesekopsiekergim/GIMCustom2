tableextension 50052 "GIMServiceHeader" extends "Service Header"
{
    fields
    {
        // Add changes to table fields here
        field(50002; SignatureName; Text[50])
        {
            Caption = 'Name Signature';
            Description = '#AT';
        }
        field(50003; "Qty Service Items"; Integer)
        {
            CalcFormula = Count("Service Item Line" WHERE("Document No." = FIELD("No."),
                                                           "Document Type" = FIELD("Document Type")));
            Caption = 'Qty Service Items';
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50010; InternerKommentar; Integer)
        {
            CalcFormula = Count("Service Comment Line" WHERE("No." = FIELD("No."),
                                                              Type = CONST(Internal)));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50012; "Service Salesperson Code"; Code[10])
        {
            Caption = 'Service Salesperson Code';
            Description = '#AT';
            TableRelation = "Salesperson/Purchaser";
        }
        field(50020; "Quote Expiration Date"; Date)
        {
            Caption = 'Quote Expiration Date';
            Description = '#AT';
        }
        field(50030; "fix Termin-Lieferung"; Text[20])
        {
            Description = '#AT';
        }
        field(50031; "External Document No."; Code[35])
        {
            Description = '#AT';
        }
        field(50032; "PO Date"; Date)
        {
            Description = '#AT';
        }
        field(50400; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            Description = '#AT';
            Editable = false;
        }
        field(50401; Creationuser; Code[50])
        {
            Caption = 'Erstellungsnutzer';
            Description = '#AT';
            TableRelation = User;
        }
        field(50500; Amount; Decimal)
        {
            CalcFormula = Sum("Service Line".Amount WHERE("Document Type" = FIELD("Document Type"),
                                                           "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}