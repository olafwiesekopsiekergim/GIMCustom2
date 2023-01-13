pageextension 50002 "gimSalesPersonPurchCardPageExt" extends "Salesperson/Purchaser Card"
{
    layout
    {
        addlast(content)
        {
            field(Signature; Signature)
            {
                ApplicationArea = all;
            }
        }



    }
}