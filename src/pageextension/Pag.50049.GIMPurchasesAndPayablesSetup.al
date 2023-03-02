/// <summary>
/// Unknown gimPurchasesAndPayablesSetup (ID 50049) extends Record Purchases and Payables Setup.
/// </summary>
pageextension 50049 gimPurchasesAndPayablesSetup extends "Purchases & Payables Setup"
{
    layout
    {
        addlast(General)
        {
            field(BaseURLForD3Documents; BaseURLForD3Documents)
            {
            }
        }
    }
}
