//TODO  SCAN-Codeunits: ScanBuffer
// codeunit 50004 "Benutzerdefiniert Scan-C902"
// {
//     // P0019 11.03.16 DEBIE.ARE Object created

//     TableNo = "Scan Buffer";

//     trigger OnRun()
//     var
//         ScanBuffer: Record "Scan Buffer";
//     begin
//         //1. prüfen ob Tabelle 5406 (ProdZeile)
//         TestField("Source Type", 5406);
//         TestField("Source Subtype", 3);
//         "Production Order".Get("Source Subtype", "Source ID");
//         //2. Prüfen Menge
//         // ScanMenge=Restmenge -> weiter mit 3.
//         // Scanmenge<Restmenge -> Teilfertgmeldung, oder FA-Ende
//         // Scanmenge>Restmenge -> FA mit neuer menge neu einlasten
//         ScanSourceDocLines.SetCurrentKey(
//           "Source ID", "Source Type", "Source Subtype", "Source Batch Name", "Source Prod. Order Line", "Source Ref. No.");
//         ScanSourceDocLines.SetFilter("Source Type", Format("Source Type"));
//         ScanSourceDocLines.SetFilter("Source Subtype", Format("Source Subtype"));
//         ScanSourceDocLines.SetFilter("Source ID", "Source ID");
//         ScanSourceDocLines.SetFilter("Source Batch Name", "Source Batch Name");
//         if ScanSourceDocLines.FindSet then
//             repeat
//                 if IsFAgruppe then begin
//                     if ScanSourceDocLines."Outstanding Qty." > 0 then begin //Teilmenge gefertigt
//                         if not ItemTrackingTools.ShowConfirm(
//                                StrSubstNo(Text001, ScanSourceDocLines."Quantity (Base)"),
//                                StrSubstNo(Text002, ScanSourceDocLines."Quantity (Base)" - ScanSourceDocLines."Outstanding Qty."),
//                                StrSubstNo(Text003, ScanSourceDocLines."Source ID"),
//                                Text005,
//                                false,
//                                '')
//                         then
//                             CreateProdOrder;
//                         ModifyProdOrder;
//                     end else
//                         if ScanSourceDocLines."Outstanding Qty." < 0 then begin //überfertigung
//                             if ItemTrackingTools.ShowConfirm(
//                                StrSubstNo(Text001, ScanSourceDocLines."Quantity (Base)"),
//                                StrSubstNo(Text002, ScanSourceDocLines."Quantity (Base)" - ScanSourceDocLines."Outstanding Qty."),
//                                StrSubstNo(Text004, ScanSourceDocLines."Source ID", -ScanSourceDocLines."Outstanding Qty."),
//                                Text005,
//                                false,
//                                '')
//                             then
//                                 ModifyProdOrder;
//                         end;
//                     ScanSourceDocLines."Quantity (Base)" :=
//                          ScanSourceDocLines."Quantity (Base)" - ScanSourceDocLines."Outstanding Qty.";
//                     ScanSourceDocLines."Outstanding Qty." := 0;
//                 end;
//             until ScanSourceDocLines.Next = 0;

//         //3. Scanpuffer übertragen
//         ItemTrackingTools.ScanEnd(0, Rec, true);

//         //4. Buchungen vorbereiten (Verbrauch und Istmeldungen) und buchen
//         if ScanSourceDocLines.FindSet then
//             repeat
//                 SetProdJnl;
//             until ScanSourceDocLines.Next = 0;

//         //5. Drucken
//         PrintDocument;
//     end;

//     var
//         ScanSourceDocLines: Record "Scan Source Doc. Lines";
//         "Production Order": Record "Production Order";
//         Text001: Label 'Die Fertigungsmenge beträgt %1.';
//         Text002: Label 'Die erfasste Istmenge beträgt %1.';
//         Text003: Label 'Möchten Sie den FA %1 beenden?';
//         Text004: Label 'Möchten Sie den FA %1 um %2 erhöhen?';
//         Text005: Label 'Dann scannen Sie bitte ein J.';
//         ItemTrackingTools: Codeunit "Tracking Spe. Scan Tools";

