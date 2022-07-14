/// <summary>
/// TableExtension "GIMServiceCrMemoHeader" (ID 50062) extends Record Service Cr.Memo Header.
/// </summary>
tableextension 50062 GIMServiceCrMemoHeader extends "Service Cr.Memo Header"
{
    fields
    {
        // Add changes to table fields here
        field(50012; "Service Salesperson Code"; Code[10])
        {
            Caption = 'Service Salesperson Code';
            Description = '#AT';
            TableRelation = "Salesperson/Purchaser";
        }
    }

    var
        myInt: Integer;
}