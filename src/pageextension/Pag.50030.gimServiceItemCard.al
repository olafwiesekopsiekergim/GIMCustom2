/// <summary>
/// PageExtension "gimServiceItemCard" (ID 50030) extends Record Service Item Card.
/// </summary>
pageextension 50030 gimServiceItemCard extends "Service Item Card"
{
    layout
    {
        addlast(General)
        {
            field(Servicebarcode; Servicebarcode)
            {
            }
            field("Gebäude"; Gebäude)
            {
            }
            field(Ebene; Ebene)
            {
            }
            field(Raum; Raum)
            {
            }
            field(Hersteller; Hersteller)
            {
            }
            field(Model; Model)
            {
            }
            field("Key-No."; "Key-No.")
            {
            }
            field("Customer Service ID"; "Customer Service ID")
            {
            }
        }
    }
}
