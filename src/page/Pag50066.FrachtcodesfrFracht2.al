page 50066 "Frachtcodes für Fracht2"
{
    // P0006 18.04.16 CCBIE.ARE New object

    PageType = List;
    SourceTable = "Frachtcodes (Fracht2)";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Bezeichnung; Rec.Bezeichnung)
                {
                }
            }
        }
    }

    actions
    {
    }
}

