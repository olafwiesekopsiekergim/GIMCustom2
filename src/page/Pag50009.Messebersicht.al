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
                }
                field(Name; Rec.Name)
                {
                }
                field(Beginn; Rec.Beginn)
                {
                }
                field(Ende; Rec.Ende)
                {
                }
            }
        }
    }

    actions
    {
    }
}

