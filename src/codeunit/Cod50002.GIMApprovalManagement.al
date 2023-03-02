codeunit 50106 GIMApprovalManagement
{
    Permissions = TableData "Approval Entry" = rm;

    trigger OnRun()
    begin
    end;

    // [Scope('Internal')]
    procedure PrepareApprovalEntriesToDelegate(var ApprovalEntry: Record "Approval Entry")
    var
        ApprovalUserSetup: Page "Approval User Setup";
        UserSetupLocal: Record "User Setup";
        DelegateToUserID: Code[50];
    begin
        //GIM0008
        UserSetupLocal.SetRange(UserSetupLocal."Unlimited Purchase Approval", true);

        ApprovalUserSetup.SetTableView(UserSetupLocal);

        ApprovalUserSetup.LookupMode(true);
        if ApprovalUserSetup.RunModal = ACTION::LookupOK then begin
            ApprovalUserSetup.GetRecord(UserSetupLocal);
            DelegateToUserID := UserSetupLocal."User ID";

            if ApprovalEntry.FindSet then
                repeat
                    ApprovalEntry.DelegateToUserID := DelegateToUserID;
                    ApprovalEntry.Modify(false);
                until ApprovalEntry.Next = 0;
        end;
    end;

    // [Scope('Internal')]
    procedure DeleteDelegateIDOnApprovalEntries(var ApprovalEntry: Record "Approval Entry")
    begin
        //GIM0008
        if ApprovalEntry.FindSet then
            repeat
                ApprovalEntry.DelegateToUserID := '';
                ApprovalEntry.Modify(false);
            until ApprovalEntry.Next = 0;
    end;

    // [Scope('Internal')]
    procedure OpenD3Doc(PurchHeader: Record "Purchase Header")
    var
        PurchSetup: Record "Purchases & Payables Setup";
        errNoPurchSetup: Label 'Die Einkaufseinrichtung fehlt';
        errNoBaseUrlForD3Documents: Label 'Die Basis-URL für D3-Dokumente in der Einkaufseinrichtung fehlt';
        d3Journal: Record "d3 Journal";
    begin
        if not PurchSetup.Get then
            Error(errNoPurchSetup);

        if PurchSetup.BaseURLForD3Documents = '' then
            Error(errNoBaseUrlForD3Documents);

        d3Journal.SetRange(RegistrierNr, PurchHeader.RegistrierNr);
        if d3Journal.FindFirst then
            HyperLink(StrSubstNo(PurchSetup.BaseURLForD3Documents, d3Journal.d3_doc_id));
    end;

    [EventSubscriber(ObjectType::Page, 51, 'OnAfterActionEvent', 'SendApprovalRequest', false, false)]
    local procedure SentApprovalRequest(var Rec: Record "Purchase Header")
    var
        d3Journal: Record "d3 Journal";
    begin
        d3Journal.CreateLineFromPurchUnposted(Rec, Rec."No.");
    end;
}

