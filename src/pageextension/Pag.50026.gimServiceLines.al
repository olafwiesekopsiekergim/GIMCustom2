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

    actions
    {
        addlast("F&unctions")
        {

            action(CopyItemsFromServiceItemLines)
            {
                Caption = 'Copy Items from Service Item Line';
                Image = Copy;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ServHeader: Record "Service Header";
                    GIMServiceMgmt: Codeunit GIMServiceManagement;
                begin
                    if ServHeader.Get("Document Type", "Document No.") then
                        GIMServiceMgmt.CopyServItemsFromServItemLineToServAlloc(ServHeader);
                end;
            }

        }
    }
}