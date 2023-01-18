/// <summary>
/// PageExtension "gimServiceInvoice" (ID 50019) extends Record Service Invoice.
/// </summary>
pageextension 50019 gimServiceInvoice extends "Service Invoice"
{
    layout
    {
        addlast(General)
        {
            field("External Document No."; "External Document No.")
            {
            }
        }
    }
}
