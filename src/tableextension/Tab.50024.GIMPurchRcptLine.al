tableextension 50024 "GIMPurchRcptLine" extends "Purch. Rcpt. Line"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "Vendor Shipment No."; Code[35])
        {
            CalcFormula = Lookup("Purch. Rcpt. Header"."Vendor Shipment No." WHERE("No." = FIELD("Document No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50012; Position; Text[5])
        {
            Description = 'P0012';
        }
    }

    var
        myInt: Integer;
}