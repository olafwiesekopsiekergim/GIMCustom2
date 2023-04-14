page 50028 SequenceProductionPlanGIM
{
    PageType = Worksheet;
    SourceTable = "Prod. Order Line";
    SourceTableView = SORTING ("Sequence Work Center No.", "Sequence Position")
                      ORDER(Ascending)
                      WHERE ("Sequence Planning" = CONST (true),
                            Status = FILTER (< Finished));

    layout
    {
        area(content)
        {
            field("Sequence Workgroup"; SequenceWorkgroupCode)
            {
                Caption = 'Sequence Workgroup Code';
                TableRelation = "Work Center"."No." WHERE ("Sequence Planning" = CONST (true));

                trigger OnValidate()
                begin
                    SetRange("Sequence Work Center No.", SequenceWorkgroupCode);
                    CurrPage.Update(false);
                end;
            }
            repeater(Group)
            {
                field(Status; Status)
                {
                }
                field("Sequence Position"; "Sequence Position")
                {
                }
                field("Prod. Order No."; "Prod. Order No.")
                {
                }
                field(Description; Description)
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Remaining Quantity"; "Remaining Quantity")
                {
                }
                field("Start Date Sequence Planning"; "Start Date Sequence Planning")
                {
                }
                field("Start Time Sequence Planning"; "Start Time Sequence Planning")
                {
                }
                field(strItemNr; getItemNoFromProdOrder(Rec))
                {
                    Caption = 'Artikelnr.';
                }
                field(strOrderNr; getOrderNoFromProdOrderLine(Rec))
                {
                    Caption = 'Auftragsnr.';
                }
            }
        }
    }

    actions
    {
    }

    var
        strItemNo: Code[50];
        SequenceWorkgroupCode: Code[50];

    local procedure getItemNoFromProdOrder(ProdOrderLine: Record "Prod. Order Line") ret: Code[50]
    var
        ProdOrder: Record "Production Order";
    begin
        if not ProdOrder.Get(ProdOrderLine.Status, "Prod. Order No.") then
            ProdOrder.Init;
        exit(ProdOrder."Source No.");
    end;

    [Scope('Internal')]
    procedure setSequenceWorkGroupFilter(strSeqWorkgroupCode: Code[50])
    begin
        SequenceWorkgroupCode := strSeqWorkgroupCode;
    end;

    local procedure getOrderNoFromProdOrderLine(prodOrderLine: Record "Prod. Order Line") ret: Code[50]
    begin
        ret := GetSalesLine(prodOrderLine);
    end;

    local procedure GetSalesLine(ProdOrderLine: Record "Prod. Order Line") ret: Code[50]
    var
        SalesLine: Record "Sales Line";
        TempOrderTrackingEntry: Record "Order Tracking Entry" temporary;
        TrackingMgt: Codeunit OrderTrackingManagement;
        IsSalesLine: Boolean;
        i: Integer;
        TempSalesLine: Record "Sales Line" temporary;
    begin
        IsSalesLine := false;
        ret := '';
        TrackingMgt.SetProdOrderLine(ProdOrderLine);
        TrackingMgt.FindRecordsProductionSlip;

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

        if IsSalesLine then
            ret := TempSalesLine."Document No.";
    end;
}

