tableextension 50051 "GIMValueEntry" extends "Value Entry"
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