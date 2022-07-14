tableextension 50023 "GIMPurchRcptHeader" extends "Purch. Rcpt. Header"
{
    fields
    {
        // Add changes to table fields here
        field(50014; "Our Account No."; Text[20])
        {
            Caption = 'Our Account No.';
            Description = 'P0010';
        }
    }

    var
        myInt: Integer;
}