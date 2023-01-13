/// <summary>
/// PageExtension "gimPaymentTermsPageExt" (ID 50000) extends Record Payment Terms.
/// </summary>
pageextension 50000 gimPaymentTermsPageExt extends "Payment Terms"
{
    layout
    {
        addlast(content)
        {
            field("Gültig für"; "Gültig für")
            {
                Importance = Additional;
                ApplicationArea = All;
            }
            field("Gültig von"; "Gültig von")
            {
                Importance = Additional;
                ApplicationArea = All;
            }
            field("Gültig bis"; "Gültig bis")
            {
                Importance = Additional;
                ApplicationArea = All;
            }
        }



    }
}