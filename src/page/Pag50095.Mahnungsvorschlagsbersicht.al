page 50095 "Mahnungsvorschlagsübersicht"
{
    Editable = false;
    PageType = List;
    ShowFilter = false;
    SourceTable = "Reminder Line";
    SourceTableView = SORTING("Reminder No.", "Line No.")
                      ORDER(Ascending)
                      WHERE(Type = CONST("Customer Ledger Entry"),
                            "Document Type" = CONST(Invoice),
                            "Reminder No." = FILTER('@MV*' | '@FB*'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    Caption = 'Debitorennr.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Caption = 'Name';
                }
                field("Reminder No."; Rec."Reminder No.")
                {
                }
                field("No. of Reminders"; Rec."No. of Reminders")
                {
                }
                field("Due Date"; Rec."Due Date")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                }
                field(KTR; Rec.KTR)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        UserSetup.Get(UserId);
        if (UserSetup."Salespers./Purch. Code" <> '') and (UserSetup.Innendienst = false) then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Salesperson Code", UserSetup."Salespers./Purch. Code");
            Rec.FilterGroup(0);
        end;
    end;

    var
        UserSetupMgt: Codeunit "User Setup Management";
        RespCenterCode: Code[10];
        UserSetup: Record "User Setup";
}

