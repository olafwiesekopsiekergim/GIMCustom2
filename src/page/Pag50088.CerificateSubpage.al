page 50088 "Cerificate Subpage"
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
            repeater(Control1106900010)
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
                field(Hint; Rec.Hint)
                {
                }
                field("Yes/No Field"; Rec."Yes/No Field")
                {
                }
                field("Show Checkbox"; Rec."Show Checkbox")
                {
                }
                field("Show Underline"; Rec."Show Underline")
                {
                }
                field("Place beside Head"; Rec."Place beside Head")
                {
                }
            }
        }
    }

    actions
    {
    }
}

