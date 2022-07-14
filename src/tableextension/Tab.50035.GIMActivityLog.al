/// <summary>
/// TableExtension "GIMActivityLog" (ID 50035) extends Record Activity Log.
/// </summary>
tableextension 50035 GIMActivityLog extends "Activity Log"
{
    fields
    {
        // Add changes to table fields here
        field(76000; "cc Mail"; Boolean)
        {
            Caption = 'cc Mail';
            Description = 'MAILW19.00';
        }
        field(76001; "Report ID"; Integer)
        {
            Caption = 'Report ID';
            Description = 'MAILW19.00';
        }
        field(76002; "Process Mail"; Boolean)
        {
            Caption = 'Process Mail';
            Description = 'MAILW19.00.01';
        }
    }

    var
        myInt: Integer;
}