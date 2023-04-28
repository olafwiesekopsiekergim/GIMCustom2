report 50079 "Production Slip"
{
    // //GIM0010 20.05.2022
    // Einfügen Barcode STLTAN
    // Einfügen Barcode TANSerial
    // Einfügen ShipmentDate "from Sales Line"
    // CC02  23.03.2023  CCMUE.WH  Print transfer to location
    DefaultLayout = RDLC;
    RDLCLayout = './ProductionSlip.rdlc';

    Caption = 'Production Slip';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1000000000; Table5405)
        {
            DataItemTableView = SORTING (Status, No.);
            RequestFilterFields = "No.";
            column(PoCaption; PoCaption)
            {
            }
            column(OrderCaption; OrderCaption)
            {
            }
            column(CustomerCaption; CustomerCaption)
            {
            }
            column(ShipDateCaption; ShipDateCaption)
            {
            }
            column(ShipmentDateCaption; ShipmentDateCaption)
            {
            }
            column(ProdOrderRoutingLineCaption; ProdOrderRoutingLineCaption)
            {
            }
            column(DescriptionCaption; DescriptionCaption)
            {
            }
            column(QtyCaption; QtyCaption)
            {
            }
            column(PackingCaption; PackingCaption)
            {
            }
            column(TANCaption; TANCaption)
            {
            }
            column(SerialNoCaption; SerialNoCaption)
            {
            }
            column(STLTANCaption; STLTANCaption)
            {
            }
            column(TANSerialCaption; TANSerialCaption)
            {
            }
            column(PrintDate; PrintDate)
            {
            }
            column(Workdate; FORMAT(WORKDATE))
            {
            }
            column(POLineItemNo; POLineItemNo)
            {
            }
            column(POLineDescription; POLineDescription)
            {
            }
            column(POLineDescription2; POLineDescription2)
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(TransferCaption; TransferCaption)
            {
            }
            column(TransferToLocationCaption; TransferToLocationCaption)
            {
            }
            column(NameCaption; NameCaption)
            {
            }
            dataitem(DataItem1000000002; Table5406)
            {
                DataItemLink = Status = FIELD (Status),
                               Prod. Order No.=FIELD(No.);
                DataItemTableView = SORTING (Status, Prod. Order No., Line No.);
                column(Status; Status)
                {
                }
                column(ProdOrderNo; "Prod. Order No.")
                {
                }
                column(LineNo; "Line No.")
                {
                }
                column(RoutingLineNo; TempProdOrderRoutingLine."No.")
                {
                }
                column(RoutingTan; TempProdOrderRoutingLine."Routing TAN")
                {
                }
                column(CustomerName; TempCustomer.Name)
                {
                }
                column(CustomerName2; TempCustomer."Name 2")
                {
                }
                column(CustomerAddress; TempCustomer."Address 2")
                {
                }
                column(CustomerPostCode; TempCustomer."Post Code")
                {
                }
                column(CustomerCity; TempCustomer.City)
                {
                }
                column(CustomerCountryRegion; TempCustomer."Country/Region Code")
                {
                }
                column(OrderNo; TempSalesLine."Document No.")
                {
                }
                column(TransferNo; TempTransferLine."Document No.")
                {
                }
                column(FixDateDelivery; SalesHeader."fix-Termin Lieferung")
                {
                }
                column(ShipmentDate; TempSalesLine."Shipment Date")
                {
                }
                column(PackingItemNo; PackingItemNo)
                {
                }
                column(PackingPosition; PackingPosition)
                {
                }
                column(TranferToLocation_Code; TranferToLocation.Code)
                {
                }
                column(TranferToLocation_Name; TranferToLocation.Name)
                {
                }
                dataitem(DataItem1000000001; Table2000000026)
                {
                    DataItemTableView = SORTING (Number);
                    column(Number; Number)
                    {
                    }
                    column(SerialNo; SerialNoArray[Number])
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        // //GIM0009 ++++ Wenn Seriennummer vorhanden mit in den TAN übernehmen
                        // IF SerialNoArray[Number]<>'' THEN
                        //  SerRoutingTAN:=TempProdOrderRoutingLine."Routing TAN"+'$'+SerialNoArray[Number];
                        // //----
                    end;

                    trigger OnPreDataItem()
                    begin
                        SETRANGE(Number, 1, "Production Order".Quantity);
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    GetProdOrderRtngLine("Prod. Order Line");
                    GetSalesLine("Prod. Order Line");
                    // >> CC01
                    GetTransferLine("Prod. Order Line");
                    // << CC01
                    GetCustomer(TempSalesLine."Sell-to Customer No.");
                    IF NOT SalesHeader.GET(TempSalesLine."Document Type", TempSalesLine."Document No.") THEN
                        SalesHeader.INIT;
                    GetPackingItems(TempSalesLine);
                    GetSerialNoArray("Prod. Order Line");
                end;
            }

            trigger OnAfterGetRecord()
            begin
                GetAllPoLines("Production Order");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        PoCaption: Label 'Production Order';
        OrderCaption: Label 'Order';
        CustomerCaption: Label 'Customer';
        ShipDateCaption: Label 'Ship Date';
        ProdOrderRoutingLineCaption: Label 'Prod. Order Rtng.';
        DescriptionCaption: Label 'Description';
        QtyCaption: Label 'Quantity';
        PackingCaption: Label 'Packing';
        TANCaption: Label 'TAN';
        SerialNoCaption: Label 'Serial No.';
        RoutingTan: Code[20];
        RoutingLineNo: Code[20];
        PrintDate: Label 'Print Date';
        TempCustomer: Record "18" temporary;
        TempSalesLine: Record "37" temporary;
        TempProdOrderRoutingLine: Record "5409" temporary;
        SalesHeader: Record "36";
        POLineItemNo: Text;
        POLineDescription: Text;
        POLineDescription2: Text;
        PackingPosition: Text;
        PackingItemNo: Text;
        SerialNoArray: array[20] of Code[20];
        TempTransferLine: Record "5741" temporary;
        TransferCaption: Label 'Transfer';
        STLTANCaption: Label 'TAN Stückliste';
        TANSerialCaption: Label 'TAN + Seriennummer';
        ShipmentDateCaption: Label 'Waren-ausgangsdatum';
        SerRoutingTAN: Code[20];
        TranferToLocation: Record "14";
        TransferToLocationCaption: Label 'Transfer to location';
        NameCaption: Label 'Name';

    local procedure GetCustomer(CustomerNo: Code[20])
    var
        Customer: Record "18";
    begin
        TempCustomer.DELETEALL;
        IF NOT Customer.GET(CustomerNo) THEN
            EXIT;
        TempCustomer := Customer;
        TempCustomer.INSERT;
    end;

    local procedure GetSalesLine(ProdOrderLine: Record "5406")
    var
        SalesLine: Record "37";
        TempOrderTrackingEntry: Record "99000799" temporary;
        TrackingMgt: Codeunit "99000778";
        IsSalesLine: Boolean;
        i: Integer;
    begin
        IsSalesLine := FALSE;

        TrackingMgt.SetProdOrderLine(ProdOrderLine);
        TrackingMgt.FindRecordsProductionSlip;

        WHILE NOT IsSalesLine DO BEGIN
            i += 1;
            IF (i = 1) THEN BEGIN
                TrackingMgt.FindRecord('=>', TempOrderTrackingEntry);
            END ELSE BEGIN
                IF (TrackingMgt.GetNextRecord(1, TempOrderTrackingEntry) <> 1) THEN
                    EXIT;
            END;

            IF (TempOrderTrackingEntry."From Type" = 37) AND (TempOrderTrackingEntry."From Subtype" = 1)
              AND (TempOrderTrackingEntry."From ID" <> '') AND (TempOrderTrackingEntry."From Ref. No." <> 0)
            THEN BEGIN
                TempSalesLine.DELETEALL;
                IF NOT SalesLine.GET(TempOrderTrackingEntry."From Subtype", TempOrderTrackingEntry."From ID", TempOrderTrackingEntry."From Ref. No.") THEN
                    EXIT;
                TempSalesLine := SalesLine;
                TempSalesLine.INSERT;
                IsSalesLine := TRUE;
            END;
        END;
    end;

    local procedure GetTransferLine(ProdOrderLine: Record "5406")
    var
        IsTransferLine: Boolean;
        TempOrderTrackingEntry: Record "99000799" temporary;
        TrackingMgt: Codeunit "99000778";
        i: Integer;
        TransferLine: Record "5741";
    begin
        // >> CC01
        IsTransferLine := FALSE;

        TrackingMgt.SetProdOrderLine(ProdOrderLine);
        TrackingMgt.FindRecordsProductionSlip;

        WHILE NOT IsTransferLine DO BEGIN
            i += 1;
            IF (i = 1) THEN BEGIN
                TrackingMgt.FindRecord('=>', TempOrderTrackingEntry);
            END ELSE BEGIN
                IF (TrackingMgt.GetNextRecord(1, TempOrderTrackingEntry) <> 1) THEN
                    EXIT;
            END;

            IF (TempOrderTrackingEntry."From Type" = 5741) AND (TempOrderTrackingEntry."From Subtype" = 0)
              AND (TempOrderTrackingEntry."From ID" <> '') AND (TempOrderTrackingEntry."From Ref. No." <> 0)
            THEN BEGIN
                TempTransferLine.DELETEALL;
                IF NOT TransferLine.GET(TempOrderTrackingEntry."From ID", TempOrderTrackingEntry."From Ref. No.") THEN
                    EXIT;
                TempTransferLine := TransferLine;
                TempTransferLine.INSERT;
                IsTransferLine := TRUE;
                // >> CC02
                TranferToLocation.GET(TempTransferLine."Transfer-to Code");
                // << CC02
            END;
        END;
        // << CC01
    end;

    local procedure GetProdOrderRtngLine(ProdOrderLine: Record "5406")
    var
        ProdOrderRoutingLine: Record "5409";
    begin
        TempProdOrderRoutingLine.DELETEALL;

        ProdOrderRoutingLine.SETRANGE(Status, ProdOrderLine.Status);
        ProdOrderRoutingLine.SETRANGE("Prod. Order No.", ProdOrderLine."Prod. Order No.");
        ProdOrderRoutingLine.SETRANGE("Routing Reference No.", ProdOrderLine."Line No.");
        IF NOT ProdOrderRoutingLine.FINDFIRST THEN
            EXIT;
        TempProdOrderRoutingLine := ProdOrderRoutingLine;
        TempProdOrderRoutingLine.INSERT;
    end;

    local procedure GetPackingItems(SalesLine: Record "37")
    var
        SalesLine2: Record "37";
        CRLF: Text[2];
    begin
        PackingItemNo := '';
        PackingPosition := '';

        CRLF := '';
        CRLF[1] := 13;
        CRLF[2] := 10;


        SalesLine2.SETRANGE("Document Type", SalesLine."Document Type");
        SalesLine2.SETRANGE("Document No.", SalesLine."Document No.");
        SalesLine2.SETFILTER(Position, '%1', SalesLine.Position + '*');
        SalesLine2.SETFILTER("Line No.", '<>%1', SalesLine."Line No.");
        SalesLine2.SETRANGE("Print on Slip", TRUE);
        IF NOT SalesLine2.FINDSET THEN
            EXIT;

        REPEAT
            PackingItemNo += SalesLine2."No." + CRLF;
            PackingPosition += SalesLine2.Position + CRLF;
        UNTIL SalesLine2.NEXT = 0;
    end;

    local procedure GetAllPoLines(ProductionOrder: Record "5405")
    var
        ProdOrderLine: Record "5406";
        CRLF: Text[2];
    begin
        POLineDescription := '';
        POLineDescription2 := '';
        POLineItemNo := '';

        CRLF := '';
        CRLF[1] := 13;
        CRLF[2] := 10;

        ProdOrderLine.SETRANGE("Prod. Order No.", ProductionOrder."No.");
        ProdOrderLine.SETRANGE(Status, ProductionOrder.Status);
        ProdOrderLine.FINDSET;
        REPEAT
            POLineDescription += ProdOrderLine.Description + CRLF;
            POLineDescription2 += ProdOrderLine."Description 2" + CRLF;
            POLineItemNo += ProdOrderLine."Item No." + CRLF;
        UNTIL ProdOrderLine.NEXT = 0;
    end;

    local procedure GetSerialNoArray(ProdOrderLine: Record "5406")
    var
        ReservationEntry: Record "337";
        i: Integer;
    begin
        CLEAR(SerialNoArray);
        ReservationEntry.SETRANGE("Source ID", ProdOrderLine."Prod. Order No.");
        ReservationEntry.SETRANGE("Item Tracking", ReservationEntry."Item Tracking"::"Serial No.");
        ReservationEntry.SETRANGE("Source Type", 5406);
        ReservationEntry.SETRANGE("Source Prod. Order Line", ProdOrderLine."Line No.");
        IF NOT ReservationEntry.FINDSET THEN
            EXIT;
        REPEAT
            i += 1;
            SerialNoArray[i] := ReservationEntry."Serial No.";
        UNTIL (ReservationEntry.NEXT = 0) OR (i = 20);
    end;
}

