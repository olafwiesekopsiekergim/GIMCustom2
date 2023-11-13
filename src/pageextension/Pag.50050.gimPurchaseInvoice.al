/// <summary>
/// PageExtension gimPurchaseInvoice (ID 50050) extends Record Purchase Invoice.
/// </summary>
pageextension 50050 gimPurchaseInvoice extends "Purchase Invoice"
{
    layout
    {
        addafter("Posting Description")
        {
            field(RegistrierNr; RegistrierNr)
            {
                ApplicationArea = all;
            }
        }
        addafter("Order Address Code")
        {
            field(Sachbearbeiter; Sachbearbeiter)
            {
                Editable = false;
                ApplicationArea = All;

                trigger OnLookup(var Text: Text): Boolean
                var
                    UserMgt: Codeunit "User Management";
                begin
                    // >> P0014
                    UserMgt.DisplayUserInformation(Sachbearbeiter);
                    // << P0014
                end;
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
                ApplicationArea = all;

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
