page 50096 "Arch. Sales Lines 2"
{
    // P0029 07.04.16 DEBIE.ARE New object

    Caption = 'Sales Lines';
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Sales Line Archive";
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
                }
                field("Document No."; Rec."Document No.")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                }
                field("SalesHeader.""No. Printed Work Order"""; SalesHeader."No. Printed Work Order")
                {
                    Caption = 'No. Printed Work Order';
                    Description = 'P0029';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    Editable = false;
                    HideValue = true;
                    Visible = true;
                }
                field("SalesHeader.""Sell-to Country/Region Code"""; SalesHeader."Sell-to Country/Region Code")
                {
                    Caption = 'Sell-to Country/Region Code';
                }
                field("SalesHeader.""Salesperson Code"""; SalesHeader."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }
                field("SalesHeader.""Salesperson Code 2"""; SalesHeader."Salesperson Code 2")
                {
                    Caption = 'Salesperson Code 2';
                }
                field("SalesHeader.""Bill-to Name"""; SalesHeader."Bill-to Name")
                {
                    Caption = 'Ship-to Name';
                }
                field("SalesHeader.""Bill-to Name 2"""; SalesHeader."Bill-to Name 2")
                {
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
                field("SalesHeader.Webrequest"; SalesHeader.Webrequest)
                {
                    Caption = 'Webrequest';
                }
                field("SalesHeader.""Archived By"""; SalesHeader."Archived By")
                {
                    Caption = 'Archiviert von';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    Description = 'P0029';
                    Editable = false;
                    HideValue = true;
                    Visible = true;
                }
                field("Line No."; Rec."Line No.")
                {
                    Editable = false;
                    HideValue = true;
                    Visible = false;
                }
                field(Type; Rec.Type)
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                }
                field("No."; Rec."No.")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                }
                field("Location Code"; Rec."Location Code")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                }
                field(Reserve; Rec.Reserve)
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                }
                field(Quantity; Rec.Quantity)
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    BlankZero = true;
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                }
                field("Item.""Item Category Code"""; Item."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }
                field("SalesHeader.""fix-Termin Lieferung"""; SalesHeader."fix-Termin Lieferung")
                {
                    Caption = 'fix-Termin Lieferung';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    Editable = false;
                    HideValue = false;
                    Visible = true;
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    HideValue = HideValue;
                    Visible = true;
                }
                field("Profit %"; Rec."Profit %")
                {
                    HideValue = HideValue;
                    Visible = true;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    HideValue = HideValue;
                }
                field(VK2; VK2)
                {
                    Caption = 'VK2';
                }
                field("Version No."; Rec."Version No.")
                {
                }
                field(Internetangrage; Internetanfrage)
                {
                    Caption = 'Internetanfrage';
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

                    trigger OnAction()
                    var
                        PageManagement: Codeunit "Page Management";
                    begin
                        SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                        PageManagement.PageRun(SalesHeader);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin


        if not SalesHeader.Get(Rec."Document Type", Rec."Document No.", Rec."Doc. No. Occurrence", Rec."Version No.") then
            SalesHeader.Init;
        if Rec.Type = Rec.Type::Item then begin
            if not Item.Get(Rec."No.") then
                Item.Init
        end else
            Item.Init;

        VK2 := SalesHeader."Salesperson Code 2";
        Internetanfrage := SalesHeader.Webrequest;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Clear(ShortcutDimCode);
    end;

    trigger OnOpenPage()
    begin

        if (UserId = 'HEW\HAGEN.FRANZ-JOSEF') or (UserId = 'HEW\COSMO') then
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
        Internetanfrage: Boolean;
        SalesHeader: Record "Sales Header Archive";
        Item: Record Item;
        ShortcutDimCode: array[8] of Code[20];
        HideValue: Boolean;
        UserMgt: Codeunit "User Setup Management";
        VK2: Code[10];
}

