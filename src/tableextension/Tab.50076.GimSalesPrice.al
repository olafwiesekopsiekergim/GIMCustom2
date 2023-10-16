/// <summary>
/// TableExtension GimSalesPrice (ID 50076) extends Record Sales Price.
/// </summary>
tableextension 50076 GimSalesPrice extends "Sales Price"
{
    fields
    {
        field(50000; "Proportion of freight"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Proportion of freight';
            DataClassification = ToBeClassified;
            Description = 'P0003';
            MinValue = 0;
        }
    }
}
