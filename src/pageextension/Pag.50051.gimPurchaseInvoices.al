pageextension 50051 gimPurchaseInvoices extends "Purchase Invoices"
{
    layout
    {
        addafter("Requested Receipt Date")
        {
            field(Sachbearbeiter; Sachbearbeiter)
            {
                Editable = false;

                trigger OnLookup(var Text: Text): Boolean
                var
                    UserMgt: Codeunit "User Management";
                begin
                    // >> P0014
                    UserMgt.DisplayUserInformation(Sachbearbeiter);
                    // << P0014
                end;
            }

            // field(Genehmigungsstatus; Genehmigungsstatus)
            // {
            // }
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
