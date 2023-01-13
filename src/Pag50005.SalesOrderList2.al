// page 50005 "Sales Order List 2"
// {
//     // PR01 PRODUKT.01 15.12.14 DENUE.SKOL Integration cc|project
//     // 
//     // #GXW17.00:T100 02.01.13 DEMSR.IST
//     //   MenuItem "GX Manufacturing Preview" added (ActionItems > Function)
//     // 
//     // #GXW17.00.00.02:T501 07.05.13 DEMSR.BKR
//     //   Correct Control IDs, Field IDs,Variable IDs and delete unused code and check development guide lines
//     // 
//     // #RENW16.00:10-001  17.04.2009  DEMSR.KHS
//     //   Filter out Rental Orders
//     // 
//     // cc|dms (CCDMS)
//     // 
//     // #DMS:T006 10.03.15 DEDRS.WHEG
//     //   Standard Implementation with DocumentBoxVisible
//     // 
//     // #DMSW18.00.01:T100 10.08.15 DEDRS.WHEG
//     //   AccessByPermission
//     // 
//     // WF  cc|workflow context menu integration.
//     // cc|mail (MAIL)

//     Caption = 'Sales Orders';
//     CardPageID = "Sales Order";
//     Editable = false;
//     PageType = List;
//     SourceTable = "Sales Header";

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 ShowCaption = false;
//                 field(Wiedervorlage; Rec.Wiedervorlage)
//                 {
//                 }
//                 field("Document Type"; Rec."Document Type")
//                 {
//                 }
//                 field("No."; Rec."No.")
//                 {
//                 }
//                 field("Sell-to Customer No."; Rec."Sell-to Customer No.")
//                 {
//                 }
//                 field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
//                 {
//                 }
//                 field("External Document No."; Rec."External Document No.")
//                 {
//                 }
//                 field("Sell-to Post Code"; Rec."Sell-to Post Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Sell-to Country/Region Code"; Rec."Sell-to Country/Region Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Sell-to Contact"; Rec."Sell-to Contact")
//                 {
//                     Visible = false;
//                 }
//                 field("Bill-to Customer No."; Rec."Bill-to Customer No.")
//                 {
//                     Visible = false;
//                 }
//                 field("Bill-to Name"; Rec."Bill-to Name")
//                 {
//                     Visible = false;
//                 }
//                 field("Bill-to Post Code"; Rec."Bill-to Post Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Bill-to Country/Region Code"; Rec."Bill-to Country/Region Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Bill-to Contact"; Rec."Bill-to Contact")
//                 {
//                     Visible = false;
//                 }
//                 field("Ship-to Code"; Rec."Ship-to Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Ship-to Name"; Rec."Ship-to Name")
//                 {
//                     Visible = false;
//                 }
//                 field("Ship-to Post Code"; Rec."Ship-to Post Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Ship-to Contact"; Rec."Ship-to Contact")
//                 {
//                     Visible = false;
//                 }
//                 field("Job No."; "Job No.")
//                 {
//                 }
//                 field("Main Job No."; "Main Job No.")
//                 {
//                     CaptionClass = JobsSetup.GetMainJobCaption;

//                     trigger OnLookup(var Text: Text): Boolean
//                     begin
//                         // >> PR01
//                         JobsSetup.LookupMainJobNo("Main Job No.");
//                         // << PR01
//                     end;
//                 }
//                 field("Posting Date"; Rec."Posting Date")
//                 {
//                     Visible = false;
//                 }
//                 field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Location Code"; Rec."Location Code")
//                 {
//                     Visible = true;
//                 }
//                 field("Salesperson Code"; Rec."Salesperson Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Assigned User ID"; Rec."Assigned User ID")
//                 {
//                 }
//                 field("Currency Code"; Rec."Currency Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Document Date"; Rec."Document Date")
//                 {
//                     Visible = false;
//                 }
//                 field("Requested Delivery Date"; Rec."Requested Delivery Date")
//                 {
//                     Visible = false;
//                 }
//                 field("Campaign No."; Rec."Campaign No.")
//                 {
//                     Visible = false;
//                 }
//                 field(Status; Rec.Status)
//                 {
//                 }
//                 field("Payment Terms Code"; Rec."Payment Terms Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Due Date"; Rec."Due Date")
//                 {
//                     Visible = false;
//                 }
//                 field("Payment Discount %"; Rec."Payment Discount %")
//                 {
//                     Visible = false;
//                 }
//                 field("Shipment Method Code"; Rec."Shipment Method Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Shipping Agent Code"; Rec."Shipping Agent Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Shipment Date"; Rec."Shipment Date")
//                 {
//                     Visible = false;
//                 }
//                 field("Shipping Advice"; Rec."Shipping Advice")
//                 {
//                     Visible = false;
//                 }
//                 field("Completely Shipped"; Rec."Completely Shipped")
//                 {
//                 }
//                 field(LineAmountGeneral; TotalSalesLine[1]."Line Amount")
//                 {
//                     AutoFormatExpression = Rec."Currency Code";
//                     AutoFormatType = 1;
//                     CaptionClass = GetCaptionClass(Text002, false);
//                     Editable = false;
//                 }
//                 field(InvDiscountAmount_General; TotalSalesLine[1]."Inv. Discount Amount")
//                 {
//                     AutoFormatExpression = Rec."Currency Code";
//                     AutoFormatType = 1;
//                     Caption = 'Inv. Discount Amount';
//                     Editable = DynamicEditable;

//                     trigger OnValidate()
//                     begin
//                         ActiveTab := ActiveTab::General;
//                         UpdateInvDiscAmount(1);
//                     end;
//                 }
//                 field("TotalAmount1[1]"; TotalAmount1[1])
//                 {
//                     AutoFormatExpression = Rec."Currency Code";
//                     AutoFormatType = 1;
//                     CaptionClass = GetCaptionClass(Text001, false);
//                     Editable = DynamicEditable;