//     [Scope('OnPrem')]
//     procedure CreateProdOrder()
//     var
//         ProdOrderOld: Record "Production Order";
//         ProdOrderNew: Record "Production Order";
//         CreateProdOrderLines: Codeunit "Create Prod. Order Lines";
//         WhseProdRelease: Codeunit "Whse.-Production Release";
//         ProdOrderStatusMgt: Codeunit "Prod. Order Status Management";
//     begin
//         ProdOrderOld.Get(ScanSourceDocLines."Source Subtype", ScanSourceDocLines."Source ID");
//         ProdOrderNew.Status := ProdOrderNew.Status::"Firm Planned";
//         ProdOrderNew."No." := SetProdNo(ProdOrderOld);
//         ProdOrderNew."No. Series" := ProdOrderOld."No. Series";
//         ProdOrderNew.Insert(true);

//         ProdOrderNew."Source Type" := ProdOrderOld."Source Type";
//         ProdOrderNew.Validate("Source No.", ProdOrderOld."Source No.");
//         ProdOrderNew.Validate(Quantity, ScanSourceDocLines."Outstanding Qty.");
//         ProdOrderNew.Validate("Location Code", ProdOrderOld."Location Code");
//         //ProdOrderNew.validate("Due Date", ProdOrderOld."Finished Date");
//         ProdOrderNew."Starting Date" := Today;
//         ProdOrderNew.Modify(true);

//         CreateProdOrderLines.Copy(ProdOrderNew, 0, '', true, 0);   //Vorwärts berechnen

//         if ProdOrderNew.Status = ProdOrderNew.Status::Released then begin
//             ProdOrderStatusMgt.FlushProdOrder(ProdOrderNew, ProdOrderNew.Status, WorkDate);
//             WhseProdRelease.Release(ProdOrderNew);
//         end;
//     end;

//     [Scope('OnPrem')]
//     procedure ModifyProdOrder()
//     var
//         ProdOrder: Record "Production Order";
//         CreateProdOrderLines: Codeunit "Create Prod. Order Lines";
//         WhseProdRelease: Codeunit "Whse.-Production Release";
//         ProdOrderStatusMgt: Codeunit "Prod. Order Status Management";
//     begin
//         ProdOrder.Get(ScanSourceDocLines."Source Subtype", ScanSourceDocLines."Source ID");
//         ProdOrder.Validate(Quantity, ScanSourceDocLines."Quantity (Base)" - ScanSourceDocLines."Outstanding Qty.");
//         ProdOrder.Modify(true);

//         CreateProdOrderLines.Copy(ProdOrder, 0, '', true, 0);   //Vorwärts berechnen

//         if ProdOrder.Status = ProdOrder.Status::Released then begin
//             ProdOrderStatusMgt.FlushProdOrder(ProdOrder, ProdOrder.Status, WorkDate);
//             WhseProdRelease.Release(ProdOrder);
//         end;
//     end;

//     [Scope('OnPrem')]
//     procedure SetProdNo(ProdOrder: Record "Production Order") NextNo: Code[20]
//     var
//         FirstNo: Code[20];
//         TempNo: Record Item temporary;
//     begin
//         //immer mit fortlaufender Nummer der Nachfertigung
//         if StrPos(ProdOrder."No.", '/') = 0 then
//             FirstNo := ProdOrder."No."
//         else
//             FirstNo := CopyStr(ProdOrder."No.", 1, StrPos(ProdOrder."No.", '/'));
//         ProdOrder.SetRange(Status, ProdOrder.Status::"Firm Planned", ProdOrder.Status::Finished);
//         ProdOrder.SetFilter("No.", StrSubstNo('%1*', FirstNo));
//         if ProdOrder.FindSet then
//             repeat
//                 TempNo."No." := ProdOrder."No.";
//                 TempNo.Insert;
//             until ProdOrder.Next = 0;

//         //letzten Datensatz finden
//         if TempNo.Find('+') then;

//         if StrPos(TempNo."No.", '/') = 0 then
//             NextNo := StrSubstNo('%1/1', TempNo."No.")
//         else
//             NextNo := IncStr(TempNo."No.");
//     end;

