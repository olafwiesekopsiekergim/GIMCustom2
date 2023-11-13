codeunit 50100 "free50100"
{

    trigger OnRun()
    var
        Mail: Codeunit Mail;
    // POFeedbackService: codeunit "CCS PM PO Feedback Service";
    // iJL: Record "Item Journal Line";
    begin
        //IF NOT Mail.NewMessage('andreas.reger@cosmoconsult.com','','','Test Email','','',FALSE) THEN
        // ERROR(Mail.GetErrorDesc);

        Message('OK');
        // POFeedbackService.InsertTANOutputJnlLine(iJL,'XXXXXXX');
    end;



}