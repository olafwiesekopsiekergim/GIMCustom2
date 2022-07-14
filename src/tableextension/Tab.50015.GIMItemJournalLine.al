/// <summary>
/// TableExtension GIM Item Journal Line (ID 50015) extends Record Item Journal Line.
/// </summary>
tableextension 50015 "GIM Item Journal Line" extends "Item Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Proportion of freight"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Proportion of freight';
            Description = 'P0003';
            MinValue = 0;
        }
    }

    var
        myInt: Integer;
}