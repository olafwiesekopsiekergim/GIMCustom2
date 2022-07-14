page 50015 "Mobile Stock Control"
{
    AutoSplitKey = true;
    Caption = 'Mobile Stock Control';
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Mobile Stock Control";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Zone Code"; Rec."Zone Code")
                {
                }
                field("Bin Code"; Rec."Bin Code")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                }
                field("Lot No."; Rec."Lot No.")
                {
                }
                field("Serial No."; Rec."Serial No.")
                {
                }
                field("User Id"; Rec."User Id")
                {
                }
                field("Date From"; Rec."Date From")
                {
                }
                field("Date To"; Rec."Date To")
                {
                }
                field("Function Name"; Rec."Function Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

