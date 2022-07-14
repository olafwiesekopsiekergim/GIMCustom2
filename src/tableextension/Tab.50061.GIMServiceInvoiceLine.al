/// <summary>
/// TableExtension "GIMServiceInvoiceLine" (ID 50061) extends Record Service Invoice Line.
/// </summary>
tableextension 50061 GIMServiceInvoiceLine extends "Service Invoice Line"
{
    fields
    {
        // Add changes to table fields here
        field(50002; Position; Text[5])
        {
            Description = '#AT';
        }
    }

    var
        myInt: Integer;
}