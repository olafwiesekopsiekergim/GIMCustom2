/// <summary>
/// Codeunit GIM Events (ID 50001).
/// </summary>
codeunit 50001 "GIM Events"
{
    [EventSubscriber(ObjectType::page, page::"Service Quote Subform", 'OnAfterValidateEvent', 'Service Item No.', true, true)]
    local procedure SQSubFormOnAfterValidateServiceItemNo(var Rec: Record "Service Item Line"; var xRec: Record "Service Item Line")

    begin
        //GIM0003 TODO Testen   
    end;

    //GIM0005
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Service-Quote to Order", 'OnAfterInsertServiceLine', '', true, true)]

    local procedure OnAfterInsertServiceLine(var ServiceItemLine2: Record "Service Item Line"; ServiceItemLine: Record "Service Item Line")
    begin
        //GIM0005 30.3.2022 ++++ TODO: aktivieren wenn Servotion integriert ist
        // ServotionServItemLEvents.ServiceItemLine_OnAfterInsert_GenerateAnswers(ServItemLine2, true);
        //GIM0005 ----
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeDelegateApprovalRequests', '', true, true)]
    local procedure OnBeforeDelegateApprovalRequests(var ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)
    var
        GimApprovalMgmt: codeunit GIMApprovalManagement;
    begin
        //GIM0008 14.4.22 ++++
        GIMApprovalMgmt.PrepareApprovalEntriesToDelegate(ApprovalEntry);
        //----
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnAfterDelegateApprovalRequest', '', true, true)]
    local procedure OnAfterDelegateApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    var
        GimApprovalMgmt: codeunit GIMApprovalManagement;
    BEGIN
        //GIM0008 14.4.22 ++++
        GIMApprovalMgmt.DeleteDelegateIDOnApprovalEntries(ApprovalEntry);
        //----
    end;


}






