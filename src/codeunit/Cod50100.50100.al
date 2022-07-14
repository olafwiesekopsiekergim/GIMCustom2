codeunit 50100 "50100"
{

    trigger OnRun()
    var
        Mail: Codeunit Mail;


    begin
        //IF NOT Mail.NewMessage('andreas.reger@cosmoconsult.com','','','Test Email','','',FALSE) THEN
        // ERROR(Mail.GetErrorDesc);

        Message('OK');

    end;
}

