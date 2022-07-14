page 50092 "Post. Sales Invoice Lines"
{
    // P0043 07.05.16 DEBIE.ARE New Object

    Caption = 'Posted Sales Invoice Lines';
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Sales Invoice Line";
    SourceTableView = SORTING("Document No.", "Line No.")
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("SalesInvoiceHeader.""Bill-to Name"""; SalesInvoiceHeader."Bill-to Name")
                {
                    Caption = 'Rechnung an Name';
                }
                field("SalesInvoiceHeader.""Bill-to Name 2"""; SalesInvoiceHeader."Bill-to Name 2")
                {
                    Caption = 'Rechnung an Name 2';
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("SalesInvoiceHeader.""No. Printed Work Order"""; SalesInvoiceHeader."No. Printed Work Order")
                {
                    Caption = 'No. Printed Work Order';
                    Description = 'P0029';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                }
                field("SalesInvoiceHeader.""Order No."""; SalesInvoiceHeader."Order No.")
                {
                    Caption = 'Auftragsnummer';
                }
                field("SalesInvoiceHeader.""Sell-to Country/Region Code"""; SalesInvoiceHeader."Sell-to Country/Region Code")
                {
                    Caption = 'Sell-to Country/Region Code';
                }
                field("SalesInvoiceHeader.""Salesperson Code"""; SalesInvoiceHeader."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }
                field("SalesInvoiceHeader.""Salesperson Code 2"""; SalesInvoiceHeader."Salesperson Code 2")
                {
                    Caption = 'Salesperson Code 2';
                }
                field("SalesInvoiceHeader.""Ship-to Name"""; SalesInvoiceHeader."Ship-to Name")
                {
                    Caption = 'Ship-to Name';
                }
                field("SalesInvoiceHeader.""Ship-to Post Code"""; SalesInvoiceHeader."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';
                }
                field("SalesInvoiceHeader.""Ship-to City"""; SalesInvoiceHeader."Ship-to City")
                {
                    Caption = 'Ship-to City';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    Description = 'P0029';
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                }
                field(Type; Rec.Type)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                    Visible = true;
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    BlankZero = true;
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Inv. Discount Amount"; Rec."Inv. Discount Amount")
                {
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                }
                field("Item.""Inventory Posting Group"""; Item."Inventory Posting Group")
                {
                    Caption = 'Inventory Posting Group';
                }
                field("Item.""Item Category Code"""; Item."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }
                field(Ursprungsland; Item."Country/Region of Origin Code")
                {
                }
                field("Zolltarifnr."; Item."Tariff No.")
                {
                }
                field("Job No."; Rec."Job No.")
                {
                    Visible = false;
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                }
                field("SalesInvoiceHeader.""fix-Termin Lieferung"""; SalesInvoiceHeader."fix-Termin Lieferung")
                {
                    Caption = 'fix-Termin Lieferung';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                }
                field("Customer.""Credit Limit (LCY)"""; Customer."Credit Limit (LCY)")
                {
                    Caption = 'Credit Limit (LCY)';
                }
                field("SalesInvoiceHeader.""Payment Terms Code"""; SalesInvoiceHeader."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field("Sell-to Country/Region Code"; SalesInvoiceHeader."Sell-to Country/Region Code")
                {
                    Caption = 'Sell-to Country/Region Code';
                }
                field("SalesInvoiceHeader.""Responsibility Center"""; SalesInvoiceHeader."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    Enabled = true;
                    HideValue = HideValue;
                    Visible = true;
                }
                field("Item.""Profit %"""; Item."Profit %")
                {
                    Caption = 'Profit %';
                    Enabled = true;
                    HideValue = HideValue;
                    Visible = true;
                }
                field("""Unit Cost (LCY)"" * Quantity"; Rec."Unit Cost (LCY)" * Rec.Quantity)
                {
                    Caption = 'Unit Amount (LCY)';
                    Enabled = true;
                    HideValue = HideValue;
                    Visible = true;
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    Caption = 'Nettogewicht';
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                    Caption = 'Bruttogewicht';
                }
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
                    Image = View;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F7';

                    trigger OnAction()
                    var
                        PageManagement: Codeunit "Page Management";
                    begin
                        SalesInvoiceHeader.Get(Rec."Document No.");
                        PageManagement.PageRun(SalesInvoiceHeader);
                    end;
                }
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction()
                    begin
                        Rec.ShowItemTrackingLines;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);

        if not SalesInvoiceHeader.Get(Rec."Document No.") then
            SalesInvoiceHeader.Init;

        if not Customer.Get(Rec."Sell-to Customer No.") then
            Customer.Init;

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
        if UserId = 'HEW\HAGEN.FRANZ-JOSEF' then
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
        SalesInvoiceHeader: Record "Sales Invoice Header";
        Customer: Record Customer;
        Item: Record Item;
        ShortcutDimCode: array[8] of Code[20];
        HideValue: Boolean;
        UserMgt: Codeunit "User Setup Management";
}

