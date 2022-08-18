// page 50098 "SV/SO Processor Activities"
// {
//     Caption = 'Activities';
//     PageType = CardPart;
//     SourceTable = "Sales Cue";

//     layout
//     {
//         area(content)
//         {
//             cuegroup(Fakturierung)
//             {
//                 Caption = 'Fakturierung';
//                 field("CountShowSalesOrderToInvoice(FALSE,FALSE)"; CountShowSalesOrderToInvoice(false, false))
//                 {
//                     Caption = 'zu fakturiende Aufträge';

//                     trigger OnDrillDown()
//                     begin
//                         Rec.CountShowSalesOrderToInvoice(true, false);
//                     end;
//                 }
//                 field("CountShowSalesOrderToPartiallyInvoice(FALSE,FALSE)"; CountShowSalesOrderToPartiallyInvoice(false, false))
//                 {
//                     Caption = 'zu Teilen fakturierbare Aufträge';

//                     trigger OnDrillDown()
//                     begin
//                         Rec.CountShowSalesOrderToPartiallyInvoice(true, false);
//                     end;
//                 }
//                 field("ShowInvoicetosend(FALSE,FALSE)"; ShowInvoicetosend(false, false))
//                 {
//                     Caption = 'zu versendende Rechnungen';

//                     trigger OnDrillDown()
//                     begin
//                         Rec.ShowInvoicetosend(true, false);
//                     end;
//                 }
//             }
//             cuegroup("Aufträge")
//             {
//                 Caption = 'Aufträge';
//                 field("Sales Orders - Released"; "Sales Orders - Released")
//                 {

//                     trigger OnDrillDown()
//                     begin
//                         ShowOrders2(Rec.FieldNo("Salesperson Code Filter"));
//                     end;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             action("Set Up Cues")
//             {
//                 Caption = 'Set Up Cues';
//                 Image = Setup;

//                 trigger OnAction()
//                 var
//                     CueRecordRef: RecordRef;
//                 begin
//                     CueRecordRef.GetTable(Rec);
//                     CueSetup.OpenCustomizePageForCurrentUser(CueRecordRef.Number);
//                 end;
//             }
//         }
//     }

//     trigger OnAfterGetRecord()
//     var
//         DocExchServiceSetup: Record "Doc. Exch. Service Setup";
//     begin
//         CalculateCueFieldValues;
//         ShowDocumentsPendingDodExchService := false;
//         if DocExchServiceSetup.Get then
//             ShowDocumentsPendingDodExchService := DocExchServiceSetup.Enabled;
//     end;

//     trigger OnOpenPage()
//     begin
//         Rec.Reset;
//         if not Rec.Get then begin
//             Rec.Init;
//             Rec.Insert;
//         end;

//         SetSalespersonFilter;
//         Rec.SetRespCenterFilter;
//         Rec.SetRange("Date Filter", 0D, WorkDate - 1);
//         Rec.SetFilter("Date Filter2", '>=%1', WorkDate);
//     end;

//     var
//         CueSetup: Codeunit "Cue Setup";
//         ShowDocumentsPendingDodExchService: Boolean;

//     local procedure CalculateCueFieldValues()
//     begin
//         if Rec.FieldActive("Average Days Delayed") then
//             Rec."Average Days Delayed" := Rec.CalculateAverageDaysDelayed;

//         if Rec.FieldActive("Ready to Ship") then
//             Rec."Ready to Ship" := Rec.CountOrders(Rec.FieldNo("Ready to Ship"));

//         if Rec.FieldActive("Partially Shipped") then
//             Rec."Partially Shipped" := Rec.CountOrders(Rec.FieldNo("Partially Shipped"));

//         if Rec.FieldActive(Delayed) then
//             Rec.Delayed := Rec.CountOrders(Rec.FieldNo(Delayed));

//         if Rec.FieldActive("Sales Orders - Open") then
//             Rec."Sales Orders - Open" := Rec.CountOrders(Rec.FieldNo("Salesperson Code Filter"));

//         if Rec.FieldActive("Sales Quotes - Open") then
//             Rec."Sales Quotes - Open" := CountQuotes;
//     end;
// }

