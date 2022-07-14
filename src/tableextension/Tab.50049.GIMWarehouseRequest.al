/// <summary>
/// TableExtension "GIMWarehouseRequest" (ID 50049) extends Record Warehouse Request.
/// </summary>
tableextension 50049 GIMWarehouseRequest extends "Warehouse Request"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "Zusatzstatus Auftrag"; Option)
        {
            Caption = 'Zusatzstatus Auftrag';
            Description = 'P0023';
            OptionMembers = ,"Abruf gesperrt",,,,,"in Zustellung",,,,Einlagerung,Feinabstimmung;
        }
    }

    var
        myInt: Integer;
}