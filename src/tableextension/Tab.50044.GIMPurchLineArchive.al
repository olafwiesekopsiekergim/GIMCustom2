/// <summary>
/// TableExtension "GIMPurchLineArchive" (ID 50044) extends Record Purchase Line Archive.
/// </summary>
tableextension 50044 GIMPurchLineArchive extends "Purchase Line Archive"
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