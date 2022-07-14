page 50006 "Dachser-Liste"
{
    // PR01 PRODUKT.01 15.12.14 DENUE.SKOL Integration cc|project
    // 
    // #GXW17.00:T100 02.01.13 DEMSR.IST
    //   MenuItem "GX Manufacturing Preview" added (ActionItems > Function)
    // 
    // #GXW17.00.00.02:T501 07.05.13 DEMSR.BKR
    //   Correct Control IDs, Field IDs,Variable IDs and delete unused code and check development guide lines
    // 
    // #RENW16.00:10-001  17.04.2009  DEMSR.KHS
    //   Filter out Rental Orders
    // 
    // cc|dms (CCDMS)
    // 
    // #DMS:T006 10.03.15 DEDRS.WHEG
    //   Standard Implementation with DocumentBoxVisible
    // 
    // #DMSW18.00.01:T100 10.08.15 DEDRS.WHEG
    //   AccessByPermission
    // 
    // WF  cc|workflow context menu integration.
    // cc|mail (MAIL)

    Caption = 'Sales Orders';
    PageType = List;
    SourceTable = "Sales Header";
    SourceTableView = WHERE("Document Type" = CONST(Order),
                            "Rental Contract" = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    Editable = false;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    Editable = false;
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Requested Delivery Date"; Rec."Requested Delivery Date")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Due Date"; Rec."Due Date")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Shipping Advice"; Rec."Shipping Advice")
                {
                    Editable = false;
                    Visible = false;
                }
                field(PackageAmount; Rec.PackageAmount)
                {
                }
                field(PackageType; Rec.PackageType)
                {
                }
                field("GetTotalGrossWeightAT()"; GetTotalGrossWeightAT())
                {
                    Caption = 'Gewicht(Brutto)';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlVisibility;
    end;

    trigger OnOpenPage()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
    begin
        if UserMgt.GetSalesFilter <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetSalesFilter);
            Rec.FilterGroup(0);
        end;

        Rec.SetRange("Date Filter", 0D, WorkDate - 1);

        JobQueueActive := SalesSetup.JobQueueActive;
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
    end;

    var
        DocPrint: Codeunit "Document-Print";
        ReportPrint: Codeunit "Test Report-Print";
        UserMgt: Codeunit "User Setup Management";
        Usage: Option "Order Confirmation","Work Order","Pick Instruction";
        [InDataSet]
        JobQueueActive: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CRMIntegrationEnabled: Boolean;
        "-- PR --": Integer;
        JobsSetup: Record "Jobs Setup";
        "--- CCDMS Vars. ---": Integer;
        DocumentBoxVisible: Boolean;

    [Scope('OnPrem')]
    procedure ShowPreview()
    var
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    begin
        SalesPostYesNo.Preview(Rec);
    end;

    local procedure SetControlVisibility()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    local procedure "--- CCDMS Fcts. ---"()
    begin
    end;
}

