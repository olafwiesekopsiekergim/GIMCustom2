page 50054 "Production Groups"
{
    // P0035 07.04.16 CCBIE.ARE New object

    Caption = 'Production Groups';
    PageType = List;
    SourceTable = "Production Group";
    ApplicationArea = All;
    UsageCategory = lists;

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
                field("Print Action Released"; Rec."Print Action Released")
                {
                    ApplicationArea = All;
                }
                field("Print Production Slips"; rec."Print Production Slips")
                {
                    ApplicationArea = All;
                }


            }
        }
        area(factboxes)
        {
            systempart(Control1106900006; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control1106900007; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control1106900008; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control1106900009; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

