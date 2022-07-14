page 50058 "Post. Service Cr. Memo  Lines"
{
    // P0043 07.05.16 DEBIE.ARE New Object

    Caption = 'Posted Service Cr. Memo Lines';
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Service Cr.Memo Line";
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
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("SalesInvoiceHeader.""Salesperson Code"""; SalesInvoiceHeader."Salesperson Code")
                {
                    Caption = 'Verkäufercode';
                }
                field("SalesInvoiceHeader.""Service Salesperson Code"""; SalesInvoiceHeader."Service Salesperson Code")
                {
                    Caption = 'Service Verkäufer Code';
                }
                field("SalesInvoiceHeader.""Service Zone Code"""; SalesInvoiceHeader."Service Zone Code")
                {
                    Caption = 'Service Gebiets Code';
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
                field("Customer.""Credit Limit (LCY)"""; Customer."Credit Limit (LCY)")
                {
                    Caption = 'Credit Limit (LCY)';
                }
                field("SalesInvoiceHeader.""Payment Terms Code"""; SalesInvoiceHeader."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field("SalesInvoiceHeader.""Responsibility Center"""; SalesInvoiceHeader."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    HideValue = HideValue;
                }
                field("Item.""Profit %"""; Item."Profit %")
                {
                    Caption = 'Profit %';
                    HideValue = HideValue;
                }
                field("""Unit Cost (LCY)"" * Quantity"; Rec."Unit Cost (LCY)" * Rec.Quantity)
                {
                    Caption = 'Unit Amount (LCY)';
                    HideValue = HideValue;
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


        if not SalesInvoiceHeader.Get(Rec."Document No.") then
            SalesInvoiceHeader.Init;

        if not Customer.Get(Rec."Customer No.") then
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
        SalesInvoiceHeader: Record "Service Cr.Memo Header";
        Customer: Record Customer;
        Item: Record Item;
        ShortcutDimCode: array[8] of Code[20];
        HideValue: Boolean;
        UserMgt: Codeunit "User Setup Management";
}

