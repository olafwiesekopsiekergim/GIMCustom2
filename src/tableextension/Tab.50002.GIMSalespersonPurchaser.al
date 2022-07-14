/// <summary>
/// TableExtension GIM Salesperson/Purchaser (ID 50002) extends Record Salesperson/Purchaser.
/// </summary>
tableextension 50002 "GIM Salesperson/Purchaser" extends "Salesperson/Purchaser"
{
    fields
    {
        // Add changes to table fields here
        field(50001; Signature; BLOB)
        {
            Caption = 'Signature';
            SubType = Bitmap;
        }
    }

    var
        myInt: Integer;
}