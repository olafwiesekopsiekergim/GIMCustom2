codeunit 50012 "ReterminateJobQueue"
{

    trigger OnRun()
    begin
        SendEmailForLastError;
        ReTerminateJobQueEntries;
    end;

    //[Scope('OnPrem')]
    procedure ReTerminateJobQueEntries()
    var
        JobQueueEntry: Record "Job Queue Entry";
    begin
        JobQueueEntry.SetRange(JobQueueEntry."Job Queue Category Code", 'AUTO');
        JobQueueEntry.SetRange(Status, JobQueueEntry.Status::Error);
        if JobQueueEntry.FindSet(true) then
            repeat
                //JobQueueEntry.CALCFIELDS(Scheduled);
                //IF NOT JobQueueEntry.Scheduled THEN BEGIN
                JobQueueEntry.Restart;
                JobQueueEntry.Modify;
            //END;
            until JobQueueEntry.Next = 0;
    end;

    local procedure SendEmailForLastError()
    var
        JobQueueEntry: Record "Job Queue Entry";
        txtErr: Text[250];
        // SMTPMail: Codeunit "SMTP Mail";
        tmpBody: text;
        FromName: Text;
        ToName: List of [Text];
        Subject: Text;
        FoundError: Boolean;
        cr: Text[2];
        // SMTPSetup: Record "SMTP Mail Setup";

        EmailMessage: Codeunit "Email message";
        Email: codeunit "Email";
    //outs: OutStream;
    begin
        tmpBody := '';

        // if SMTPSetup.Get then begin

        cr[1] := 10;
        cr[2] := 13;
        FromName := 'Fabian.Simes@hanning-gim.com';
        ToName.Add('Fabian.Simes@hanning-gim.com');
        Subject := 'Fehler in der Aufgabenwarteschlangenposten';
        FoundError := false;
        // SMTPMail.CreateMessage(FromName,
        //                        'Fabian.Simes@hanning-gim.com',
        //                         ToName,  //Empfänger
        //                         Subject,   //Subject
        //                         '',  //BODY
        //                         false);  //HTML


        JobQueueEntry.SetRange(JobQueueEntry."Job Queue Category Code", 'AUTO');
        JobQueueEntry.SetRange(Status, JobQueueEntry.Status::Error);
        if JobQueueEntry.FindSet(true) then
            repeat
                JobQueueEntry.CalcFields("Object Caption to Run");
                txtErr := JobQueueEntry."Object Caption to Run" + ': ' + JobQueueEntry."Error Message" + cr;
                tmpbody += txtErr;
                FoundError := true;
            until JobQueueEntry.Next = 0;

        if FoundError then BEGIN

            EmailMessage.Create(ToName, Subject, tmpbody, False);
            Email.Send(EmailMessage);
            //SMTPMail.Send;
        END;
        // end;
    end;
}

