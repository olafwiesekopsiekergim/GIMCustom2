page 50037 "Internal Job Subform"
{
    // P0005 16.02.16 CCBIE.ARE New object

    AutoSplitKey = true;
    Caption = 'Internal Job Subform';
    DeleteAllowed = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Internal Job Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Internal Job No."; Rec."Internal Job No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Item category"; Rec."Item category")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
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

