page 50027 "Acceptance Protocol Subpage"
{
    // P0036 06.04.16 CCBIE.ARE New object

    AutoSplitKey = true;
    Caption = 'Lines';
    PageType = ListPart;
    SourceTable = "Acceptance Protocol Line";

    layout
    {
        area(content)
        {
            repeater(Control1106900004)
            {
                ShowCaption = false;
                field(Type; Rec.Type)
                {
                }
                field("Document Type"; Rec."Document Type")
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

