/// <summary>
/// PageExtension gimResourceAllocations (ID 50047) extends Record Resource Allocations.
/// </summary>
pageextension 50047 gimResourceAllocations extends "Resource Allocations"
{
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