//                     trigger OnValidate()
//                     begin
//                         ActiveTab := ActiveTab::General;
//                         UpdateTotalAmount(1);
//                     end;
//                 }
//                 field("AdjProfitLCY[1]"; AdjProfitLCY[1])
//                 {
//                     AutoFormatType = 1;
//                     Caption = 'Adjusted Profit (LCY)';
//                     Editable = false;
//                     HideValue = HideValue;
//                 }
//                 field("AdjProfitPct[1]"; AdjProfitPct[1])
//                 {
//                     Caption = 'Adjusted Profit %';
//                     DecimalPlaces = 1 : 1;
//                     Editable = false;
//                     HideValue = HideValue;
//                 }
//                 field("TotalSalesLineLCY[1].""Unit Cost (LCY)"""; TotalSalesLineLCY[1]."Unit Cost (LCY)")
//                 {
//                     AutoFormatType = 1;
//                     Caption = 'Original Cost (LCY)';
//                     Editable = false;
//                     HideValue = HideValue;
//                 }
//                 field("Creation Date"; Rec."Creation Date")
//                 {
//                     Caption = 'Erstellungsdatum';
//                 }
//                 field("Job Queue Status"; Rec."Job Queue Status")
//                 {
//                     Visible = JobQueueActive;
//                 }
//                 field("Quote No."; Rec."Quote No.")
//                 {
//                 }
//                 field("Ship-to City"; Rec."Ship-to City")
//                 {
//                 }
//                 field(Webrequest; Rec.Webrequest)
//                 {
//                 }
//             }
//         }
//         area(factboxes)
//         {
//             //TODO DMS Box
//             // part(DocumentBox; "DMS - Doc. Box FactBox Async")
//             // {
//             //     AccessByPermission = Page "DMS - Doc. Box FactBox Async" = X;
//             //     Visible = DocumentBoxVisible;
//             // }
//             part(Control1902018507; "Customer Statistics FactBox")
//             {
//                 SubPageLink = "No." = FIELD("Bill-to Customer No."),
//                               "Date Filter" = FIELD("Date Filter");
//                 Visible = true;
//             }
//             part(Control1900316107; "Customer Details FactBox")
//             {
//                 SubPageLink = "No." = FIELD("Bill-to Customer No."),
//                               "Date Filter" = FIELD("Date Filter");
//                 Visible = true;
//             }
//             part(IncomingDocAttachFactBox; "Incoming Doc. Attach. FactBox")
//             {
//                 ShowFilter = false;
//                 Visible = false;
//             }
//             systempart(Control1900383207; Links)
//             {
//                 Visible = false;
//             }
//             systempart(Control1905767507; Notes)
//             {
//                 Visible = true;
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             group("O&rder")
//             {
//                 Caption = 'O&rder';
//                 Image = "Order";
//                 action("Show Document")
//                 {
//                     Caption = 'Show Document';
//                     Enabled = true;
//                     Image = View;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'Shift+F7';
//                     Visible = true;

//                     trigger OnAction()
//                     var
//                         PageManagement: Codeunit "Page Management";
//                     begin
//                         SalesHeader.Get(Rec."Document Type", Rec."No.");
//                         PageManagement.PageRun(SalesHeader);
//                     end;
//                 }
//                 action(Dimensions)
//                 {
//                     AccessByPermission = TableData Dimension = R;
//                     Caption = 'Dimensions';
//                     Image = Dimensions;
//                     ShortCutKey = 'Shift+Ctrl+D';

//                     trigger OnAction()
//                     begin
//                         Rec.ShowDocDim;
//                     end;
//                 }
//                 action(Statistics)
//                 {
//                     Caption = 'Statistics';
//                     Image = Statistics;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     ShortCutKey = 'F7';

//                     trigger OnAction()
//                     begin
//                         Rec.OpenSalesOrderStatistics;
//                     end;
//                 }
//                 action("A&pprovals")
//                 {
//                     Caption = 'A&pprovals';
//                     Image = Approvals;

//                     trigger OnAction()
//                     var
//                         ApprovalEntries: Page "Approval Entries";
//                     begin
//                         ApprovalEntries.Setfilters(DATABASE::"Sales Header", Rec."Document Type", Rec."No.");
//                         ApprovalEntries.Run;
//                     end;
//                 }
//                 action("Co&mments")
//                 {
//                     Caption = 'Co&mments';
//                     Image = ViewComments;
//                     RunObject = Page "Sales Comment Sheet";
//                     RunPageLink = "Document Type" = FIELD("Document Type"),
//                                   "No." = FIELD("No."),
//                                   "Document Line No." = CONST(0);
//                 }
//             }
//             group(Documents)
//             {
//                 Caption = 'Documents';
//                 Image = Documents;
//                 action("S&hipments")
//                 {
//                     Caption = 'S&hipments';
//                     Image = Shipment;
//                     RunObject = Page "Posted Sales Shipments";
//                     RunPageLink = "Order No." = FIELD("No.");
//                     RunPageView = SORTING("Order No.");
//                 }
//                 action(Invoices)
//                 {
//                     Caption = 'Invoices';
//                     Image = Invoice;
//                     RunObject = Page "Posted Sales Invoices";
//                     RunPageLink = "Order No." = FIELD("No.");
//                     RunPageView = SORTING("Order No.");
//                 }
//                 action("Prepa&yment Invoices")
//                 {
//                     Caption = 'Prepa&yment Invoices';
//                     Image = PrepaymentInvoice;
//                     RunObject = Page "Posted Sales Invoices";
//                     RunPageLink = "Prepayment Order No." = FIELD("No.");
//                     RunPageView = SORTING("Prepayment Order No.");
//                 }
//                 action("Prepayment Credi&t Memos")
//                 {
//                     Caption = 'Prepayment Credi&t Memos';
//                     Image = PrepaymentCreditMemo;
//                     RunObject = Page "Posted Sales Credit Memos";
//                     RunPageLink = "Prepayment Order No." = FIELD("No.");
//                     RunPageView = SORTING("Prepayment Order No.");
//                 }
//             }
//             group(Warehouse)
//             {
//                 Caption = 'Warehouse';
//                 Image = Warehouse;
//                 action("Whse. Shipment Lines")
//                 {
//                     Caption = 'Whse. Shipment Lines';
//                     Image = ShipmentLines;
//                     RunObject = Page "Whse. Shipment Lines";
//                     RunPageLink = "Source Type" = CONST(37),
//                                   "Source Subtype" = FIELD("Document Type"),
//                                   "Source No." = FIELD("No.");
//                     RunPageView = SORTING("Source Type", "Source Subtype", "Source No.", "Source Line No.");
//                 }
//                 action("In&vt. Put-away/Pick Lines")
//                 {
//                     Caption = 'In&vt. Put-away/Pick Lines';
//                     Image = PickLines;
//                     RunObject = Page "Warehouse Activity List";
//                     RunPageLink = "Source Document" = CONST("Sales Order"),
//                                   "Source No." = FIELD("No.");
//                     RunPageView = SORTING("Source Document", "Source No.", "Location Code");
//                 }
//             }
//             //TODO DMS
//             // action("Open DocumentBox")
//             // {
//             //     AccessByPermission = TableData "DMS - Document Library" = R;
//             //     Caption = 'Open DocumentBox';
//             //     Image = ViewDocumentLine;

