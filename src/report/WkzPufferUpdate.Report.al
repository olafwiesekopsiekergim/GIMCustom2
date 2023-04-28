report 50084 WkzPufferUpdate
{
    Permissions = TableData 50039 = rimd;
    ProcessingOnly = true;

    dataset
    {
        dataitem("FA Ledger Entry"; 5601)
        {

            trigger OnAfterGetRecord()
            begin
                IF WkzPuffer.FINDSET THEN BEGIN
                    WkzPuffer.DELETEALL;
                END;

                WkzPuffer."EntryNo." := 0;

                "FA Ledger Entry".SETRANGE("FA Posting Type", "FA Ledger Entry"."FA Posting Type"::"Acquisition Cost");
                IF "FA Ledger Entry".FINDSET THEN BEGIN
                    REPEAT
                        WkzPuffer."EntryNo." += 1;
                        WkzPuffer."WkzNo." := COPYSTR("FA Ledger Entry".Description, 1, 8);
                        WkzPuffer.Anschaffungswert := "FA Ledger Entry"."Amount (LCY)";
                        WkzPuffer.INSERT(FALSE);
                    UNTIL "FA Ledger Entry".NEXT = 0;
                END;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        WkzPuffer: Record 50039;
}

