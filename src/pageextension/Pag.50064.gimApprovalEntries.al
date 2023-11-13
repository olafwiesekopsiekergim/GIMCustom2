pageextension 50064 gimApprovalEntries extends "Approval Entries"
{
    layout
    {
        addlast(factboxes)
        {
            part(approvCommentFactbox; ApprovCommentFactBoxGIM)
            {
                Caption = 'Genehmigungsbemerkungen';
                Editable = false;
            }
        }
    }
    actions
    {
        AddAfter("&Delegate")
        {
            action(OpenD3Document)
            {
                Caption = 'Öffne D3-Document';
                Image = Document;

                trigger OnAction()
                var
                    PurchHeader: Record "Purchase Header";
                    GIMApprovalMgmt: Codeunit GIMApprovalManagement;
                begin
                    if "Table ID" = 38 then begin
                        PurchHeader.Get("Document Type", "Document No.");
                        GIMApprovalMgmt.OpenD3Doc(PurchHeader);
                    end;
                end;

            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if CurrPage.approvCommentFactbox.PAGE.SetFilterFromApprovalEntry(Rec) then;
    end;
}