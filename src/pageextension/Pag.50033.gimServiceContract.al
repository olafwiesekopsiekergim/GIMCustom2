/// <summary>
/// PageExtension "gimServiceContract" (ID 50033) extends Record Service Contract.
/// </summary>
pageextension 50033 gimServiceContract extends "Service Contract"
{
    layout
    {
        addlast(Control1)
        {
            field("Service Salesperson Code"; "Service Salesperson Code")
            {
            }
            field("externe Belegnummer"; "externe Belegnummer")
            {
            }
        }
        addlast(content)
        {
            group(Preiskonditionen)
            {
                Caption = 'Preiskonditionen';
                field("W/Ü pro Sicherheitsschrank"; "W/Ü pro Sicherheitsschrank")
                {
                }
                field("Menge Sicherheitsschrank"; "Menge Sicherheitsschrank")
                {
                }
                field("W/Ü pro Laborabzug"; "W/Ü pro Laborabzug")
                {
                }
                field("Menge Laborabzug"; "Menge Laborabzug")
                {
                }
                field("W/Ü pro Filteraufsatz"; "W/Ü pro Filteraufsatz")
                {
                }
                field("Menge Filteraufsatz"; "Menge Filteraufsatz")
                {
                }
                field("Montage/h"; "Montage/h")
                {
                }
                field("Fahrt/h"; "Fahrt/h")
                {
                }
                field("Fahrt/km"; "Fahrt/km")
                {
                }
            }

        }
    }
}
