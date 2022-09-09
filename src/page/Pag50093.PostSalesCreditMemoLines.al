page 50093 "Post. Sales Credit Memo Lines"
{
    // P0043 07.05.16 DEBIE.ARE New Object

    Caption = 'Post. Sales Credit Memo Lines';
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Sales Cr.Memo Line";
    SourceTableView = SORTING("Document No.", "Line No.")
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("SalesCrMemoHeader.""No. Printed Work Order"""; SalesCrMemoHeader."No. Printed Work Order")
                {
                    Caption = 'No. Printed Work Order';
                    Description = 'P0029';
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("SalesCrMemoHeader.""Sell-to Country/Region Code"""; SalesCrMemoHeader."Sell-to Country/Region Code")
                {
                    Caption = 'Sell-to Country/Region Code';
                    ApplicationArea = All;
                }
                field("SalesCrMemoHeader.""Salesperson Code"""; SalesCrMemoHeader."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                    ApplicationArea = All;
                }
                // field("SalesCrMemoHeader.""Salesperson Code 2"""; SalesCrMemoHeader."Salesperson Code 2")
                // {
                //     Caption = 'Salesperson Code 2';
                // }
                field("SalesCrMemoHeader.""Ship-to Name"""; SalesCrMemoHeader."Ship-to Name")
                {
                    Caption = 'Ship-to Name';
                    ApplicationArea = All;
                }
                field("SalesCrMemoHeader.""Ship-to Post Code"""; SalesCrMemoHeader."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';
                    ApplicationArea = All;
                }
                field("SalesCrMemoHeader.""Ship-to City"""; SalesCrMemoHeader."Ship-to City")
                {
                    Caption = 'Ship-to City';
                    ApplicationArea = All;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    Description = 'P0029';
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    Visible = true;
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    BlankZero = true;
                    ApplicationArea = All;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Item.""Inventory Posting Group"""; Item."Inventory Posting Group")
                {
                    Caption = 'Inventory Posting Group';
                    ApplicationArea = All;
                }
                field("Item.""Item Category Code"""; Item."Item Category Code")
                {
                    Caption = 'Item Category Code';
                    ApplicationArea = All;
                }
                field("Job No."; Rec."Job No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                    ApplicationArea = All;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                    ApplicationArea = All;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                    ApplicationArea = All;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                    ApplicationArea = All;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                    ApplicationArea = All;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                    ApplicationArea = All;
                }
                field("SalesCrMemoHeader.""fix-Termin Lieferung"""; SalesCrMemoHeader."fix-Termin Lieferung")
                {
                    Caption = 'fix-Termin Lieferung';
                    ApplicationArea = All;
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                }
                field("Customer.""Credit Limit (LCY)"""; Customer."Credit Limit (LCY)")
                {
                    Caption = 'Credit Limit (LCY)';
                    ApplicationArea = All;
                }
                field("SalesCrMemoHeader.""Payment Terms Code"""; SalesCrMemoHeader."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                    ApplicationArea = All;
                }
                field("Sell-to Country/Region Code"; SalesCrMemoHeader."Sell-to Country/Region Code")
                {
                    Caption = 'Sell-to Country/Region Code';
                    ApplicationArea = All;
                }
                field("SalesCrMemoHeader.""Responsibility Center"""; SalesCrMemoHeader."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                    ApplicationArea = All;
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    HideValue = HideValue;
                    ApplicationArea = All;
                }
                field("Item.""Profit %"""; Item."Profit %")
                {
                    Caption = 'Profit %';
                    HideValue = HideValue;
                    ApplicationArea = All;
                }
                field("""Unit Cost (LCY)"" * Quantity"; Rec."Unit Cost (LCY)" * Rec.Quantity)
                {
                    Caption = 'Unit Amount (LCY)';
                    HideValue = HideValue;
                    ApplicationArea = All;
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
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        PageManagement: Codeunit "Page Management";
                    begin
                        SalesCrMemoHeader.Get(Rec."Document No.");
                        PageManagement.PageRun(SalesCrMemoHeader);
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
                    ApplicationArea = All;

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

        if not SalesCrMemoHeader.Get(Rec."Document No.") then
            SalesCrMemoHeader.Init;

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
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        Customer: Record Customer;
        Item: Record Item;
        ShortcutDimCode: array[8] of Code[20];
        HideValue: Boolean;
        UserMgt: Codeunit "User Setup Management";
}

