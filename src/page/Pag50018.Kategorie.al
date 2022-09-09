page 50018 "Kategorie"
{
    PageType = List;

    SourceTable = Kategorie;
    SourceTableView = SORTING(Kategorie)
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Kategorie; Rec.Kategorie)
                {
                    Caption = 'Kategorie';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Vimeo-ID"; Rec."Vimeo-ID")
                {
                    ApplicationArea = All;
                }
                field("Vimeo-ID2"; Rec."Vimeo-ID2")
                {
                    Caption = 'Vimeo-ID ENU';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

