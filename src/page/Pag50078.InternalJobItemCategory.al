page 50078 "Internal Job Item Category"
{
    // P0005 16.02.16 CCBIE.ARE New object

    Caption = 'Internal Job Item Category';
    PageType = List;
    SourceTable = "Job Item Category";

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
            }
        }
    }

    actions
    {
    }
}