//             //     trigger OnAction()
//             //     var
//             //         AsyncDocumentBox: Page "DMS - Doc. Box FactBox Async";
//             //         RecRef: RecordRef;
//             //     begin
//             //         // >> CCDMS
//             //         RecRef.GetTable(Rec);
//             //         AsyncDocumentBox.SetRecordRef(RecRef);
//             //         AsyncDocumentBox.SetIndependentPage(true, CurrPage.Caption);
//             //         AsyncDocumentBox.Run;
//             //         // << CCDMS
//             //     end;
//             // }
//             group(ActionGroupCRM)
//             {
//                 Caption = 'Dynamics CRM';
//                 Visible = CRMIntegrationEnabled;
//                 action(CRMGoToSalesOrderListInNAV)
//                 {
//                     Caption = 'Sales Order List';
//                     Enabled = CRMIntegrationEnabled;
//                     Image = "Order";
//                     ToolTip = 'Open the Dynamics CRM Sales Order List page in NAV';
//                     Visible = CRMIntegrationEnabled;

//                     trigger OnAction()
//                     var
//                         CRMSalesorder: Record "CRM Salesorder";
//                     begin
//                         PAGE.Run(PAGE::"CRM Sales Order List", CRMSalesorder);
//                     end;
//                 }
//             }
//         }
//         area(processing)
//         {
//             action("&Workflow Context Menu")
//             {
//                 Caption = '&Workflow Context Menu';
//                 Image = ExplodeBOM;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 ShortCutKey = 'Shift+Ctrl+W';

//                 trigger OnAction()
//                 var
//                     WorkflowContextMenu: Page "Workflow Context Menu";
//                     RecRef: RecordRef;
//                     MessagePageID: Integer;
//                 begin
//                     // >> WF
//                     RecRef.GetTable(Rec);
//                     Evaluate(MessagePageID, CopyStr(CurrPage.ObjectId(false),
//                       StrPos(CurrPage.ObjectId(false), ' ') + 1, StrLen(CurrPage.ObjectId(false))));
//                     WorkflowContextMenu.SetRecRef(RecRef);
//                     WorkflowContextMenu.SetObjectID(MessagePageID);
//                     WorkflowContextMenu.RunModal;
//                     Clear(WorkflowContextMenu);
//                     // << WF
//                 end;
//             }
//             group(Action12)
//             {
//                 Caption = 'Release';
//                 Image = ReleaseDoc;
//                 action(Release)
//                 {
//                     Caption = 'Re&lease';
//                     Image = ReleaseDoc;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     ShortCutKey = 'Ctrl+F9';

//                     trigger OnAction()
//                     var
//                         ReleaseSalesDoc: Codeunit "Release Sales Document";
//                     begin
//                         ReleaseSalesDoc.PerformManualRelease(Rec);
//                     end;
//                 }
//                 action(Reopen)
//                 {
//                     Caption = 'Re&open';
//                     Image = ReOpen;
//                     Promoted = true;
//                     PromotedCategory = Process;

//                     trigger OnAction()
//                     var
//                         ReleaseSalesDoc: Codeunit "Release Sales Document";
//                     begin
//                         ReleaseSalesDoc.PerformManualReopen(Rec);
//                     end;
//                 }
//             }
//             group("F&unctions")
//             {
//                 Caption = 'F&unctions';
//                 Image = "Action";
//                 action("Pla&nning")
//                 {
//                     Caption = 'Pla&nning';
//                     Image = Planning;

//                     trigger OnAction()
//                     var
//                         SalesOrderPlanningForm: Page "Sales Order Planning";
//                     begin
//                         SalesOrderPlanningForm.SetSalesOrder(Rec."No.");
//                         SalesOrderPlanningForm.RunModal;
//                     end;
//                 }
//                 action("Order &Promising")
//                 {
//                     AccessByPermission = TableData "Order Promising Line" = R;
//                     Caption = 'Order &Promising';
//                     Image = OrderPromising;

//                     trigger OnAction()
//                     var
//                         OrderPromisingLine: Record "Order Promising Line" temporary;
//                     begin
//                         OrderPromisingLine.SetRange("Source Type", Rec."Document Type");
//                         OrderPromisingLine.SetRange("Source ID", Rec."No.");
//                         PAGE.RunModal(PAGE::"Order Promising Lines", OrderPromisingLine);
//                     end;
//                 }
//                 action("Send IC Sales Order Cnfmn.")
//                 {
//                     AccessByPermission = TableData "IC G/L Account" = R;
//                     Caption = 'Send IC Sales Order Cnfmn.';
//                     Image = IntercompanyOrder;

