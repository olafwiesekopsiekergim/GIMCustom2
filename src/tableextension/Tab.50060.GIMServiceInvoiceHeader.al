tableextension 50060 "GIMServiceInvoiceHeader" extends "Service Invoice Header"
{
    fields
    {
        // Add changes to table fields here
        field(50001; GIMAmount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            CalcFormula = Sum("Service Invoice Line".Amount WHERE("Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Invoice Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Service Invoice Line"."Inv. Discount Amount" WHERE("Document No." = FIELD("No.")));
            Caption = 'Invoice Discount Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50012; "Service Salesperson Code"; Code[10])
        {
            Caption = 'Service Salesperson Code';
            Description = '#AT';
            TableRelation = "Salesperson/Purchaser";
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
    }

    var
        myInt: Integer;
}