pageextension 50005 "gimCustomerlistPageExt" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {

            field(Rechnungsadresse; Rechnungsadresse)
            {
                ApplicationArea = All;
            }
        }
    }
}