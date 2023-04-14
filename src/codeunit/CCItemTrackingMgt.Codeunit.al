codeunit 50004 "CC Item Tracking Mgt."
{
    // CheckNegAdjmt := FALSE;
    // 
    // InitTrackingSpecification(SourceDocLine, ForQty, ForQtyBase, ForSerialNo, ForLotNo, TempTrackingSpecification2);
    // // "Lot No." relevant Data change e.g. Exp. Date, Warranty or AMP-QM ("Lot No. Status", etc)
    // AddDataFromLotNoInformation(SourceDocLine, TempTrackingSpecification2);
    // CreateItemTrackingForDocLines(SourceDocLine, TempTrackingSpecification2, CheckNegAdjmt);

    Permissions = TableData Item = rimd,
                  TableData "Sales Line" = rimd,
                  TableData "Purchase Line" = rimd,
                  TableData "Item Journal Line" = rimd,
                  TableData "Tracking Specification" = rimd,
                  TableData "Reservation Entry" = rimd,
                  TableData "Assembly Header" = rimd,
                  TableData "Assembly Line" = rimd,
                  TableData "Transfer Line" = rimd,
                  TableData "Serial No. Information" = rimd,
                  TableData "Lot No. Information" = rimd,
                  TableData "Warehouse Receipt Line" = rimd;

    trigger OnRun()
    var
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
        TempWarehouseShipmentLine: Record "Warehouse Shipment Line" temporary;
    begin
        WarehouseShipmentLine.Get('WA1000015', 80000);
        TempWarehouseShipmentLine.Init;
        TempWarehouseShipmentLine.TransferFields(WarehouseShipmentLine);
        TempWarehouseShipmentLine.Insert;

        CreateItemTrackingSimple(TempWarehouseShipmentLine, 1, 1, '3', '');
    end;

    var
        NegAdjmt: Boolean;
        "---Wesco Globals": Integer;
        IsDummySNTracking: Boolean;
        DeleteExisting: Boolean;
        tmpReservationEntry: Record "Reservation Entry";


    procedure CreateItemTrackingSimple(SourceDocLine: Variant; ForQty: Decimal; ForQtyBase: Decimal; ForSerialNo: Code[20]; ForLotNo: Code[20])
    var
        TempTrackingSpecification2: Record "Tracking Specification" temporary;
        LotNoInformation: Record "Lot No. Information";
        CheckNegAdjmt: Boolean;
    begin
        // Use just for Neg. Adjmt - Data from Existing Inventory - Tracking from Lot no. Info!!!

        // ToDo Check neg. Adj.
        CheckNegAdjmt := false;

        InitTrackingSpecification(SourceDocLine, ForQty, ForQtyBase, ForSerialNo, ForLotNo, TempTrackingSpecification2);
        // "Lot No." relevant Data change e.g. Exp. Date, Warranty or AMP-QM ("Lot No. Status", etc)
        //AddDataFromLotNoInformation(SourceDocLine, TempTrackingSpecification2);

        CreateItemTrackingForDocLines(SourceDocLine, TempTrackingSpecification2, CheckNegAdjmt);
    end;


    procedure InitTrackingSpecification(SourceDocLine: Variant; ForQty: Decimal; ForQtyBase: Decimal; ForSerialNo: Code[20]; ForLotNo: Code[20]; var TrackingSpecification: Record "Tracking Specification" temporary)
    begin
        TrackingSpecification.Init;
        TrackingSpecification."Entry No." := 1;
        TrackingSpecification."Qty. to Handle" := ForQty;
        TrackingSpecification."Qty. to Handle (Base)" := ForQtyBase;
        TrackingSpecification."Lot No." := ForLotNo;
        TrackingSpecification."Serial No." := ForSerialNo;

        TrackingSpecification.Insert;
    end;


    procedure CreateItemTrackingForDocLines(SourceDocLine: Variant; var TempTrackingSpecification2: Record "Tracking Specification" temporary; CheckNegAdjmt: Boolean)
    var
        RecRef: RecordRef;
        SalesLine: Record "Sales Line";
        PurchaseLine: Record "Purchase Line";
        ItemJournalLine: Record "Item Journal Line";
        WarehouseReceiptLine: Record "Warehouse Receipt Line";
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
        TransferLine: Record "Transfer Line";
        AssemblyHeader: Record "Assembly Header";
        AssemblyLine: Record "Assembly Line";
        ProdOrderLine: Record "Prod. Order Line";
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        TempReservEntry: Record "Reservation Entry" temporary;
        ServiceLine: Record "Service Line";
    begin
        //IF NOT TrackingAllowed(TempTrackingSpecification2."Item No.") THEN
        //  ERROR('Keine Artikelverfolgung erforderlich!');

        if not GetRecRefFromVar(SourceDocLine, RecRef) then begin
            Error('Fehler im Programmaufruf!');
            exit;
        end;

        case RecRef.Number of
            37:
                begin
                    RecRef.SetTable(SalesLine);
                    ForSalesLine(SalesLine, TempTrackingSpecification2);            //ForQty, ForQtyBase, ForSerialNo, ForLotNo, ForExpirationDate);
                end;

            39:  // Purch Line / Whse. Receipt Line
                begin
                    RecRef.SetTable(PurchaseLine);
                    ForPurchLine(PurchaseLine, TempTrackingSpecification2);         //ForQty, ForQtyBase, ForSerialNo, ForLotNo, ForExpirationDate);
                end;

            83:
                begin
                    RecRef.SetTable(ItemJournalLine);
                    if ItemJournalLine."Entry Type" = ItemJournalLine."Entry Type"::Transfer then begin
                        if (TempTrackingSpecification2."Serial No." <> '') and (TempTrackingSpecification2."New Serial No." = '') then begin
                            TempTrackingSpecification2."New Serial No." := TempTrackingSpecification2."Serial No.";
                        end;
                        if (TempTrackingSpecification2."Lot No." <> '') and (TempTrackingSpecification2."New Lot No." = '') then begin
                            TempTrackingSpecification2."New Lot No." := TempTrackingSpecification2."Lot No.";
                        end;
                    end;

                    //IF ItemJournalLine."Entry Type" <> ItemJournalLine."Entry Type" :: Transfer THEN BEGIN
                    ForItemJnlLine(ItemJournalLine, TempTrackingSpecification2);  //ForQty, ForQtyBase, ForSerialNo, ForLotNo, ForExpirationDate);
                                                                                  //END ELSE BEGIN
                                                                                  //  ERROR('Muss noch ausprogrammiert werden!');
                                                                                  //  ForTransferItemJnlLine(ItemJournalLine, ForQty, ForQtyBase, ForSerialNo, ForLotNo, ForExpirationDate , , , ,);
                                                                                  //END;
                end;

            900:
                begin
                    RecRef.SetTable(AssemblyHeader);
                    ForAssemblyHeader(AssemblyHeader, TempTrackingSpecification2); //ForQty, ForQtyBase, ForSerialNo, ForLotNo, ForExpirationDate);
                end;

            901:
                begin
                    RecRef.SetTable(AssemblyLine);
                    ForAssemblyLine(AssemblyLine, TempTrackingSpecification2); //ForQty, ForQtyBase, ForSerialNo, ForLotNo, ForExpirationDate);
                end;

            5406:
                begin
                    RecRef.SetTable(ProdOrderLine);
                    ForProdOrderLine(ProdOrderLine, TempTrackingSpecification2);
                end;

            5741: // Transfer
                begin
                    RecRef.SetTable(TransferLine);
                    ForTransferLine(TransferLine, TempTrackingSpecification2); // ForQty, ForQtyBase, ForSerialNo, ForLotNo, ForExpirationDate, '', '', 0D);
                end;

            5902:
                begin
                    RecRef.SetTable(ServiceLine);
                    ForServiceLine(ServiceLine, TempTrackingSpecification2);
                end;
            7317:  // Whse. Receipt Line
                begin
                    RecRef.SetTable(WarehouseReceiptLine);

                    case WarehouseReceiptLine."Source Type" of
                        39: // Purchase
                            begin
                                PurchaseLine.Get(WarehouseReceiptLine."Source Subtype", WarehouseReceiptLine."Source No.", WarehouseReceiptLine."Source Line No.");
                                ForPurchLine(PurchaseLine, TempTrackingSpecification2); //ForQty, ForQtyBase, ForSerialNo, ForLotNo, ForExpirationDate);
                            end;

                        37: //
                            begin
                                SalesLine.Get(WarehouseReceiptLine."Source Subtype", WarehouseReceiptLine."Source No.", WarehouseReceiptLine."Source Line No.");
                                ForSalesLine(SalesLine, TempTrackingSpecification2); //ForQty, ForQtyBase, ForSerialNo, ForLotNo, ForExpirationDate);
                            end;

                        5741: //
                            begin
                                Error('Umlagerungs-EingÔÇ×nge noch nicht umgesetzt!');
                            end;

                        else begin
                            Error('WE: Die Zeile %1 %2 konnte keinem Beleg zugeordnet werden!', WarehouseReceiptLine."Source No.", WarehouseReceiptLine."Source Line No.");
                        end;
                    end;

                end;

            7321:  // Whse. Shipment Line
                begin
                    RecRef.SetTable(WarehouseShipmentLine);

                    case WarehouseShipmentLine."Source Type" of
                        39: // Purchase
                            begin
                                PurchaseLine.Get(WarehouseShipmentLine."Source Subtype", WarehouseShipmentLine."Source No.", WarehouseShipmentLine."Source Line No.");
                                ForPurchLine(PurchaseLine, TempTrackingSpecification2); //ForQty, ForQtyBase, ForSerialNo, ForLotNo, ForExpirationDate);
                            end;

                        37: //
                            begin
                                SalesLine.Get(WarehouseShipmentLine."Source Subtype", WarehouseShipmentLine."Source No.", WarehouseShipmentLine."Source Line No.");
                                ForSalesLine(SalesLine, TempTrackingSpecification2); //ForQty, ForQtyBase, ForSerialNo, ForLotNo, ForExpirationDate);
                            end;

                        5741: //
                            begin
                                TransferLine.Get(WarehouseShipmentLine."Source No.", WarehouseShipmentLine."Source Line No.");
                                ForTransferLine(TransferLine, TempTrackingSpecification2);
                            end;

                        else begin
                            Error('WA: Die Zeile %1 %2 konnte keinem Beleg zugeordnet werden!', WarehouseShipmentLine."Source No.", WarehouseShipmentLine."Source Line No.");
                        end;
                    end;
                end;
            else
                Error('Für Tabelle %1 noch nicht ausprogrammiert!', RecRef.Number);
        end;

        TempReservEntry.TransferFields(TempTrackingSpecification2);
        NegAdjmt := TempTrackingSpecification2."Quantity (Base)" * CreateReservEntry.SignFactor(TempReservEntry) < 0;
        if CheckNegAdjmt and not NegAdjmt then begin
            Error('Diese Funktion darf nur für Lagerabgänge verwendet werden');
        end;
    end;

    local procedure ForSalesLine(var SalesLine: Record "Sales Line"; TempTrackingSpecification: Record "Tracking Specification")
    var
        ShipmentDate: Date;
        ExpectedReceiptDate: Date;

    begin
        CheckSalesDates(SalesLine, ShipmentDate, ExpectedReceiptDate);

        CreateTracking(SalesLine.RowID1,
          SalesLine."Qty. per Unit of Measure",   // ForQtyPerUOM
          SalesLine."No.",
          SalesLine."Variant Code",
          SalesLine."Location Code",
          SalesLine.Description,
          ExpectedReceiptDate,                    // Expected Recipe date
          ShipmentDate,                           // Shipment Date
          0,
          tmpReservationEntry."Reservation Status"::Surplus,                                // Status = Surplus
                                                                                             //'',
          TempTrackingSpecification);
    end;

    local procedure CheckSalesDates(SalesLine: Record "Sales Line"; ShipmentDate2: Date; ExpectedReceiptDate2: Date): Boolean
    var
        SignFactor: Integer;
    begin
        // ToDo Check This
        if (SalesLine."Document Type" = SalesLine."Document Type"::"Return Order") then
            SignFactor := 1
        else
            SignFactor := -1;

        if SalesLine.Quantity * SignFactor < 0 then begin
            // Outbound
            ShipmentDate2 := SalesLine."Shipment Date";
            ExpectedReceiptDate2 := 0D;
        end else begin
            // Inbound
            ShipmentDate2 := 0D;
            ExpectedReceiptDate2 := SalesLine."Shipment Date";
        end;
    end;

    local procedure ForPurchLine(var Purchline: Record "Purchase Line"; TempTrackingSpecification: Record "Tracking Specification")
    var
        ShipmentDate: Date;
        ExpectedReceiptDate: Date;
    begin
        CheckPurchDates(Purchline, ShipmentDate, ExpectedReceiptDate);

        CreateTracking(Purchline.RowID1,
          Purchline."Qty. per Unit of Measure",    // ForQtyPerUOM
          Purchline."No.",
          Purchline."Variant Code",
          Purchline."Location Code",
          Purchline.Description,
          ExpectedReceiptDate,                     // Expected Recipe date
          ShipmentDate,                            // Shipment Date
          0,
          tmpReservationEntry."Reservation Status"::Surplus,                                       // Status = Surplus
                                                                                                   //'',
          TempTrackingSpecification);
    end;

    local procedure CheckPurchDates(PurchaseLine: Record "Purchase Line"; ShipmentDate2: Date; ExpectedReceiptDate2: Date): Boolean
    var
        SignFactor: Integer;
    begin
        // ToDo Check This
        if (PurchaseLine."Document Type" = PurchaseLine."Document Type"::"Return Order") then
            SignFactor := 1
        else
            SignFactor := -1;

        if PurchaseLine.Quantity * SignFactor > 0 then begin
            // Inbound
            ExpectedReceiptDate2 := PurchaseLine."Expected Receipt Date";
            ShipmentDate2 := 0D;
        end else begin
            // Outbound
            ExpectedReceiptDate2 := 0D;
            ;
            ShipmentDate2 := PurchaseLine."Expected Receipt Date";
        end;
    end;

    local procedure ForTransferLine(var TransferLine: Record "Transfer Line"; TempTrackingSpecification: Record "Tracking Specification")
    begin
        // ToDo if needed
        CreateTracking(TransLineRowID1(TransferLine),
          TransferLine."Qty. per Unit of Measure",  // ForQtyPerUOM
          TransferLine."Item No.",
          TransferLine."Variant Code",
          TransferLine."Transfer-from Code",
          TransferLine.Description,
          0D,                                       // Expected Recipe date
          TransferLine."Shipment Date",             // Shipment Date
          TransferLine."Derived From Line No.",
          tmpReservationEntry."Reservation Status"::Surplus,
          //TransferLine."Transfer-to Code",
          TempTrackingSpecification);

        //CreateSecondReservEntryForTran(TransferLine.RowID1);
    end;

    local procedure ForItemJnlLine(var ItemJnlLine: Record "Item Journal Line"; TempTrackingSpecification: Record "Tracking Specification")
    begin
        CreateTracking(ItemJnlLine.RowID1,
          ItemJnlLine."Qty. per Unit of Measure",    // ForQtyPerUOM
          ItemJnlLine."Item No.",
          ItemJnlLine."Variant Code",
          ItemJnlLine."Location Code",
          ItemJnlLine.Description,
          0D,                                        // Expected Recipe date
          ItemJnlLine."Posting Date",                // Shipment Date
          0,
          tmpReservationEntry."Reservation Status"::Prospect,                                         // Status = Prospect
                                                                                                      //'',
          TempTrackingSpecification);
    end;

    local procedure ForReclassItemJnlLine(var ItemJnlLine: Record "Item Journal Line"; TempTrackingSpecification: Record "Tracking Specification")
    begin
        Error('Under Construktion - Alle NEW Felder berücksichtigen: New Lot No etc.');

        // CreateTracking(ItemJnlLine.RowID1,
        //  ItemJnlLine."Qty. per Unit of Measure",    // ForQtyPerUOM
        //  ForQty,
        //  ForQtyBase,
        //  ForSerialNo,
        //  ForLotNo,
        //  ForExpirationDate,
        //  ItemJnlLine."Item No.",
        //  ItemJnlLine."Variant Code",
        //  ItemJnlLine."Location Code",
        //  ItemJnlLine.Description,
        //  0D,                                        // Expected Recipe date
        //  ItemJnlLine."Posting Date",                // Shipment Date
        //  0,
        //  3,                                         // Status = Prospect
        //  ItemJnlLine."Entry Type" = ItemJnlLine."Entry Type"::Transfer,
        //  '',
        //  '');
    end;

    local procedure ForAssemblyHeader(var AssemblyHeader: Record "Assembly Header"; TempTrackingSpecification: Record "Tracking Specification")
    begin
        CreateTracking(AssHeaderRowID(AssemblyHeader),
          AssemblyHeader."Qty. per Unit of Measure",   // ForQtyPerUOM
          AssemblyHeader."Item No.",
          AssemblyHeader."Variant Code",
          AssemblyHeader."Location Code",
          AssemblyHeader.Description,
          AssemblyHeader."Due Date",                   // Expected Recipe date
          0D,                                          // Shipment Date
          0,
          tmpReservationEntry."Reservation Status"::Surplus,                                           // Status = Surplus
                                                                                                       //'',
          TempTrackingSpecification);
    end;

    local procedure ForAssemblyLine(var AssemblyLine: Record "Assembly Line"; TempTrackingSpecification: Record "Tracking Specification")
    begin
        CreateTracking(AssLineRowID(AssemblyLine),
          AssemblyLine."Qty. per Unit of Measure",     // ForQtyPerUOM
          AssemblyLine."No.",
          AssemblyLine."Variant Code",
          AssemblyLine."Location Code",
          AssemblyLine.Description,
          0D,                                          // Expected Recipe date
          AssemblyLine."Due Date",                     // Shipment Date
          0,
          tmpReservationEntry."Reservation Status"::Surplus,                                           // Status = Surplus
                                                                                                       //'',
          TempTrackingSpecification);
    end;

    local procedure ForProdOrderLine(var ProdOrderLine: Record "Prod. Order Line"; TempTrackingSpecification: Record "Tracking Specification")
    begin
        CreateTracking(ProdOrderLine.RowID1,
          ProdOrderLine."Qty. per Unit of Measure",
          ProdOrderLine."Item No.",
          ProdOrderLine."Variant Code",
          ProdOrderLine."Location Code",
          ProdOrderLine.Description,
          0D,
          ProdOrderLine."Due Date",
          0,
          tmpReservationEntry."Reservation Status"::Surplus,
          TempTrackingSpecification);
    end;

    local procedure ForServiceLine(var ServiceLine: Record "Service Line"; TempTrackingSpecification: Record "Tracking Specification")
    var
        ShipmentDate: Date;
        ExpectedReceiptDate: Date;
    begin
        //CheckSalesDates(SalesLine, ShipmentDate, ExpectedReceiptDate);

        CreateTracking(ServiceLine.RowID1,
          ServiceLine."Qty. per Unit of Measure",   // ForQtyPerUOM
          ServiceLine."No.",
          ServiceLine."Variant Code",
          ServiceLine."Location Code",
          ServiceLine.Description,
          0D,                    // expected Recipe date
          ServiceLine."Posting Date",             // Shipment Date
          0,
          tmpReservationEntry."Reservation Status"::Surplus,                                      // Status = Surplus
                                                                                                  //'',
          TempTrackingSpecification);
    end;

    //Reservation,Tracking,Surplus,Prospect
    local procedure CreateTracking(RowID: Text[250]; ForQtyPerUOM: Decimal; ForItemNo: Code[20]; ForVariantCode: Code[10]; ForLocationCode: Code[10]; ForDescription: Text[50]; ForExpectedReceiptDate: Date; ForShipmentDate: Date; ForTransferredFromEntryNo: Integer; ForStatus: Enum "Reservation Status"; TempTrackSpec: Record "Tracking Specification")
    var
        StringArray: array[6] of Text[30];
        ReservationEntry: Record "Reservation Entry";
        LotReservEntry: Record "Reservation Entry";
        SecondRowID: Text[250];
        ItemTrkMgmt: Codeunit "Item Tracking Management";
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        ExpDate: Date;
        EntriesExist: Boolean;
        IsReclass: Boolean;
        tmpItemTrackingSetup: Record "Item Tracking Setup" temporary;
    begin
        OnBeforInsertItemTrackingLine(RowID, TempTrackSpec, NegAdjmt, IsDummySNTracking, DeleteExisting);

        if not TrackingAllowed(ForItemNo) then
            Error('Keine Artikelverfolgung erforderlich!');

        ItemTrkMgmt.DecomposeRowID(RowID, StringArray);

        Evaluate(TempTrackSpec."Source Type", StringArray[1]);
        Evaluate(TempTrackSpec."Source Subtype", StringArray[2]);
        TempTrackSpec."Source ID" := StringArray[3];
        TempTrackSpec."Source Batch Name" := StringArray[4];
        Evaluate(TempTrackSpec."Source Prod. Order Line", StringArray[5]);
        Evaluate(TempTrackSpec."Source Ref. No.", StringArray[6]);

        // Handle Expiration Date
        if TempTrackSpec."Expiration Date" = 0D then begin
            ExpDate := ItemTrkMgmt.ExistingExpirationDate(TempTrackSpec, false, EntriesExist);
            //ExpDate := ItemTrkMgmt.ExistingExpirationDate(ForItemNo, ForVariantCode, TempTrackSpec."Lot No.", TempTrackSpec."Serial No.", false, EntriesExist);
            if EntriesExist then begin
                TempTrackSpec."Expiration Date" := ExpDate;
                TempTrackSpec."Buffer Status2" := TempTrackSpec."Buffer Status2"::"ExpDate blocked";
            end else
                TempTrackSpec."Buffer Status2" := 0;

            if IsReclass then begin
                TempTrackSpec."New Expiration Date" := TempTrackSpec."Expiration Date";
                tmpItemTrackingSetup.INIT;
                tmpItemTrackingSetup."Lot No." := tempTrackSpec."Lot No.";
                tmpItemTrackingSetup."serial no." := tempTrackSpec."Serial No.";
                TempTrackSpec."Warranty Date" := ItemTrkMgmt.ExistingWarrantyDate(ForItemNo, ForVariantCode, tmpItemTrackingSetup, EntriesExist);

                //TempTrackSpec."Warranty Date" := ItemTrkMgmt.ExistingWarrantyDate(ForItemNo, ForVariantCode, TempTrackSpec."Lot No.", TempTrackSpec."Serial No.", EntriesExist);
            end;
        end;
        //

        CreateReservEntry.SetDates(TempTrackSpec."Warranty Date", TempTrackSpec."Expiration Date");     // only Date on positive adjustments - for "Warranty Date" and "Expiration Date"

        CreateReservEntry.SetApplyFromEntryNo(TempTrackSpec."Appl.-from Item Entry");                   // only Return Orders / Credit Memos

        CreateReservEntry.SetApplyToEntryNo(TempTrackSpec."Appl.-to Item Entry");                       // Fixed Apply-to Entry for outbound Posting

        LotReservEntry.INIT;
        lotreserventry."Serial No." := TempTrackSpec."Serial No.";
        LotReservEntry."Lot No." := TempTrackSpec."Lot No.";
        CreateReservEntry.CreateReservEntryfor(
          TempTrackSpec."Source Type",
          TempTrackSpec."Source Subtype",
          TempTrackSpec."Source ID",
          TempTrackSpec."Source Batch Name",
          TempTrackSpec."Source Prod. Order Line",
          TempTrackSpec."Source Ref. No.",
          ForQtyPerUOM,
          TempTrackSpec."Qty. to Handle",
          TempTrackSpec."Qty. to Handle (Base)",
          LotReservEntry);

        // >> AMP
        // CreateReservEntry.CreateReservEntryForTradgUnit(
        //  TempTrackSpec."Lot No. Trading Unit",
        //  TempTrackSpec."Trading Unit No.");

        // CreateReservEntry.SetAddDataQM(TempTrackSpec."No. of Units",
        //                               TempTrackSpec."External Lot No.",
        //                               TempTrackSpec."Quarantine Date",
        //                               TempTrackSpec."Retest Date",
        //                               TempTrackSpec."Entry Date",
        //                               TempTrackSpec.Status,
        //                               TempTrackSpec."New Status",
        //                               TempTrackSpec."New External Lot No.",
        //                               TempTrackSpec."New Quarantine Date",
        //                               TempTrackSpec."New Retest Date",
        //                               TempTrackSpec."New Entry Date",
        //                               TempTrackSpec."Warranty Date",
        //                               TempTrackSpec."New Warranty Date");
        // << AMP


        // Reclass
        if (TempTrackSpec."Source Type" = DATABASE::"Item Journal Line") and (TempTrackSpec."Source Subtype" = 4) then begin
            //CreateReservEntry.SetNewSerialLotNo(TempTrackSpec."New Serial No.", TempTrackSpec."New Lot No.");
            CreateReservEntry.SetNewTrackingFromNewTrackingSpecification(tempTrackSpec);
            CreateReservEntry.SetNewExpirationDate(TempTrackSpec."New Expiration Date");
            // >> AMP
            //  CreateReservEntry.SetNewTradingUnit(TempTrackSpec."New Lot No. Trading Unit", TempTrackSpec."New Trading Unit No.");
            //  CreateReservEntry.SetAddDataQM(TempTrackSpec."No. of Units",
            //                                 TempTrackSpec."External Lot No.",
            //                                 TempTrackSpec."Quarantine Date",
            //                                 TempTrackSpec."Retest Date",
            //                                 TempTrackSpec."Entry Date",
            //                                 TempTrackSpec.Status,
            //                                 TempTrackSpec."New Status",
            //                                 TempTrackSpec."New External Lot No.",
            //                                 TempTrackSpec."New Quarantine Date",
            //                                 TempTrackSpec."New Retest Date",
            //                                 TempTrackSpec."New Entry Date",
            //                                 TempTrackSpec."Warranty Date",
            //                                 TempTrackSpec."New Warranty Date");
            // << AMP
        end;

        CreateReservEntry.CreateEntry(
          ForItemNo,
          ForVariantCode,
          ForLocationCode,
          ForDescription,
          ForExpectedReceiptDate,
          ForShipmentDate,
          ForTransferredFromEntryNo,
          ForStatus);                                              // Reservation,Tracking,Surplus,Prospect


        // Synchronization of outbound transfer order: COPY // SynchronizeLinkedSources('');  Call in PAGE 6510 "On Close Page"
        if (TempTrackSpec."Source Type" = DATABASE::"Transfer Line") and
           (TempTrackSpec."Source Subtype" = 0) then begin
            SecondRowID := ItemTrkMgmt.ComposeRowID(TempTrackSpec."Source Type",
                1, TempTrackSpec."Source ID",
                TempTrackSpec."Source Batch Name", TempTrackSpec."Source Prod. Order Line",
                TempTrackSpec."Source Ref. No.");

            if (RowID <> '') and (SecondRowID <> '') then begin
                ItemTrkMgmt.SynchronizeItemTracking(RowID, SecondRowID, '');
            end;
        end;
    end;

    local procedure "---Check Item Tracking"()
    begin
    end;

    local procedure GetExistingExpDate(TrackingSpecification: Record "Tracking Specification"): Date
    var
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        ExpDate: Date;
        EntriesExist: Boolean;
    begin
        ExpDate := ItemTrackingMgt.ExistingExpirationDate(
            TrackingSpecification, false, EntriesExist);

        if ExpDate <> 0D then begin
            TrackingSpecification."Expiration Date" := ExpDate;
            TrackingSpecification."Buffer Status2" := TrackingSpecification."Buffer Status2"::"ExpDate blocked";
        end;
    end;

    local procedure "---Extended RowID Functions"()
    begin
    end;


    procedure TransLineRowID1(TransferLine: Record "Transfer Line"): Text[250]
    var
        ItemTrackingMgt: Codeunit "Item Tracking Management";
    begin
        exit(ItemTrackingMgt.ComposeRowID(DATABASE::"Transfer Line", 0, TransferLine."Document No.", '', 0, TransferLine."Line No."));
    end;


    procedure AssHeaderRowID(AssemblyHeader: Record "Assembly Header"): Text[250]
    var
        ItemTrackingMgt: Codeunit "Item Tracking Management";
    begin
        exit(ItemTrackingMgt.ComposeRowID(DATABASE::"Assembly Header", AssemblyHeader."Document Type".AsInteger(), AssemblyHeader."No.", '', 0, 0));
    end;


    procedure AssLineRowID(AssemblyLine: Record "Assembly Line"): Text[250]
    var
        ItemTrackingMgt: Codeunit "Item Tracking Management";
    begin
        exit(ItemTrackingMgt.ComposeRowID(DATABASE::"Assembly Line", AssemblyLine."Document Type".asInteger(), AssemblyLine."Document No.", '', 0, AssemblyLine."Line No."));
    end;

    local procedure "---Core"()
    begin
    end;

    local procedure GetRecRefFromVar(VarRec: Variant; var RecRef: RecordRef): Boolean
    var
        DataTypeManagement: Codeunit "Data Type Management";
    begin
        exit(DataTypeManagement.GetRecordRef(VarRec, RecRef));
    end;

    local procedure GetLotNoInfo(SourceDocLine: Variant; var TempTrackingSpecification2: Record "Tracking Specification"): Boolean
    var
        RecRef: RecordRef;
        SalesLine: Record "Sales Line";
        PurchaseLine: Record "Purchase Line";
        ItemJournalLine: Record "Item Journal Line";
        WarehouseReceiptLine: Record "Warehouse Receipt Line";
        TransferLine: Record "Transfer Line";
        AssemblyHeader: Record "Assembly Header";
        AssemblyLine: Record "Assembly Line";
    begin
        if GetRecRefFromVar(SourceDocLine, RecRef) then begin
            case RecRef.Number of
                37:
                    begin
                        RecRef.SetTable(SalesLine);
                        TempTrackingSpecification2."Item No." := SalesLine."No.";
                        TempTrackingSpecification2."Variant Code" := SalesLine."Variant Code";

                    end;

                39:  // Purch Line / Whse. Receipt Line
                    begin
                        RecRef.SetTable(PurchaseLine);
                        TempTrackingSpecification2."Item No." := PurchaseLine."No.";
                        TempTrackingSpecification2."Variant Code" := PurchaseLine."Variant Code";
                    end;

                83:
                    begin
                        RecRef.SetTable(ItemJournalLine);
                        TempTrackingSpecification2."Item No." := ItemJournalLine."No.";
                        TempTrackingSpecification2."Variant Code" := ItemJournalLine."Variant Code";

                        if ItemJournalLine."Entry Type" <> ItemJournalLine."Entry Type"::Transfer then begin
                            //ForItemJnlLine(ItemJournalLine, ForQty, ForQtyBase, ForSerialNo, ForLotNo, ForExpirationDate);
                        end else begin
                            Error('Muss noch ausprogrammiert werden!');
                            //ForTransferItemJnlLine(ItemJournalLine, ForQty, ForQtyBase, ForSerialNo, ForLotNo, ForExpirationDate , , , ,);
                        end;
                    end;

                900:
                    begin
                        RecRef.SetTable(AssemblyHeader);
                        TempTrackingSpecification2."Item No." := AssemblyHeader."Item No.";
                        TempTrackingSpecification2."Variant Code" := AssemblyHeader."Variant Code";
                    end;

                901:
                    begin
                        RecRef.SetTable(AssemblyLine);
                        TempTrackingSpecification2."Item No." := AssemblyLine."No.";
                        TempTrackingSpecification2."Variant Code" := AssemblyLine."Variant Code";
                    end;

                5741: // Transfer
                    begin
                        RecRef.SetTable(TransferLine);
                        TempTrackingSpecification2."Item No." := TransferLine."Item No.";
                        TempTrackingSpecification2."Variant Code" := TransferLine."Variant Code";
                    end;

                7317:  // Purch Line / Whse. Receipt Line
                    begin
                        RecRef.SetTable(WarehouseReceiptLine);
                        TempTrackingSpecification2."Item No." := WarehouseReceiptLine."Item No.";
                        TempTrackingSpecification2."Variant Code" := WarehouseReceiptLine."Variant Code";
                    end;
                else
                    Error('Für Tabelle %1 noch nicht ausprogrammiert!', RecRef.Number);
            end;
        end;
    end;

    local procedure TrackingAllowed(ItemNo: Code[20]): Boolean
    var
        Item: Record Item;
    begin
        // ToDo - generalize
        // mention SourceTableNo ???
        if Item.Get(ItemNo) then begin
            if Item."Item Tracking Code" <> '' then begin
                exit(true);

                // ToDo Check Doc Types
                //          lItemTracking.GET(lItem."Item Tracking Code");
                //          IF (NOT lItemTracking."Lot Specific Tracking") AND
                //             (NOT lItemTracking."SN Specific Tracking") THEN EXIT;

                //          // Get Charge Serial Info Inbound
                //          IF lItemTracking."SN Warehouse Tracking" THEN
                //            IF lItemTracking."SN Info. Inbound Must Exist" THEN
                //              lChargeSerialInfoInbound := TRUE;
                //          IF lItemTracking."Lot Warehouse Tracking" THEN
                //            IF lItemTracking."Lot Info. Inbound Must Exist" THEN
                //              lChargeSerialInfoInbound := TRUE;

                // dies sollte nicht notwendog sein - prüfen
                //    ItemTrackingCode.GET(Item."Item Tracking Code");
                //    SerialNoEditable := ItemTrackingCode."SN Warehouse Tracking";
                //    LotNoEditable := ItemTrackingCode."Lot Warehouse Tracking";
                //    IF ItemTrackingCode."Man. Expir. Date Entry Reqd." THEN BEGIN
                //      MHDEditable := ("Source Posting Typ" = "Source Posting Typ" :: Inbound);
                //      MHDNotEditable := NOT MHDEditable;
                //    END;
            end;
        end;

        exit(false);
    end;


    procedure DeleteExistingTracking(RowID: Text[250]; SerialNo: Code[20]; LotNo: Code[20])
    var
        ReservEntry: Record "Reservation Entry";
        ReservEntry2: Record "Reservation Entry";
    begin
        // >> TEMP-TEST
        if FindReservEntry(ReservEntry, RowID, SerialNo, LotNo) then begin
            ReservEntry.SetFilter("Reservation Status", '<>%1', ReservEntry."Reservation Status"::Reservation);
            if ReservEntry.FindSet then begin
                repeat
                    if ReservEntry."Reservation Status" = ReservEntry."Reservation Status"::Tracking then begin
                        if ReservEntry2.Get(ReservEntry."Entry No.", not ReservEntry.Positive) then begin
                            ReservEntry2.Delete;
                        end;
                    end;
                    ReservEntry.Delete;
                until ReservEntry.Next = 0;
            end;
        end;
        // >> TEMP-TEST
    end;


    procedure FindReservEntry(var ReservEntry: Record "Reservation Entry"; RowID: Text[250]; SerialNo: Code[20]; LotNo: Code[20]): Boolean
    var
        FilterArray: array[6] of Text[100];
        ItemTrkMngt: Codeunit "Item Tracking Management";
        int: Integer;
        Option: Option "0","1","2","3","4","5","6","7","8","9","10";
    begin
        Clear(FilterArray);
        ItemTrkMngt.DecomposeRowID(RowID, FilterArray);

        ReservEntry.Reset;
        Evaluate(int, FilterArray[1]);
        ReservEntry.SetRange("Source Type", int);
        Evaluate(Option, FilterArray[2]);
        int := Option;
        ReservEntry.SetRange("Source Subtype", int);
        ReservEntry.SetRange("Source ID", FilterArray[3]);
        ReservEntry.SetRange("Source Batch Name", FilterArray[4]);
        Evaluate(int, FilterArray[5]);
        ReservEntry.SetRange("Source Prod. Order Line", int);
        Evaluate(int, FilterArray[6]);
        ReservEntry.SetRange("Source Ref. No.", int);
        if SerialNo <> '' then begin
            ReservEntry.SetRange("Serial No.", SerialNo);
        end;
        if LotNo <> '' then begin
            ReservEntry.SetRange("Lot No.", LotNo);
        end;

        if ReservEntry.FindFirst then begin
            exit(true);
        end else begin
            exit(false);
        end;
    end;

    local procedure CreateSNLNInfo(CreateLotNoInfo: Boolean; CreateSerialNoInfo: Boolean)
    var
        LotNoInformation: Record "Lot No. Information";
        SerialNoInformation: Record "Serial No. Information";
    begin
        // Create Information (Lot No.)
        //    IF CreateLotNoInfo THEN BEGIN
        //      LotNoInformation.SETRANGE("Item No.",      Rec."Item No.");
        //      lLotNoInfo.SETRANGE("Variant Code",  Rec."Variant Code");
        //      lLotNoInfo.SETRANGE("Lot No.", TempLotNo);
        //      IF NOT lLotNoInfo.FINDFIRST() THEN BEGIN
        //        lLotNoInfo.INIT();
        //        lLotNoInfo."Item No." :=  "Item No.";
        //        lLotNoInfo."Lot No." := TempLotNo;
        //        lLotNoInfo.Description :=     FORMAT(Rec."No.");
        //        lLotNoInfo.INSERT(TRUE);
        //      END;
        //    END;

        // Create Information (Serial No.)
        //    IF CreateSerialNoInfo THEN BEGIN
        //      lSerialNoInfo.SETRANGE("Item No.",      Rec."Item No.");
        //      lSerialNoInfo.SETRANGE("Variant Code",  Rec."Variant Code");
        //      lSerialNoInfo.SETRANGE("Serial No.", TempSerialNo);
        //      IF NOT lSerialNoInfo.FINDFIRST() THEN BEGIN
        //        lSerialNoInfo.INIT();
        //        lSerialNoInfo."Item No."   := "Item No.";
        //        lSerialNoInfo."Serial No." := TempSerialNo;
        //        lSerialNoInfo.Description  := FORMAT(Rec."No.");
        //        lSerialNoInfo.INSERT(TRUE);
        //      END;
        //    END;
    end;

    local procedure "---ExistingReservation"()
    begin
    end;

    procedure ReservationExits(var ReservationEntry: Record "Reservation Entry"; RowID: Text[250]; SerialNo: Code[20]; LotNo: Code[20]): Boolean
    var
        FindExistingTracking: Boolean;
    begin
        FindExistingTracking := (SerialNo <> '') or (LotNo <> '');
        FindReservEntry(ReservationEntry, RowID, '', '');
        ReservationEntry.SetRange("Reservation Status", ReservationEntry."Reservation Status"::Reservation);
        if FindExistingTracking then begin
            ReservationEntry.SetRange("Serial No.", SerialNo);
            ReservationEntry.SetRange("Lot No.", LotNo);
        end;

        exit(not ReservationEntry.IsEmpty);
    end;

    procedure MergeTrackingInReservation(var ReservationEntry: Record "Reservation Entry"; QtyBaseToAssign: Decimal; SerialNo: Code[20])
    var
        ReservationEntry2: Record "Reservation Entry";
        SplittedReservEntry: Record "Reservation Entry";
        SplittedReservEntry2: Record "Reservation Entry";
        SignFactor: Integer;
    begin
        // WESCO , SN , for outbound
        // Called for Each Line / Tracking

        // ToDo Check Total qty from Line
        // ToDo Add LotNo
        // ToDo Inbound
        if ReservationEntry.Positive then begin
            SignFactor := 1;
        end else begin
            SignFactor := -1;
        end;

        if (ReservationEntry.Quantity) * SignFactor > 1 then begin
            // Splitt and Create New Entry
            SplittedReservEntry := ReservationEntry;
            SplittedReservEntry."Entry No." := 0;
            SplittedReservEntry.Validate("Quantity (Base)", 1 * SignFactor);
            SplittedReservEntry."Serial No." := SerialNo;
            SplittedReservEntry."Item Tracking" := SplittedReservEntry."Item Tracking"::"Serial No.";
            SplittedReservEntry.Insert(true);

            ReservationEntry.Validate("Quantity (Base)", ReservationEntry."Quantity (Base)" - 1 * SignFactor);
            ReservationEntry.Modify;

            ReservationEntry2.Get(ReservationEntry."Entry No.", not ReservationEntry.Positive);
            SplittedReservEntry2 := ReservationEntry2;
            SplittedReservEntry2."Entry No." := SplittedReservEntry."Entry No.";
            SplittedReservEntry2.Validate("Quantity (Base)", -1 * SignFactor);
            SplittedReservEntry2."Serial No." := SerialNo;
            SplittedReservEntry2."Item Tracking" := SplittedReservEntry2."Item Tracking"::"Serial No.";
            SplittedReservEntry2.Insert(true);

            ReservationEntry2.Validate("Quantity (Base)", ReservationEntry."Quantity (Base)" * -1 * SignFactor);
            ReservationEntry2.Modify;

            if ReservationEntry.Quantity = 0 then begin
                ReservationEntry.Delete;
                ReservationEntry2.Delete;
            end;
        end else begin
            // Assign
            ReservationEntry."Serial No." := SerialNo;
            ReservationEntry."Item Tracking" := SplittedReservEntry."Item Tracking"::"Serial No.";
            ReservationEntry.Modify;

            ReservationEntry2.Get(ReservationEntry."Entry No.", not ReservationEntry.Positive);
            ReservationEntry2."Serial No." := SerialNo;
            ReservationEntry2."Item Tracking" := SplittedReservEntry."Item Tracking"::"Serial No.";
            ReservationEntry2.Modify;
        end;
    end;

    //
    procedure RemoveTrackingFromReservation(var ReservationEntry: Record "Reservation Entry"; SerialNo: Code[20])
    var
        ReservationEntry2: Record "Reservation Entry";
    begin
        // WESCO , SN , for outbound
        // Called for Each Line / Tracking
        // ToDo Add LotNo
        // ToDo Inbound

        ReservationEntry."Serial No." := '';
        ReservationEntry."Item Tracking" := ReservationEntry."Item Tracking"::None;
        ReservationEntry.Modify;

        ReservationEntry2.Get(ReservationEntry."Entry No.", not ReservationEntry.Positive);
        ReservationEntry2."Serial No." := '';
        ReservationEntry2."Item Tracking" := ReservationEntry2."Item Tracking"::None;
        ReservationEntry2.Modify;
    end;

    local procedure "--Publisher"()
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforInsertItemTrackingLine(RowID: Text[250]; var TempTrackSpec: Record "Tracking Specification"; NegAdjmt: Boolean; IsDummySNTracking: Boolean; var DeleteExisting: Boolean)
    begin
    end;

    local procedure "--ADD"()
    begin
    end;

    local procedure AddDataFromLotNoInformation(SourceDocLine: Variant; var TempTrackingSpecification2: Record "Tracking Specification" temporary)
    var
        RecRef: RecordRef;
        LotNoInformation: Record "Lot No. Information";
    begin
        if TempTrackingSpecification2."Lot No." = '' then
            exit;

        if not GetRecRefFromVar(SourceDocLine, RecRef) then begin
            Error('Falsches Format bei íbergabe Parameter!');
        end;

        case RecRef.Number of
            37:  // Sales Line
                begin
                    TempTrackingSpecification2."Item No." := RecRef.Field(6).Value;
                    TempTrackingSpecification2."Variant Code" := RecRef.Field(5402).Value;
                end;

            39:  // Purch Line / Whse. Receipt Line
                begin
                    TempTrackingSpecification2."Item No." := RecRef.Field(6).Value;
                    TempTrackingSpecification2."Variant Code" := RecRef.Field(5402).Value;
                end;
            83:  // Item Jnl Line
                begin
                    TempTrackingSpecification2."Item No." := RecRef.Field(3).Value;
                    TempTrackingSpecification2."Variant Code" := RecRef.Field(5402).Value;
                end;

            900:
                begin
                    TempTrackingSpecification2."Item No." := RecRef.Field(10).Value;
                    TempTrackingSpecification2."Variant Code" := RecRef.Field(12).Value;
                end;

            901:
                begin
                    TempTrackingSpecification2."Item No." := RecRef.Field(11).Value;
                    TempTrackingSpecification2."Variant Code" := RecRef.Field(12).Value;
                end;

            5741: // Transfer
                begin
                    TempTrackingSpecification2."Item No." := RecRef.Field(3).Value;
                    TempTrackingSpecification2."Variant Code" := RecRef.Field(30).Value;
                end;

            //    7317:  // Whse. Receipt Line
            //      BEGIN
            //        ERROR('Für Tabelle %1 noch nicht ausprogrammiert!', RecRef.NUMBER);
            // //        TempTrackingSpecification2."Item No."     := RecRef.FIELD(14).VALUE;
            // //        TempTrackingSpecification2."Variant Code" := RecRef.FIELD(31).VALUE;
            //      END;
            else
                Error('Für Tabelle %1 noch nicht ausprogrammiert!', RecRef.Number);
        end;

        // >> AMP
        //TempTrackingSpecification2."Lot No. Trading Unit" := TempTrackingSpecification2."Lot No.";
        //TempTrackingSpecification2."Trading Unit No." := '';
        // << AMP
        LotNoInformation.Get(TempTrackingSpecification2."Item No.", TempTrackingSpecification2."Variant Code", TempTrackingSpecification2."Lot No.");
        //TempTrackingSpecification2."Expiration Date"  := LotNoInformation."Expiration Date"; not for neg. Adj.
        //TempTrackingSpecification2."External Lot No." := LotNoInformation."External Lot No.";

        //TempTrackingSpecification2.Status             := LotNoInformation.Status;
        //TempTrackingSpecification2."Entry Date"       := LotNoInformation."Entry Date";
    end;

    local procedure "---WESCO"()
    begin
    end;


    procedure SetIsDummySNTracking(DeleteExisting2: Boolean)
    begin
        IsDummySNTracking := true;
        DeleteExisting := DeleteExisting2;
    end;

    local procedure "--TrackingSetting"()
    begin
    end;

    // {Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer,Consumption,Output," ","Assembly Consumption","Assembly Output"}
    procedure GetItemTrackingSettings(ItemNo: Code[20]; EntryType: Enum "Item Ledger Entry Type"; Inbound: Boolean; BinRequired: Boolean; var SNRequired: Boolean; var LotRequired: Boolean)
    var
        Item: Record Item;
        ItemTrackingManagement: Codeunit "Item Tracking Management";
        ItemTrackingCode: Record "Item Tracking Code";
        SNInfoRequired: Boolean;
        LotInfoRequired: Boolean;
        ItemTrackingSetup: record "Item Tracking Setup" temporary;
    begin
        SNRequired := false;
        LotRequired := false;
        if not Item.Get(ItemNo) then
            exit;

        if (Item."Item Tracking Code" = '') or not ItemTrackingCode.Get(Item."Item Tracking Code") then
            exit;

        ItemTrackingManagement.GetItemTrackingSetup(ItemTrackingCode, EntryType, Inbound, ItemTrackingSetup);
        if BinRequired then
            ItemTrackingManagement.CheckWhseItemTrkgSetup(ItemNo);
        // ItemTrackingManagement.CheckWhseItemTrkgSetup(ItemNo, SNRequired, LotRequired, false);

        // Wesco special
        // IF (SNRequired) AND (Item."Serial Nos." <> '') THEN
        //  SNRequired := FALSE;
    end;


    procedure IsSNSpecTracking(TrackingCode: Code[10]): Boolean
    var
        ItemTrackingCode: Record "Item Tracking Code";
    begin
        if TrackingCode = '' then
            exit(false);

        ItemTrackingCode.Get(TrackingCode);
        exit(ItemTrackingCode."SN Specific Tracking");
    end;
}

