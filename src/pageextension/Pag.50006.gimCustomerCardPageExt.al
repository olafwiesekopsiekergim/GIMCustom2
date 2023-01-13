pageextension 50006 "gimCustomerCardPageExt" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Geschäftsbereich (Standard)"; "Geschäftsbereich (Standard)")
            {
                ApplicationArea = All;

            }
            field("Kostenträger (Standard)"; "Kostenträger (Standard)")
            {
                ApplicationArea = All;

            }
        }
        addlast(Invoicing)
        {
            field(Rechnungsadresse; Rechnungsadresse)
            {
                ApplicationArea = All;

            }
            field(Bounsagreement; Bounsagreement)
            {
                ApplicationArea = All;
            }
        }

    }
}