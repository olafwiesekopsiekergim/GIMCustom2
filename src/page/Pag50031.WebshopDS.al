page 50031 "Webshop-DS"
{
    PageType = Card;
    SourceTable = "Webshop-DS";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    HideValue = false;
                    Visible = false;
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
                field("Einsatz/Programmabschnitt"; Rec."Einsatz/Programmabschnitt")
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
                field("YouTubeID-DE"; Rec."YouTubeID-DE")
                {
                    ApplicationArea = All;
                }
                field("YouTubeID-EN"; Rec."YouTubeID-EN")
                {
                    ApplicationArea = All;
                }
                field("YouTubeID2-DE"; Rec."YouTubeID2-DE")
                {
                    ApplicationArea = All;
                }
                field("YouTubeID2-EN"; Rec."YouTubeID2-EN")
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

