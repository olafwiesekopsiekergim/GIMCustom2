page 50047 "RMD Labelanweisung"
{
    // P0001 17.02.16 CCBIE.ARE New object

    PageType = List;
    SourceTable = "RMD Labelanweisung";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Beschreibung; Rec.Beschreibung)
                {
                }
            }
        }
    }

    actions
    {
    }
}