//                     trigger OnAction()
//                     var
//                         ICInOutboxMgt: Codeunit ICInboxOutboxMgt;
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         if ApprovalsMgmt.PrePostApprovalCheckSales(Rec) then
//                             ICInOutboxMgt.SendSalesDoc(Rec, false);
//                     end;
//                 }
//             }
//             group("Request Approval")
//             {
//                 Caption = 'Request Approval';
//                 action("GX Manufacturing Preview")
//                 {
//                     Caption = 'GX Manufacturing Preview';
//                     Image = ViewJob;
//                     RunObject = Page "GX Sales Order Manuf. Preview";
//                     RunPageLink = "Document Type" = FIELD("Document Type"),
//                                   "No." = FIELD("No.");
//                 }
//                 action(SendApprovalRequest)
//                 {
//                     Caption = 'Send A&pproval Request';
//                     Enabled = NOT OpenApprovalEntriesExist;
//                     Image = SendApprovalRequest;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         if ApprovalsMgmt.CheckSalesApprovalPossible(rec)   then
//                             ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
//                     end;
//                 }
//                 action(CancelApprovalRequest)
//                 {
//                     Caption = 'Cancel Approval Re&quest';
//                     Enabled = OpenApprovalEntriesExist;
//                     Image = Cancel;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);
//                     end;
//                 }
//             }
//             group(Action3)
//             {
//                 Caption = 'Warehouse';
//                 Image = Warehouse;
//                 action("Create Inventor&y Put-away/Pick")
//                 {
//                     AccessByPermission = TableData "Posted Invt. Pick Header" = R;
//                     Caption = 'Create Inventor&y Put-away/Pick';
//                     Ellipsis = true;
//                     Image = CreatePutawayPick;

//                     trigger OnAction()
//                     begin
//                         Rec.CreateInvtPutAwayPick;

//                         if not Rec.Find('=><') then
//                             Rec.Init;
//                     end;
//                 }
//                 action("Create &Whse. Shipment")
//                 {
//                     AccessByPermission = TableData "Warehouse Shipment Header" = R;
//                     Caption = 'Create &Whse. Shipment';
//                     Image = NewShipment;

//                     trigger OnAction()
//                     var
//                         GetSourceDocOutbound: Codeunit "Get Source Doc. Outbound";
//                     begin
//                         GetSourceDocOutbound.CreateFromSalesOrder(Rec);

//                         if not Rec.Find('=><') then
//                             Rec.Init;
//                     end;
//                 }
//             }
//             group("P&osting")
//             {
//                 Caption = 'P&osting';
//                 Image = Post;
//                 action(Post)
//                 {
//                     Caption = 'P&ost';
//                     Ellipsis = true;
//                     Image = PostOrder;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'F9';

//                     trigger OnAction()
//                     begin
//                         Rec.SendToPosting(CODEUNIT::"Sales-Post (Yes/No)");
//                     end;
//                 }
//                 action("Post and &Print")
//                 {
//                     Caption = 'Post and &Print';
//                     Ellipsis = true;
//                     Image = PostPrint;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'Shift+F9';

//                     trigger OnAction()
//                     begin
//                         Rec.SendToPosting(CODEUNIT::"Sales-Post + Print");
//                     end;
//                 }
//                 action("Post and Email")
//                 {
//                     Caption = 'Post and Email';
//                     Ellipsis = true;
//                     Image = PostMail;

//                     trigger OnAction()
//                     var
//                         SalesPostPrint: Codeunit "Sales-Post + Print";
//                     begin
//                         SalesPostPrint.PostAndEmail(Rec);
//                     end;
//                 }
//                 action("Post and Upload PDF")
//                 {
//                     AccessByPermission = TableData "DMS - Document Library" = R;
//                     Caption = 'Post and Upload PDF';
//                     Ellipsis = true;
//                     Image = SendAsPDF;
//                     Promoted = true;
//                     PromotedCategory = Process;

//                     trigger OnAction()
//                     var
//                         SalesPostPrint: Codeunit "Sales-Post + Print";
//                     begin
//                         // >> CCDMS
//                         SalesPostPrint.PostAndUploadPDF(Rec);
//                         CurrPage.DocumentBox.PAGE.UpdateDocumentBox;
//                         // << CCDMS
//                     end;
//                 }
//                 action("Test Report")
//                 {
//                     Caption = 'Test Report';
//                     Ellipsis = true;
//                     Image = TestReport;

//                     trigger OnAction()
//                     begin
//                         ReportPrint.PrintSalesHeader(Rec);
//                     end;
//                 }
//                 action("Post &Batch")
//                 {
//                     Caption = 'Post &Batch';
//                     Ellipsis = true;
//                     Image = PostBatch;
//                     Promoted = true;
//                     PromotedCategory = Process;

//                     trigger OnAction()
//                     begin
//                         REPORT.RunModal(REPORT::"Batch Post Sales Orders", true, true, Rec);
//                         CurrPage.Update(false);
//                     end;
//                 }
//                 action("Remove From Job Queue")
//                 {
//                     Caption = 'Remove From Job Queue';
//                     Image = RemoveLine;
//                     Visible = JobQueueActive;

//                     trigger OnAction()
//                     begin
//                         Rec.CancelBackgroundPosting;
//                     end;
//                 }
//                 action("Preview Posting")
//                 {
//                     Caption = 'Preview Posting';
//                     Image = ViewPostedOrder;

//                     trigger OnAction()
//                     begin
//                         ShowPreview
//                     end;
//                 }
//             }
//             group("&Print")
//             {
//                 Caption = '&Print';
//                 Image = Print;
//                 action("Work Order")
//                 {
//                     Caption = 'Work Order';
//                     Ellipsis = true;
//                     Image = Print;

//                     trigger OnAction()
//                     begin
//                         DocPrint.PrintSalesOrder(Rec, Usage::"Work Order");
//                     end;
//                 }
//                 action("Pick Instruction")
//                 {
//                     Caption = 'Pick Instruction';
//                     Image = Print;

//                     trigger OnAction()
//                     begin
//                         DocPrint.PrintSalesOrder(Rec, Usage::"Pick Instruction");
//                     end;
//                 }
//                 action("Upload Work Order PDF")
//                 {
//                     AccessByPermission = TableData "DMS - Document Library" = R;
//                     Caption = 'Upload Work Order PDF';
//                     Ellipsis = true;
//                     Image = SendAsPDF;

