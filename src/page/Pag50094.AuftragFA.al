page 50094 "Auftrag-FA"
{
    // P0029 02.03.17 DEBIE.ARE New object

    Caption = 'Order-Prod.';
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Sales Line";
    SourceTableTemporary = true;
    SourceTableView = SORTING("Document Type", "Document No.", "Line No.")
                      ORDER(Ascending)
                      WHERE("Document Type" = FILTER(Order));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Document Type"; Rec."Document Type")
                {
                    Editable = ESACC_F1_Editable;
                    HideValue = ESACC_F1_HideValue;
                    Visible = ESACC_F1_Visible;
                }
                field("Document No."; Rec."Document No.")
                {
                    Editable = ESACC_F3_Editable;
                    HideValue = ESACC_F3_HideValue;
                    Visible = ESACC_F3_Visible;
                }
                // field("Description 5"; "Description 5")
                // {
                //     Caption = 'Description 5';
                // }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    Editable = ESACC_F10_Editable;
                    HideValue = ESACC_F10_HideValue;
                    Visible = ESACC_F10_Visible;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    Editable = ESACC_F2_Editable;
                    HideValue = ESACC_F2_HideValue;
                    Visible = ESACC_F2_Visible;
                }
                field("SalesHeader.""Sell-to Country/Region Code"""; SalesHeader."Sell-to Country/Region Code")
                {
                    Caption = 'Sell-to Country/Region Code';
                }
                field("SalesHeader.""Salesperson Code"""; SalesHeader."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }
                // field("SalesHeader.""Salesperson Code 2"""; SalesHeader."Salesperson Code 2")
                // {
                //     Caption = 'Salesperson Code 2';
                // }
                field("SalesHeader.""Bill-to Name"""; SalesHeader."Bill-to Name")
                {
                    Caption = 'Ship-to Name';
                }
                field("SalesHeader.""Ship-to Name"""; SalesHeader."Ship-to Name")
                {
                    Caption = 'Lief. an Name';
                }
                field("SalesHeader.""Ship-to Post Code"""; SalesHeader."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';
                }
                field("SalesHeader.""Ship-to City"""; SalesHeader."Ship-to City")
                {
                    Caption = 'Ship-to City';
                }
                field("SalesHeader.""Creation Date"""; SalesHeader."Creation Date")
                {
                    Caption = 'Erstelluingsdatum Auftrag';
                }
                field(Type; Rec.Type)
                {
                    Editable = ESACC_F5_Editable;
                    HideValue = ESACC_F5_HideValue;
                    Visible = ESACC_F5_Visible;
                }
                field("No."; Rec."No.")
                {
                    Editable = ESACC_F6_Editable;
                    HideValue = ESACC_F6_HideValue;
                    Visible = ESACC_F6_Visible;
                }
                field(Description; Rec.Description)
                {
                    Editable = ESACC_F11_Editable;
                    HideValue = ESACC_F11_HideValue;
                    Visible = ESACC_F11_Visible;
                }
                field("Location Code"; Rec."Location Code")
                {
                    Editable = ESACC_F7_Editable;
                    HideValue = ESACC_F7_HideValue;
                    Visible = true;
                }
                field(Reserve; Rec.Reserve)
                {
                    Editable = ESACC_F96_Editable;
                    HideValue = ESACC_F96_HideValue;
                    Visible = ESACC_F96_Visible;
                }
                field(Quantity; Rec.Quantity)
                {
                    Editable = ESACC_F15_Editable;
                    HideValue = ESACC_F15_HideValue;
                    Visible = ESACC_F15_Visible;
                }
                field("Reserved Qty. (Base)"; Rec."Reserved Qty. (Base)")
                {
                    HideValue = ESACC_F5495_HideValue;
                    Visible = ESACC_F5495_Visible;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    Editable = ESACC_F5407_Editable;
                    HideValue = ESACC_F5407_HideValue;
                    Visible = ESACC_F5407_Visible;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    Editable = ESACC_F22_Editable;
                    HideValue = ESACC_F22_HideValue;
                    Visible = ESACC_F22_Visible;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    BlankZero = true;
                    Editable = ESACC_F103_Editable;
                    HideValue = ESACC_F103_HideValue;
                    Visible = ESACC_F103_Visible;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    Editable = ESACC_F75_Editable;
                    HideValue = ESACC_F75_HideValue;
                    Visible = ESACC_F75_Visible;
                }
                field("Item.""Item Category Code"""; Item."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }
                field("Job No."; Rec."Job No.")
                {
                    Editable = ESACC_F45_Editable;
                    HideValue = ESACC_F45_HideValue;
                    Visible = false;
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                    Editable = ESACC_F52_Editable;
                    HideValue = ESACC_F52_HideValue;
                    Visible = false;
                }
                field("SalesHeader.""fix-Termin Lieferung"""; SalesHeader."fix-Termin Lieferung")
                {
                    Caption = 'fix-Termin Lieferung';
                }
                field("Requested Delivery Date"; Rec."Requested Delivery Date")
                {
                    Editable = ESACC_F5790_Editable;
                    HideValue = ESACC_F5790_HideValue;
                    Visible = ESACC_F5790_Visible;
                }
                field("Promised Delivery Date"; Rec."Promised Delivery Date")
                {
                    Editable = ESACC_F5791_Editable;
                    HideValue = ESACC_F5791_HideValue;
                    Visible = ESACC_F5791_Visible;
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    Editable = ESACC_F16_Editable;
                    HideValue = ESACC_F16_HideValue;
                    Visible = ESACC_F16_Visible;
                }
                // field("Description 4"; "Description 4")
                // {
                //     Caption = 'Liefernr.+ Erstellungsdatum';
                // }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Show Document")
                {
                    Caption = 'Show Document';
                    Enabled = ESACC_C23_Enabled;
                    Image = View;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F7';
                    Visible = ESACC_C23_Visible;

                    trigger OnAction()
                    var
                        PageManagement: Codeunit "Page Management";
                    begin
                        SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                        PageManagement.PageRun(SalesHeader);
                    end;
                }
                action("Reservation Entries")
                {
                    AccessByPermission = TableData Item = R;
                    Caption = 'Reservation Entries';
                    Enabled = ESACC_C32_Enabled;
                    Image = ReservationLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = ESACC_C32_Visible;

                    trigger OnAction()
                    begin
                        Rec.ShowReservationEntries(true);
                    end;
                }
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    Enabled = ESACC_C6500_Enabled;
                    Image = ItemTrackingLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+I';
                    Visible = ESACC_C6500_Visible;

                    trigger OnAction()
                    begin
                        Rec.OpenItemTrackingLines;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);

        if not SalesHeader.Get(Rec."Document Type", Rec."Document No.") then
            SalesHeader.Init;

        if Rec.Type = Rec.Type::Item then begin
            if not Item.Get(Rec."No.") then
                Item.Init
        end else
            Item.Init;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Clear(ShortcutDimCode);
    end;

    trigger OnOpenPage()
    begin
        CreateData;

        // ESACC_EasySecurity(true);
        if UserId = 'HEW\FRANZ-JOSEF.HAGEN' then
            HideValue := false
        else
            HideValue := true;

        if UserMgt.GetSalesFilter <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetSalesFilter);
            Rec.FilterGroup(0);
        end;
    end;

    var
        // ESACC_ESFLADSMgt: Codeunit "ES FLADS Management";
        [InDataSet]
        ESACC_C23_Visible: Boolean;
        [InDataSet]
        ESACC_C23_Enabled: Boolean;
        [InDataSet]
        ESACC_C32_Visible: Boolean;
        [InDataSet]
        ESACC_C32_Enabled: Boolean;
        [InDataSet]
        ESACC_C6500_Visible: Boolean;
        [InDataSet]
        ESACC_C6500_Enabled: Boolean;
        [InDataSet]
        ESACC_F1_Visible: Boolean;
        [InDataSet]
        ESACC_F1_Editable: Boolean;
        [InDataSet]
        ESACC_F1_HideValue: Boolean;
        [InDataSet]
        ESACC_F2_Visible: Boolean;
        [InDataSet]
        ESACC_F2_Editable: Boolean;
        [InDataSet]
        ESACC_F2_HideValue: Boolean;
        [InDataSet]
        ESACC_F3_Visible: Boolean;
        [InDataSet]
        ESACC_F3_Editable: Boolean;
        [InDataSet]
        ESACC_F3_HideValue: Boolean;
        [InDataSet]
        ESACC_F4_Visible: Boolean;
        [InDataSet]
        ESACC_F4_Editable: Boolean;
        [InDataSet]
        ESACC_F4_HideValue: Boolean;
        [InDataSet]
        ESACC_F5_Visible: Boolean;
        [InDataSet]
        ESACC_F5_Editable: Boolean;
        [InDataSet]
        ESACC_F5_HideValue: Boolean;
        [InDataSet]
        ESACC_F6_Visible: Boolean;
        [InDataSet]
        ESACC_F6_Editable: Boolean;
        [InDataSet]
        ESACC_F6_HideValue: Boolean;
        [InDataSet]
        ESACC_F7_Visible: Boolean;
        [InDataSet]
        ESACC_F7_Editable: Boolean;
        [InDataSet]
        ESACC_F7_HideValue: Boolean;
        [InDataSet]
        ESACC_F10_Visible: Boolean;
        [InDataSet]
        ESACC_F10_Editable: Boolean;
        [InDataSet]
        ESACC_F10_HideValue: Boolean;
        [InDataSet]
        ESACC_F11_Visible: Boolean;
        [InDataSet]
        ESACC_F11_Editable: Boolean;
        [InDataSet]
        ESACC_F11_HideValue: Boolean;
        [InDataSet]
        ESACC_F15_Visible: Boolean;
        [InDataSet]
        ESACC_F15_Editable: Boolean;
        [InDataSet]
        ESACC_F15_HideValue: Boolean;
        [InDataSet]
        ESACC_F16_Visible: Boolean;
        [InDataSet]
        ESACC_F16_Editable: Boolean;
        [InDataSet]
        ESACC_F16_HideValue: Boolean;
        [InDataSet]
        ESACC_F22_Visible: Boolean;
        [InDataSet]
        ESACC_F22_Editable: Boolean;
        [InDataSet]
        ESACC_F22_HideValue: Boolean;
        [InDataSet]
        ESACC_F23_Visible: Boolean;
        [InDataSet]
        ESACC_F23_Editable: Boolean;
        [InDataSet]
        ESACC_F23_HideValue: Boolean;
        [InDataSet]
        ESACC_F40_Visible: Boolean;
        [InDataSet]
        ESACC_F40_Editable: Boolean;
        [InDataSet]
        ESACC_F40_HideValue: Boolean;
        [InDataSet]
        ESACC_F41_Visible: Boolean;
        [InDataSet]
        ESACC_F41_Editable: Boolean;
        [InDataSet]
        ESACC_F41_HideValue: Boolean;
        [InDataSet]
        ESACC_F45_Visible: Boolean;
        [InDataSet]
        ESACC_F45_Editable: Boolean;
        [InDataSet]
        ESACC_F45_HideValue: Boolean;
        [InDataSet]
        ESACC_F52_Visible: Boolean;
        [InDataSet]
        ESACC_F52_Editable: Boolean;
        [InDataSet]
        ESACC_F52_HideValue: Boolean;
        [InDataSet]
        ESACC_F75_Visible: Boolean;
        [InDataSet]
        ESACC_F75_Editable: Boolean;
        [InDataSet]
        ESACC_F75_HideValue: Boolean;
        [InDataSet]
        ESACC_F96_Visible: Boolean;
        [InDataSet]
        ESACC_F96_Editable: Boolean;
        [InDataSet]
        ESACC_F96_HideValue: Boolean;
        [InDataSet]
        ESACC_F103_Visible: Boolean;
        [InDataSet]
        ESACC_F103_Editable: Boolean;
        [InDataSet]
        ESACC_F103_HideValue: Boolean;
        [InDataSet]
        ESACC_F5402_Visible: Boolean;
        [InDataSet]
        ESACC_F5402_Editable: Boolean;
        [InDataSet]
        ESACC_F5402_HideValue: Boolean;
        [InDataSet]
        ESACC_F5407_Visible: Boolean;
        [InDataSet]
        ESACC_F5407_Editable: Boolean;
        [InDataSet]
        ESACC_F5407_HideValue: Boolean;
        [InDataSet]
        ESACC_F5495_Visible: Boolean;
        [InDataSet]
        ESACC_F5495_HideValue: Boolean;
        [InDataSet]
        ESACC_F5790_Visible: Boolean;
        [InDataSet]
        ESACC_F5790_Editable: Boolean;
        [InDataSet]
        ESACC_F5790_HideValue: Boolean;
        [InDataSet]
        ESACC_F5791_Visible: Boolean;
        [InDataSet]
        ESACC_F5791_Editable: Boolean;
        [InDataSet]
        ESACC_F5791_HideValue: Boolean;
        [InDataSet]
        ESACC_F50002_Visible: Boolean;
        [InDataSet]
        ESACC_F50002_Editable: Boolean;
        [InDataSet]
        ESACC_F50002_HideValue: Boolean;
        [InDataSet]
        ESACC_F5012401_Visible: Boolean;
        [InDataSet]
        ESACC_F5012401_Editable: Boolean;
        [InDataSet]
        ESACC_F5012401_HideValue: Boolean;
        SalesHeader: Record "Sales Header";
        Item: Record Item;
        ShortcutDimCode: array[8] of Code[20];
        HideValue: Boolean;
        UserMgt: Codeunit "User Setup Management";

    // local procedure ESACC_EasySecurity(OpenObject: Boolean)
    // var
    //     SetFilters: Codeunit "ES FLADS Set Filters";
    //     TempBoolean: Boolean;
    // begin
    //     if OpenObject then begin
    //         SetFilters.Filter37(Rec, 8, 50091);

    //         TempBoolean := CurrPage.Editable;
    //         if ESACC_ESFLADSMgt.PageGeneral(37, 50091, TempBoolean) then
    //             CurrPage.Editable := TempBoolean;
    //     end;

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 1, 23,
    //       ESACC_C23_Visible, ESACC_C23_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 1, 32,
    //       ESACC_C32_Visible, ESACC_C32_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 1, 6500,
    //       ESACC_C6500_Visible, ESACC_C6500_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 1,
    //       ESACC_F1_Visible, ESACC_F1_Editable, ESACC_F1_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 2,
    //       ESACC_F2_Visible, ESACC_F2_Editable, ESACC_F2_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 3,
    //       ESACC_F3_Visible, ESACC_F3_Editable, ESACC_F3_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 4,
    //       ESACC_F4_Visible, ESACC_F4_Editable, ESACC_F4_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 5,
    //       ESACC_F5_Visible, ESACC_F5_Editable, ESACC_F5_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 6,
    //       ESACC_F6_Visible, ESACC_F6_Editable, ESACC_F6_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 7,
    //       ESACC_F7_Visible, ESACC_F7_Editable, ESACC_F7_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 10,
    //       ESACC_F10_Visible, ESACC_F10_Editable, ESACC_F10_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 11,
    //       ESACC_F11_Visible, ESACC_F11_Editable, ESACC_F11_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 15,
    //       ESACC_F15_Visible, ESACC_F15_Editable, ESACC_F15_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 16,
    //       ESACC_F16_Visible, ESACC_F16_Editable, ESACC_F16_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 22,
    //       ESACC_F22_Visible, ESACC_F22_Editable, ESACC_F22_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 23,
    //       ESACC_F23_Visible, ESACC_F23_Editable, ESACC_F23_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 40,
    //       ESACC_F40_Visible, ESACC_F40_Editable, ESACC_F40_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 41,
    //       ESACC_F41_Visible, ESACC_F41_Editable, ESACC_F41_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 45,
    //       ESACC_F45_Visible, ESACC_F45_Editable, ESACC_F45_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 52,
    //       ESACC_F52_Visible, ESACC_F52_Editable, ESACC_F52_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 75,
    //       ESACC_F75_Visible, ESACC_F75_Editable, ESACC_F75_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 96,
    //       ESACC_F96_Visible, ESACC_F96_Editable, ESACC_F96_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 103,
    //       ESACC_F103_Visible, ESACC_F103_Editable, ESACC_F103_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 5402,
    //       ESACC_F5402_Visible, ESACC_F5402_Editable, ESACC_F5402_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 5407,
    //       ESACC_F5407_Visible, ESACC_F5407_Editable, ESACC_F5407_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 5495,
    //       ESACC_F5495_Visible, TempBoolean, ESACC_F5495_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 5790,
    //       ESACC_F5790_Visible, ESACC_F5790_Editable, ESACC_F5790_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 5791,
    //       ESACC_F5791_Visible, ESACC_F5791_Editable, ESACC_F5791_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 50002,
    //       ESACC_F50002_Visible, ESACC_F50002_Editable, ESACC_F50002_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       37, 50091, 0, 5012401,
    //       ESACC_F5012401_Visible, ESACC_F5012401_Editable, ESACC_F5012401_HideValue);

    //     ESACC_EasySecurityManual(OpenObject);
    // end;

    local procedure ESACC_EasySecurityManual(OpenObject: Boolean)
    begin
    end;

    local procedure CreateData()
    var
        SalesLine: Record "Sales Line";
        ProdOrderLine: Record "Prod. Order Line";
        ReservationEntry: Record "Reservation Entry";
        ReservationEntry2: Record "Reservation Entry";
        SalesShipmentHeader: Record "Sales Shipment Header";
    begin
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        if not SalesLine.FindSet then
            exit;

        ReservationEntry.SetRange("Source Type", DATABASE::"Sales Line");
        ReservationEntry.SetRange("Source Subtype", SalesLine."Document Type"::Order);
        ReservationEntry.SetRange("Reservation Status", ReservationEntry."Reservation Status"::Reservation);
        repeat
            ReservationEntry.SetRange("Source ID", SalesLine."Document No.");
            ReservationEntry.SetRange("Source Ref. No.", SalesLine."Line No.");
            SalesShipmentHeader.SetRange("Order No.", SalesLine."Document No.");
            if ReservationEntry.FindSet then begin
                ReservationEntry2.Get(ReservationEntry."Entry No.", not ReservationEntry.Positive);
                if ReservationEntry2."Source Type" = DATABASE::"Prod. Order Line" then begin
                    ProdOrderLine.Get(ReservationEntry2."Source Subtype", ReservationEntry2."Source ID", ReservationEntry2."Source Prod. Order Line");
                    if SalesLine."Shipment Date" <> ProdOrderLine."Ending Date" then begin
                        Rec := SalesLine;
                        // Rec."Description 5" := ProdOrderLine."Prod. Order No." + ' / Enddatum ' + Format(ProdOrderLine."Ending Date");
                        Rec.Insert;
                        if SalesShipmentHeader.FindSet then begin
                            Rec := SalesLine;
                            // Rec."Description 4" := SalesShipmentHeader."No." + ' / Lieferung Erstellungsdatum' + Format(SalesShipmentHeader."Creation Date");
                        end;
                    end;
                end;
            end;
        until SalesLine.Next = 0;
    end;
}