//     [Scope('OnPrem')]
//     procedure SetProdJnl()
//     var
//         ProdOrder: Record "Production Order";
//         ItemJnlLine: Record "Item Journal Line";
//         ProductionJrnlMgt: Codeunit "Production Journal Mgt";
//         ItemJnlPost: Codeunit "Item Jnl.-Post";
//         ToTemplateName: Code[10];
//         ToBatchName: Code[10];
//     begin
//         ProdOrder.Get(ScanSourceDocLines."Source Subtype", ScanSourceDocLines."Source ID");

//         Clear(ProductionJrnlMgt);
//         ProductionJrnlMgt.SetHidden(true);
//         ProductionJrnlMgt.Handling(ProdOrder, ScanSourceDocLines."Source Ref. No.");

//         ProductionJrnlMgt.GetTemplateBatchName(ToTemplateName, ToBatchName);

//         ItemJnlLine.SetRange("Journal Template Name", ToTemplateName);
//         ItemJnlLine.SetRange("Journal Batch Name", ToBatchName);
//         ItemJnlLine.SetRange("Order Type", ItemJnlLine."Order Type"::Production);
//         ItemJnlLine.SetRange("Order No.", ProdOrder."No.");
//         if ScanSourceDocLines."Source Ref. No." <> 0 then
//             ItemJnlLine.SetRange("Order Line No.", ScanSourceDocLines."Source Ref. No.");
//         ItemJnlLine.SetRange("Flushing Method", ItemJnlLine."Flushing Method"::Manual);
//         //Mengen anpassen, bei Teillieferungen
//         if (not IsFAgruppe) and (ScanSourceDocLines."Outstanding Qty." > 0) then begin
//             if ItemJnlLine.FindSet then
//                 repeat
//                     case ItemJnlLine."Entry Type" of
//                         ItemJnlLine."Entry Type"::Output:
//                             begin
//                                 ItemJnlLine.Validate("Output Quantity (Base)",
//                                        ItemJnlLine."Output Quantity (Base)" - ScanSourceDocLines."Outstanding Qty.");
//                                 ItemJnlLine.Modify;
//                             end;
//                         ItemJnlLine."Entry Type"::Consumption:
//                             begin
//                                 ItemJnlLine.Validate(Quantity, GetConsumtionQnt(ItemJnlLine));
//                                 ItemJnlLine.Modify;
//                             end;
//                     end;
//                 until ItemJnlLine.Next = 0;
//         end;
//         ItemJnlPost.SetHidden(true);
//         if ItemJnlLine.FindSet then
//             ItemJnlPost.Run(ItemJnlLine);
//     end;

//     [Scope('OnPrem')]
//     procedure PrintDocument()
//     var
//         ProdLine: Record "Prod. Order Line";
//         ProdLabel: Report "Etikett Fertigung";
//     begin
//         ProdLine.SetRange(Status, ScanSourceDocLines."Source Subtype");
//         ProdLine.SetRange("Prod. Order No.", ScanSourceDocLines."Source ID");
//         ProdLabel.SetTableView(ProdLine);
//         ProdLabel.UseRequestPage(false);
//         ProdLabel.RunModal;
//     end;

//     [Scope('OnPrem')]
//     procedure IsFAgruppe(): Boolean
//     begin
//         /*---
//         //HS,DEPOT,ZELLEN und UTS
//         EXIT(("Production Order".Fertigungsgruppe='HS') OR
//              ("Production Order".Fertigungsgruppe='DEPOT') OR
//              ("Production Order".Fertigungsgruppe='ZELLEN') OR
//              ("Production Order".Fertigungsgruppe='UTS'));
//         ----*/
//         exit("Production Order"."Production Group Code" = 'PULVERN');
//         exit(false);

//     end;

//     [Scope('OnPrem')]
//     procedure GetConsumtionQnt(ItemJnlLine: Record "Item Journal Line"): Decimal
//     var
//         ProdOrderComp: Record "Prod. Order Component";
//     begin
//         ProdOrderComp.Get("Production Order".Status,
//                           "Production Order"."No.",
//                           ItemJnlLine."Order Line No.",
//                           ItemJnlLine."Prod. Order Comp. Line No.");

//         exit((ScanSourceDocLines."Quantity (Base)" - ScanSourceDocLines."Outstanding Qty.") *
//               ProdOrderComp."Quantity per");
//     end;
// }

