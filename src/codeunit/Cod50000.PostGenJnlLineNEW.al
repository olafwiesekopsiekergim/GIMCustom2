codeunit 50000 "Post Gen Jnl Line NEW"
{

    trigger OnRun()
    var
        GenJournalLine: Record "Gen. Journal Line";
        GenJournalLine2: Record "Gen. Journal Line";
        i: Integer;
        NewDocNo: Code[10];
        NewLineNo: Integer;
        win: Dialog;
        Date: Record Date;
        GenJnlTemplate: Code[10];
        GenJnlBatchName: Code[10];
        GenJnlBatch2Name: Code[10];
        GenJnlErrorBatchName: Code[10];
        GenJournalTemplate: Record "Gen. Journal Template";
        GenJournalBatch: Record "Gen. Journal Batch";
        GenJournalLineLog: Record "Gen. Jnl Post Log2";
    begin
        //DataMigSetup.GET;
        //DataMigSetup.TESTFIELD("Acc. Balance Posting Date");
        //IF NOT CONFIRM('Weiter') THEN ERROR('Abbruch durch Benutzer!');
        //GenJournalLine.SETRANGE("Journal Batch Name",  DataMigSetup."G/L Acc. Jnl. Batch Name");
        //GenJournalLine.SETRANGE("Journal Template Name", DataMigSetup."G/L Acc. Jnl. Template Name");
        if CompanyName <> 'HEW' then
            Error('Falscher Mandant');

        GenJnlTemplate := 'ALLGEMEIN';
        GenJnlBatchName := 'BEWEGUNG';
        GenJnlBatch2Name := 'POSTBEW';
        GenJnlErrorBatchName := 'ERRORBEW';

        // Check Templates
        GenJournalTemplate.Get(GenJnlTemplate);
        GenJournalTemplate."Force Doc. Balance" := false;
        GenJournalTemplate.Modify;

        GenJournalBatch.Get(GenJnlTemplate, GenJnlBatchName);
        GenJournalBatch.TestField("No. Series", '');

        GenJournalBatch.Get(GenJnlTemplate, GenJnlBatch2Name);
        GenJournalBatch.TestField("No. Series", '');

        GenJournalBatch.Get(GenJnlTemplate, GenJnlErrorBatchName);
        GenJournalBatch.TestField("No. Series", '');

        // Run Post
        GenJournalLine.SetRange("Journal Template Name", GenJnlTemplate);
        GenJournalLine.SetRange("Journal Batch Name", GenJnlBatchName);
        if GenJournalLine.IsEmpty then begin
            Message('Keine Bu.Bl. Zeilen gefunden!');
            exit;
        end;

        Date.Reset;
        Date.SetRange("Period Type", Date."Period Type"::Date);
        //Date.SETRANGE("Period Start",010115D,CALCDATE('<31D>',TODAY));
        Date.SetRange("Period Start", 20160401D, 20160430D);
        if Date.FindSet then begin
            win.Open('#1#######');
            repeat
                if not GenJournalLineLog.Get(GenJnlTemplate, GenJnlBatchName, Date."Period Start") then begin
                    GenJournalLineLog.Init;
                    GenJournalLineLog."Journal Template Name" := GenJnlTemplate;
                    GenJournalLineLog."Journal Batch Name" := GenJnlBatchName;
                    GenJournalLineLog.Period := Date."Period Start";
                    GenJournalLineLog.PostPerBatch2Name := (Date."Period Start" >= 20160101D);
                    GenJournalLineLog.Batch2Name := GenJnlBatch2Name;
                    GenJournalLineLog.ErrorBatchName := GenJnlErrorBatchName;
                    GenJournalLineLog.Insert;
                end;

                win.Update(1, Format(Date."Period Start"));

                if not GenJournalLineLog.Posted then begin
                    GenJournalLine.SetRange("Journal Template Name", GenJournalLineLog."Journal Template Name");   // ??? Reset after first post
                    if GenJournalLineLog.PostPerBatch2Name and GenJournalLineLog.CopiedtoBatch2Name then begin
                        GenJournalLine.SetRange("Journal Batch Name", GenJournalLineLog.Batch2Name);
                    end else begin
                        GenJournalLine.SetRange("Journal Batch Name", GenJournalLineLog."Journal Batch Name");
                    end;
                    GenJournalLine.SetRange("Posting Date", GenJournalLineLog.Period);
                    if GenJournalLine.IsEmpty then begin
                        GenJournalLineLog.Delete;
                    end else begin
                        Post(GenJournalLine, GenJournalLineLog);
                    end;
                end;
            until Date.Next = 0;
            win.Close;
        end;

        // Check Templates
        GenJournalTemplate.Get(GenJnlTemplate);
        GenJournalTemplate."Force Doc. Balance" := true;
        GenJournalTemplate.Modify;
    end;

    local procedure Post(var GenJournalLine3: Record "Gen. Journal Line"; var GenJournalLineLog2: Record "Gen. Jnl Post Log2")
    var
        GenJnlPost: Codeunit "Gen. Jnl.-Post";
        PostOK: Boolean;
    begin
        GenJournalLineLog2.Started := CurrentDateTime;
        GenJournalLineLog2.Finished := 0DT;
        GenJournalLineLog2.Duration := 0;
        GenJournalLineLog2.NoOfRecs := GenJournalLine3.Count;
        GenJournalLineLog2.Error := '';
        GenJournalLineLog2.Modify;

        GenJournalLine3.FindSet;
        // TODO SetHideDialog
        // GenJnlPost.SetHideDialog(true);

        if GenJournalLineLog2.PostPerBatch2Name and not GenJournalLineLog2.CopiedtoBatch2Name then begin
            GenJournalLineLog2.CopiedtoBatch2Name := CopytoNewJnl(GenJournalLine3, GenJournalLineLog2.Batch2Name);
        end;

        ClearLastError;
        Commit;

        GenJournalLineLog2.Posted := GenJnlPost.Run(GenJournalLine3);

        if not GenJournalLineLog2.Posted then begin
            GenJournalLineLog2.Started := 0DT;
            GenJournalLineLog2.Error := GetLastErrorText;
            // CopyToErrorBatch
            GenJournalLineLog2.CopiedtoErrorBatchName := CopytoNewJnl(GenJournalLine3, GenJournalLineLog2.ErrorBatchName);
        end else begin
            GenJournalLineLog2.Finished := CurrentDateTime;
            GenJournalLineLog2.Duration := GenJournalLineLog2.Finished - GenJournalLineLog2.Started;
        end;
        GenJournalLineLog2.Modify;
        Commit;
    end;

    local procedure CopytoNewJnl(var GenJournalLine4: Record "Gen. Journal Line"; NewBatchName: Code[10]): Boolean
    var
        GenJournalLine5: Record "Gen. Journal Line";
        i: Integer;
    begin
        if NewBatchName = '' then
            Error('Neuer Batch Name darf nicht leer sein!');
        GenJournalLine5.CopyFilters(GenJournalLine4);
        GenJournalLine5.FindSet;
        i := 0;
        repeat
            i += 1;
            GenJournalLine4.Init;
            GenJournalLine4.TransferFields(GenJournalLine5);
            GenJournalLine4."Journal Batch Name" := NewBatchName;
            GenJournalLine4.Insert;
            GenJournalLine5.Delete;
            if i > 10000 then // just 1000 per Date
                Error('Fehler IN der Logik');
        until GenJournalLine5.Next = 0;
        GenJournalLine4.SetRange("Journal Batch Name", NewBatchName);
        exit(true);
    end;
}

