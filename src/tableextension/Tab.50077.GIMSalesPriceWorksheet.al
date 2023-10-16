tableextension 50077 GIMSalesPriceWorksheet extends "Sales Price Worksheet"
{
    fields
    {
        field(50000; "New Proportion of freight"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'New Proportion of freight';
            DataClassification = ToBeClassified;
            Description = 'P0003';
            MinValue = 0;
        }
    }
}
