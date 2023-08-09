/// <summary>
/// PageExtension gimCustomerCardPageExt (ID 50006) extends Record Customer Card.
/// </summary>
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
            field("Salesperson Code 2";"Salesperson Code 2")
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
        addafter(shipping)
        {
            group(ForeignTrade)
            {
                Caption = 'Außenhandel';
            }
        }
        Addfirst(ForeignTrade)
        {
            field("Currency Code 2";"Currency Code")
            {
                ApplicationArea=All;
            }

            field("Language Code 2";"Language Code")
            {
                ApplicationArea=All;
            }

            field("Territory Code 2";"Territory Code")
            {
                ApplicationArea=All;
            }
        }

    }
}