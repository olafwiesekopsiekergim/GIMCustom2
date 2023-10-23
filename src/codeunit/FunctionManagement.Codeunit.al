/// <summary>
/// Codeunit Function Management (ID 50005).
/// </summary>
codeunit 50005 "Function Management"
{
    // CC01 19.01.2022 CC.NR # Object created
    // CC02 01.02.2022 CC.NR # Added Functions CreateSerialInfoFromPO, CheckMainPOLineForTracking
    // CC03 17.01.2023 CC.DA # Added Function P99000786_OnAfterGetRecord, show active PRODBOM Version,P99000766_OnAfterGetRecord, show atvice Routing Version


    trigger OnRun()
    begin
    end;

    var
        Text50000: Label 'For the po line 10000 are only %1 serial nos allocated. Expeced %2.';

    //TODO: Ersatz für DOTNET Barcode
    // //
    // procedure CreateBarcode_Image(BarcodeValue: Text; var TmpBlob: Record TempBlob temporary; Height: Integer; Width: Integer; BarcodeType: Option "128",EAN13,QR; Rotate: Option "0","90","-90")
    // var
    //     BarcodeEncoder: DotNet BarcodeEncoder;
    //     BarcodeEncodingFormat: DotNet BarcodeEncodingFormat;
    //     BarcodeImageFormat: DotNet BarcodeImageFormat;
    //     NAVInStream: InStream;
    //     MediaGUID: Guid;
    //     FileManagement: Codeunit "File Management";
    //     ClientFile: Text;
    //     OStream: OutStream;
    //     MemoryStream: DotNet MemoryStream;
    //     Bitmap: DotNet Bitmap;
    //     RotateFlipType: DotNet RotateFlipType;
    //     ImageFormat: DotNet ImageFormat;
    // begin
    //     TmpBlob.Reset;
    //     TmpBlob.DeleteAll;

    //     TmpBlob."Primary Key" := 1;
    //     //ClientFile := FileManagement.ClientTempFileName('jpeg');

    //     BarcodeEncoder := BarcodeEncoder.BarcodeEncoder;
    //     case BarcodeType of
    //         0:
    //             BarcodeEncoder.BarcodeEncodingFormat := BarcodeEncodingFormat.CODE_128;
    //         1:
    //             BarcodeEncoder.BarcodeEncodingFormat := BarcodeEncodingFormat.EAN_13;
    //         2:
    //             BarcodeEncoder.BarcodeEncodingFormat := BarcodeEncodingFormat.QR_CODE;
    //     end;
    //     BarcodeEncoder.BarcodeImageFormat := BarcodeImageFormat.Png;
    //     BarcodeEncoder.Height := Height;
    //     BarcodeEncoder.Width := Width;

    //     MemoryStream := BarcodeEncoder.GetBarcodePicture(BarcodeValue);
    //     Bitmap := Bitmap.Bitmap(MemoryStream);
    //     case Rotate of
    //         Rotate::"90":
    //             Bitmap.RotateFlip(RotateFlipType.Rotate90FlipNone);
    //         Rotate::"-90":
    //             Bitmap.RotateFlip(RotateFlipType.Rotate90FlipXY);
    //     end;

    //     MemoryStream.Close;

    //     MemoryStream := MemoryStream.MemoryStream();
    //     Bitmap.Save(MemoryStream, ImageFormat.Png);

    //     TmpBlob.Blob.CreateOutStream(OStream);
    //     MemoryStream.WriteTo(OStream);

    //     TmpBlob.Insert;
    //     TmpBlob.CalcFields(Blob);
    // end;

    procedure PrintTypShieldFromPO(ProductionOrder: Record "Production Order")
    var
        ProdOrderLine: Record "Prod. Order Line";
    begin
        ProdOrderLine.SetRange(Status, ProductionOrder.Status);
        ProdOrderLine.SetRange("Prod. Order No.", ProductionOrder."No.");
        if not ProdOrderLine.FindFirst then
            exit;

        PrintTypShieldFromPOLine(ProdOrderLine);  //TODO: Report wieder einbauen
    end;

    // TODO: Report einabuen
    procedure PrintTypShieldFromPOLine(ProdOrderLine: Record "Prod. Order Line")
    var
        ReservationEntry: Record "Reservation Entry";
        TypLabelOutside: Report "Typ Label (Outside)";
        TypLabelInside: Report "Typ Label (inside)";
        i: Integer;
        EndDate: Date;
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        if ProdOrderLine.Status <> ProdOrderLine.Status::Finished then begin
            ReservationEntry.SetRange("Source ID", ProdOrderLine."Prod. Order No.");
            ReservationEntry.SetRange("Item Tracking", ReservationEntry."Item Tracking"::"Serial No.");
            ReservationEntry.SetRange("Source Type", 5406);
            ReservationEntry.SetRange("Source Prod. Order Line", ProdOrderLine."Line No.");
            if ReservationEntry.FindSet then begin
                repeat
                    i += 1;
                    if ProdOrderLine."ccs px End Date Seq. Planning" <> 0D then
                        EndDate := ProdOrderLine."ccs px End Date Seq. Planning"
                    else
                        EndDate := ProdOrderLine."Due Date";
                    TypLabelOutside.SetValues(i, ReservationEntry."Item No.", ReservationEntry."Serial No.", EndDate);
                    TypLabelInside.SetValues(i, ReservationEntry."Item No.", ReservationEntry."Serial No.", EndDate);

                until ReservationEntry.Next = 0;

                // TypLabelOutside.Print('');
                // TypLabelInside.Print('');

                IF NOT GUIALLOWED THEN BEGIN
                    TypLabelOutside.PRINT('');
                    TypLabelInside.PRINT('');
                END ELSE BEGIN
                    TypLabelOutside.RUNMODAL;
                    TypLabelInside.RUNMODAL;
                END;

            end;
        end else begin
            ItemLedgerEntry.SetCurrentKey("Order Type", "Order No.", "Order Line No.",
              "Entry Type", "Prod. Order Comp. Line No.");
            ItemLedgerEntry.SetRange("Order Type", ItemLedgerEntry."Order Type"::Production);
            ItemLedgerEntry.SetRange("Order No.", ProdOrderLine."Prod. Order No.");
            ItemLedgerEntry.SetRange("Order Line No.", ProdOrderLine."Line No.");
            ItemLedgerEntry.SetRange("Entry Type", ItemLedgerEntry."Entry Type"::Output);
            ItemLedgerEntry.SetRange("Prod. Order Comp. Line No.", 0);
            if ItemLedgerEntry.FindSet then begin
                repeat
                    i += 1;
                    if ProdOrderLine."ccs PX End Date Seq. Planning" <> 0D then
                        EndDate := ProdOrderLine."ccs px End Date Seq. Planning"
                    else
                        EndDate := ProdOrderLine."Due Date";
                    TypLabelOutside.SetValues(i, ItemLedgerEntry."Item No.", ItemLedgerEntry."Serial No.", EndDate);
                    TypLabelInside.SetValues(i, ItemLedgerEntry."Item No.", ItemLedgerEntry."Serial No.", EndDate);
                until ItemLedgerEntry.Next = 0;
                TypLabelOutside.RunModal;
                TypLabelInside.RunModal;
            end;
        end;

    end;


    procedure CreateSerialInfoFromPO(ProductionOrder: Record "Production Order")
    var
        ReservationEntry: Record "Reservation Entry";
        ProdOrderLine: Record "Prod. Order Line";
        SerialNoInformation: Record "Serial No. Information";
        ItemTrackingCode: Record "Item Tracking Code";
        Item: Record Item;
    begin
        // >> CC02
        // IF ProductionOrder.Status <> ProductionOrder.Status::"Firm Planned" THEN
        exit;
        CheckMainPOLineForTracking(ProductionOrder);
        ProdOrderLine.SetRange(Status, ProductionOrder.Status);
        ProdOrderLine.SetRange("Prod. Order No.", ProductionOrder."No.");
        if not ProdOrderLine.FindFirst then
            exit;

        repeat
            ReservationEntry.SetRange("Source ID", ProdOrderLine."Prod. Order No.");
            ReservationEntry.SetRange("Item Tracking", ReservationEntry."Item Tracking"::"Serial No.");
            ReservationEntry.SetRange("Source Type", 5406);
            ReservationEntry.SetRange("Source Prod. Order Line", ProdOrderLine."Line No.");
            if ReservationEntry.FindSet then
                repeat
                    SerialNoInformation.Init;
                    SerialNoInformation.Validate("Item No.", ReservationEntry."Item No.");
                    SerialNoInformation."Variant Code" := '';
                    SerialNoInformation.Validate("Serial No.", ReservationEntry."Serial No.");
                    // P001
                    Item.Get(ReservationEntry."Item No.");
                    ItemTrackingCode.Get(Item."Item Tracking Code");
                    SerialNoInformation."CCS QA Status (Lot/SN)" := ItemTrackingCode."ccs qa Initial Status";

                    SerialNoInformation."ccs qa Quantity" := ReservationEntry.Quantity;
                    SerialNoInformation.Insert;

                until ReservationEntry.Next = 0;
        until ProdOrderLine.Next = 0;




        // << CC02
    end;

    local procedure CheckMainPOLineForTracking(ProductionOrder: Record "Production Order")
    var
        ProdOrderLine: Record "Prod. Order Line";
        ReservationEntry: Record "Reservation Entry";
        Item: Record Item;
        i: Integer;
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        ReservationEntry2: Record "Reservation Entry";
    begin
        // >> CC02
        if not Item.Get(ProductionOrder."Source No.") then
            exit;
        if Item."Item Tracking Code" = '' then
            exit;
        ProdOrderLine.SetRange(Status, ProductionOrder.Status);
        ProdOrderLine.SetRange("Prod. Order No.", ProductionOrder."No.");
        ProdOrderLine.SetRange("Line No.", 10000);
        if not ProdOrderLine.FindFirst then
            exit;
        ReservationEntry.SetRange("Source ID", ProdOrderLine."Prod. Order No.");
        ReservationEntry.SetRange("Item Tracking", ReservationEntry."Item Tracking"::"Serial No.");
        ReservationEntry.SetRange("Source Type", 5406);
        ReservationEntry.SetRange("Source Prod. Order Line", ProdOrderLine."Line No.");
        if not ReservationEntry.FindSet then begin
            //  FOR i := 1 TO ProdOrderLine.Quantity DO BEGIN
            //          CreateReservEntry.CreateReservEntryFor(
            //                5406,
            //                0,
            //                '',
            //                '',
            //                10000,
            //                10000,
            //                ProdOrderLine."Qty. per Unit of Measure",
            //                ProdOrderLine.Quantity,
            //                ProdOrderLine."Quantity (Base)",
            //                'SN' + FORMAT(i),
            //                '');
            //  END;
        end;
        //COMMIT;
        //ERROR('raus');
        if ReservationEntry.Count < ProdOrderLine.Quantity then
            Message(StrSubstNo(Text50000, ReservationEntry.Count, ProdOrderLine.Quantity));
        // << CC02
    end;

    //
    procedure GetOrderNoFromTransferOrder(TransferHeader: Record "Transfer Header"; Type: Option SalesOrder,ProdOrder): Code[20]
    var
        ReservationEntry: Record "Reservation Entry";
        ReservationEntry2: Record "Reservation Entry";
        TransferLine: Record "Transfer Line";
        SerialNo: Integer;
    begin
        TransferLine.SetRange("Document No.", TransferHeader."No.");
        if TransferLine.FindFirst then begin
            ReservationEntry.SetRange("Item No.", TransferLine."Item No.");
            ReservationEntry.SetRange("Source Type", 5741);
            ReservationEntry.SetRange("Source ID", TransferHeader."No.");
            if ReservationEntry.FindFirst then begin
                ReservationEntry2.SetRange("Entry No.", ReservationEntry."Entry No.");
                ReservationEntry2.SetRange("Item No.", TransferLine."Item No.");
                ReservationEntry2.SetRange("Serial No.", ReservationEntry."Serial No.");

                case Type of
                    Type::SalesOrder:
                        begin
                            ReservationEntry2.SetRange("Source Type", 37);
                            ReservationEntry2.SetRange("Source Subtype", 1);
                        end;
                    Type::ProdOrder:
                        begin
                            ReservationEntry2.SetRange("Source Type", 5406);
                            ReservationEntry2.SetRange("Source Subtype", 3);
                        end;
                end;

                if ReservationEntry2.FindFirst then
                    exit(ReservationEntry2."Source ID");
            end;
        end;
    end;

    //
    procedure GetSalesLineFromProdOrderLine(ProdOrderLine: Record "Prod. Order Line"; var TempSalesLine: Record "Sales Line" temporary)
    var
        SalesLine: Record "Sales Line";
        TempOrderTrackingEntry: Record "Order Tracking Entry" temporary;
        TrackingMgt: Codeunit OrderTrackingManagement;
        IsSalesLine: Boolean;
        i: Integer;
    begin
        IsSalesLine := false;

        TrackingMgt.SetProdOrderLine(ProdOrderLine);
        TrackingMgt.FindRecordsWithoutMessage();

        while not IsSalesLine do begin
            i += 1;
            if (i = 1) then begin
                TrackingMgt.FindRecord('=>', TempOrderTrackingEntry);
            end else begin
                if (TrackingMgt.GetNextRecord(1, TempOrderTrackingEntry) <> 1) then
                    exit;
            end;

            if (TempOrderTrackingEntry."From Type" = 37) and (TempOrderTrackingEntry."From Subtype" = 1)
              and (TempOrderTrackingEntry."From ID" <> '') and (TempOrderTrackingEntry."From Ref. No." <> 0)
            then begin
                TempSalesLine.DeleteAll;
                if not SalesLine.Get(TempOrderTrackingEntry."From Subtype", TempOrderTrackingEntry."From ID", TempOrderTrackingEntry."From Ref. No.") then
                    exit;
                TempSalesLine := SalesLine;
                TempSalesLine.Insert;
                IsSalesLine := true;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, 99000786, 'OnAfterGetRecordEvent', '', false, false)]
    //
    procedure P99000786_OnAfterGetRecord(var Rec: Record "Production BOM Header")
    var
        VersionMgt: Codeunit VersionManagement;
        ActiveVersionCode: Code[20];
        ProdBOMVersion: Record "Production BOM Version";
    begin
        // >> CC03
        with Rec do begin
            ActiveVersionCode := VersionMgt.GetBOMVersion("No.", WorkDate, true);
            if ActiveVersionCode <> '' then begin
                ProdBOMVersion.SetRange("Production BOM No.", "No.");
                ProdBOMVersion.SetRange("Version Code", ActiveVersionCode);
                PAGE.Run(PAGE::"Production BOM Version", ProdBOMVersion);
                ActiveVersionCode := VersionMgt.GetBOMVersion("No.", WorkDate, true);
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, 99000766, 'OnAfterGetRecordEvent', '', false, false)]
    //
    procedure P99000766_OnAfterGetRecord(var Rec: Record "Routing Header")
    var
        VersionMgt: Codeunit VersionManagement;
        ActiveVersionCode: Code[20];
        RtngVersion: Record "Routing Version";
    begin
        with Rec do begin
            ActiveVersionCode := VersionMgt.GetRtngVersion("No.", WorkDate, true);
            if ActiveVersionCode <> '' then begin
                RtngVersion.SetRange("Routing No.", "No.");
                RtngVersion.SetRange("Version Code", ActiveVersionCode);
                PAGE.Run(PAGE::"Routing Version", RtngVersion);
                ActiveVersionCode := VersionMgt.GetRtngVersion("No.", WorkDate, true);
            end;
        end;
        // << CC03
    end;


}

