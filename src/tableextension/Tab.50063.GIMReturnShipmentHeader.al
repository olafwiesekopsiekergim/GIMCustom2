/// <summary>
/// TableExtension "GIMReturnShipmentHeader" (ID 50063) extends Record Return Shipment Header.
/// </summary>
tableextension 50063 GIMReturnShipmentHeader extends "Return Shipment Header"
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