/// <summary>
/// PageExtension "gimServiceLines" (ID 50026) extends Record Service Lines.
/// </summary>
pageextension 50026 gimServiceLines extends "Service Lines"
{
    layout
    {
        addlast(Control1)
        {
            field(RepairStatusCode; RepairStatusCode)
            {
                Caption = 'Reparaturstatuscode';
            }
            field(Position; Position)
            {
            }
        }
    }
}
