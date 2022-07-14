page 50032 "WebshopStammdaten-DS"
{
    PageType = List;
    SourceTable = "WebshopStammdaten- DS";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Description(EN)"; Rec."Description(EN)")
                {
                }
                field("Description(FR)"; Rec."Description(FR)")
                {
                }
                field(Ebene; Rec.Ebene)
                {
                }
                field(Produktkategorie; Rec.Produktkategorie)
                {
                }
                field(Zubehoer; Rec.Zubehoer)
                {
                }
                field(Linie; Rec.Linie)
                {
                }
                field("Einsatz/Produktabschnitt"; Rec."Einsatz/Produktabschnitt")
                {
                }
                field(Produktgruppe; Rec.Produktgruppe)
                {
                }
                field("Bezeichnung-Zusatz"; Rec."Bezeichnung-Zusatz")
                {
                }
                field(Modellgroesse; Rec.Modellgroesse)
                {
                }
            }
        }
    }

    actions
    {
    }
}

