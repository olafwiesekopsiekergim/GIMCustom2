/// <summary>
/// PageExtension gimRequestsToApprove (ID 50054) extends Record Requests to Approve.
/// </summary>
pageextension 50054 gimRequestsToApprove extends "Requests to Approve"
{
    layout
    {
        addfirst(factboxes)
        {
            part(ApprovCommentFactBoxGIM; ApprovCommentFactBoxGIM)
            {
                ShowFilter = true;
            }

        }
    }

    actions
    {
        AddAfter(AllRequests)
        {
            action(OpenD3Document)
            {
                Caption = 'Öffne D3-Document';
                Image = Document;

                trigger OnAction()
                var
                    PurchHeader: Record "Purchase Header";
                    GimApprovalMgmt: Codeunit GIMApprovalManagement;
                begin
                    if "Table ID" = 38 then begin
                        PurchHeader.Get("Document Type", "Document No.");
                        GIMApprovalMgmt.OpenD3Doc(PurchHeader);
                    end;
                end;
            }
        }
    }

    /// <summary>
    /// OnAfterGetCurrRecord.
    /// </summary>
    trigger OnAfterGetCurrRecord()
    begin
        if CurrPage.ApprovCommentFactBoxGIM.PAGE.SetFilterFromApprovalEntry(Rec) then;
    end;

}
