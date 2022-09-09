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
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Caption = 'Name';
                    ApplicationArea = All;
                }
                field("Reminder No."; Rec."Reminder No.")
                {
                    ApplicationArea = All;
                }
                field("No. of Reminders"; Rec."No. of Reminders")
                {
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = All;
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                }
                field(KTR; Rec.KTR)
                {
                    ApplicationArea = All;
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

