/// <summary>
/// PageExtension "gimFixedAssetCard" (ID 50014) extends Record Fixed Asset Card.
/// </summary>
pageextension 50014 gimFixedAssetCard extends "Fixed Asset Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
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