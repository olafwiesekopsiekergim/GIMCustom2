/// <summary>
/// TableExtension "GIMReturnReceiptLine" (ID 50066) extends Record Return Receipt Line.
/// </summary>
tableextension 50066 GIMReturnReceiptLine extends "Return Receipt Line"
{
    fields
    {
        // Add changes to table fields here
        field(50012; Position; Text[5])
        {
            Caption = 'Position';
            Description = 'P0008';
        }

    }

    var
        myInt: Integer;
}