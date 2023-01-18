/// <summary>
/// PageExtension "gimPostedReturnReceipt" (ID 50043) extends Record Posted Return Receipt.
/// </summary>
pageextension 50043 gimPostedReturnReceipt extends "Posted Return Receipt"
{
    layout
    {
        addlast(General)
        {
            field("Invoice No."; "Invoice No.")
            {

            }
            field("Order No."; "Order No.")
            {

            }

        }
    }
}