//                     trigger OnAction()
//                     begin
//                         // >> CCDMS
//                         DocPrint.UploadSalesOrder(Rec, Usage::"Work Order");
//                         CurrPage.DocumentBox.PAGE.UpdateDocumentBox;
//                         // << CCDMS
//                     end;
//                 }
//                 action("Upload Pick Instr. PDF")
//                 {
//                     AccessByPermission = TableData "DMS - Document Library" = R;
//                     Caption = 'Upload Pick Instr. PDF';
//                     Ellipsis = true;
//                     Image = SendAsPDF;

//                     trigger OnAction()
//                     begin
//                         // >> CCDMS
//                         DocPrint.UploadSalesOrder(Rec, Usage::"Pick Instruction");
//                         CurrPage.DocumentBox.PAGE.UpdateDocumentBox;
//                         // << CCDMS
//                     end;
//                 }
//             }
//             group("&Order Confirmation")
//             {
//                 Caption = '&Order Confirmation';
//                 Image = Email;
//                 action("Email Confirmation")
//                 {
//                     Caption = 'Email Confirmation';
//                     Ellipsis = true;
//                     Image = Email;

//                     trigger OnAction()
//                     var
//                         MailSetup: Record "Mail Setup, cc";
//                         MailMgt: Codeunit "Mail Functions, cc";
//                         VarRec: Variant;
//                     begin
//                         // >>MAILW19.00
//                         if MailSetup.ReadPermission then begin
//                             VarRec := Rec;
//                             CurrPage.SetSelectionFilter(VarRec);
//                             MailMgt.SendDocumentMail(VarRec, 0);
//                         end else
//                             // <<MAILW19.00
//                             DocPrint.EmailSalesHeader(Rec);
//                     end;
//                 }
//                 action("Activity Log")
//                 {
//                     AccessByPermission = Codeunit "Mail Functions, cc" = X;
//                     Caption = 'Activity Log';
//                     Description = 'MAILW19.00';
//                     Image = Log;

//                     trigger OnAction()
//                     var
//                         MailMgt: Codeunit "Mail Functions, cc";
//                     begin
//                         // >>MAILW19.00
//                         MailMgt.Show_ActivityLogForRecordID(Rec.RecordId);
//                         // <<MAILW19.00
//                     end;
//                 }
//                 action("Print Confirmation")
//                 {
//                     Caption = 'Print Confirmation';
//                     Ellipsis = true;
//                     Image = Print;
//                     Promoted = true;
//                     PromotedCategory = Process;

//                     trigger OnAction()
//                     begin
//                         DocPrint.PrintSalesOrder(Rec, Usage::"Order Confirmation");
//                     end;
//                 }
//                 action("Upload Confirmation PDF")
//                 {
//                     AccessByPermission = TableData "DMS - Document Library" = R;
//                     Caption = 'Upload Confirmation PDF';
//                     Ellipsis = true;
//                     Image = SendAsPDF;
//                     Promoted = true;
//                     PromotedCategory = Process;

//                     trigger OnAction()
//                     begin
//                         // >> CCDMS
//                         DocPrint.UploadSalesOrder(Rec, Usage::"Order Confirmation");
//                         CurrPage.DocumentBox.PAGE.UpdateDocumentBox;
//                         // << CCDMS
//                     end;
//                 }
//             }
//         }
//         area(reporting)
//         {
//             action("Sales Reservation Avail.")
//             {
//                 Caption = 'Sales Reservation Avail.';
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 RunObject = Report "Sales Reservation Avail.";
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     begin
//         SetControlVisibility;
//         CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);

//         // >> CCDMS
//         UpdateDocumentBox;
//         // << CCDMS
//     end;

//     trigger OnAfterGetRecord()
//     begin
//         RefreshOnAfterGetRecord;
//     end;

//     trigger OnOpenPage()
//     var
//         SalesSetup: Record "Sales & Receivables Setup";
//         CRMIntegrationManagement: Codeunit "CRM Integration Management";
//     begin
//         if UserId = 'HEW\HAGEN.FRANZ-JOSEF' then
//             HideValue := false
//         else
//             HideValue := true;


//         if UserMgt.GetSalesFilter <> '' then begin
//             Rec.FilterGroup(2);
//             Rec.SetRange("Responsibility Center", UserMgt.GetSalesFilter);
//             Rec.FilterGroup(0);
//         end;

//         Rec.SetRange("Date Filter", 0D, WorkDate - 1);

//         JobQueueActive := SalesSetup.JobQueueActive;
//         CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
//     end;

//     var
//         DocPrint: Codeunit "Document-Print";
//         ReportPrint: Codeunit "Test Report-Print";
//         UserMgt: Codeunit "User Setup Management";
//         Usage: Option "Order Confirmation","Work Order","Pick Instruction";
//         [InDataSet]
//         JobQueueActive: Boolean;
//         OpenApprovalEntriesExist: Boolean;
//         CRMIntegrationEnabled: Boolean;
//         "-- PR --": Integer;
//         JobsSetup: Record "Jobs Setup";
//         "--- CCDMS Vars. ---": Integer;
//         DocumentBoxVisible: Boolean;
//         TotalSalesLine: array[3] of Record "Sales Line";
//         TotalSalesLineLCY: array[3] of Record "Sales Line";
//         TotalAmount1: array[3] of Decimal;
//         Text000: Label 'Sales %1 Statistics';
//         Text001: Label 'Total';
//         Text002: Label 'Amount';
//         Text003: Label '%1 must not be 0.';
//         Text004: Label '%1 must not be greater than %2.';
//         Text005: Label 'You cannot change the invoice discount because a customer invoice discount with the code %1 exists.';
//         Text006: Label 'Prepmt. Amount';
//         Text007: Label 'Prepmt. Amt. Invoiced';
//         Text008: Label 'Prepmt. Amt. Deducted';
//         Text009: Label 'Prepmt. Amt. to Deduct';
//         UpdateInvDiscountQst: Label 'There are one or more invoiced lines.\Do you want to update the invoice discount?';
//         Text5072650: Label 'Rent %1 Statistics';
//         DynamicEditable: Boolean;
//         ActiveTab: Option General,Invoicing,Shipping,Prepayment;
//         TempVATAmountLine1: Record "VAT Amount Line" temporary;
//         TempVATAmountLine2: Record "VAT Amount Line" temporary;
//         VATLinesForm: Page "VAT Amount Lines";
//         AllowInvDisc: Boolean;
//         VATAmount: array[3] of Decimal;
//         TotalAmount2: array[3] of Decimal;
//         ProfitLCY: array[3] of Decimal;
//         ProfitPct: array[3] of Decimal;
//         AdjProfitLCY: array[3] of Decimal;
//         AdjProfitPct: array[3] of Decimal;
//         TotalAdjCostLCY: array[3] of Decimal;
//         PrevNo: Code[20];
//         TempVATAmountLine3: Record "VAT Amount Line" temporary;
//         TempVATAmountLine4: Record "VAT Amount Line" temporary;
//         SalesPost: Codeunit "Sales-Post";
//         VATAmountText: array[3] of Text[30];
//         PrepmtTotalAmount: Decimal;
//         PrepmtVATAmount: Decimal;
//         PrepmtVATAmountText: Text[30];
//         PrepmtInvPct: Decimal;
//         PrepmtDeductedPct: Decimal;
//         PrepmtTotalAmount2: Decimal;
//         Cust: Record Customer;
//         CreditLimitLCYExpendedPct: Decimal;
//         PrevTab: Option General,Invoicing,Shipping,Prepayment;
//         SalesHeader: Record "Sales Header";
//         HideValue: Boolean;

