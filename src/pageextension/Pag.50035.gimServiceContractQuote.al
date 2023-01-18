/// <summary>
/// PageExtension "gimServiceContractQuote" (ID 50035) extends Record Service Contract Quote.
/// </summary>
pageextension 50035 gimServiceContractQuote extends "Service Contract Quote"
{
    Layout
    {
        addlast(General)
        {
            field("Service Salesperson Code"; "Service Salesperson Code")
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
