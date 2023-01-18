/// <summary>
/// PageExtension "gimDispatchBoard" (ID 50021) extends Record Dispatch Board.
/// </summary>
pageextension 50021 gimDispatchBoard extends "Dispatch Board"
{
    layout
    {
        addlast(Control1)
        {
            field("Service Salesperson Code"; "Service Salesperson Code")
            {
                Editable = false;
            }
        }
    }
}