//     [Scope('OnPrem')]
//     procedure ShowPreview()
//     var
//         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
//     begin
//         SalesPostYesNo.Preview(Rec);
//     end;

//     local procedure SetControlVisibility()
//     var
//         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//     begin
//         OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
//     end;

//     local procedure "--- CCDMS Fcts. ---"()
//     begin
//     end;

//     [Scope('OnPrem')]
//     procedure UpdateDocumentBox()
//     var
//         ChangeLog: Codeunit "Change Log Management";
//         RecRef: RecordRef;
//     begin
//         // >> CCDMS
//         DocumentBoxVisible := ChangeLog.CheckLicensePermission('CCDMS');
//         if DocumentBoxVisible then begin
//             RecRef.GetTable(Rec);
//             if CurrPage.DocumentBox.PAGE.SetRecordRef(RecRef) then
//                 CurrPage.DocumentBox.PAGE.UpdateDocumentBox;
//         end;
//         // << CCDMS
//     end;

//     local procedure "--AT--"()
//     begin
//     end;

//     local procedure GetCaptionClass(FieldCaption: Text[100]; ReverseCaption: Boolean): Text[80]
//     begin
//         if Rec."Prices Including VAT" xor ReverseCaption then
//             exit('2,1,' + FieldCaption);
//         exit('2,0,' + FieldCaption);
//     end;

//     local procedure UpdateInvDiscAmount(ModifiedIndexNo: Integer)
//     var
//         PartialInvoicing: Boolean;
//         MaxIndexNo: Integer;
//         IndexNo: array[2] of Integer;
//         i: Integer;
//         InvDiscBaseAmount: Decimal;
//     begin
//         CheckAllowInvDisc;
//         if not (ModifiedIndexNo in [1, 2]) then
//             exit;

//         if Rec.InvoicedLineExists then
//             if not Confirm(UpdateInvDiscountQst, false) then
//                 Error('');

//         if ModifiedIndexNo = 1 then
//             InvDiscBaseAmount := TempVATAmountLine1.GetTotalInvDiscBaseAmount(false, Rec."Currency Code")
//         else
//             InvDiscBaseAmount := TempVATAmountLine2.GetTotalInvDiscBaseAmount(false, Rec."Currency Code");

//         if InvDiscBaseAmount = 0 then
//             Error(Text003, TempVATAmountLine2.FieldCaption("Inv. Disc. Base Amount"));

//         if TotalSalesLine[ModifiedIndexNo]."Inv. Discount Amount" / InvDiscBaseAmount > 1 then
//             Error(
//               Text004,
//               TotalSalesLine[ModifiedIndexNo].FieldCaption("Inv. Discount Amount"),
//               TempVATAmountLine2.FieldCaption("Inv. Disc. Base Amount"));

//         PartialInvoicing := (TotalSalesLine[1]."Line Amount" <> TotalSalesLine[2]."Line Amount");

//         IndexNo[1] := ModifiedIndexNo;
//         IndexNo[2] := 3 - ModifiedIndexNo;
//         if (ModifiedIndexNo = 2) and PartialInvoicing then
//             MaxIndexNo := 1
//         else
//             MaxIndexNo := 2;

//         if not PartialInvoicing then
//             if ModifiedIndexNo = 1 then
//                 TotalSalesLine[2]."Inv. Discount Amount" := TotalSalesLine[1]."Inv. Discount Amount"
//             else
//                 TotalSalesLine[1]."Inv. Discount Amount" := TotalSalesLine[2]."Inv. Discount Amount";

//         for i := 1 to MaxIndexNo do begin
//             if (i = 1) or not PartialInvoicing then
//                 if IndexNo[i] = 1 then begin
//                     TempVATAmountLine1.SetInvoiceDiscountAmount(
//                       TotalSalesLine[IndexNo[i]]."Inv. Discount Amount", TotalSalesLine[IndexNo[i]]."Currency Code", Rec."Prices Including VAT", Rec."VAT Base Discount %");
//                 end else
//                     TempVATAmountLine2.SetInvoiceDiscountAmount(
//                       TotalSalesLine[IndexNo[i]]."Inv. Discount Amount", TotalSalesLine[IndexNo[i]]."Currency Code", Rec."Prices Including VAT", Rec."VAT Base Discount %");

