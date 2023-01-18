/// <summary>
/// PageExtension "gimServiceOrderSubform" (ID 50025) extends Record Service Order Subform.
/// </summary>
pageextension 50025 gimServiceOrderSubform extends "Service Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field(InternerKommentar; InternerKommentar)
            {
                Editable = false;
            }
        }
    }
}
