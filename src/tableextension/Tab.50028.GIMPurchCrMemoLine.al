tableextension 50028 "GIMPurchCrMemoLine" extends "Purch. Cr. Memo Line"
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