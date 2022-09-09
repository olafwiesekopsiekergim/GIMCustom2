page 50056 "Service Lines 2"
{
    // P0029 07.04.16 DEBIE.ARE New object

    Caption = 'Service Lines';
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Service Line";
    SourceTableView = SORTING("Document Type", "Document No.", "Line No.")
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Document Type"; Rec."Document Type")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                    ApplicationArea = All;
                }
                field("SalesHeader.""Customer No."""; SalesHeader."Customer No.")
                {
                    Caption = 'Debitornr.';
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                    ApplicationArea = All;
                }
                field("SalesHeader.""Service Salesperson Code"""; SalesHeader."Service Salesperson Code")
                {
                    Caption = 'Service Verkäufer Code';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("SalesHeader.""Service Zone Code"""; SalesHeader."Service Zone Code")
                {
                    Caption = 'Service Gebiets Code';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("SalesHeader.""Bill-to Name"""; SalesHeader."Bill-to Name")
                {
                    Caption = 'Ship-to Name';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("SalesHeader.""Ship-to Name"""; SalesHeader."Ship-to Name")
                {
                    Caption = 'Lief. an Name';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("SalesHeader.""Ship-to Post Code"""; SalesHeader."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("SalesHeader.""Ship-to City"""; SalesHeader."Ship-to City")
                {
                    Caption = 'Ship-to City';
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    Editable = false;
                    HideValue = true;
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    BlankZero = true;
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Item.""Item Category Code"""; Item."Item Category Code")
                {
                    Caption = 'Item Category Code';
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("SalesHeader.""Order Date"""; SalesHeader."Order Date")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
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
                    Enabled = true;
                    Image = View;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F7';
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        PageManagement: Codeunit "Page Management";
                    begin
                        SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                        PageManagement.PageRun(SalesHeader);
                    end;
                }
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    Enabled = true;
                    Image = ItemTrackingLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+I';
                    Visible = true;
                    ApplicationArea = All;

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
        SalesHeader: Record "Service Header";
        Item: Record Item;
        ShortcutDimCode: array[8] of Code[20];
        HideValue: Boolean;
        UserMgt: Codeunit "User Setup Management";
}

