/// <summary>
/// PageExtension "gimPostedServiceInvoice" (ID 50037) extends Record Posted Service Invoice.
/// </summary>
pageextension 50037 gimPostedServiceInvoice extends "Posted Service Invoice"
{
    layout
    {
        addlast(General)
        {
            field("PO Date"; "PO Date")
            {
                Caption = 'Bestelldatum';
            }
            field("External Document No."; "External Document No.")
            {
                Caption = 'Bestellnr.';
            }
        }
    }
}
