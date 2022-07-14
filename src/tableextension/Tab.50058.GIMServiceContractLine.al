/// <summary>
/// TableExtension "GIMServiceContractLine" (ID 50058) extends Record Service Contract Line.
/// </summary>
tableextension 50058 GIMServiceContractLine extends "Service Contract Line"
{
    fields
    {
        // Add changes to table fields here
        field(50001; Servicebarcode; Code[10])
        {
            Description = '#AT';
        }
        field(50005; Menge; Integer)
        {
        }
    }
    var
        myInt: Integer;
}