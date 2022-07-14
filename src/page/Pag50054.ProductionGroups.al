page 50054 "Production Groups"
{
    // P0035 07.04.16 CCBIE.ARE New object

    Caption = 'Production Groups';
    PageType = List;
    SourceTable = "Production Group";

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
                field("Print Action Released"; Rec."Print Action Released")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1106900006; Outlook)
            {
            }
            systempart(Control1106900007; Notes)
            {
            }
            systempart(Control1106900008; MyNotes)
            {
            }
            systempart(Control1106900009; Links)
            {
            }
        }
    }

    actions
    {
    }
}

