/// <summary>
/// TableExtension "GIMSalesPrice" (ID 50067) extends Record Sales Price.
/// </summary>
tableextension 50067 GIMSalesPrice extends "Sales Price"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Proportion of freight"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            Caption = 'Proportion of freight';
            Description = 'P0003';
            MinValue = 0;
        }
        field(50001; Artikelrabattgruppe; Code[20])
        {
            CalcFormula = Lookup(Item."Item Disc. Group" WHERE("No." = FIELD("Item No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }

    }

    var
        myInt: Integer;
}