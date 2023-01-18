/// <summary>
/// PageExtension "gimServiceOrder" (ID 50016) extends Record Service Order.
/// </summary>
pageextension 50016 gimServiceOrder extends "Service Order"
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
            }
            field("Qty Service Items"; "Qty Service Items")
            {
            }
            field("Service Salesperson Code"; "Service Salesperson Code")
            {
            }
            field("fix Termin-Lieferung"; "fix Termin-Lieferung")
            {
            }

        }
    }
}
