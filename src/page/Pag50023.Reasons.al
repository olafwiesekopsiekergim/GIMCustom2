page 50023 "Reasons"
{
    // P0005 16.02.16 CCBIE.ARE New object

    AutoSplitKey = true;
    Caption = 'Reasons';
    PageType = List;
    SourceTable = Reason;

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
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = All;
                }
                field(Win; Rec.Win)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Code := xRec.Code;
    end;
}

