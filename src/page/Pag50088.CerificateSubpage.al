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
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Hint; Rec.Hint)
                {
                    ApplicationArea = All;
                }
                field("Yes/No Field"; Rec."Yes/No Field")
                {
                    ApplicationArea = All;
                }
                field("Show Checkbox"; Rec."Show Checkbox")
                {
                    ApplicationArea = All;
                }
                field("Show Underline"; Rec."Show Underline")
                {
                    ApplicationArea = All;
                }
                field("Place beside Head"; Rec."Place beside Head")
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

