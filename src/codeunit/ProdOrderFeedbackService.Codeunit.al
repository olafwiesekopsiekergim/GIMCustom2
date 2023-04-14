codeunit 50006 "Prod. Order Feedback Service"
{
    // Copyright (Exclusive Rights): COSMO CONSULT Licensing GmbH, Sarnen, Switzerland
    // 
    // :PMW14.00:3218:1
    //   # New function "UpdateJnlLines"
    //   # New function "UpdateComponents"
    //   # New function "UpdateConsumptionJnlLine"
    //   # New function "UpdateOutputJnlLine"
    //   # New function "SetGlobalItemJnlLineFilter"
    //   # New function "RoutingLinkValid"
    // 
    // :PMW14.02:28:1
    //   # New function "GetNextRtngTAN"
    //   # New function "InsertTANOutputJnlLine"
    // 
    // :PMW14.02:169:1
    //   # Check Over-/Underdelivery
    // 
    // :PMW14.02:171:1
    //   # Usage of Rounding Precision for Consumption Line
    // 
    // :PMW14.02.01:5:1
    //   # Code Base Translation
    // 
    // :PMW14.02.01:87:1
    //   # Function FormRun deleted.
    // 
    // :PMW14.02.01:113:1
    //   # No Setup and Run Time calculation for By-Production and Regranulation
    // 
    // :PMW15.00:241:1
    //   # Changes due to UI and programming standards
    // 
    // :PMW15.00:246:1
    //   # Function ExploRoutingLine deleted
    //   # Function DeleteProdOrderFeedbackLine deleted
    // 
    // :PMW15.00:238:1
    //   # Usage of new data access commands
    // 
    // :PMW16.00:145:1
    //   # Run time calculation changed for fixed-step production rate
    // 
    // :PMW16.00:148:1
    //   # Sprue bush calculation for consumption lines
    // 
    // #PMW16.00.00.02:T503 05.05.09 DEMSR.IST
    //   Consider routing scrap on update consuption line
    // 
    // #PMW16.00.00.02:T511 10.09.09 DEMSR.IST
    //   Rounding of Scrap Time
    // 
    // #PMW16.00.01.02:T503 05.03.10 DEMSR.IST
    //   Changes due to UI and programming standards
    // 
    // #PMW16.00.01.02:T505 27.07.10 DEMSR.IST
    //   Consider subcontracting for posting quantity
    // 
    // #PMW16.00.02.05:T514 16.06.11 DEMSR.IST
    //   No update of component quantities if pick is required for component location
    // 
    // #PMW16.00.03.01:T506 28.02.12 DEMSR.IST
    //   Correction of posting quantity calculation for subcontracting
    // 
    // #PMW17.00:T101 12.10.12 DEMSR.IST
    //   Changed "Prod. Order" fields in Item Ledger Entry
    // 
    // #PMW17.00:T513 14.01.13 DEMSR.IST
    //   Rounding of consumption qty. corrected
    // 
    // #PMW17.10.00.03:T100 31.07.14 DEMSR.IST - Rebranding
    // 
    // #PMW18.00.00.03:T500 12.02.15 DEMSR.KHS
    //   Update / Correct dummy usage
    // 
    // #PMW18.00.00.07:T504 08.07.15 DEMSR.IST
    //   Consider Preset Output Quantity in Update Journal Lines
    // 
    // GIM0013 22.9.22 Verhindern von Buchungen wenn keine Testaufträge mehr vorhanden sind


    trigger OnRun()
    begin
    end;

    var
        CheckDeliveryTolerance: Boolean;

    // //
    // procedure CalcRoutingTime(var ProdOrderLine: Record "Prod. Order Line")
    // var
    //     ProdOrderRoutingLine: Record "Prod. Order Routing Line";
    //     ItemJournalLine: Record "Item Journal Line";
    //     ProdOrderComponent: Record "Prod. Order Component";
    //     CalendarMgt: Codeunit CalendarManagement;
    //     Quantity: Decimal;
    //     ScrapTime: Decimal;
    //     WorkCenter: Record "Work Center";
    //     SetupTime: Decimal;
    //     RunTime: Decimal;
    // begin
    //     ProdOrderRoutingLine.SetRange(Status, ProdOrderLine.Status);
    //     ProdOrderRoutingLine.SetRange("Prod. Order No.", ProdOrderLine."Prod. Order No.");
    //     ProdOrderRoutingLine.SetRange("Routing Reference No.", ProdOrderLine."Routing Reference No.");
    //     if ProdOrderRoutingLine.FindSet then begin
    //         repeat
    //             // >> #PMW17.00:T101
    //             // ItemJournalLine.SETRANGE("Prod. Order No.",ProdOrderRoutingLine."Prod. Order No.");
    //             // ItemJournalLine.SETRANGE("Prod. Order Line No.",ProdOrderLine."Line No.");
    //             ItemJournalLine.SetRange("Order Type", ItemJournalLine."Order Type"::Production);
    //             ItemJournalLine.SetRange("Order No.", ProdOrderRoutingLine."Prod. Order No.");
    //             ItemJournalLine.SetRange("Order Line No.", ProdOrderLine."Line No.");
    //             // << #PMW17.00:T101
    //             ItemJournalLine.SetRange("Routing Reference No.", ProdOrderRoutingLine."Routing Reference No.");
    //             ItemJournalLine.SetRange("Operation No.", ProdOrderRoutingLine."Operation No.");
    //             if ItemJournalLine.FindFirst then begin

    //                 // Time unit conversion

    //                 WorkCenter.Get(ProdOrderRoutingLine."Work Center No.");
    //                 RunTime := Round(ProdOrderRoutingLine."Run Time" *
    //                             CalendarMgt.TimeFactor(ProdOrderRoutingLine."Run Time Unit of Meas. Code") /
    //                             CalendarMgt.TimeFactor(WorkCenter."Unit of Measure Code"),
    //                             WorkCenter."Calendar Rounding Precision");

    //                 SetupTime := Round(ProdOrderRoutingLine."Setup Time" *
    //                               CalendarMgt.TimeFactor(ProdOrderRoutingLine."Setup Time Unit of Meas. Code") /
    //                               CalendarMgt.TimeFactor(WorkCenter."Unit of Measure Code"),
    //                               WorkCenter."Calendar Rounding Precision");

    //                 if ProdOrderLine."Posting Quantity" > 0 then begin

    //                     if ProdOrderLine."Scrap %" > 0 then begin

    //                         // >> #PMW16.00.00.02:T511
    //                         // ScrapTime := ROUND(RunTime / 100 * ProdOrderLine."Scrap %");
    //                         ScrapTime := Round(RunTime / 100 * ProdOrderLine."Scrap %", 0.00001);
    //                         // << #PMW16.00.00.02:T511

    //                         ItemJournalLine.Validate("Run Time", Round(RunTime * ProdOrderLine."Posting Quantity")
    //                                                              + (ProdOrderLine."Posting Quantity" * ScrapTime));
    //                         ItemJournalLine.Validate("Output Quantity", ProdOrderLine."Posting Quantity");

    //                     end else begin

    //                         ItemJournalLine.Validate("Run Time", Round(RunTime * ProdOrderLine."Posting Quantity"));
    //                         ItemJournalLine.Validate("Output Quantity", ProdOrderLine."Posting Quantity");

    //                     end;

    //                 end else begin

    //                     if ProdOrderLine."Scrap %" > 0 then begin

    //                         // >> #PMW16.00.00.02:T511
    //                         // ScrapTime := ROUND(RunTime / 100 * ProdOrderLine."Scrap %");
    //                         ScrapTime := Round(RunTime / 100 * ProdOrderLine."Scrap %", 0.00001);
    //                         // << #PMW16.00.00.02:T511

    //                         ItemJournalLine.Validate("Run Time", Round(RunTime * ProdOrderLine."Remaining Quantity")
    //                                                              + (ProdOrderLine."Remaining Quantity" * ScrapTime));
    //                         ItemJournalLine.Validate("Output Quantity", ProdOrderLine."Posting Quantity");
    //                     end else begin

    //                         ItemJournalLine.Validate("Run Time", Round(RunTime * ProdOrderLine."Remaining Quantity"));
    //                         ItemJournalLine.Validate("Output Quantity", ProdOrderLine."Remaining Quantity");

    //                     end
    //                 end;

    //                 ItemJournalLine.Validate("Setup Time", SetupTime);
    //                 ItemJournalLine.Modify;

    //             end;
    //         until ProdOrderRoutingLine.Next = 0;
    //     end;

    //     if ProdOrderLine."Posting Quantity" > 0 then begin
    //         ProdOrderComponent.SetRange(Status, ProdOrderLine.Status);
    //         ProdOrderComponent.SetRange("Prod. Order No.", ProdOrderLine."Prod. Order No.");
    //         ProdOrderComponent.SetRange("Prod. Order Line No.", ProdOrderLine."Line No.");
    //         if ProdOrderComponent.FindSet then begin
    //             ItemJournalLine.Reset;
    //             repeat
    //                 // >> #PMW17.00:T101
    //                 // ItemJournalLine.SETRANGE("Prod. Order No.",ProdOrderLine."Prod. Order No.");
    //                 // ItemJournalLine.SETRANGE("Prod. Order Line No.",ProdOrderLine."Line No.");
    //                 ItemJournalLine.SetRange("Order Type", ItemJournalLine."Order Type"::Production);
    //                 ItemJournalLine.SetRange("Order No.", ProdOrderRoutingLine."Prod. Order No.");
    //                 ItemJournalLine.SetRange("Order Line No.", ProdOrderLine."Line No.");
    //                 // << #PMW17.00:T101
    //                 ItemJournalLine.SetRange("Prod. Order Comp. Line No.", ProdOrderComponent."Line No.");
    //                 if ItemJournalLine.FindFirst then begin
    //                     if ProdOrderLine."Scrap %" > 0 then begin
    //                         Quantity :=
    //                           Round((ProdOrderComponent.Quantity * ProdOrderLine."Posting Quantity") *
    //                                 (1 + ProdOrderLine."Scrap %" / 100));
    //                     end else begin
    //                         Quantity := ProdOrderComponent.Quantity * ProdOrderLine."Posting Quantity";
    //                     end;
    //                     ItemJournalLine.Validate(Quantity, Quantity);
    //                     ItemJournalLine.Modify;
    //                 end;
    //             until ProdOrderComponent.Next = 0;
    //         end;
    //     end;
    // end;

    // //
    // procedure UpdatePostingQuantity(var ProdOrderLine: Record "Prod. Order Line")
    // begin
    //     ProdOrderLine."Posting Quantity" := ProdOrderLine."Remaining Quantity";
    //     ProdOrderLine.Modify;
    // end;


    procedure UpdateJnlLines(ProdOrder: Record "Production Order"; ProdOrderLineNo: Integer; TemplateName: Code[10]; BatchName: Code[10]; PostingQuantity: Decimal; ScrapPercent: Decimal; ConsiderPresetOutputQty: Boolean)
    var
        ProdOrderLine: Record "Prod. Order Line";
        ProdOrderRtngLine: Record "Prod. Order Routing Line";
        ProdOrderComp: Record "Prod. Order Component";
        ItemJnlLine: Record "Item Journal Line";
        ManufacturingSetup: Record "Manufacturing Setup";
        OriginalPercent: Decimal;
    begin
        // >> :PMW14.00:3218:1
        ProdOrderLine.Reset;
        ProdOrderLine.SetRange(Status, ProdOrder.Status);
        ProdOrderLine.SetRange("Prod. Order No.", ProdOrder."No.");
        if ProdOrderLineNo <> 0 then begin
            ProdOrderLine.SetRange("Line No.", ProdOrderLineNo);
        end;
        if ProdOrderLine.FindSet then begin

            // >> #PMW18.00.00.07:T504
            ManufacturingSetup.Get;
            // << #PMW18.00.00.07:T504

            repeat

                // >> :PMW14.02:169:1
                // IF PostingQuantity > ProdOrderLine."Remaining Quantity" THEN BEGIN
                //   ERROR(lText000);
                // END;
                CheckDeliveryTolerance := true;
                // << :PMW14.02:169:1

                OriginalPercent := ProdOrderLine."Scrap %";

                ProdOrderLine."Scrap %" := ScrapPercent;
                ProdOrderLine."CCS PM Posting Quantity" := PostingQuantity;

                ProdOrderRtngLine.Reset;
                ProdOrderRtngLine.SetRange("Prod. Order No.", ProdOrderLine."Prod. Order No.");
                ProdOrderRtngLine.SetRange("Routing No.", ProdOrderLine."Routing No.");
                ProdOrderRtngLine.SetRange(Status, ProdOrderLine.Status);
                ProdOrderRtngLine.SetRange("Routing Reference No.", ProdOrderLine."Routing Reference No.");
                if ProdOrderRtngLine.FindSet then begin

                    SetGlobalItemJnlLineFilter(ItemJnlLine, ProdOrder."No.", ProdOrderLineNo, TemplateName, BatchName);
                    UpdateComponents(ProdOrderLine, true, ItemJnlLine); // With no Routing Link or illegal Routing Link

                    repeat

                        // >> #PMW18.00.00.07:T504
                        if UpdateOutputQuantity(ManufacturingSetup, ProdOrderRtngLine, ConsiderPresetOutputQty) then begin
                            // << #PMW18.00.00.07:T504

                            SetGlobalItemJnlLineFilter(ItemJnlLine, ProdOrder."No.", ProdOrderLineNo, TemplateName, BatchName);
                            ItemJnlLine.SetRange("Routing No.", ProdOrderRtngLine."Routing No.");
                            ItemJnlLine.SetRange("Routing Reference No.", ProdOrderRtngLine."Routing Reference No.");
                            ItemJnlLine.SetRange("Operation No.", ProdOrderRtngLine."Operation No.");
                            UpdateOutputJnlLine(ProdOrderRtngLine, ProdOrderLine, ItemJnlLine);

                            // >> #PMW18.00.00.07:T504
                        end;
                        // << #PMW18.00.00.07:T504


                        // Components connected by Routing Link

                        if ProdOrderRtngLine."Routing Link Code" <> '' then begin
                            ProdOrderComp.Reset;
                            ProdOrderComp.SetCurrentKey(Status, "Prod. Order No.", "Routing Link Code");
                            ProdOrderComp.SetRange(Status, ProdOrder.Status);
                            ProdOrderComp.SetRange("Prod. Order No.", ProdOrderLine."Prod. Order No.");
                            ProdOrderComp.SetRange("Routing Link Code", ProdOrderRtngLine."Routing Link Code");
                            ProdOrderComp.SetRange("Prod. Order Line No.", ProdOrderLine."Line No.");
                            ProdOrderComp.SetFilter("Item No.", '<>%1', '');
                            if ProdOrderComp.FindSet then begin
                                repeat

                                    // Update Consumption Item Journal-line

                                    SetGlobalItemJnlLineFilter(ItemJnlLine, ProdOrder."No.", ProdOrderLineNo, TemplateName, BatchName);
                                    ItemJnlLine.SetRange("Prod. Order Comp. Line No.", ProdOrderComp."Line No.");
                                    // >> #PMW16.00.00.02:T503
                                    // UpdateConsumptionJnlLine(ProdOrderComp,ProdOrderLine, ItemJnlLine);
                                    UpdateConsumptionJnlLine(ProdOrderComp, ProdOrderLine, ProdOrderRtngLine, ItemJnlLine);
                                // << #PMW16.00.00.02:T503

                                until ProdOrderComp.Next = 0;
                            end;

                        end;

                    until ProdOrderRtngLine.Next = 0;

                end else begin

                    // Update All Components - No Routing Link Check

                    SetGlobalItemJnlLineFilter(ItemJnlLine, ProdOrder."No.", ProdOrderLineNo, TemplateName, BatchName);
                    UpdateComponents(ProdOrderLine, false, ItemJnlLine);

                    // Update line for Output Qty

                    Clear(ProdOrderRtngLine);

                    SetGlobalItemJnlLineFilter(ItemJnlLine, ProdOrder."No.", ProdOrderLineNo, TemplateName, BatchName);
                    UpdateOutputJnlLine(ProdOrderRtngLine, ProdOrderLine, ItemJnlLine);

                end;

                ProdOrderLine."Scrap %" := OriginalPercent;
                ProdOrderLine.Modify;

            until ProdOrderLine.Next = 0;
        end;

        Commit;
        // << :PMW14.00:3218:1
    end;

    local procedure UpdateComponents(ProdOrderLine: Record "Prod. Order Line"; CheckRoutingLink: Boolean; var ItemJnlLine: Record "Item Journal Line")
    var
        ProdOrderComp: Record "Prod. Order Component";
        ProdOrderRtngLine: Record "Prod. Order Routing Line";
    begin
        // >> :PMW14.00:3218:1
        ProdOrderComp.Reset;
        ProdOrderComp.SetRange(Status, ProdOrderLine.Status);
        ProdOrderComp.SetRange("Prod. Order No.", ProdOrderLine."Prod. Order No.");
        ProdOrderComp.SetRange("Prod. Order Line No.", ProdOrderLine."Line No.");
        ProdOrderComp.SetFilter("Item No.", '<>%1', '');
        if ProdOrderComp.FindSet then begin
            repeat

                ItemJnlLine.SetRange("Prod. Order Comp. Line No.", ProdOrderComp."Line No.");

                // >> #PMW16.00.00.02:T503
                Clear(ProdOrderRtngLine);
                // << #PMW16.00.00.02:T503

                if not CheckRoutingLink then begin
                    // >> #PMW16.00.00.02:T503
                    // UpdateConsumptionJnlLine(ProdOrderComp,ProdOrderLine,ItemJnlLine);
                    UpdateConsumptionJnlLine(ProdOrderComp, ProdOrderLine, ProdOrderRtngLine, ItemJnlLine);
                    // << #PMW16.00.00.02:T503
                end else begin
                    if not RoutingLinkValid(ProdOrderComp, ProdOrderLine) then begin
                        // >> #PMW16.00.00.02:T503
                        // UpdateConsumptionJnlLine(ProdOrderComp,ProdOrderLine,ItemJnlLine);
                        UpdateConsumptionJnlLine(ProdOrderComp, ProdOrderLine, ProdOrderRtngLine, ItemJnlLine);
                        // << #PMW16.00.00.02:T503
                    end;
                end;

            until ProdOrderComp.Next = 0;
        end;
        // << :PMW14.00:3218:1
    end;

    local procedure UpdateConsumptionJnlLine(ProdOrderComp: Record "Prod. Order Component"; ProdOrderLine: Record "Prod. Order Line"; ProdOrderRtngLine: Record "Prod. Order Routing Line"; var ItemJnlLine: Record "Item Journal Line")
    var
        Item: Record Item;
        Location: Record Location;
        Quantity: Decimal;
    begin
        // >> :PMW14.00:3218:1
        ItemJnlLine.SetRange("Entry Type", ItemJnlLine."Entry Type"::Consumption);
        if ItemJnlLine.FindSet then begin
            repeat

                // >> #PMW16.00.02.05:T514
                if (ItemJnlLine."Location Code" <> '') and (ItemJnlLine."Location Code" <> Location.Code) then begin
                    Location.Get(ItemJnlLine."Location Code");
                end else begin
                    Clear(Location);
                end;

                // IF ProdOrderLine."Posting Quantity" > 0 THEN BEGIN
                if (ProdOrderLine."ccs pm Posting Quantity" > 0) and (not Location."Require Pick") then begin
                    // << #PMW16.00.02.05:T514

                    // >> :PMW16.00:148:1
                    // IF ProdOrderLine."Scrap %" > 0 THEN BEGIN
                    //    Quantity :=
                    //      ROUND((ProdOrderComp.Quantity * ProdOrderLine."Posting Quantity") *
                    //            (1 + ProdOrderLine."Scrap %" / 100));
                    // END ELSE BEGIN
                    //   Quantity := ProdOrderComp.Quantity * ProdOrderLine."Posting Quantity";
                    // END;
                    Quantity :=
                        // >> #PMW17.00:T513
                        // ROUND(
                        // << #PMW17.00:T513
                        (ProdOrderComp.Quantity * ProdOrderLine."ccs pm Posting Quantity") *
                        (1 + ProdOrderLine."Scrap %" / 100) *
                        // >> #PMW16.00.00.02:T503
                        (1 + ProdOrderRtngLine."Scrap Factor % (Accumulated)") *
                        // << #PMW16.00.00.02:T503
                        (1 + ProdOrderComp."ccs pm Sprue Bush %" / 100) *
                        // >> #PMW17.00:T513
                        // (1 + ProdOrderComp."Scrap %" / 100));
                        (1 + ProdOrderComp."Scrap %" / 100);
                    // << #PMW17.00:T513
                    // << :PMW16.00:148:1

                    // >> :PMW14.02:171:1
                    Item.Get(ItemJnlLine."Item No.");
                    if Item."Rounding Precision" > 0 then begin
                        ItemJnlLine.Validate(Quantity, Round(Quantity, Item."Rounding Precision", '>'));
                    end else begin
                        ItemJnlLine.Validate(Quantity, Round(Quantity, 0.00001));
                    end;
                    // << :PMW14.02:171:1

                    ItemJnlLine.Modify;

                end;

            until ItemJnlLine.Next = 0;
        end;
        // << :PMW14.00:3218:1
    end;

    local procedure UpdateOutputJnlLine(ProdOrderRtngLine: Record "Prod. Order Routing Line"; var ProdOrderLine: Record "Prod. Order Line"; var ItemJnlLine: Record "Item Journal Line")
    var
        WorkCenter: Record "Work Center";
        CalendarMgt: Codeunit "Shop Calendar Management";
        CostCalcMgt: Codeunit "Cost Calculation Management";
        ScrapTime: Decimal;
        SetupTime: Decimal;
        RunTime: Decimal;
        CurrentOutputQty: Decimal;
        SubcontractingQty: Decimal;
    begin
        // >> :PMW14.00:3218:1
        ItemJnlLine.SetRange("Entry Type", ItemJnlLine."Entry Type"::Output);
        if ItemJnlLine.FindSet then begin

            repeat

                if ProdOrderLine."ccs pm Additional Line Type" = ProdOrderLine."ccs pm Additional Line Type"::" " then begin // :PMW14.02.01:113:1

                    // Time Unit of Measure conversion

                    if ProdOrderRtngLine."Prod. Order No." <> '' then begin

                        WorkCenter.Get(ProdOrderRtngLine."Work Center No.");

                        RunTime := Round(ProdOrderRtngLine."Run Time" *
                                          CalendarMgt.TimeFactor(ProdOrderRtngLine."Run Time Unit of Meas. Code") /
                                          CalendarMgt.TimeFactor(WorkCenter."Unit of Measure Code"),
                                          WorkCenter."Calendar Rounding Precision");

                        SetupTime := Round(ProdOrderRtngLine."Setup Time" *
                                            CalendarMgt.TimeFactor(ProdOrderRtngLine."Setup Time Unit of Meas. Code") /
                                            CalendarMgt.TimeFactor(WorkCenter."Unit of Measure Code"),
                                            WorkCenter."Calendar Rounding Precision");

                    end;

                end; // :PMW14.02.01:113:1

                if ProdOrderLine."ccs pm Posting Quantity" > 0 then begin

                    // >> :PMW16.00:145:1
                    if ProdOrderRtngLine."CCS PX FixedStep ProdRate Time" then begin
                        CurrentOutputQty :=
                          Round(ProdOrderLine."ccs pm Posting Quantity" / ProdOrderRtngLine."CCS PX Fixed-Step Prod. Rate", 1, '>');
                    end else begin
                        CurrentOutputQty := ProdOrderLine."ccs pm Posting Quantity";
                    end;
                    // << :PMW16.00:145:1

                    // >> #PMW16.00.03.01:T506
                    SubcontractingQty := 0;
                    // << #PMW16.00.03.01:T506

                    // >> #PMW16.00.01.02:T505
                    if WorkCenter."No." <> ProdOrderRtngLine."Work Center No." then begin
                        WorkCenter.Get(ProdOrderRtngLine."Work Center No.");
                    end;
                    if WorkCenter."Subcontractor No." <> '' then begin
                        // >> #PMW16.00.03.01:T506
                        // ProdOrderLine."Posting Quantity" :=
                        //   ProdOrderLine."Posting Quantity" - CostCalcMgt.CalcActOutputQtyBase(ProdOrderLine, ProdOrderRtngLine);
                        // ProdOrderLine."Posting Quantity" := ProdOrderLine."Posting Quantity" / ProdOrderLine."Qty. per Unit of Measure";
                        SubcontractingQty :=
                          CostCalcMgt.CalcActOutputQtyBase(ProdOrderLine, ProdOrderRtngLine) / ProdOrderLine."Qty. per Unit of Measure";
                        // << #PMW16.00.03.01:T506
                    end;
                    // << #PMW16.00.01.02:T505

                    if ProdOrderLine."Scrap %" > 0 then begin

                        // >> #PMW16.00.00.02:T511
                        // ScrapTime := ROUND(RunTime / 100 * ProdOrderLine."Scrap %");
                        ScrapTime := Round(RunTime / 100 * ProdOrderLine."Scrap %", 0.00001);
                        // << #PMW16.00.00.02:T511

                        // >> :PMW16.00:145:1
                        ItemJnlLine.Validate(
                          "Run Time", Round(RunTime * CurrentOutputQty) + (CurrentOutputQty * ScrapTime));
                        // >> :PMW16.00:145:1

                        // >> #PMW16.00.03.01:T506
                        // ItemJnlLine.VALIDATE("Output Quantity",ProdOrderLine."Posting Quantity");
                        ItemJnlLine.Validate("Output Quantity", ProdOrderLine."ccs pm Posting Quantity" - SubcontractingQty);
                        // << #PMW16.00.03.01:T506

                    end else begin

                        ItemJnlLine.Validate("Run Time", Round(RunTime * CurrentOutputQty)); // :PMW16.00:145:1
                                                                                             // >> #PMW16.00.03.01:T506
                                                                                             // ItemJnlLine.VALIDATE("Output Quantity",ProdOrderLine."Posting Quantity");
                        ItemJnlLine.Validate("Output Quantity", ProdOrderLine."ccs pm Posting Quantity" - SubcontractingQty);
                        // << #PMW16.00.03.01:T506

                    end;

                end else begin

                    // >> :PMW16.00:145:1
                    if ProdOrderRtngLine."CCS PX FixedStep ProdRate Time" then begin
                        CurrentOutputQty :=
                          Round(ProdOrderLine."Remaining Quantity" / ProdOrderRtngLine."CCS PX Fixed-Step Prod. Rate", 1, '>');
                    end else begin
                        CurrentOutputQty := ProdOrderLine."Remaining Quantity";
                    end;
                    // << :PMW16.00:145:1

                    if ProdOrderLine."Scrap %" > 0 then begin

                        // >> #PMW16.00.00.02:T511
                        // ScrapTime := ROUND(RunTime / 100 * ProdOrderLine."Scrap %");
                        ScrapTime := Round(RunTime / 100 * ProdOrderLine."Scrap %", 0.00001);
                        // << #PMW16.00.00.02:T511

                        // >> :PMW16.00:145:1
                        ItemJnlLine.Validate(
                          "Run Time", Round(RunTime * CurrentOutputQty) + (CurrentOutputQty * ScrapTime));
                        ItemJnlLine.Validate("Output Quantity", ProdOrderLine."Remaining Quantity");
                        // << :PMW16.00:145:1

                    end else begin

                        ItemJnlLine.Validate("Run Time", Round(RunTime * CurrentOutputQty)); // :PMW16.00:145:1
                        ItemJnlLine.Validate("Output Quantity", ProdOrderLine."Remaining Quantity");

                    end

                end;

                // >> :PMW14.02:169:1
                if CheckDeliveryTolerance then begin
                    if ProdOrderLine."Remaining Quantity" <> ItemJnlLine."Output Quantity" then begin
                        ItemJnlLine.ccspmCheckDeliveryTolerance(ItemJnlLine, ProdOrderLine, ItemJnlLine.FieldNo("Output Quantity"));
                    end;
                    CheckDeliveryTolerance := false;
                end;
                // << :PMW14.02:169:1

                ItemJnlLine.Validate("Setup Time", SetupTime);
                ItemJnlLine.Modify;

            until ItemJnlLine.Next = 0;
        end;
        // << :PMW14.00:3218:1
    end;

    local procedure SetGlobalItemJnlLineFilter(var ItemJnlLine: Record "Item Journal Line"; ProdOrderNo: Code[20]; ProdOrderLineNo: Integer; TemplateName: Code[10]; BatchName: Code[10])
    begin
        // >> :PMW14.00:3218:1
        ItemJnlLine.Reset;
        ItemJnlLine.SetRange("Journal Template Name", TemplateName);
        ItemJnlLine.SetRange("Journal Batch Name", BatchName);
        // >> #PMW17.00:T101
        // ItemJnlLine.SETRANGE("Prod. Order No.", ProdOrderNo);
        // IF ProdOrderLineNo <> 0 THEN BEGIN
        //   ItemJnlLine.SETRANGE("Prod. Order Line No.", ProdOrderLineNo);
        // END;
        ItemJnlLine.SetRange("Order Type", ItemJnlLine."Order Type"::Production);
        ItemJnlLine.SetRange("Order No.", ProdOrderNo);
        if ProdOrderLineNo <> 0 then begin
            ItemJnlLine.SetRange("Order Line No.", ProdOrderLineNo);
        end;
        // << #PMW17.00:T101
        // << :PMW14.00:3218:1
    end;

    local procedure RoutingLinkValid(ProdOrderComp: Record "Prod. Order Component"; ProdOrderLine: Record "Prod. Order Line"): Boolean
    var
        ProdOrderRtngLine: Record "Prod. Order Routing Line";
    begin
        // >> :PMW14.00:3218:1
        if ProdOrderComp."Routing Link Code" = '' then begin
            exit(false);
        end;

        with ProdOrderRtngLine do begin
            Reset;
            SetRange(Status, ProdOrderLine.Status);
            SetRange("Prod. Order No.", ProdOrderLine."Prod. Order No.");
            SetRange("Routing Reference No.", ProdOrderLine."Routing Reference No.");
            SetRange("Routing No.", ProdOrderLine."Routing No.");
            SetRange("Routing Link Code", ProdOrderComp."Routing Link Code");
            exit(FindFirst);
        end;
        // << :PMW14.00:3218:1
    end;

    //
    procedure GetNextRtngTAN(var ProdOrderRoutingLine: Record "Prod. Order Routing Line")
    var
        ProcessManufacturingSetup: Record "ccs pm Process Manuf. Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        // >> :PMW14.02:28:1
        if ProdOrderRoutingLine.Status in [ProdOrderRoutingLine.Status::"Firm Planned", ProdOrderRoutingLine.Status::Released] then begin
            if ProdOrderRoutingLine."ccs pm Routing TAN" = '' then begin
                ProcessManufacturingSetup.Get;
                if ProcessManufacturingSetup."Routing TAN Nos." <> '' then begin
                    ProdOrderRoutingLine."ccs pm Routing TAN" := NoSeriesMgt.GetNextNo(ProcessManufacturingSetup."Routing TAN Nos.", 0D, true);
                end;
            end;
        end;
        // << :PMW14.02:28:1
    end;


    procedure InsertTANOutputJnlLine(var ItemJnlLine: Record "Item Journal Line"; RoutingTAN: Code[20]; currTester: Code[20]; outputQty: Decimal; scrapQty: Decimal) ret: Boolean
    var
        MfgSetup: Record "Manufacturing Setup";
        ProdOrderLine: Record "Prod. Order Line";
        ProdOrderRoutingLine: Record "Prod. Order Routing Line";
        ItemJnlLine2: Record "Item Journal Line";
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        CostCalcMgt: Codeunit "Cost Calculation Management";
        NextLineNo: Integer;
        QtyToPost: Decimal;
        Text001: Label 'The routing TAN %1 was already registered.';
        ReservationEntry: Record "Reservation Entry";
        TempReservationEntry: Record "Reservation Entry" temporary;
        TempItemTracking: Page "Temp Item Tracking";
        ReservationEntry2: Record "Reservation Entry";
        TestOrder: Record "ccs qa Test Order";
        SerialNo: Code[20];
        QMBasicFunctions: Codeunit "ccs qa Basic Functions";
        TestOrderProp: Record "ccs qa Test Order Property";
        cTest: Code[20];
        TestOrder2: Record "ccs qa Test Order";
        pagtestOrderPropGIM: Page TestOrderPropGIM;
        strMessage: Text[250];
    begin
        // >> :PMW14.02:28:1
        ret := false;
        if RoutingTAN <> '' then begin

            //GIM0009 20.05.2022 +++++
            //Wenn eine Seriennummer in dem Barcode RoutingTAN enthalten ist, wird diese in SerialNO extrahiert.
            SplitRoutingTAN(RoutingTAN, SerialNo);
            //----

            // Check if TAN already exist in Item Journal

            ItemJnlLine2.Reset;
            ItemJnlLine2.SetRange("Journal Template Name", ItemJnlLine."Journal Template Name");
            ItemJnlLine2.SetRange("Journal Batch Name", ItemJnlLine."Journal Batch Name");
            ItemJnlLine2.SetRange("ccs pm Routing TAN", RoutingTAN);
            if ItemJnlLine2.FindFirst then begin

                Message(Text001, RoutingTAN);

                ItemJnlLine := ItemJnlLine2;

            end else begin

                // Get next Line No

                ItemJnlLine2.LockTable;
                ItemJnlLine2.Reset;
                ItemJnlLine2.SetRange("Journal Template Name", ItemJnlLine."Journal Template Name");
                ItemJnlLine2.SetRange("Journal Batch Name", ItemJnlLine."Journal Batch Name");
                if ItemJnlLine2.FindLast then begin
                    NextLineNo := ItemJnlLine2."Line No." + 10000
                end else begin
                    NextLineNo := 10000;
                end;

                // Insert Journal Line

                ItemJnlLine2.Init;
                ItemJnlLine2."Journal Template Name" := ItemJnlLine."Journal Template Name";
                ItemJnlLine2."Journal Batch Name" := ItemJnlLine."Journal Batch Name";
                ItemJnlLine2."Line No." := NextLineNo;
                ItemJnlLine2."ccs pm Routing TAN" := RoutingTAN;
                ItemJnlLine2.Insert;

                ProdOrderRoutingLine.Reset;
                ProdOrderRoutingLine.SetCurrentKey("ccs pm Routing TAN");
                ProdOrderRoutingLine.SetRange("ccs pm Routing TAN", RoutingTAN);
                if ProdOrderRoutingLine.FindFirst then begin

                    if ProdOrderRoutingLine.Status = ProdOrderRoutingLine.Status::Released then begin

                        ProdOrderLine.Get(ProdOrderRoutingLine.Status, ProdOrderRoutingLine."Prod. Order No.",
                                           ProdOrderRoutingLine."Routing Reference No.");

                        // Get Quantity to post

                        MfgSetup.Get;

                        if (ProdOrderRoutingLine."Flushing Method" <> ProdOrderRoutingLine."Flushing Method"::Manual) or
                           (MfgSetup."Preset Output Quantity" = MfgSetup."Preset Output Quantity"::"Zero on All Operations") or
                           ((MfgSetup."Preset Output Quantity" = MfgSetup."Preset Output Quantity"::"Zero on Last Operation") and
                           // >> #PMW18.00.00.03:T500
                           // (ProdOrderRoutingLine."Next Operation No." = '')) OR
                           IsLastOperation(ProdOrderRoutingLine)) or
                           // << #PMW18.00.00.03:T500
                           ((ProdOrderRoutingLine."Prod. Order No." = '') and
                           (MfgSetup."Preset Output Quantity" <> MfgSetup."Preset Output Quantity"::"Expected Quantity"))
                        then begin
                            QtyToPost := 0
                        end else begin
                            if ProdOrderRoutingLine."Prod. Order No." <> '' then begin
                                QtyToPost :=
                                  CostCalcMgt.CalcQtyAdjdForRoutingScrap(
                                    ProdOrderLine."Quantity (Base)",
                                    ProdOrderRoutingLine."Scrap Factor % (Accumulated)",
                                    ProdOrderRoutingLine."Fixed Scrap Qty. (Accum.)") -
                                    CostCalcMgt.CalcActOutputQtyBase(ProdOrderLine, ProdOrderRoutingLine);
                                QtyToPost := QtyToPost / ProdOrderLine."Qty. per Unit of Measure";
                            end else begin // No Routing Line
                                QtyToPost := ProdOrderLine."Remaining Quantity";
                            end;
                        end;

                        //        IF outputQtyPost<>0 THEN BEGIN
                        //          QtyToPost:=outputQty;
                        //        END;

                        if QtyToPost < 0 then begin
                            QtyToPost := 0;
                        end;

                        // Update Journal Line

                        ItemJnlLine2.Validate("Posting Date", WorkDate);
                        ItemJnlLine2.Validate("Entry Type", ItemJnlLine2."Entry Type"::Output);
                        // >> #PMW17.00:T101
                        // ItemJnlLine2.VALIDATE("Prod. Order No.", ProdOrderLine."Prod. Order No.");
                        // ItemJnlLine2.VALIDATE("Prod. Order Line No.", ProdOrderLine."Line No.");
                        ItemJnlLine2.Validate("Order Type", ItemJnlLine2."Order Type"::Production);
                        ItemJnlLine2.Validate("Order No.", ProdOrderLine."Prod. Order No.");
                        ItemJnlLine2.Validate("Order Line No.", ProdOrderLine."Line No.");
                        // << #PMW17.00:T101
                        ItemJnlLine2.Validate("Item No.", ProdOrderLine."Item No.");
                        ItemJnlLine2.Validate("Variant Code", ProdOrderLine."Variant Code");
                        ItemJnlLine2.Validate("Location Code", ProdOrderLine."Location Code");

                        if ProdOrderLine."Bin Code" <> '' then begin
                            ItemJnlLine2.Validate("Bin Code", ProdOrderLine."Bin Code");
                        end;

                        ItemJnlLine2.Validate("Routing No.", ProdOrderLine."Routing No.");
                        ItemJnlLine2.Validate("Routing Reference No.", ProdOrderLine."Routing Reference No.");

                        if ProdOrderRoutingLine."Prod. Order No." <> '' then begin
                            ItemJnlLine2.Validate("Operation No.", ProdOrderRoutingLine."Operation No.");
                        end;

                        ItemJnlLine2.Validate("Unit of Measure Code", ProdOrderLine."Unit of Measure Code");
                        ItemJnlLine2.Validate("Setup Time", 0);
                        ItemJnlLine2.Validate("Run Time", 0);
                        //ItemJnlLine2.VALIDATE("Output Quantity", QtyToPost);
                        ItemJnlLine2.Validate("Output Quantity", 1);

                        if ProdOrderRoutingLine."Routing Status" = ProdOrderRoutingLine."Routing Status"::Finished then begin
                            ItemJnlLine2.Finished := true;
                        end;

                        ItemJnlLine2."Flushing Method" := ProdOrderRoutingLine."Flushing Method";
                        ItemJnlLine2."Source Code" := ItemJnlLine."Source Code";
                        ItemJnlLine2."Reason Code" := ItemJnlLine."Reason Code";
                        ItemJnlLine2."Posting No. Series" := ItemJnlLine."Posting No. Series";
                        //ItemJnlLine2.MODIFY;

                        // >> #PMW18.00.00.03:T500
                        // IF ProdOrderRoutingLine."Next Operation No." = '' THEN BEGIN // Last or no Routing Line
                        //        IF IsLastOperation(ProdOrderRoutingLine) THEN BEGIN
                        // << #PMW18.00.00.03:T500
                        //ItemTrackingMgt.CopyItemTracking(ProdOrderLine.RowID1, ItemJnlLine2.RowID1, FALSE);
                        // >> CC01

                        ReservationEntry.SetRange("Source Type", 5406);
                        ReservationEntry.SetRange("Source Subtype", ProdOrderLine.Status);
                        ReservationEntry.SetRange("Source ID", ProdOrderLine."Prod. Order No.");
                        ReservationEntry.SetRange("Source Prod. Order Line", ProdOrderLine."Line No.");

                        //ReservationEntry.SETRANGE("Entry No.", 16143113);
                        //IF ReservationEntry.FINDSET THEN BEGIN

                        if SerialNo <> '' then begin
                            CreateReservEntries(ItemJnlLine2, SerialNo);
                            Commit;
                            //Prüfauftrag
                        end;
                        //-----
                        //END;

                        if ProdOrderRoutingLine."ccs qa Test Plan No." <> '' then begin
                            Commit;
                            TestOrder.Reset;
                            if SerialNo <> '' then
                                TestOrder.SetRange("Serial No.", SerialNo);
                            TestOrder.SetRange("Source No.", ItemJnlLine2."Document No.");
                            TestOrder.SetFilter(Status, '%1|%2', TestOrder.Status::Created, TestOrder.Status::"Value Recording");
                            TestOrder.SetRange("Test Destination Type", TestOrder."Test Destination Type"::Item);
                            TestOrder.SetRange("Test Destination No.", ProdOrderLine."Item No.");
                            if TestOrder.FindFirst then begin
                                if (TestOrder.Status = TestOrder.Status::Created) then begin
                                    QMBasicFunctions.ReleaseTestOrder(TestOrder);
                                    Commit;
                                end;
                                Commit;
                                TestOrderProp.SetRange("Test Order No.", TestOrder."No.");
                                //Prüfer im Prüfauftrag festlegen
                                HandleTester(TestOrder, currTester);
                                pagtestOrderPropGIM.SetColumnsVisibleForTester(TestOrder);
                                //PAGE.RUNMODAL(PAGE::"QM Value Recording",TestOrderProp);//  = ACTION::Ok THEN BEGIN
                                pagtestOrderPropGIM.SetTableView(TestOrderProp);
                                pagtestOrderPropGIM.RunModal;
                                //              PAGE.RUNMODAL(50042,TestOrderProp);//  = ACTION::Ok THEN BEGIN

                                TestOrder2.Get(TestOrder."No.");
                                IF (Testorder2."Tester 1 Status" = Testorder2."Tester 1 Status"::finished) AND (Testorder2."Tester 2 Status" = testorder2."Tester 2 Status"::finished) THEN BEGIN
                                    TestOrder2.CheckTestingFinished(TestorderProp); //TODO: HIer brauchen wir einen Einsprung, damit der Test
                                END;
                                if TestOrder2.Status <> TestOrder2.Status::"Testing Finished" then begin

                                    //GIM0009 ++++
                                    strMessage := 'Vorgang abgebrochen';
                                    if TestOrder2.Testerstatus = TestOrder2.Testerstatus::"Tester 1 active" then
                                        case TestOrder2."Tester 1 Status" of
                                            TestOrder2."Tester 1 Status"::"in edit":
                                                strMessage := 'Prüfer 1: Erfassung Prüfauftrag in Arbeit, noch nicht abgeschlossen';
                                            TestOrder2."Tester 1 Status"::finished:
                                                strMessage := 'Prüfer 1: Erfassung Prüfauftrag abgeschlossen';
                                        end;

                                    if TestOrder2.Testerstatus = TestOrder2.Testerstatus::"Tester 2 active" then
                                        case TestOrder2."Tester 2 Status" of
                                            TestOrder2."Tester 2 Status"::"in edit":
                                                strMessage := 'Prüfer 2: Erfassung Prüfauftrag in Arbeit, noch nicht abgeschlossen';
                                            TestOrder2."Tester 2 Status"::finished:
                                                strMessage := 'Prüfer 2: Erfassung Prüfauftrag abgeschlossen';
                                        end;
                                    //----

                                    // Wenn IST-Wert-Eingabe nicht vollständig
                                    ItemJnlLine2.Delete;
                                    Commit;
                                    //GIM0009 20.05.2022
                                    SendNotification(strMessage);
                                    exit(false);
                                    //----
                                end else begin
                                    if TestOrder2.Status = TestOrder2.Status::"Testing Finished" then begin
                                        // Evtl. Prüfung auf positiv oder negativ
                                        if TestOrder2."Inspection Result" = TestOrder2."Inspection Result"::"Items are not OK" then begin
                                            ItemJnlLine2.Delete;
                                            Commit;
                                            //ERROR('Ergebnis negativ! Buchung abgebrochen!');
                                            //GIM0009 20.05.2022
                                            SendNotification('Prüfauftrag nicht erfolgreich. Die Buchung wurde nicht durchgeführt');
                                            exit(false);
                                            //----
                                        end else begin
                                            TestOrder2.SetStatusFinished;
                                            TestOrder2.Modify;
                                        end;
                                    end;
                                end;
                                // >> CC02
                                // END ELSE BEGIN
                                //   ItemJnlLine2.DELETE;
                                //   COMMIT;
                                //   ERROR('Achtung! Es wurde kein zugeordneter Prüfauftrag gefunden!');
                                // << CC02
                            end else begin
                                SendNotification('Es wurde kein weiterer Prüfauftrag gefunden. DIe Buchung wurde abgebrochen');
                                ItemJnlLine2.Delete;
                                exit(false);
                            end;
                        end;

                        ItemJnlLine2.Modify;

                        if IsLastOperation(ProdOrderRoutingLine) then begin
                            if outputQty = 0 then begin
                                ItemJnlLine2.Validate("Output Quantity", 1);
                                ProdOrderLine."ccs pm Posting Quantity" := 1;
                            end else begin
                                ItemJnlLine2.Validate("Output Quantity (Base)", outputQty);
                                ItemJnlLine2.Validate("Scrap Quantity (Base)", scrapQty);
                                ProdOrderLine."ccs pm Posting Quantity" := outputQty;

                            end;
                            //ItemJnlLine2.VALIDATE("Serial No.", );
                            ItemJnlLine2.Modify;
                            //ProdOrderLine."Posting Quantity" := 1;
                        end;


                        ItemJnlLine2.SetRange("Journal Template Name", ItemJnlLine2."Journal Template Name");
                        ItemJnlLine2.SetRange("Journal Batch Name", ItemJnlLine2."Journal Batch Name");
                        ItemJnlLine2.SetRange("Line No.", ItemJnlLine2."Line No.");

                        UpdateOutputJnlLine(ProdOrderRoutingLine, ProdOrderLine, ItemJnlLine2);

                        // P001
                        // Bewegungsmenge in Verknüpften Belegen setzen
                        if SerialNo <> '' then begin
                            ReservationEntry.Reset;
                            ReservationEntry.SetRange("Serial No.", SerialNo);
                            ReservationEntry.SetRange("Item No.", ItemJnlLine2."Item No.");
                            if ReservationEntry.FindSet(true, false) then begin
                                repeat
                                    ReservationEntry."Qty. to Handle (Base)" := ReservationEntry."Quantity (Base)";
                                    ReservationEntry.Modify;
                                until ReservationEntry.Next = 0;
                            end;
                        end;

                    end;

                end;

                ItemJnlLine := ItemJnlLine2;

                exit(true);

            end;
        end;
        // << :PMW14.02:28:1
    end;

    local procedure IsLastOperation(ProdOrderRtngLine: Record "Prod. Order Routing Line"): Boolean
    var
        ProdOrderRtngLine2: Record "Prod. Order Routing Line";
        ItemJnlPostLine: Codeunit "Item Jnl.-Post Line";
        DummySNTracking: Codeunit "Dummy SN Tracking";
    begin
        // >> #PMW18.00.00.03:T500
        ProdOrderRtngLine2 := ProdOrderRtngLine;
        if Dummysntracking.CheckForUniqueDummyUsage(ProdOrderRtngLine2) then begin
            exit(ProdOrderRtngLine2."Next Operation No." = '');
        end else
            exit(ProdOrderRtngLine."Next Operation No." = '');
        // << #PMW18.00.00.03:T500
    end;

    local procedure UpdateOutputQuantity(ManufacturingSetup: Record "Manufacturing Setup"; ProdOrderRtngLine: Record "Prod. Order Routing Line"; ConsiderPresetOutputQty: Boolean): Boolean
    begin
        // >> #PMW18.00.00.07:T504
        if ConsiderPresetOutputQty then begin
            if (ProdOrderRtngLine."Flushing Method" <> ProdOrderRtngLine."Flushing Method"::Manual) or
               (ManufacturingSetup."Preset Output Quantity" = ManufacturingSetup."Preset Output Quantity"::"Zero on All Operations") or
               ((ManufacturingSetup."Preset Output Quantity" = ManufacturingSetup."Preset Output Quantity"::"Zero on Last Operation") and IsLastOperation(ProdOrderRtngLine)) or
               ((ProdOrderRtngLine."Prod. Order No." = '') and (ManufacturingSetup."Preset Output Quantity" <> ManufacturingSetup."Preset Output Quantity"::"Expected Quantity"))
            then begin
                exit(false);
            end;
        end;
        exit(true);
        // << #PMW18.00.00.07:T504
    end;

    local procedure CreateReservEntries(ItemJournalLine: Record "Item Journal Line"; SerialNo: Code[20])
    var
        LotNoInformation: Record "Lot No. Information";
        SerialNoInformation: Record "Serial No. Information";
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        CurrentEntryStatus: Enum "Reservation Status"; // Reservation,Tracking,Surplus,Prospect;
        NewLotNo: Code[20];
        NewLotNoTradingUnit: Code[20];
        NewTradingunitNo: Code[20];
        LotReservEntry: Record "Reservation Entry";
        TrackingSpec: Record "Tracking Specification";
    begin

        LotReservEntry.INIT;
        LotReservEntry."Serial No." := SerialNo;
        LotReservEntry."lot no." := '';
        CurrentEntryStatus := CurrentEntryStatus::Prospect;
        CreateReservEntry.CreateReservEntryFor(
          DATABASE::"Item Journal Line",
          ItemJournalLine."Entry Type".AsInteger(),
          ItemJournalLine."Journal Template Name",
          ItemJournalLine."Journal Batch Name",
          0,
          ItemJournalLine."Line No.",
          ItemJournalLine."Qty. per Unit of Measure",
          1,
          1,
          LotReservEntry);
        //CreateReservEntry.SetNewSerialLotNo(WarehouseEntry."Serial No.",NewLotNo);
        TrackingSpec.INIT;
        TrackingSpec."Serial No." := SerialNo;
        TrackingSpec."Lot No." := '';
        // CreateReservEntry.SetNewSerialLotNo(SerialNo, '');
        CreateReservEntry.SetNewTrackingFromNewTrackingSpecification(TrackingSpec);
        //  IF NewTradingunitNo <> '' THEN
        //    CreateReservEntry.SetNewTradingUnit(NewLotNoTradingUnit,NewTradingunitNo);

        CreateReservEntry.CreateEntry(
          ItemJournalLine."Item No.",
          ItemJournalLine."Variant Code",
          ItemJournalLine."Location Code",
          ItemJournalLine.Description,
          ItemJournalLine."Posting Date", 0D, 0, CurrentEntryStatus);
    end;

    local procedure SplitRoutingTAN(var RoutingTAN: Code[20]; var SerialNo: Code[20])
    var
        divider: Text[1];
        dividerPos: Integer;
        Barcode: Code[20];
    begin
        Barcode := RoutingTAN;
        divider := '$';
        dividerPos := StrPos(Barcode, divider);
        if dividerPos <> 0 then begin
            RoutingTAN := CopyStr(Barcode, 1, dividerPos - 1);
            SerialNo := CopyStr(Barcode, dividerPos + 1);
        end;
    end;

    local procedure SendNotification(strMessage: Text)
    var
        myNotification: Notification;
    begin
        //GIM0009
        myNotification.Message(strMessage);
        myNotification.Send;
    end;

    local procedure HandleTester(var Testorder: Record "ccs qa Test Order"; currTester: Code[20])
    begin
        //GIM0009
        if (Testorder."Tester 1" = '') and (Testorder."Tester 2" = '') then begin
            //Ersten Prüfer festlegen
            Testorder.Validate("Tester 1", currTester);
            Testorder.Testerstatus := Testorder.Testerstatus::"Tester 1 active";
            Testorder.Modify;
            Commit;
            exit;
        end;

        if (Testorder."Tester 1" <> '') and (Testorder."Tester 2" = '') and (Testorder."Tester 1" <> currTester) then begin
            //Zweiten Prüfer festlegen
            Testorder.Validate("Tester 2", currTester);
            Testorder.Testerstatus := Testorder.Testerstatus::"Tester 2 active";
            Testorder.Modify;
            Commit;
            exit;
        end;

        if Testorder."Tester 1" = currTester then begin
            Testorder.Testerstatus := Testorder.Testerstatus::"Tester 1 active";
            Testorder.Modify;
            Commit;
        end;

        if Testorder."Tester 2" = currTester then begin
            Testorder.Testerstatus := Testorder.Testerstatus::"Tester 2 active";
            Testorder.Modify;
            Commit;
        end;
    end;

    //
    procedure IsLastOperationWithTAN(RoutingTAN: Code[20]) ret: Boolean
    var
        ProdOrderRoutingLine: Record "Prod. Order Routing Line";
    begin
        ProdOrderRoutingLine.Reset;
        ProdOrderRoutingLine.SetCurrentKey("ccs pm Routing TAN");
        ProdOrderRoutingLine.SetRange("ccs pm Routing TAN", RoutingTAN);
        if ProdOrderRoutingLine.FindFirst then begin
            exit(IsLastOperation(ProdOrderRoutingLine))
        end;

        exit(false);
    end;
}

