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
                }
                field(Status; Rec.Status)
                {
                }
                field("Message Type"; Rec."Message Type")
                {
                }
                field("Message Text"; Rec."Message Text")
                {
                }
                field(Priority; Rec.Priority)
                {
                }
                field("Vendor Shipment No."; Rec."Vendor Shipment No.")
                {
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
                field("Executed Date"; Rec."Executed Date")
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
                field("Create Date"; Rec."Create Date")
                {
                }
                field("Source Type"; Rec."Source Type")
                {
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                }
                field("Create User Id"; Rec."Create User Id")
                {
                }
                field("Modify Date"; Rec."Modify Date")
                {
                }
                field("Modify User Id"; Rec."Modify User Id")
                {
                }
            }
            part(Lines; "Mobile Transaction Subform")
            {
                Caption = 'Lines';
                SubPageLink = "Transaction No." = FIELD("No.");
                SubPageView = SORTING("Transaction No.", "No.")
                              ORDER(Ascending);
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
            separator(Action1000000026)
            {
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

    local procedure SinglePost()
    begin
        //+LM2.00.08
        // IF NOT (Status IN [9,10]) THEN
        //  FIELDERROR(Status);
        // IF CODEUNIT.RUN(CODEUNIT::"Mobile Trans. Proc. Work",Rec) THEN
        //  Status := 42
        // ELSE
        //  Status := 99;
        // MODIFY;
        // MobTransLine.SETRANGE("Transaction No.","No.");
        // IF MobTransLine.FINDSET THEN BEGIN
        //  REPEAT
        //    MobTransEff.SETRANGE("Posting No.",MobTransLine."No.");
        //    MobTransEff.DELETEALL;
        //  UNTIL MobTransLine.NEXT = 0;
        //  MobTransLine.MODIFYALL(Status,Status);
        // END;
        Post(Rec);
        if Rec.Status = 99 then
            //-LM2.00.08
            Message(GetLastErrorText);
    end;
}

