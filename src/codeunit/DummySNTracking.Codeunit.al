codeunit 50003 "Dummy SN Tracking"
{
    // P0033    15.06.2019  COSMO.RGO #Object Created
    // P0025    31.07.2019  CC.SGE - Changed function "CheckDummySNSetup"
    // P0033-01 06.11.2019  CC.SGE - Changed function "C5980_OnBeforePostWithLines" (Fehlermeldung beim Buchen: Tabelle "Servicezeile" ist leer.)
    // P0033-02 02.12.2019  COSMO.RGO #No Dummy Tracking for Invoice Shipment or Receipt from Invoice
    // P0076    19.12.2019  Cosmo.LKA #No Dummy Tracking if transfer from consignment back to stock.
    // ACSD_04  28.05.2021  COSMO.RGO Print From PO befor Post
    // P0135_01 20.08.2021  Cosmo.LKA #Create Tracking for No-Dummy Items
    // P0146_01 19.10.2021  Cosmo.LKA #FunctionModify - HandleOutputBeforeStatusChange
    // P0165    21.01.2022  Cosmo.LKA #Functionsadd -  InheritSerialNoFromComponent,SetInheritSerialNos,CreateTempTrackingSpecProdOrderLine,
    //                                                     CreateInboundSNNoDummyPOLine


    trigger OnRun()
    var
        AssemblyHeader: Record "Assembly Header";
    begin
        AssemblyHeader.Get(AssemblyHeader."Document Type"::Order, 'M03919');
        CreateDummySNTracking(AssemblyHeader);
        //TESTAssemblyLine(AssemblyHeader);
    end;

    var
        CCItemTrackingMgt: Codeunit "CC Item Tracking Mgt.";
        Text50000: Label 'You must not assign a serial no. manually if the serial no. is inherited from a component.';

    [EventSubscriber(ObjectType::Codeunit, 90, 'OnBeforePostLines', '', false, false)]
    local procedure C90_OnBeforePostLines(var PurchLine: Record "Purchase Line"; PurchHeader: Record "Purchase Header"; PreviewMode: Boolean; CommitIsSupressed: Boolean)
    begin
        if not PurchHeader.Receive then
            exit;

        PurchLine.FindSet;
        repeat
            PurchLineDummySNTracking(PurchLine);
        until PurchLine.Next = 0;
    end;

    local procedure PurchLineDummySNTracking(var PurchaseLine2: Record "Purchase Line")
    var
        SignFactor: Decimal;
    begin
        if PurchaseLine2.Type <> PurchaseLine2.Type::Item then
            exit;

        if PurchaseLine2."Qty. to Receive (Base)" = 0 then
            exit;

        // >> P0033-02
        if (PurchaseLine2."Receipt No." <> '') and (PurchaseLine2."Document Type" = PurchaseLine2."Document Type"::Invoice)
          or
           (PurchaseLine2."Return Shipment No." <> '') and (PurchaseLine2."Document Type" = PurchaseLine2."Document Type"::"Credit Memo") then
            exit;
        // << P0033-02

        SignFactor := PurchaseLine2."Qty. to Receive (Base)" * SetSignFactor(39, PurchaseLine2."Document Type".asInteger, false);

        if SignFactor > 0 then begin
            CreateInboundSN(PurchaseLine2, PurchaseLine2."No.", Abs(PurchaseLine2."Qty. to Receive (Base)"));
        end else begin
            AssignOutboundSN(PurchaseLine2, PurchaseLine2."No.", PurchaseLine2."Variant Code", PurchaseLine2."Location Code", PurchaseLine2."Bin Code", Abs(PurchaseLine2."Qty. to Receive (Base)"));
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnBeforePostLines', '', false, false)]
    local procedure C80_OnBeforePostLines(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean)
    begin
        if not SalesHeader.Ship and not SalesHeader.Receive then
            exit;

        SalesLine.FindSet;
        repeat
            SalesLineDummySNTracking(SalesLine);
        until SalesLine.Next = 0;
    end;

    local procedure SalesLineDummySNTracking(var SalesLine2: Record "Sales Line")
    var
        i: Integer;
        SignFactor: Decimal;
        AssemblyHeader: Record "Assembly Header";
        IsATO: Boolean;
        QtyToPostBase: Decimal;
    begin
        if SalesLine2.Type <> SalesLine2.Type::Item then
            exit;

        if SalesLine2."Document Type" = SalesLine2."Document Type"::Order then begin
            QtyToPostBase := SalesLine2."Qty. to Ship (Base)";
        end else begin
            QtyToPostBase := SalesLine2."Return Qty. to Receive (Base)";
        end;

        if QtyToPostBase = 0 then
            exit;

        // >> P0033-02
        if (SalesLine2."Shipment No." <> '') and (SalesLine2."Document Type" = SalesLine2."Document Type"::Invoice)
          or
           (SalesLine2."Return Receipt No." <> '') and (SalesLine2."Document Type" = SalesLine2."Document Type"::"Credit Memo") then
            exit;
        // << P0033-02

        SalesLine2.CalcFields("Reserved Quantity");
        //IsATO := (SalesLine2."Qty. to Assemble to Order" <> 0) AND (SalesLine2."Reserved Quantity" <> 0);
        //IF IsATO THEN

        if (SalesLine2."Reserved Quantity" <> 0) then begin
            // HIER KEINE DUMMYZUWEISUNG: MUSS VORHER GESCHEHEN. NOCH OFFEN BESTELLUNG=>AUFTRAG
            exit;
        end;

        SignFactor := QtyToPostBase * SetSignFactor(37, SalesLine2."Document Type".asinteger(), false);

        if SignFactor > 0 then begin
            CreateInboundSN(SalesLine2, SalesLine2."No.", Abs(QtyToPostBase));
        end else begin
            AssignOutboundSN(SalesLine2, SalesLine2."No.", SalesLine2."Variant Code", SalesLine2."Location Code", SalesLine2."Bin Code", Abs(QtyToPostBase));
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 23, 'OnAfterCheckJnlLine', '', false, false)]
    local procedure C23_OnAfterCheckJnlLine(var ItemJournalLine: Record "Item Journal Line"; CommitIsSuppressed: Boolean)
    begin
        HandleItemJnlLine(ItemJournalLine, CommitIsSuppressed);
    end;

    [EventSubscriber(ObjectType::Codeunit, 900, 'OnBeforeOnRun', '', false, false)]
    local procedure C900_OnBeforeOnRun(var AssemblyHeader: Record "Assembly Header")
    begin
        //CreateDummySNTracking(AssemblyHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, 900, 'OnBeforeInitPost', '', false, false)]
    local procedure C900_OnBeforeInitPost(var AssemblyHeader: Record "Assembly Header")
    begin
        // IF AssemblyHeader.ISTEMPORARY THEN
        //  EXIT;
        //
        // WITH AssemblyHeader DO BEGIN
        //  IF "Quantity to Assemble (Base)" = 0 THEN
        //    EXIT;
        //
        //  DummySNTracking(AssemblyHeader);
        //  CreateInboundSN(AssemblyHeader, "Item No.", ABS("Quantity to Assemble (Base)"));
        // END;
    end;

    [EventSubscriber(ObjectType::Codeunit, 900, 'OnBeforePostItemConsumption', '', false, false)]
    local procedure C900_OnBeforePostItemConsumption(var AssemblyHeader: Record "Assembly Header"; var AssemblyLine: Record "Assembly Line"; var ItemJournalLine: Record "Item Journal Line")
    begin
        // IF AssemblyLine.ISTEMPORARY THEN
        //  EXIT;
        //
        // EXIT;
        //
        // WITH AssemblyLine DO BEGIN

        //  REPEAT
        //    IF AssemblyLine.Type = AssemblyLine.Type::Item THEN BEGIN
        //      IF "Quantity to Consume (Base)" = 0 THEN
        //        EXIT;
        //
        //      AssignOutboundSN(AssemblyLine, "No.", "Variant Code", "Location Code", "Bin Code", ABS("Quantity to Consume (Base)"));
        //    END;
        //  UNTIL AssemblyLine.NEXT = 0;
        // END;
    end;

    [EventSubscriber(ObjectType::Codeunit, 900, 'OnBeforePost', '', false, false)]
    local procedure C900_OnBeforePost(var AssemblyHeader: Record "Assembly Header")
    begin
        CreateDummySNTracking(AssemblyHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, 50004, 'OnBeforInsertItemTrackingLine', '', false, false)]
    local procedure CU50016_OnBeforInserCCtItemTrackingLine(RowID: Text[250]; var TempTrackSpec: Record "Tracking Specification"; NegAdjmt: Boolean; IsDummySNTracking: Boolean; var DeleteExisting: Boolean)
    begin
        Clear(CCItemTrackingMgt);
        if IsDummySNTracking and DeleteExisting and not NegAdjmt then begin
            CCItemTrackingMgt.DeleteExistingTracking(RowID, '', '');
            DeleteExisting := false;  // Something like Global IsHandled in Case of Inserting multiple SN in a Loop
        end;
    end;

    local procedure CreateInboundSN(SourceLine: Variant; ItemNo: Code[20]; ABSQtyBase: Decimal)
    var
        DummySNSeries: Code[20];
        i: Integer;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        NoOfSNToTrack: Integer;
    begin
        Clear(CCItemTrackingMgt);
        if not CheckDummySNSetup(ItemNo, DummySNSeries) then
            exit;

        CCItemTrackingMgt.SetIsDummySNTracking(true);

        NoOfSNToTrack := ABSQtyBase;

        for i := 1 to NoOfSNToTrack do begin
            CCItemTrackingMgt.CreateItemTrackingSimple(SourceLine, 1, 1, NoSeriesManagement.GetNextNo(DummySNSeries, Today, true), '');
        end;
    end;

    local procedure CreateInboundSNNoDummy(SourceLine: Variant; ItemNo: Code[20]; ABSQtyBase: Decimal)
    var
        DummySNSeries: Code[20];
        i: Integer;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        NoOfSNToTrack: Integer;
        Item: Record Item;
    begin
        Clear(CCItemTrackingMgt);

        if CheckDummySNSetup(ItemNo, DummySNSeries) then
            exit;
        if ABSQtyBase = 0 then
            exit;

        Item.Get(ItemNo);

        // >> P0146_01
        if not CCItemTrackingMgt.IsSNSpecTracking(Item."Item Tracking Code") then
            exit;
        // << P0146_01
        NoOfSNToTrack := ABSQtyBase;

        for i := 1 to NoOfSNToTrack do begin
            CCItemTrackingMgt.CreateItemTrackingSimple(SourceLine, 1, 1, NoSeriesManagement.GetNextNo(Item."Serial Nos.", Today, true), '');
        end;
    end;

    //
    procedure CheckDummySNSetup(ItemNo: Code[20]; var NoSeries: Code[20]): Boolean
    var
        Item: Record Item;
        InventorySetup: Record "Inventory Setup";
    begin
        Item.Get(ItemNo);
        //IF NOT Item."Dummy SN Tracking" THEN
        if Item."Serial Nos." = '' then
            exit(false);

        //InventorySetup.GET();
        // >> P0033
        //InventorySetup.TESTFIELD(KeyClick);
        // << P0033
        //NoSeries := InventorySetup."Dummy SN Tracking Nos";
        NoSeries := Item."Serial Nos.";
        exit(true);
    end;

    local procedure AssignOutboundSN(SourceLine: Variant; ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]; BinCode: Code[20]; ABSQtyBase: Decimal)
    var
        Item: Record Item;
        InventoryBuffer: Record "Inventory Buffer" temporary;
        i: Integer;
        NoOfSNToTrack: Integer;
    begin
        Clear(CCItemTrackingMgt);
        Item.Get(ItemNo);
        // IF NOT Item."Dummy SN Tracking" THEN
        //  EXIT;

        NoOfSNToTrack := ABSQtyBase;

        CalcSNAvaiInventory(ItemNo, VariantCode, LocationCode, BinCode, InventoryBuffer, NoOfSNToTrack, false);

        Clear(CCItemTrackingMgt);
        CCItemTrackingMgt.SetIsDummySNTracking(true);

        InventoryBuffer.FindSet;

        for i := 1 to NoOfSNToTrack do begin
            CCItemTrackingMgt.CreateItemTrackingSimple(SourceLine, 1, 1, InventoryBuffer."Serial No.", '');
            InventoryBuffer.Next;
        end;
    end;

    local procedure HandleItemJnlLine(var ItemJournalLine: Record "Item Journal Line"; CommitIsSuppressed: Boolean)
    var
        SignFactor: Decimal;
    begin
        if ItemJournalLine.IsTemporary then
            exit;

        if ItemJournalLine."Quantity (Base)" = 0 then
            exit;

        // Output Cancellation
        if (ItemJournalLine."Entry Type" = ItemJournalLine."Entry Type"::Output) and (ItemJournalLine."Output Quantity" < 0) then
            exit;

        // Revaluation
        if ItemJournalLine."Value Entry Type" = ItemJournalLine."Value Entry Type"::Revaluation then
            exit;

        SignFactor := ItemJournalLine."Quantity (Base)" * SetSignFactor(83, ItemJournalLine."Entry Type".asinteger(), (ItemJournalLine."Entry Type" = ItemJournalLine."Entry Type"::Transfer) and (ItemJournalLine.Quantity < 0));

        if SignFactor > 0 then begin
            CreateInboundSN(ItemJournalLine, ItemJournalLine."Item No.", Abs(ItemJournalLine."Quantity (Base)"));
        end else begin
            AssignOutboundSN(ItemJournalLine, ItemJournalLine."Item No.", ItemJournalLine."Variant Code", ItemJournalLine."Location Code", ItemJournalLine."Bin Code", Abs(ItemJournalLine."Quantity (Base)"));
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 5407, 'OnBeforeChangeStatusOnProdOrder', '', false, false)]
    local procedure C5407_OnBeforeChangeStatusOnProdOrder(var ProductionOrder: Record "Production Order"; NewStatus: Option Quote,Planned,"Firm Planned",Released,Finished)
    begin
        HandleOutputBeforeStatusChange(ProductionOrder, NewStatus);
    end;

    [EventSubscriber(ObjectType::Codeunit, 22, 'OnBeforePostFlushedConsumpItemJnlLine', '', false, false)]
    local procedure C22_OnBeforePostFlushedConsumpItemJnlLine(var ItemJournalLine: Record "Item Journal Line")
    begin
        HandleItemJnlLine(ItemJournalLine, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, 5704, 'OnBeforeTransferOrderPostShipment', '', false, false)]
    local procedure C5704_OnBeforeTransferOrderPostShipment(var TransferHeader: Record "Transfer Header"; CommitIsSuppressed: Boolean)
    var
        TransferLine: Record "Transfer Line";
    begin
        TransferLine.Reset;
        TransferLine.SetRange("Document No.", TransferHeader."No.");
        TransferLine.SetFilter("Qty. to Ship", '>%1', 0);
        if not TransferLine.FindSet then
            exit;

        repeat
            TransferLineDummySNTracking(TransferLine);
        until TransferLine.Next = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, 5980, 'OnBeforePostWithLines', '', false, false)]
    local procedure C5980_OnBeforePostWithLines(var PassedServHeader: Record "Service Header"; var PassedServLine: Record "Service Line"; var PassedShip: Boolean; var PassedConsume: Boolean; var PassedInvoice: Boolean)
    begin
        if not PassedShip then
            exit;

        // >> P0033-01
        //PassedServLine.FINDSET;
        if PassedServLine.FindSet then
            // << P0033-01
            repeat
                ServiceLineDummySNTracking(PassedServLine);
            until PassedServLine.Next = 0;
    end;

    local procedure ServiceLineDummySNTracking(var ServiceLine2: Record "Service Line")
    var
        i: Integer;
        SignFactor: Decimal;
        AssemblyHeader: Record "Assembly Header";
        IsATO: Boolean;
    begin
        if ServiceLine2.Type <> ServiceLine2.Type::Item then
            exit;

        if ServiceLine2."Qty. to Ship (Base)" = 0 then
            exit;

        ServiceLine2.CalcFields("Reserved Quantity");
        //IsATO := (SalesLine2."Qty. to Assemble to Order" <> 0) AND (SalesLine2."Reserved Quantity" <> 0);
        //IF IsATO THEN

        if (ServiceLine2."Reserved Quantity" <> 0) then begin
            // HIER KEINE DUMMYZUWEISUNG: MUSS VORHER GESCHEHEN. NOCH OFFEN BESTELLUNG=>AUFTRAG
            exit;
        end;

        SignFactor := ServiceLine2."Qty. to Ship (Base)" * SetSignFactor(37, Serviceline2."Document Type".AsInteger(), false);

        if SignFactor > 0 then begin
            CreateInboundSN(ServiceLine2, ServiceLine2."No.", Abs(ServiceLine2."Qty. to Ship (Base)"));
        end else begin
            AssignOutboundSN(ServiceLine2, ServiceLine2."No.", ServiceLine2."Variant Code", ServiceLine2."Location Code", ServiceLine2."Bin Code", Abs(ServiceLine2."Qty. to Ship (Base)"));
        end;
    end;

    local procedure TransferLineDummySNTracking(var TransferLine2: Record "Transfer Line")
    var
        i: Integer;
        SignFactor: Decimal;
        WescoSetup: Record "Job Item Category";
    begin
        if TransferLine2."Qty. to Ship (Base)" = 0 then
            exit;

        SignFactor := TransferLine2."Qty. to Ship (Base)" * SetSignFactor(DATABASE::"Transfer Line", 0, false);

        if SignFactor > 0 then begin
            CreateInboundSN(TransferLine2, TransferLine2."Item No.", Abs(TransferLine2."Qty. to Ship (Base)"));
        end else begin
            // >> P0076
            //dori
            //    WescoSetup.GET;
            //    IF "Transfer-from Code" = WescoSetup."Consignment Location Code" THEN BEGIN
            //      EXIT; // Keine Dummyverfolgung für Rücklieferung von Konsignationslager
            //    END;
            // << P0076
            AssignOutboundSN(TransferLine2, TransferLine2."Item No.", TransferLine2."Variant Code", TransferLine2."Transfer-from Code", TransferLine2."Transfer-from Bin Code", Abs(TransferLine2."Qty. to Ship (Base)"));
        end;
    end;

    [EventSubscriber(ObjectType::Page, 6510, 'OnOpenPageEvent', '', false, false)]
    local procedure P6510OnOpenPage(var Rec: Record "Tracking Specification")
    var
        Item: Record Item;
    begin
        //Item.GET(Rec."Item No.");
        //Rec."Entry No."Item.TESTFIELD("Dummy SN Tracking",FALSE);
    end;

    local procedure "---Helper"()
    begin
    end;


    procedure CalcSNAvaiInventory(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]; BinCode: Code[20]; var InventoryBuffer: Record "Inventory Buffer"; NeededSN: Integer; SkipCheckInUse: Boolean)
    var
        Location: Record Location;
        // SerialNumbersbyBin: Query GIMServiceAnswers;
        i: Integer;
    begin
        // Location.GET(LocationCode);
        // i := 0;
        //
        // IF NOT Location."Bin Mandatory" THEN BEGIN
        //  SerialNumbersOnStock.SETRANGE(Item_No, ItemNo);
        //  SerialNumbersOnStock.SETRANGE(Location_Code, LocationCode);
        //  SerialNumbersOnStock.SETRANGE(Variant_Code, VariantCode);
        //  SerialNumbersOnStock.OPEN;
        //  WHILE SerialNumbersOnStock.READ DO BEGIN
        //    IF NOT SerialNoAlreadyInUse(SerialNumbersOnStock.Serial_No) OR SkipCheckInUse THEN BEGIN
        //      InventoryBuffer.INIT;
        //      InventoryBuffer."Serial No." := SerialNumbersOnStock.Serial_No;
        //      InventoryBuffer.INSERT;
        //      i += 1;
        //      IF i = NeededSN THEN
        //        BREAK;
        //    END;
        //  END;
        //
        // END ELSE BEGIN
        //  SerialNumbersbyBin.SETRANGE(Item_No, ItemNo);
        //  SerialNumbersbyBin.SETRANGE(Location_Code, LocationCode);
        //  SerialNumbersbyBin.SETRANGE(Bin_Code, BinCode);
        //  SerialNumbersbyBin.SETRANGE(Variant_Code, VariantCode);
        //  SerialNumbersbyBin.OPEN;
        //  WHILE SerialNumbersbyBin.READ DO BEGIN
        //    IF NOT SerialNoAlreadyInUse(SerialNumbersbyBin.Serial_No) OR SkipCheckInUse THEN BEGIN
        //      InventoryBuffer.INIT;
        //      InventoryBuffer."Serial No." := SerialNumbersbyBin.Serial_No;
        //      InventoryBuffer.INSERT;
        //
        //      i += 1;
        //      IF i = NeededSN THEN
        //        BREAK;
        //    END;
        //  END;
        // END;
        //
        // IF InventoryBuffer.COUNT < NeededSN THEN
        //  ERROR('Zu wenig Dummy SN im Bestand gefunden!\Artikel: %1\Lagerort: %2\Lagerplatz: %3', ItemNo, LocationCode, BinCode);
    end;

    local procedure SerialNoAlreadyInUse(SerialNo: Code[50]): Boolean
    var
        ReservationEntry: Record "Reservation Entry";
    begin
        ReservationEntry.Reset;
        ReservationEntry.SetRange("Item Tracking", ReservationEntry."Item Tracking"::"Serial No.");
        ReservationEntry.SetRange("Serial No.", SerialNo);
        ReservationEntry.SetRange(Positive, false);
        exit(not ReservationEntry.IsEmpty);
    end;

    procedure SetSignFactor(SourceType: Integer; SourceSubtype: Integer; Inbound: Boolean): Integer
    var
        Sign: Integer;
    begin
        // Demand is regarded as negative, supply is regarded as positive.
        case SourceType of
            DATABASE::"Sales Line":
                if SourceSubtype in [3, 5] then // Credit memo, Return Order = supply
                    exit(1)
                else
                    exit(-1);
            DATABASE::"Requisition Line":
                if SourceSubtype = 1 then
                    exit(-1)
                else
                    exit(1);
            DATABASE::"Purchase Line":
                if SourceSubtype in [3, 5] then // Credit memo, Return Order = demand
                    exit(-1)
                else
                    exit(1);
            DATABASE::"Item Journal Line":
                if (SourceSubtype = 4) and Inbound then
                    exit(1)
                else
                    if SourceSubtype in [1, 3, 4, 5] then // Sale, Negative Adjmt., Transfer, Consumption
                        exit(-1)
                    else
                        exit(1);
            DATABASE::"Job Journal Line":
                exit(-1);
            DATABASE::"Item Ledger Entry":
                exit(1);
            DATABASE::"Prod. Order Line":
                exit(1);
            DATABASE::"Prod. Order Component":
                exit(-1);
            DATABASE::"Assembly Header":
                exit(1);
            DATABASE::"Assembly Line":
                exit(-1);
            DATABASE::"Planning Component":
                exit(-1);
            DATABASE::"Transfer Line":
                if SourceSubtype = 0 then // Outbound
                    exit(-1)
                else
                    exit(1);
            DATABASE::"Service Line":
                if SourceSubtype in [3] then // Credit memo
                    exit(1)
                else
                    exit(-1);
            DATABASE::"Job Planning Line":
                exit(-1);
        end;

        exit(Sign);
    end;

    local procedure CreateDummySNTracking(var AssemblyHeader: Record "Assembly Header")
    var
        AssemblyLine: Record "Assembly Line";
        InheritSerialNo: Boolean;
        IsATO: Boolean;
        DummySeries: Code[20];
    begin
        if AssemblyHeader.IsTemporary then
            exit;

        if AssemblyHeader."Quantity to Assemble (Base)" = 0 then
            exit;

        AssemblyLine.SetRange("Document Type", AssemblyHeader."Document Type");
        AssemblyLine.SetRange("Document No.", AssemblyHeader."No.");
        repeat
            if AssemblyLine.Type = AssemblyLine.Type::Item then begin
                if AssemblyLine."Quantity to Consume (Base)" = 0 then
                    exit;
                // >> P0135_01
                //      IF AssemblyLine."Inherit Serial No." THEN
                //        InheritSerialNo := TRUE;
                // << P0135_01
                AssignOutboundSN(AssemblyLine, AssemblyLine."No.", AssemblyLine."Variant Code", AssemblyLine."Location Code", AssemblyLine."Bin Code", Abs(AssemblyLine."Quantity to Consume (Base)"));
            end;
        until AssemblyLine.Next = 0;

        AssemblyHeader.CalcFields("Reserved Quantity", "Assemble to Order");
        IsATO := AssemblyHeader."Assemble to Order" and (AssemblyHeader."Reserved Quantity" <> 0);
        if IsATO then begin
            ModifyExistingReservation(AssemblyHeader."Item No.", Abs(AssemblyHeader."Quantity to Assemble (Base)"), CCItemTrackingMgt.AssHeaderRowID(AssemblyHeader));
            // >> P0135_01
            if not InheritSerialNo then begin
                ModifyExistingReservationNoDummy(AssemblyHeader."Item No.", Abs(AssemblyHeader."Quantity to Assemble (Base)"), CCItemTrackingMgt.AssHeaderRowID(AssemblyHeader));
            end;
            // << P0135_01
        end else begin
            CreateInboundSN(AssemblyHeader, AssemblyHeader."Item No.", Abs(AssemblyHeader."Quantity to Assemble (Base)"));
        end;
    end;

    //
    procedure ModifyExistingReservation(ItemNo: Code[20]; ABSQtyBase: Decimal; RowID: Text[250])
    var
        CCItemTrackingMgt: Codeunit "CC Item Tracking Mgt.";
        ReservationEntry: Record "Reservation Entry";
        ReservationEntry2: Record "Reservation Entry";
        SerialNo: Code[20];
        DummySNSeries: Code[20];
        i: Integer;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        NoOfSNToTrack: Integer;
        SplittedReservEntry: Record "Reservation Entry";
        SplittedReservEntry2: Record "Reservation Entry";
        CurrentSourceRowID: Text[100];
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        SecondSourceRowID: Text[100];
    begin
        Clear(CCItemTrackingMgt);
        if not CheckDummySNSetup(ItemNo, DummySNSeries) then
            exit;

        CCItemTrackingMgt.FindReservEntry(ReservationEntry, RowID, '', '');
        ReservationEntry.SetRange("Reservation Status", ReservationEntry."Reservation Status"::Reservation);
        if not ReservationEntry.FindSet then
            exit;

        repeat
            //Nur bei FA und UML-Ausgang
            //IF ReservationEntry."Source Type" = 5406 THEN BEGIN

            while (ABSQtyBase > 0) and (ReservationEntry.Quantity <> 0) do begin


                SerialNo := NoSeriesManagement.GetNextNo(DummySNSeries, Today, true);

                SplittedReservEntry := ReservationEntry;
                SplittedReservEntry."Entry No." := 0;
                SplittedReservEntry.Validate("Quantity (Base)", 1);
                SplittedReservEntry."Serial No." := SerialNo;
                SplittedReservEntry."Item Tracking" := SplittedReservEntry."Item Tracking"::"Serial No.";
                //dori
                SplittedReservEntry."Qty. to Handle (Base)" := 0;
                SplittedReservEntry."CCS QA No. of Units" := 1;

                SplittedReservEntry.Insert(true);

                ReservationEntry.Validate("Quantity (Base)", ReservationEntry."Quantity (Base)" - 1);

                //dori
                ReservationEntry.Validate("Qty. to Handle (Base)", 0);

                ReservationEntry.Modify;


                ReservationEntry2.Get(ReservationEntry."Entry No.", not ReservationEntry.Positive);
                SplittedReservEntry2 := ReservationEntry2;
                SplittedReservEntry2."Entry No." := SplittedReservEntry."Entry No.";
                SplittedReservEntry2.Validate("Quantity (Base)", -1);
                SplittedReservEntry2."Serial No." := SerialNo;
                SplittedReservEntry2."Item Tracking" := SplittedReservEntry2."Item Tracking"::"Serial No.";

                //dori
                SplittedReservEntry2."Qty. to Handle (Base)" := 0;
                SplittedReservEntry2."ccs qa No. of Units" := 1;

                SplittedReservEntry2.Insert(true);

                ReservationEntry2.Validate("Quantity (Base)", ReservationEntry."Quantity (Base)" * -1);

                //dori
                ReservationEntry2.Validate("Qty. to Handle (Base)", 0);

                ReservationEntry2.Modify;
                ABSQtyBase -= 1;


                if ReservationEntry2."Source Type" = DATABASE::"Transfer Line" then begin
                    CurrentSourceRowID := ItemTrackingMgt.ComposeRowID(DATABASE::"Transfer Line",
                      0, ReservationEntry2."Source ID", '', 0, ReservationEntry2."Source Ref. No.");
                    SecondSourceRowID := ItemTrackingMgt.ComposeRowID(DATABASE::"Transfer Line",
                      1, ReservationEntry2."Source ID", '', 0, ReservationEntry2."Source Ref. No.");
                    ItemTrackingMgt.SynchronizeItemTracking(CurrentSourceRowID, SecondSourceRowID, '');
                end;


            end;
            if ReservationEntry.Quantity = 0 then begin
                ReservationEntry.Delete;
                ReservationEntry2.Delete;
            end;
        //END;
        until ReservationEntry.Next = 0;
    end;


    procedure ModifyExistingReservationNoDummy(ItemNo: Code[20]; ABSQtyBase: Decimal; RowID: Text[250])
    var
        CCItemTrackingMgt: Codeunit "CC Item Tracking Mgt.";
        ReservationEntry: Record "Reservation Entry";
        ReservationEntry2: Record "Reservation Entry";
        SerialNo: Code[20];
        DummySNSeries: Code[20];
        i: Integer;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        NoOfSNToTrack: Integer;
        SplittedReservEntry: Record "Reservation Entry";
        SplittedReservEntry2: Record "Reservation Entry";
        Item: Record Item;
        AssemblyLine: Record "Assembly Line";
    begin
        // >> P0135_01
        Clear(CCItemTrackingMgt);
        if CheckDummySNSetup(ItemNo, DummySNSeries) then
            exit;
        if not Item.Get(ItemNo) then
            exit;

        if not CCItemTrackingMgt.IsSNSpecTracking(Item."Item Tracking Code") then
            exit;

        CCItemTrackingMgt.FindReservEntry(ReservationEntry, RowID, '', '');
        ReservationEntry.SetRange("Reservation Status", ReservationEntry."Reservation Status"::Reservation);
        ReservationEntry.FindSet;

        repeat
            // >> P0165
            if ReservationEntry."Serial No." <> '' then begin
                // << P0165
                while (ABSQtyBase > 0) and (ReservationEntry.Quantity <> 0) do begin
                    SerialNo := NoSeriesManagement.GetNextNo(Item."Serial Nos.", Today, true);

                    SplittedReservEntry := ReservationEntry;
                    SplittedReservEntry."Entry No." := 0;
                    SplittedReservEntry.Validate("Quantity (Base)", 1);
                    SplittedReservEntry."Serial No." := SerialNo;
                    SplittedReservEntry."Item Tracking" := SplittedReservEntry."Item Tracking"::"Serial No.";
                    SplittedReservEntry.Insert(true);

                    ReservationEntry.Validate("Quantity (Base)", ReservationEntry."Quantity (Base)" - 1);
                    ReservationEntry.Modify;


                    ReservationEntry2.Get(ReservationEntry."Entry No.", not ReservationEntry.Positive);
                    SplittedReservEntry2 := ReservationEntry2;
                    SplittedReservEntry2."Entry No." := SplittedReservEntry."Entry No.";
                    SplittedReservEntry2.Validate("Quantity (Base)", -1);
                    SplittedReservEntry2."Serial No." := SerialNo;
                    SplittedReservEntry2."Item Tracking" := SplittedReservEntry2."Item Tracking"::"Serial No.";
                    SplittedReservEntry2.Insert(true);

                    ReservationEntry2.Validate("Quantity (Base)", ReservationEntry."Quantity (Base)" * -1);
                    ReservationEntry2.Modify;
                    ABSQtyBase -= 1;
                end;
                if ReservationEntry.Quantity = 0 then begin
                    ReservationEntry.Delete;
                    ReservationEntry2.Delete;
                end;
            end; // P0165
        until ReservationEntry.Next = 0;
    end;

    //
    procedure HandleOutputBeforeStatusChange(ProdOrder: Record "Production Order"; NewStatus: Option Quote,Planned,"Firm Planned",Released,Finished)
    var
        ProdOrderLine: Record "Prod. Order Line";
        ReservationEntry: Record "Reservation Entry";
        ICCItemTrackingMgt: Codeunit "CC Item Tracking Mgt.";
        ProdOrderComponent: Record "Prod. Order Component";
    begin
        if NewStatus <> NewStatus::Finished then
            exit;

        ProdOrderLine.Reset;
        ProdOrderLine.SetRange(Status, ProdOrder.Status);
        ProdOrderLine.SetRange("Prod. Order No.", ProdOrder."No.");
        if ProdOrderLine.FindSet then begin
            repeat
                // >> P0165
                if InheritSerialNoFromComponent(ProdOrderLine, ProdOrderComponent) then begin
                    SetInheritSerialNos(ProdOrderLine, ProdOrderComponent);
                end else begin
                    // << P0165
                    ICCItemTrackingMgt.FindReservEntry(ReservationEntry, ProdOrderLine.RowID1, '', '');
                    ReservationEntry.SetRange("Reservation Status", ReservationEntry."Reservation Status"::Reservation);
                    if not ReservationEntry.IsEmpty then begin
                        ModifyExistingReservation(ProdOrderLine."Item No.", ProdOrderLine."Remaining Qty. (Base)", ProdOrderLine.RowID1);
                        // >> P0146_01
                        ModifyExistingReservationNoDummy(ProdOrderLine."Item No.", ProdOrderLine."Remaining Qty. (Base)", ProdOrderLine.RowID1);
                        // << P0146_01
                    end else begin
                        CreateInboundSN(ProdOrderLine, ProdOrderLine."Item No.", Abs(ProdOrderLine."Remaining Qty. (Base)"));
                        // >> P0165
                        if not CCItemTrackingMgt.FindReservEntry(ReservationEntry, ProdOrderLine.RowID1, '', '') then begin
                            // << P0165
                            // >> P0146_01
                            CreateInboundSNNoDummy(ProdOrderLine, ProdOrderLine."Item No.", Abs(ProdOrderLine."Remaining Qty. (Base)"));
                            // << P0146_01
                        end; // P0165
                    end;
                end;
            until ProdOrderLine.Next = 0;
        end;
    end;

    local procedure InheritSerialNoFromComponent(ProdorderLine: Record "Prod. Order Line"; var ProdOrderComponent: Record "Prod. Order Component"): Boolean
    begin
        // >> P0165
        ProdOrderComponent.Reset;
        ProdOrderComponent.SetRange(Status, ProdorderLine.Status);
        ProdOrderComponent.SetRange("Prod. Order No.", ProdorderLine."Prod. Order No.");
        ProdOrderComponent.SetRange("Prod. Order Line No.", ProdorderLine."Line No.");
        //ProdOrderComponent.SETRANGE("Inherit Serial No.",TRUE);
        exit(ProdOrderComponent.FindSet);
        // << P0165
    end;

    local procedure SetInheritSerialNos(ProdOrderLine: Record "Prod. Order Line"; ProdOrderComponent: Record "Prod. Order Component")
    var
        tempReservEntry: Record "Reservation Entry" temporary;
        ReservationEntry: Record "Reservation Entry";
        ReservationEntry2: Record "Reservation Entry";
        TempTrackingSpecification: Record "Tracking Specification" temporary;
        SplittedReservEntry: Record "Reservation Entry";
        SplittedReservEntry2: Record "Reservation Entry";
        Item: Record Item;
        ItemTrackingCode: Record "Item Tracking Code";
        ReservationEngineMgt: Codeunit "Reservation Engine Mgt.";
        DummySNSeries: Code[10];
        SerialNo: Code[50];
        QtyToAddAsBlank: Decimal;
    begin
        // >> P0165
        Clear(CCItemTrackingMgt);
        if CheckDummySNSetup(ProdOrderLine."Item No.", DummySNSeries) then
            exit;
        if not Item.Get(ProdOrderLine."Item No.") then
            exit;

        if not CCItemTrackingMgt.IsSNSpecTracking(Item."Item Tracking Code") then
            exit;

        CCItemTrackingMgt.FindReservEntry(ReservationEntry, ProdOrderComponent.RowID1, '', '');
        if ReservationEntry.FindSet then begin
            repeat
                CreateTempTrackingSpecProdOrderLine(ReservationEntry, ProdOrderLine, TempTrackingSpecification);
            until ReservationEntry.Next = 0;
        end;
        if not TempTrackingSpecification.FindSet then begin
            exit;
        end;

        CCItemTrackingMgt.FindReservEntry(ReservationEntry, ProdOrderLine.RowID1, '', '');
        ReservationEntry.SetRange("Reservation Status", ReservationEntry."Reservation Status"::Reservation);
        if ReservationEntry.FindSet then begin
            tempReservEntry.DeleteAll;
            tempReservEntry := ReservationEntry;
            tempReservEntry.Insert;
            tempReservEntry.CopyFilters(ReservationEntry);
            ItemTrackingCode.GET(Item."Item Tracking Code");
            if TempTrackingSpecification.FindSet then begin
                repeat
                    ReservationEngineMgt.AddItemTrackingToTempRecSet(tempReservEntry, TempTrackingSpecification, TempTrackingSpecification."Quantity (Base)", QtyToAddAsBlank, ItemTrackingCode)
                until TemptrackingSpecification.next = 0;
            end;

            //  REPEAT
            //    WHILE (TempTrackingSpecification.FINDSET) AND (ReservationEntry.Quantity <> 0) DO BEGIN
            //      SerialNo := TempTrackingSpecification."Serial No.";
            //
            //      SplittedReservEntry := ReservationEntry;
            //      SplittedReservEntry."Entry No." := 0;
            //      SplittedReservEntry.VALIDATE("Quantity (Base)",1);
            //      SplittedReservEntry."Serial No." := SerialNo;
            //      SplittedReservEntry."Item Tracking" := SplittedReservEntry."Item Tracking"::"Serial No.";
            //      SplittedReservEntry.INSERT(TRUE);
            //
            //      ReservationEntry.VALIDATE("Quantity (Base)",ReservationEntry."Quantity (Base)" -1);
            //      ReservationEntry.MODIFY;
            //
            //
            //      ReservationEntry2.GET(ReservationEntry."Entry No.", NOT ReservationEntry.Positive);
            //      SplittedReservEntry2 := ReservationEntry2;
            //      SplittedReservEntry2."Entry No." := SplittedReservEntry."Entry No.";
            //      SplittedReservEntry2.VALIDATE("Quantity (Base)",-1);
            //      SplittedReservEntry2."Serial No." := SerialNo;
            //      SplittedReservEntry2."Item Tracking" := SplittedReservEntry2."Item Tracking"::"Serial No.";
            //      SplittedReservEntry2.INSERT(TRUE);
            //
            //      ReservationEntry2.VALIDATE("Quantity (Base)",ReservationEntry."Quantity (Base)" * -1);
            //      ReservationEntry2.MODIFY;
            //      TempTrackingSpecification.DELETE;
            //    END;
            //    IF ReservationEntry.Quantity = 0 THEN BEGIN
            //      ReservationEntry.DELETE;
            //      ReservationEntry2.DELETE;
            //    END;
            //  UNTIL ReservationEntry.NEXT = 0;
        end else begin
            CreateInboundSNNoDummyPOLine(ProdOrderLine, TempTrackingSpecification);
        end;

        // << P0165
    end;

    local procedure CreateTempTrackingSpecProdOrderLine(ReservationEntry: Record "Reservation Entry"; ProdOrderLine: Record "Prod. Order Line"; var TempTrackingSpecification: Record "Tracking Specification" temporary)
    begin
        // >> P0165
        TempTrackingSpecification.Init;
        TempTrackingSpecification."Entry No." := ReservationEntry."Entry No.";
        TempTrackingSpecification."Item No." := ProdOrderLine."Item No.";
        TempTrackingSpecification."Quantity (Base)" := ReservationEntry.Quantity * -1;
        TempTrackingSpecification."Source Type" := DATABASE::"Prod. Order Line";
        TempTrackingSpecification."Source Subtype" := ProdOrderLine.Status.AsInteger();
        TempTrackingSpecification."Source ID" := ProdOrderLine."Prod. Order No.";
        TempTrackingSpecification."Source Batch Name" := '';
        TempTrackingSpecification."Source Prod. Order Line" := ProdOrderLine."Line No.";
        TempTrackingSpecification."Source Ref. No." := 0;
        TempTrackingSpecification."Serial No." := ReservationEntry."Serial No.";
        TempTrackingSpecification."Qty. per Unit of Measure" := ReservationEntry."Qty. per Unit of Measure";
        TempTrackingSpecification."Qty. to Handle" := ReservationEntry.Quantity * -1;
        TempTrackingSpecification."Qty. to Handle (Base)" := ReservationEntry.Quantity * -1;
        TempTrackingSpecification."Qty. to Invoice (Base)" := ReservationEntry.Quantity * -1;
        TempTrackingSpecification."Qty. to Invoice" := ReservationEntry.Quantity * -1;
        TempTrackingSpecification.Insert;
        // << P0165
    end;

    local procedure CreateInboundSNNoDummyPOLine(ProdOrderLine: Record "Prod. Order Line"; var TempTrackingSpecification: Record "Tracking Specification" temporary)
    var
        DummySNSeries: Code[20];
        i: Integer;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        NoOfSNToTrack: Integer;
        Item: Record Item;
        DummySN: Code[10];
        ReservationEntry: Record "Reservation Entry";
    begin
        // >> P0165
        Clear(CCItemTrackingMgt);

        if CheckDummySNSetup(ProdOrderLine."Item No.", DummySN) then
            exit;
        if TempTrackingSpecification.IsEmpty then
            exit;

        Item.Get(ProdOrderLine."Item No.");

        if not CCItemTrackingMgt.IsSNSpecTracking(Item."Item Tracking Code") then
            exit;

        if CCItemTrackingMgt.FindReservEntry(ReservationEntry, ProdOrderLine.RowID1, '', '') then begin
            Error(Text50000);
        end;

        if TempTrackingSpecification.FindSet then begin
            repeat
                CCItemTrackingMgt.CreateItemTrackingSimple(ProdOrderLine, 1, 1, TempTrackingSpecification."Serial No.", '');
            until TempTrackingSpecification.Next = 0;
        end;
        // << P0165
    end;

    procedure CheckForUniqueDummyUsage(var ProdOrderRtngLine: Record "Prod. Order Routing Line") DummyFound: Boolean
    var
        LicPermission: Record "License Permission";
        ProcessManufacturingSetup: Record "ccs pm Process Manuf. Setup";
        ProdOrderRtngLine2: Record "Prod. Order Routing Line";
    begin
        // >> #PMW18.00.00.01:T100
        LicPermission.Get(LicPermission."Object Type"::TableData, DATABASE::"ccs pm Process Manuf. Setup");
        if LicPermission."Read Permission" = LicPermission."Read Permission"::Yes then begin

            if ProcessManufacturingSetup.Get then begin

                if (ProdOrderRtngLine."Next Operation No." <> '') then begin

                    if (ProdOrderRtngLine."CCS PM Tool att to OperationNo" = '') and
                       (ProdOrderRtngLine."CCS PM InsertAttToOperationNo" = '') and
                       (StrPos(ProdOrderRtngLine."Previous Operation No.", '|') = 0)
                    then begin
                        // Check if routing is not parallel to others than tools / inserts
                        ProdOrderRtngLine2.Reset;
                        ProdOrderRtngLine2.SetRange(Status, ProdOrderRtngLine.Status);
                        ProdOrderRtngLine2.SetRange("Prod. Order No.", ProdOrderRtngLine."Prod. Order No.");
                        ProdOrderRtngLine2.SetRange("Routing Reference No.", ProdOrderRtngLine."Routing Reference No.");
                        ProdOrderRtngLine2.SetRange("Routing No.", ProdOrderRtngLine."Routing No.");
                        ProdOrderRtngLine2.SetRange("Previous Operation No.", ProdOrderRtngLine."Previous Operation No.");
                        ProdOrderRtngLine2.SetRange("CCS PM Tool att to OperationNo", '');
                        ProdOrderRtngLine2.SetRange("CCS PM InsertAttToOperationNo", '');
                        if not (ProdOrderRtngLine2.Count > 1) then begin

                            // Find next operation and check for last operation dummy

                            // >> #PMW18.00.00.03:T503
                            if StrPos(ProdOrderRtngLine."Next Operation No.", '|') = 0 then begin
                                // << #PMW18.00.00.03:T503
                                if ProdOrderRtngLine2.Get(
                                     ProdOrderRtngLine.Status,
                                     ProdOrderRtngLine."Prod. Order No.",
                                     ProdOrderRtngLine."Routing Reference No.",
                                     ProdOrderRtngLine."Routing No.",
                                     ProdOrderRtngLine."Next Operation No.")
                                then begin

                                    if (ProcessManufacturingSetup."Work Center for Tool Planning" <> '') and
                                       (ProdOrderRtngLine2."No." = ProcessManufacturingSetup."Work Center for Tool Planning")
                                    then begin
                                        ProdOrderRtngLine := ProdOrderRtngLine2;
                                        exit(true);
                                    end;

                                end;
                                // >> #PMW18.00.00.03:T503
                            end;
                            // << #PMW18.00.00.03:T503

                        end;
                    end;
                end else begin
                    if (ProcessManufacturingSetup."Work Center for Tool Planning" <> '') and
                       (ProdOrderRtngLine."No." = ProcessManufacturingSetup."Work Center for Tool Planning")
                    then begin
                        ProdOrderRtngLine2.Reset;
                        ProdOrderRtngLine2.SetRange(Status, ProdOrderRtngLine.Status);
                        ProdOrderRtngLine2.SetRange("Prod. Order No.", ProdOrderRtngLine."Prod. Order No.");
                        ProdOrderRtngLine2.SetRange("Routing Reference No.", ProdOrderRtngLine."Routing Reference No.");
                        ProdOrderRtngLine2.SetRange("Routing No.", ProdOrderRtngLine."Routing No.");
                        ProdOrderRtngLine2.SetFilter("Operation No.", ProdOrderRtngLine."Previous Operation No.");
                        ProdOrderRtngLine2.FindFirst;

                        ProdOrderRtngLine := ProdOrderRtngLine2;
                        exit(true);
                    end;
                end;
            end;
        end;
        // << #PMW18.00.00.01:T100
    end;

}

