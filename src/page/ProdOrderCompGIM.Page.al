page 50041 ProdOrderCompGIM
{
    // GIM 30.11.2022 Verfügbarkeit anzeigen, Entweder abhängig nur vom Lagerort oder auch Lagerplatz

    Caption = 'Fertigungsauftragskomponenten';
    Editable = false;
    PageType = List;
    SourceTable = "Prod. Order Component";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; "Item No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Quantity per"; "Quantity per")
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field("Bin Code"; "Bin Code")
                {
                }
                field(CalcedQuantityAvailable; CalcedQuantityAvailable)
                {
                    Caption = 'Verfügbare Menge';
                    Style = Unfavorable;
                    StyleExpr = Alert;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        CalcedQuantityAvailable := GetQuantityAvailable;
        if CalcedQuantityAvailable < Rec."Quantity (Base)" then
            Alert := true
        else
            Alert := false;
    end;

    var
        CalcedQuantityAvailable: Decimal;
        Alert: Boolean;

    local procedure GetQuantityAvailable() ret: Decimal
    var
        BinContent: Record "Bin Content";
        Item: Record Item;
    begin
        ret := 0;
        if (Rec."Location Code" <> '') and (Rec."Bin Code" <> '') then begin
            if BinContent.Get(Rec."Location Code", Rec."Bin Code", Rec."Item No.", Rec."Variant Code", Rec."Unit of Measure Code") then begin
                BinContent.CalcFields("Quantity (Base)");
                exit(BinContent."Quantity (Base)");
            end;
        end;

        if (Rec."Location Code" <> '') and (Rec."Bin Code" = '') then begin
            if Item.Get(Rec."Item No.") then begin
                Item.SetRange("Location Filter", Rec."Location Code");
                Item.CalcFields(Inventory);
                exit(Item.Inventory);
            end;
        end;
    end;
}

