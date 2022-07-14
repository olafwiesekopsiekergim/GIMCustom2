/// <summary>
/// TableExtension "GIMReturnReceiptHeader" (ID 50065) extends Record Return Receipt Header.
/// </summary>
tableextension 50065 GIMReturnReceiptHeader extends "Return Receipt Header"
{
    fields
    {
        // Add changes to table fields here
        field(50001; PackageType; Code[10])
        {
            Caption = 'Verpackungsart';
            Description = '#AT';
            TableRelation = "Unit of Measure";
        }
        field(50002; PackageAmount; Decimal)
        {
            Caption = 'Verpackungsmenge';
            Description = '#AT';
        }
        field(50003; Webrequest; Boolean)
        {
            Caption = 'Internetanfrage';
            Description = '#AT';
        }
        field(50007; "Order No."; Text[30])
        {
            Caption = 'Auftragsnummer';
            Description = '#AT';
            Editable = false;
        }
        field(50008; "Invoice No."; Text[30])
        {
            Caption = 'Rechnungsnummer';
            Description = '#AT';
            Editable = false;
        }
        field(50400; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            Description = 'P0046';
        }

    }

    var
        myInt: Integer;
}