/// <summary>
/// PageExtension gimPurchaseOrder (ID 50053) extends Record Purchase Order.
/// </summary>
pageextension 50053 gimPurchaseOrder extends "Purchase Order"
{
    layout
    {
        addafter("Buy-from Contact")
        {
            field(RegistrierNr; RegistrierNr)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("Co&mments")
        {
            action(OpenD3Document)
            {
                Caption = 'Öffne D3-Document';
                Image = Document;

                trigger OnAction()
                var
                    PurchHeader: Record "Purchase Header";
                    GIMApprovalMgmt: Codeunit GIMApprovalManagement;
                begin
                    PurchHeader.Get("Document Type", "No.");
                    GIMApprovalMgmt.OpenD3Doc(PurchHeader);
                end;
            }
        }
    }
}
