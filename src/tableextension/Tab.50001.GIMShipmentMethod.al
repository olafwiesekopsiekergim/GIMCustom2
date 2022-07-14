/// <summary>
/// TableExtension GIM Shipment Method (ID 50001) extends Record Shipment Method.
/// </summary>
tableextension 50001 "GIM Shipment Method" extends "Shipment Method"
{
    fields
    {
        // Add changes to table fields here
        field(50001; Fracht; Boolean)
        {
            Caption = 'Fracht';
            Description = 'P0006';
        }
        field(50003; Frachtberechnungsart; Option)
        {
            Caption = 'Frachtberechnungsart';
            Description = 'P0006';
            OptionMembers = " ","bis Rampe";
        }
        field(50010; "Print Checklist"; Boolean)
        {
            Caption = 'Print Checklist';
            Description = 'P0008';
        }
    }

    var
        myInt: Integer;
}