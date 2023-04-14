codeunit 50020 "CCO Prod. Order Status Mgt. H."
{

    trigger OnRun()
    begin
    end;

    var
        noInventoryErr: Label 'Insufficient inventory! Item No.: %1 Location: %2';
        noInventory2Err: Label 'Insufficient inventory! Item No.: %1, Location: %2, Lot No.: %3, Serial No.: %4';

    [Scope('Internal')]
    procedure CheckComponentInventory(var ProductionOrder: Record "Production Order"; NewStatus: Option Quote,Planned,"Firm Planned",Released,Finished)
    var
        Item: Record Item;
        ProdOrderComp: Record "Prod. Order Component";
        ReservationEntry: Record "Reservation Entry";
        RemainingQty: Decimal;
        QtyOnReservEntry: Decimal;
        ErrorMsg: Text;
    begin
        if NewStatus = NewStatus::Released then begin
            ProdOrderComp.SetRange(Status, ProductionOrder.Status);
            ProdOrderComp.SetRange("Prod. Order No.", ProductionOrder."No.");
            if ProdOrderComp.FindSet() then
                repeat
                    if Item.Get(ProdOrderComp."Item No.") then begin
                        if Item."Item Tracking Code" <> '' then begin
                            RemainingQty := ProdOrderComp."Remaining Quantity";
                            ReservationEntry.SetSourceFilter(DATABASE::"Prod. Order Component", ProdOrderComp.Status, ProdOrderComp."Prod. Order No.", ProdOrderComp."Line No.", false);
                            ReservationEntry.SetSourceFilter2('', ProdOrderComp."Prod. Order Line No.");
                            if RemainingQty > 0 then begin
                                if ReservationEntry.FindSet() then
                                    repeat
                                        Item.Reset();
                                        Item.SetRange("Location Filter", ReservationEntry."Location Code");
                                        if ReservationEntry."Lot No." <> '' then
                                            Item.SetRange("Lot No. Filter", ReservationEntry."Lot No.");
                                        if ReservationEntry."Serial No." <> '' then
                                            Item.SetRange("Serial No. Filter", ReservationEntry."Serial No.");
                                        Item.CalcFields(Inventory);
                                        if (-ReservationEntry.Quantity > Item.Inventory) then begin
                                            if ErrorMsg <> '' then
                                                ErrorMsg += '\';
                                            ErrorMsg += StrSubstNo(noInventory2Err, ReservationEntry."Item No.", ReservationEntry."Location Code", ReservationEntry."Lot No.", ReservationEntry."Serial No.");
                                        end;
                                        RemainingQty += ReservationEntry.Quantity;
                                    until ReservationEntry.Next() = 0;
                                if RemainingQty > 0 then begin
                                    QtyOnReservEntry := ProdOrderComp."Remaining Quantity" - RemainingQty;
                                    Item.Reset();
                                    Item.SetRange("Location Filter", ProdOrderComp."Location Code");
                                    Item.CalcFields(Inventory);
                                    if RemainingQty > Item.Inventory - QtyOnReservEntry then begin
                                        if ErrorMsg <> '' then
                                            ErrorMsg += '\';
                                        ErrorMsg += StrSubstNo(noInventoryErr, ProdOrderComp."Item No.", ProdOrderComp."Location Code");
                                    end;
                                end;
                            end;
                        end else begin
                            Item.Reset();
                            if ProdOrderComp."Location Code" <> '' then
                                Item.SetRange("Location Filter", ProdOrderComp."Location Code");
                            Item.CalcFields(Inventory);
                            if ProdOrderComp."Remaining Quantity" > Item.Inventory then begin
                                if ErrorMsg <> '' then
                                    ErrorMsg += '\';
                                ErrorMsg += StrSubstNo(noInventoryErr, ProdOrderComp."Item No.", ProdOrderComp."Location Code");
                            end;
                        end;
                    end;
                until ProdOrderComp.Next() = 0;
            if ErrorMsg <> '' then
                Error(ErrorMsg);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 415, 'OnBeforeReleasePurchaseDoc', '', true, true)]
    local procedure CreateReservationForProdLine(var ProductionOrder: Record "Production Order")
    var
        ItemTrackingManagement: Codeunit "Item Tracking Management";
        Inbound: Boolean;
        SNRequired: Boolean;
        LotRequired: Boolean;
        SNInfoRequired: Boolean;
        LotInfoRequired: Boolean;
        EntryType: Option Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer,Consumption,Output," ","Assembly Consumption","Assembly Output";
        Item: Record Item;
        ItemTrackingCode: Record "Item Tracking Code";
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        CurrentEntryStatus: Option Reservation,Tracking,Surplus,Prospect;
        ReservationEntry: Record "Reservation Entry";
        ReservationEntry2: Record "Reservation Entry";
        ProdOrderLine: Record "Prod. Order Line";
        NextSN: Code[20];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        i: Integer;
        SerialNoInformation: Record "Serial No. Information";
        DummySNTracking: Codeunit "Dummy SN Tracking";
    begin


        ProdOrderLine.SetRange(Status, ProductionOrder.Status);
        ProdOrderLine.SetRange("Prod. Order No.", ProductionOrder."No.");
        ProdOrderLine.SetFilter(Quantity, '>0');
        if ProdOrderLine.FindSet(false, false) then begin
            repeat
                i := 0;
                DummySNTracking.ModifyExistingReservation(ProdOrderLine."Item No.", ProdOrderLine.Quantity, ProdOrderLine.RowID1);

                Clear(ReservationEntry);
                Clear(ReservationEntry2);
                ReservationEntry.SetRange("Source ID", ProductionOrder."No.");
                ReservationEntry.SetRange("Source Type", DATABASE::"Prod. Order Line");
                ReservationEntry.SetRange("Source Prod. Order Line", ProdOrderLine."Line No.");
                ReservationEntry.SetRange("Reservation Status", ReservationEntry."Reservation Status"::Prospect);
                ReservationEntry.SetRange("Location Code", ProdOrderLine."Location Code");
                if ReservationEntry.FindFirst then begin
                    repeat
                        ReservationEntry2.SetRange("Serial No.", ReservationEntry."Serial No.");
                        ReservationEntry2.SetRange("Item No.", ReservationEntry."Item No.");
                        ReservationEntry2.ModifyAll("Qty. to Handle (Base)", 0);
                    until ReservationEntry.Next = 0;
                end;


            until ProdOrderLine.Next = 0;
        end;
    end;

    local procedure "--- Events ---"()
    begin
    end;

    [Scope('Internal')]
    procedure OnBeforeChangeStatusOnProdOrder(var ProductionOrder: Record "Production Order"; NewStatus: Option Quote,Planned,"Firm Planned",Released,Finished)
    begin
        //GIM FS 13.04.2022 Für Workshop auskommentiert
        //CheckComponentInventory(ProductionOrder, NewStatus);

        // IF NewStatus = NewStatus::Released THEN
        //  CreateReservationForProdLine(ProductionOrder);
    end;

    [Scope('Internal')]
    procedure OnAfterChangeStatusOnProdOrder(var ProductionOrder: Record "Production Order"; NewStatus: Option Quote,Planned,"Firm Planned",Released,Finished)
    var
        ProdOrderLine: Record "Prod. Order Line";
        Item: Record Item;
        ItemTrackingCode: Record "Item Tracking Code";
        ProdOrderRoutingLine: Record "Prod. Order Routing Line";
        RecRef: RecordRef;
        CreateTestOrder: Codeunit "Create Test Order";
        i: Integer;
        FunctionManagement: Codeunit "Function Management";
        ProductionOrder2: Record "Production Order";
        ProductionSlip: Report "Production Slip";
        ProdOrder2: Record "Production Order";
        ProdReport: Report "Montage Entnahmestückliste";
        TempSalesLine: Record "Sales Line" temporary;
        noReporting: Boolean;
    begin

        if NewStatus = NewStatus::Released then begin

            // >> P0035

            CreateReservationForProdLine(ProductionOrder);

            // >> CC01
            FunctionManagement.CreateSerialInfoFromPO(ProductionOrder);
            // << CC01

            // >> CC02
            //IF (ProductionOrder."Production Group Code" = 'ZELLEN') OR (ProductionOrder."Production Group Code" = 'VERPACK') THEN BEGIN
            if (ProductionOrder."Production Group Code" = 'ZELLEN') or (ProductionOrder."Production Group Code" = 'VERPACK') or (ProductionOrder."Production Group Code" = 'HS') or (ProductionOrder."Production Group Code" = 'UTS') then begin

                //GIM0013 ++++ Reports deaktivieren für Tests noReporting:=true;
                noReporting := false;
                if not noReporting then begin
                    //GIM0013 ----
                    ProductionOrder2 := ProductionOrder;
                    ProductionOrder2.SetRange(Status, ProductionOrder.Status);
                    ProductionOrder2.SetRange("No.", ProductionOrder."No.");
                    ProductionSlip.SetTableView(ProductionOrder2);
                    ProductionSlip.UseRequestPage(false);
                    ProductionSlip.RunModal;

                    FunctionManagement.PrintTypShieldFromPO(ProductionOrder);
                    //GIM0013 ++++
                end;
                //GIM0013 -----
            end else begin

                case ProductionOrder."Print Action Released" of
                    ProductionOrder."Print Action Released"::"mit Details", ProductionOrder."Print Action Released"::"ohne Details":
                        begin
                            if not (ProdOrder2."Production Group Code" = 'PULVERN') then begin
                                ProdOrder2 := ProductionOrder;
                                ProdOrder2.SetRange(Status, ProductionOrder.Status);
                                ProdOrder2.SetRange("No.", ProductionOrder."No.");
                                ProdReport.SetTableView(ProdOrder2);
                                ProdReport.SetDetails(ProductionOrder."Print Action Released" = ProductionOrder."Print Action Released"::"mit Details");
                                ProdReport.UseRequestPage(false);
                                ProdReport.RunModal;
                            end;
                        end;
                end;



            end;
            // << CC02
            // << P0035

            ProdOrderLine.SetRange(Status, ProductionOrder.Status);
            ProdOrderLine.SetRange("Prod. Order No.", ProductionOrder."No.");
            if ProdOrderLine.FindSet(false, false) then begin

                //dori
                FunctionManagement.GetSalesLineFromProdOrderLine(ProdOrderLine, TempSalesLine);
                if (TempSalesLine."Document No." <> '') then begin
                    ProductionOrder."Evtl. Auftragsnr." := TempSalesLine."Document No.";
                    ProductionOrder."Evtl. Auftragszeilennr." := TempSalesLine."Line No.";
                    ProductionOrder.Modify;
                end;

                repeat
                    ProdOrderRoutingLine.SetRange(Status, ProductionOrder.Status);
                    ProdOrderRoutingLine.SetRange("Prod. Order No.", ProductionOrder."No.");
                    ProdOrderRoutingLine.SetRange("Routing Reference No.", ProdOrderLine."Line No.");
                    if ProdOrderRoutingLine.FindFirst then begin
                        Clear(CreateTestOrder);
                        Clear(RecRef);
                        repeat
                            i := 0;
                            if ProdOrderRoutingLine."Test Plan No." <> '' then begin
                                RecRef.GetTable(ProdOrderRoutingLine);

                                Item.Get(ProdOrderLine."Item No.");
                                if (ItemTrackingCode.Get(Item."Item Tracking Code")) and (ItemTrackingCode."SN Specific Tracking") then begin
                                    CreateTestOrder.SetSourceLine(RecRef);
                                    CreateTestOrder.SetCalculation(true);
                                    CreateTestOrder.SetGuiAllowed(false);
                                    CreateTestOrder.Run;
                                end else begin
                                    i := 0;
                                    repeat
                                        i += 1;
                                        CreateTestOrder.SetSourceLine(RecRef);
                                        CreateTestOrder.SetCalculation(true);
                                        CreateTestOrder.SetGuiAllowed(false);
                                        CreateTestOrder.Run;
                                    until (i = 1);
                                end;
                            end;
                        until ProdOrderRoutingLine.Next = 0;
                    end;
                until ProdOrderLine.Next = 0;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, 337, 'OnAfterModifyEvent', '', false, false)]
    local procedure T337_OnAfterModifyEvent(var Rec: Record "Reservation Entry"; var xRec: Record "Reservation Entry"; RunTrigger: Boolean)
    var
        ReservationEntry: Record "Reservation Entry";
        HanningSetup: Record "Hanning Setup";
    begin

        HanningSetup.Get;
        if HanningSetup."Düperthal Processes" = false then
            exit;

        if (Rec."Qty. to Handle (Base)" <> 0) and (Rec."Serial No." <> '') and (Rec."Reservation Status" = Rec."Reservation Status"::Prospect) then begin
            ReservationEntry.SetRange("Item No.", Rec."Item No.");
            ReservationEntry.SetRange("Serial No.", Rec."Serial No.");
            ReservationEntry.SetRange("Reservation Status", ReservationEntry."Reservation Status"::Reservation);
            if ReservationEntry.FindFirst then begin
                repeat
                    //ERROR('test2');
                    ReservationEntry.Validate("Qty. to Handle (Base)", ReservationEntry."Quantity (Base)");
                    ReservationEntry.Modify;
                until ReservationEntry.Next = 0;
            end;
        end;
    end;
}

