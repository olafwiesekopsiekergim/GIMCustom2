page 50014 "Mobile Transactions"
{
    // L-MOBILE LM2.00
    //   object defined
    // 
    // L-MOBILE LM2.00.05
    //   Admin Role functionality implemented
    // 
    // L-MOBILE LM2.00.06
    //   sorting set to descending
    //   action
    //     ShowMessage
    //   added
    // 
    // L-MOBILE LM2.00.08
    //   changed scheduler to use the Timer codeunit
    //   control PingPong removed

    Caption = 'Mobile Transactions';
    CardPageID = "Mobile Transaction Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    SourceTable = "Mobile Transaction Head";
    SourceTableView = SORTING("No.")
                      ORDER(Descending);

    layout
    {
        area(content)
        {
            field(TimerOn; TimerOn)
            {
                Caption = 'Started';
                Editable = false;
            }
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Priority; Rec.Priority)
                {
                }
                field("Vendor Shipment No."; Rec."Vendor Shipment No.")
                {
                    Visible = false;
                }
                field("Language Code"; Rec."Language Code")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Posting User Id"; Rec."Posting User Id")
                {
                }
                field("Message Type"; Rec."Message Type")
                {
                }
                field("Message Text"; Rec."Message Text")
                {
                }
                field("Create Date"; Rec."Create Date")
                {
                }
                field("Create User Id"; Rec."Create User Id")
                {
                }
                field("Executed Date"; Rec."Executed Date")
                {
                }
                field("Source Type"; Rec."Source Type")
                {
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                }
                field("Retrying Date"; Rec."Retrying Date")
                {
                }
                field("Retry Counter"; Rec."Retry Counter")
                {
                }
                field("Error Entry No."; Rec."Error Entry No.")
                {
                }
                field("Modify Date"; Rec."Modify Date")
                {
                }
                field("Modify User Id"; Rec."Modify User Id")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                Caption = 'Post';
                Enabled = AdminAllowed;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SinglePost;
                end;
            }
            action(StartTimer)
            {
                Caption = 'Start';
                Enabled = AdminAllowed;
                Image = Start;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    MobileTransProcTimer: Codeunit "Mobile Trans. Proc. Timer";
                begin
                    //+LM2.00.08
                    // MobileSetup.TESTFIELD("Timer Interval");
                    // CurrPage.PingPong.Ping(MobileSetup."Timer Interval");
                    // TimerOn := TRUE;
                    MobileTransProcTimer.StartScheduler;
                    UpdateSchedulerStatus;
                    //-LM2.00.08
                end;
            }
            action(StopTimer)
            {
                Caption = 'Stop';
                Enabled = AdminAllowed;
                Image = Stop;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    MobileTransProcTimer: Codeunit "Mobile Trans. Proc. Timer";
                begin
                    //+LM2.00.08
                    //CurrPage.PingPong.Stop;
                    //TimerOn := FALSE;
                    MobileTransProcTimer.StopScheduler;
                    UpdateSchedulerStatus;
                    //-LM2.00.08
                end;
            }
            separator(Action1000000028)
            {
            }
            action(SetToUnprocessed)
            {
                Caption = 'Set To Unprocessed';
                Enabled = AdminAllowed;
                Image = Undo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    MobileTransactionHead: Record "Mobile Transaction Head";
                begin
                    CurrPage.SetSelectionFilter(MobileTransactionHead);
                    MobileTransactionHead.SetToUnprocessed(MobileTransactionHead);
                end;
            }
            separator(Action1000000029)
            {
            }
            action(Show)
            {
                Caption = 'Show';
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Mobile Transaction Card";
                RunPageOnRec = true;
            }
            action(ShowMessage)
            {
                Caption = 'Show Message';
                Image = ShowWarning;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //+LM2.00.06
                    Message(Rec."Message Text");
                    //+LM2.00.06
                end;
            }
        }
        area(navigation)
        {
            action(SourceDocument)
            {
                Caption = 'Source Document';
                Image = Document;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    //+LM2.00.08
                    ShowSourceDocument;
                    //-LM2.00.08
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        MobileSetup.Get;
        AdminAllowed := MobileSetup.TestAdminRole(false);
        CurrPage.Editable := AdminAllowed;
        //+LM2.00.06
        if not Rec.IsEmpty then
            Rec.FindFirst;
        //-LM2.00.06
        //+LM2.00.08
        UpdateSchedulerStatus;
        //-LM2.00.08
    end;

    var
        MobileSetup: Record "Mobile Setup";
        TimerOn: Boolean;
        AdminAllowed: Boolean;

    local procedure UpdateSchedulerStatus()
    var
        MobileTransProcTimer: Codeunit "Mobile Trans. Proc. Timer";
    begin
        //+LM2.00.08
        TimerOn := MobileTransProcTimer.GetSchedulerStatus;
        //-LM2.00.08
    end;

    local procedure SinglePost()
    begin
        //+LM2.00.08
        Post(Rec);
        if Rec.Status = 99 then
            Message(GetLastErrorText);
        //-LM2.00.08
    end;
}

