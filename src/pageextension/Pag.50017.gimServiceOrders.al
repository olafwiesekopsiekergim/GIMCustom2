/// <summary>
/// PageExtension "gimServiceOrders" (ID 50017) extends Record Service Orders.
/// </summary>
pageextension 50017 gimServiceOrders extends "Service Orders"
{
    Layout
    {
        addlast(Control1)
        {
            field("Qty Service Items"; "Qty Service Items")
            {
                Editable = false;
            }
            field(InternerKommentar; InternerKommentar)
            {
            }

        }
    }
}
