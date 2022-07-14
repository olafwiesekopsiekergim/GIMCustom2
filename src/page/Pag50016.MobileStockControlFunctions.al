page 50016 "Mobile Stock Control Functions"
{
    Caption = 'Mobile Stock Control Functions';
    PageType = List;
    SourceTable = "Mobile Stock Control Function";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Name; Rec.Name)
                {
                }
            }
        }
    }

    actions
    {
    }
}

