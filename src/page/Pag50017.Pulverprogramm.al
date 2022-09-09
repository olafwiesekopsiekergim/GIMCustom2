page 50017 "Pulverprogramm"
{
    PageType = List;
    SourceTable = Pulverprogramm;
    SourceTableView = SORTING(Pulverprogrammno)
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Pulverprogrammno; Rec.Pulverprogrammno)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
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

