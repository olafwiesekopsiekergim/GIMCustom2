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
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Description(EN)"; Rec."Description(EN)")
                {
                    ApplicationArea = All;
                }
                field("Description(FR)"; Rec."Description(FR)")
                {
                    ApplicationArea = All;
                }
                field(Ebene; Rec.Ebene)
                {
                    ApplicationArea = All;
                }
                field(Produktkategorie; Rec.Produktkategorie)
                {
                    ApplicationArea = All;
                }
                field(Zubehoer; Rec.Zubehoer)
                {
                    ApplicationArea = All;
                }
                field(Linie; Rec.Linie)
                {
                    ApplicationArea = All;
                }
                field("Einsatz/Produktabschnitt"; Rec."Einsatz/Produktabschnitt")
                {
                    ApplicationArea = All;
                }
                field(Produktgruppe; Rec.Produktgruppe)
                {
                    ApplicationArea = All;
                }
                field("Bezeichnung-Zusatz"; Rec."Bezeichnung-Zusatz")
                {
                    ApplicationArea = All;
                }
                field(Modellgroesse; Rec.Modellgroesse)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

