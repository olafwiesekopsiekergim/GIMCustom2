/// <summary>
/// PageExtension "gimServiceQuote" (ID 50018) extends Record Service Quote.
/// </summary>
pageextension 50018 gimServiceQuote extends "Service Quote"
{
    layout
    {
        addlast(General)
        {
            field("External Document No."; "External Document No.")
            {
                Caption = 'Anfragenr.';
            }
            field("PO Date"; "PO Date")
            {
                Caption = 'Anfragedatum';
            }

            field("Service Salesperson Code"; "Service Salesperson Code")
            {
            }
            field("Qty Service Items"; "Qty Service Items")
            {
            }
        }
    }
}
