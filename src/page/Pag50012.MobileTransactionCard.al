page 50012 "Mobile Transaction Card"
{
    // L-MOBILE LM2.00
    //   object defined
    // 
    // L-MOBILE LM2.00.05
    //   Admin Role functionality implemented

    Caption = 'Mobile Transaction Card';
    PageType = Card;
    SourceTable = "Mobile Transaction Head";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Message Type"; Rec."Message Type")
                {
                    ApplicationArea = All;
                }
                field("Message Text"; Rec."Message Text")
                {
                    ApplicationArea = All;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = All;
                }
                field("Vendor Shipment No."; Rec."Vendor Shipment No.")
                {
                    ApplicationArea = All;
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Posting User Id"; Rec."Posting User Id")
                {
                    ApplicationArea = All;
                }
                field("Executed Date"; Rec."Executed Date")
                {
                    ApplicationArea = All;
                }
                field("Retrying Date"; Rec."Retrying Date")
                {
                    ApplicationArea = All;
                }
                field("Retry Counter"; Rec."Retry Counter")
                {
                    ApplicationArea = All;
                }
                field("Error Entry No."; Rec."Error Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Create Date"; Rec."Create Date")
                {
                    ApplicationArea = All;
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = All;
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                    ApplicationArea = All;
                }
                field("Create User Id"; Rec."Create User Id")
                {
                    ApplicationArea = All;
                }
                field("Modify Date"; Rec."Modify Date")
                {
                    ApplicationArea = All;
                }
                field("Modify User Id"; Rec."Modify User Id")
                {
                    ApplicationArea = All;
                }
            }
            part(Lines; "Mobile Transaction Subform")
            {
                Caption = 'Lines';
                SubPageLink = "Transaction No." = FIELD("No.");
                SubPageView = SORTING("Transaction No.", "No.")
                              ORDER(Ascending);
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {
            // action(Post)
            // {
            //     Caption = 'Post';
            //     Enabled = AdminAllowed;
            //     Image = Post;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;

            //     trigger OnAction()
            //     begin
            //         SinglePost;
            //     end;
            // }
            action(SetToUnprocessed)
            {
                Caption = 'Set To Unprocessed';
                Enabled = AdminAllowed;
                Image = Undo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    MobileTransactionHead: Record "Mobile Transaction Head";
                begin
                    CurrPage.SetSelectionFilter(MobileTransactionHead);
                    MobileTransactionHead.SetToUnprocessed(MobileTransactionHead);
                end;
            }
            separator(Action1000000026)
            {
            }
            action(ShowMessage)
            {
                Caption = 'Show Message';
                Image = ShowWarning;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

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
                ApplicationArea = All;

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
    var
        MobileSetup: Record "Mobile Setup";
    begin
        //+LM2.00.05
        MobileSetup.Get;
        AdminAllowed := MobileSetup.TestAdminRole(false);
        CurrPage.Editable := AdminAllowed;
        //-LM2.00.05
    end;

    var
        AdminAllowed: Boolean;

    // local procedure SinglePost()
    // begin
    //     //+LM2.00.08
    //     // IF NOT (Status IN [9,10]) THEN
    //     //  FIELDERROR(Status);
    //     // IF CODEUNIT.RUN(CODEUNIT::"Mobile Trans. Proc. Work",Rec) THEN
    //     //  Status := 42
    //     // ELSE
    //     //  Status := 99;
    //     // MODIFY;
    //     // MobTransLine.SETRANGE("Transaction No.","No.");
    //     // IF MobTransLine.FINDSET THEN BEGIN
    //     //  REPEAT
    //     //    MobTransEff.SETRANGE("Posting No.",MobTransLine."No.");
    //     //    MobTransEff.DELETEALL;
    //     //  UNTIL MobTransLine.NEXT = 0;
    //     //  MobTransLine.MODIFYALL(Status,Status);
    //     // END;
    //     Post(Rec);
    //     if Rec.Status = 99 then
    //         //-LM2.00.08
    //         Message(GetLastErrorText);
    // end;
}

