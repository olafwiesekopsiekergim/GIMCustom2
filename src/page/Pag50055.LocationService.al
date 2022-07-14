page 50055 "Location Service"
{
    PageType = List;
    SourceTable = "Location Service-DS";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Prod. Order No."; Rec."Prod. Order No.")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Customer No." := CustomerNo;
    end;

    var
        CustomerNo: Code[20];

    [Scope('OnPrem')]
    procedure SetCustomerNo(CustomerNoNew: Code[20])
    begin
        CustomerNo := CustomerNoNew;
    end;
}

