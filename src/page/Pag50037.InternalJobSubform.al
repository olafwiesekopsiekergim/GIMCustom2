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
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field("Item category"; Rec."Item category")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field(Comment; Rec.Comment)
                {
                }
            }
        }
    }

    actions
    {
    }
}

