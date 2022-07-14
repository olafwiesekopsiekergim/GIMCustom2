tableextension 50026 "GIMPurchInvLine" extends "Purch. Inv. Line"
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