/// <summary>
/// TableExtension "GIMReturnShipmentLine" (ID 50064) extends Record Return Shipment Line.
/// </summary>                              
tableextension 50064 GIMReturnShipmentLine extends "Return Shipment Line"
{
    fields
    {
        // Add changes to table fields here
        field(50012; Position; Text[5])
        {
            Description = 'P0012';
        }

    }

    var
        myInt: Integer;
}