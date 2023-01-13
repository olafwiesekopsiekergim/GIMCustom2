/// <summary>
/// PageExtension "gimFixedAssetList" (ID 50013) extends Record Fixed Asset List.
/// </summary>
pageextension 50013 gimFixedAssetList extends "Fixed Asset List"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("KST-Bezeichnung"; "KST-Bezeichnung")
            {
            }

            field(Startdatum; Startdatum)
            {
            }
            field(Enddatum; Enddatum)
            {
            }
            field(Nutzungsdauer; Nutzungsdauer)
            {
            }
            field(Buchwert; Buchwert)
            {
            }
            field(Anschaffungswert; Anschaffungswert)
            {
            }
            field(Anschaffungsdatum; Anschaffungsdatum)
            {
            }
            field(Verkaufsdatum; Verkaufsdatum)
            {
            }
            //TODO Feld in COSMO-Lösung
            // field(Verschrottungsdatum; Verschrottungsdatum)
            // {
            // }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}