//             if (i = 2) and PartialInvoicing then
//                 if IndexNo[i] = 1 then begin
//                     InvDiscBaseAmount := TempVATAmountLine2.GetTotalInvDiscBaseAmount(false, TotalSalesLine[IndexNo[i]]."Currency Code");
//                     if InvDiscBaseAmount = 0 then
//                         TempVATAmountLine1.SetInvoiceDiscountPercent(
//                           0, TotalSalesLine[IndexNo[i]]."Currency Code", Rec."Prices Including VAT", false, Rec."VAT Base Discount %")
//                     else
//                         TempVATAmountLine1.SetInvoiceDiscountPercent(
//                           100 * TempVATAmountLine2.GetTotalInvDiscAmount / InvDiscBaseAmount,
//                           TotalSalesLine[IndexNo[i]]."Currency Code", Rec."Prices Including VAT", false, Rec."VAT Base Discount %");
//                 end else begin
//                     InvDiscBaseAmount := TempVATAmountLine1.GetTotalInvDiscBaseAmount(false, TotalSalesLine[IndexNo[i]]."Currency Code");
//                     if InvDiscBaseAmount = 0 then
//                         TempVATAmountLine2.SetInvoiceDiscountPercent(
//                           0, TotalSalesLine[IndexNo[i]]."Currency Code", Rec."Prices Including VAT", false, Rec."VAT Base Discount %")
//                     else
//                         TempVATAmountLine2.SetInvoiceDiscountPercent(
//                           100 * TempVATAmountLine1.GetTotalInvDiscAmount / InvDiscBaseAmount,
//                           TotalSalesLine[IndexNo[i]]."Currency Code", Rec."Prices Including VAT", false, Rec."VAT Base Discount %");
//                 end;
//         end;

//         UpdateHeaderInfo(1, TempVATAmountLine1);
//         UpdateHeaderInfo(2, TempVATAmountLine2);

//         if ModifiedIndexNo = 1 then
//             VATLinesForm.SetTempVATAmountLine(TempVATAmountLine1)
//         else
//             VATLinesForm.SetTempVATAmountLine(TempVATAmountLine2);

//         Rec."Invoice Discount Calculation" := Rec."Invoice Discount Calculation"::Amount;
//         Rec."Invoice Discount Value" := TotalSalesLine[1]."Inv. Discount Amount";
//         Rec.Modify;

//         UpdateVATOnSalesLines;
//     end;

//     local procedure CheckAllowInvDisc()
//     begin
//         if not AllowInvDisc then
//             Error(Text005, Rec."Invoice Disc. Code");
//     end;

//     local procedure UpdateHeaderInfo(IndexNo: Integer; var VATAmountLine: Record "VAT Amount Line")
//     var
//         CurrExchRate: Record "Currency Exchange Rate";
//         UseDate: Date;
//     begin
//         TotalSalesLine[IndexNo]."Inv. Discount Amount" := VATAmountLine.GetTotalInvDiscAmount;
//         TotalAmount1[IndexNo] :=
//           TotalSalesLine[IndexNo]."Line Amount" - TotalSalesLine[IndexNo]."Inv. Discount Amount";
//         VATAmount[IndexNo] := VATAmountLine.GetTotalVATAmount;
//         if Rec."Prices Including VAT" then begin
//             TotalAmount1[IndexNo] := VATAmountLine.GetTotalAmountInclVAT;
//             TotalAmount2[IndexNo] := TotalAmount1[IndexNo] - VATAmount[IndexNo];
//             TotalSalesLine[IndexNo]."Line Amount" :=
//               TotalAmount1[IndexNo] + TotalSalesLine[IndexNo]."Inv. Discount Amount";
//         end else
//             TotalAmount2[IndexNo] := TotalAmount1[IndexNo] + VATAmount[IndexNo];

//         if Rec."Prices Including VAT" then
//             TotalSalesLineLCY[IndexNo].Amount := TotalAmount2[IndexNo]
//         else
//             TotalSalesLineLCY[IndexNo].Amount := TotalAmount1[IndexNo];
//         if Rec."Currency Code" <> '' then
//             if Rec."Posting Date" = 0D then
//                 UseDate := WorkDate
//             else
//                 UseDate := Rec."Posting Date";

//         TotalSalesLineLCY[IndexNo].Amount :=
//           CurrExchRate.ExchangeAmtFCYToLCY(
//             UseDate, Rec."Currency Code", TotalSalesLineLCY[IndexNo].Amount, Rec."Currency Factor");

//         ProfitLCY[IndexNo] := TotalSalesLineLCY[IndexNo].Amount - TotalSalesLineLCY[IndexNo]."Unit Cost (LCY)";
//         if TotalSalesLineLCY[IndexNo].Amount = 0 then
//             ProfitPct[IndexNo] := 0
//         else
//             ProfitPct[IndexNo] := Round(100 * ProfitLCY[IndexNo] / TotalSalesLineLCY[IndexNo].Amount, 0.01);

//         AdjProfitLCY[IndexNo] := TotalSalesLineLCY[IndexNo].Amount - TotalAdjCostLCY[IndexNo];
//         if TotalSalesLineLCY[IndexNo].Amount = 0 then
//             AdjProfitPct[IndexNo] := 0
//         else
//             AdjProfitPct[IndexNo] := Round(100 * AdjProfitLCY[IndexNo] / TotalSalesLineLCY[IndexNo].Amount, 0.01);
//     end;

//     local procedure UpdateVATOnSalesLines()
//     var
//         SalesLine: Record "Sales Line";
//     begin
//         GetVATSpecification(ActiveTab);
//         if TempVATAmountLine1.GetAnyLineModified then
//             SalesLine.UpdateVATOnLines(0, Rec, SalesLine, TempVATAmountLine1);
//         if TempVATAmountLine2.GetAnyLineModified then
//             SalesLine.UpdateVATOnLines(1, Rec, SalesLine, TempVATAmountLine2);
//         PrevNo := '';
//     end;

//     local procedure GetVATSpecification(QtyType: Option General,Invoicing,Shipping)
//     begin
//         case QtyType of
//             QtyType::General:
//                 begin
//                     VATLinesForm.GetTempVATAmountLine(TempVATAmountLine1);
//                     UpdateHeaderInfo(1, TempVATAmountLine1);
//                 end;
//             QtyType::Invoicing:
//                 begin
//                     VATLinesForm.GetTempVATAmountLine(TempVATAmountLine2);
//                     UpdateHeaderInfo(2, TempVATAmountLine2);
//                 end;
//             QtyType::Shipping:

