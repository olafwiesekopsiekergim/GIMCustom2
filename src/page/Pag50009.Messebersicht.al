page 50009 "Messeübersicht"
{
    PageType = List;
    SourceTable = Messedaten;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Beginn; Rec.Beginn)
                {
                    ApplicationArea = All;
                }
                field(Ende; Rec.Ende)
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

