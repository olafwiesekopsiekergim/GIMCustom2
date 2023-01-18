/// <summary>
/// PageExtension "gimServiceItemLineFactbox" (ID 50022) extends Record Service Item Line FactBox.
/// </summary>
pageextension 50022 gimServiceItemLineFactbox extends "Service Item Line FactBox"
{
    layout
    {
        addlast(content)
        {
            field("Gebäude"; Gebäude)
            {
            }
            field(Ebene; Ebene)
            {
            }
            field(Raum; Raum)
            {
            }
            field(Seriennr; Seriennr)
            {
            }
            field(Modelnr; Modelnr)
            {
            }
            field("Customer Service ID"; "Customer Service ID")
            {
                Caption = 'Inventarnr Kunde';
            }
        }
    }
}
