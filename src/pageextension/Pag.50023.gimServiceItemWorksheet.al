/// <summary>
/// PageExtension "gimServiceItemWorksheet" (ID 50023) extends Record Service Item Worksheet.
/// </summary>
pageextension 50023 gimServiceItemWorksheet extends "Service Item Worksheet"
{
    layout
    {
        addlast(General)
        {
            field("Gebäude"; Gebäude)
            {
                Editable = false;
            }
            field(Ebene; Ebene)
            {
                Editable = false;
            }
            field(Raum; Raum)
            {
                Editable = false;
            }
            field(Standort; Standort)
            {
                Editable = false;
            }


        }
    }
}
