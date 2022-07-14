/// <summary>
/// TableExtension "GIMServiceCue" (ID 50069) extends Record Service Cue.
/// </summary>
tableextension 50069 GIMServiceCue extends "Service Cue"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Service Invoice - to send"; Integer)
        {
            CalcFormula = Count("Service Invoice Header" WHERE("No. Printed" = FILTER(= 0)));
            Caption = 'zu versendende Servicerechnungen';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}