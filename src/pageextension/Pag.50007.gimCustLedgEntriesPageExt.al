pageextension 50007 "gimCustLedgEntriesPageExt" extends "Customer Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field("Geschäftsbereich"; Geschäftsbereich)
            {
                ApplicationArea = All;
            }
            field(Mahnstufe; Mahnstufe)
            {
                ApplicationArea = All;
            }
        }
    }
}