report 50013 "Execute calc. Low-level code"
{
    // CC01  07.08.2023  CCMUE.WH  new object

    Caption = 'Execute calc. Low-level code';
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
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

    trigger OnPreReport()
    begin
        // CalcLowlevelcode.SetHideDialogs(TRUE);
        CalcLowlevelcode.Calculate(False);
    end;

    var
        CalcLowlevelcode: Codeunit "Low-Level Code Calculator";
}

