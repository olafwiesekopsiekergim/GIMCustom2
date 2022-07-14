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
                }
                field(Description; Rec.Description)
                {
                }
                field("Vimeo-ID"; Rec."Vimeo-ID")
                {
                }
                field("Vimeo-ID2"; Rec."Vimeo-ID2")
                {
                    Caption = 'Vimeo-ID ENU';
                }
            }
        }
    }

    actions
    {
    }
}