//                 // >> #RENW17.00:T501
//                 // VATLinesForm.GetTempVATAmountLine(TempVATAmountLine3);
//                 begin
//                     VATLinesForm.GetTempVATAmountLine(TempVATAmountLine3);
//                     if "Rental Contract" = "Rental Contract"::"1" then begin
//                         UpdateHeaderInfo(3, TempVATAmountLine3);
//                     end;
//                 end;
//         // << #RENW17.00:T501

//         end;
//     end;

//     local procedure UpdateTotalAmount(IndexNo: Integer)
//     var
//         SaveTotalAmount: Decimal;
//     begin
//         CheckAllowInvDisc;
//         if Rec."Prices Including VAT" then begin
//             SaveTotalAmount := TotalAmount1[IndexNo];
//             UpdateInvDiscAmount(IndexNo);
//             TotalAmount1[IndexNo] := SaveTotalAmount;
//         end;

//         TotalSalesLine[IndexNo]."Inv. Discount Amount" := TotalSalesLine[IndexNo]."Line Amount" - TotalAmount1[IndexNo];
//         UpdateInvDiscAmount(IndexNo);
//     end;

//     local procedure RefreshOnAfterGetRecord()
//     var
//         SalesLine: Record "Sales Line";
//         TempSalesLine: Record "Sales Line" temporary;
//         SalesPostPrepayments: Codeunit "Sales-Post Prepayments";
//         i: Integer;
//     begin
//         if PrevNo = Rec."No." then
//             exit;
//         PrevNo := Rec."No.";

//         Clear(SalesLine);
//         Clear(TotalSalesLine);
//         Clear(TotalSalesLineLCY);

//         for i := 1 to 3 do begin
//             TempSalesLine.DeleteAll;
//             Clear(TempSalesLine);
//             Clear(SalesPost);
//             SalesPost.GetSalesLines(Rec, TempSalesLine, i - 1);
//             Clear(SalesPost);
//             case i of
//                 1:
//                     SalesLine.CalcVATAmountLines(0, Rec, TempSalesLine, TempVATAmountLine1);
//                 2:
//                     SalesLine.CalcVATAmountLines(0, Rec, TempSalesLine, TempVATAmountLine2);
//                 3:
//                     SalesLine.CalcVATAmountLines(0, Rec, TempSalesLine, TempVATAmountLine3);
//             end;

//             SalesPost.SumSalesLinesTemp(
//               Rec, TempSalesLine, i - 1, TotalSalesLine[i], TotalSalesLineLCY[i],
//               VATAmount[i], VATAmountText[i], ProfitLCY[i], ProfitPct[i], TotalAdjCostLCY[i]);

//             if i = 3 then
//                 TotalAdjCostLCY[i] := TotalSalesLineLCY[i]."Unit Cost (LCY)";

//             AdjProfitLCY[i] := TotalSalesLineLCY[i].Amount - TotalAdjCostLCY[i];
//             if TotalSalesLineLCY[i].Amount <> 0 then
//                 AdjProfitPct[i] := Round(AdjProfitLCY[i] / TotalSalesLineLCY[i].Amount * 100, 0.1);

//             if Rec."Prices Including VAT" then begin
//                 TotalAmount2[i] := TotalSalesLine[i].Amount;
//                 TotalAmount1[i] := TotalAmount2[i] + VATAmount[i];
//                 TotalSalesLine[i]."Line Amount" := TotalAmount1[i] + TotalSalesLine[i]."Inv. Discount Amount";
//             end else begin
//                 TotalAmount1[i] := TotalSalesLine[i].Amount;
//                 TotalAmount2[i] := TotalSalesLine[i]."Amount Including VAT";
//             end;
//         end;
//         TempSalesLine.DeleteAll;
//         Clear(TempSalesLine);
//         SalesPostPrepayments.GetSalesLines(Rec, 0, TempSalesLine);
//         SalesPostPrepayments.SumPrepmt(
//           Rec, TempSalesLine, TempVATAmountLine4, PrepmtTotalAmount, PrepmtVATAmount, PrepmtVATAmountText);
//         PrepmtInvPct :=
//           Pct(TotalSalesLine[1]."Prepmt. Amt. Inv.", PrepmtTotalAmount);
//         PrepmtDeductedPct :=
//           Pct(TotalSalesLine[1]."Prepmt Amt Deducted", TotalSalesLine[1]."Prepmt. Amt. Inv.");
//         if Rec."Prices Including VAT" then begin
//             PrepmtTotalAmount2 := PrepmtTotalAmount;
//             PrepmtTotalAmount := PrepmtTotalAmount + PrepmtVATAmount;
//         end else
//             PrepmtTotalAmount2 := PrepmtTotalAmount + PrepmtVATAmount;

//         if Cust.Get(Rec."Bill-to Customer No.") then
//             Cust.CalcFields("Balance (LCY)")
//         else
//             Clear(Cust);

//         case true of
//             Cust."Credit Limit (LCY)" = 0:
//                 CreditLimitLCYExpendedPct := 0;
//             Cust."Balance (LCY)" / Cust."Credit Limit (LCY)" < 0:
//                 CreditLimitLCYExpendedPct := 0;
//             Cust."Balance (LCY)" / Cust."Credit Limit (LCY)" > 1:
//                 CreditLimitLCYExpendedPct := 10000;
//             else
//                 CreditLimitLCYExpendedPct := Round(Cust."Balance (LCY)" / Cust."Credit Limit (LCY)" * 10000, 1);
//         end;

//         TempVATAmountLine1.ModifyAll(Modified, false);
//         TempVATAmountLine2.ModifyAll(Modified, false);
//         TempVATAmountLine3.ModifyAll(Modified, false);
//         TempVATAmountLine4.ModifyAll(Modified, false);

//         PrevTab := -1;

//         UpdateHeaderInfo(2, TempVATAmountLine2);
//     end;

//     local procedure Pct(Numerator: Decimal; Denominator: Decimal): Decimal
//     begin
//         if Denominator = 0 then
//             exit(0);
//         exit(Round(Numerator / Denominator * 10000, 1));
//     end;
// }

