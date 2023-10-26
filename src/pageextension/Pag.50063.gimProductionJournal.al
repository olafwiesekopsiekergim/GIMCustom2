pageextension 50063 gimProductionJournal extends "Production Journal"
{
    layout
    {

    }
    actions
    {
        addlast("&Line")
        {
            action("AdjustConsumptionToOutput")
            {
                Caption = 'Verbrauch an Istmeldung anpassen';
                Image = Copy;

                trigger OnAction()
                begin
                    // >> P0027
                    AdjustConsumptionToOutput();
                    // << P0027
                end;
            }
        }
    }
    local procedure AdjustConsumptionToOutput()
    var
        ItemJournalLine: Record "Item Journal Line";
        ProdOrderComponent: Record "Prod. Order Component";
        QntNew: Decimal;
    begin
        // >> P0027
        TestField("Entry Type", "Entry Type"::Output);
        ItemJournalLine.SetRange("Journal Template Name", "Journal Template Name");
        ItemJournalLine.SetRange("Journal Batch Name", "Journal Batch Name");
        ItemJournalLine.SetRange("Order Type", "Order Type");
        ItemJournalLine.SetRange("Order No.", "Order No.");
        ItemJournalLine.SetRange("Entry Type", "Entry Type"::Consumption);
        if not ItemJournalLine.Find('-') then
            exit;
        repeat
            if ProdOrderComponent.Get(ProdOrderComponent.Status::Released,
                                      ItemJournalLine."Order No.",
                                      ItemJournalLine."Order Line No.",
                                      ItemJournalLine."Prod. Order Comp. Line No.") then begin
                QntNew := "Output Quantity" * ProdOrderComponent."Quantity per";
                if QntNew >= 0 then begin
                    if QntNew > ProdOrderComponent."Remaining Quantity" then
                        QntNew := ProdOrderComponent."Remaining Quantity";
                end else begin
                    if QntNew < ProdOrderComponent."Remaining Quantity" then
                        QntNew := ProdOrderComponent."Remaining Quantity";
                end;
                ItemJournalLine.Validate(Quantity, QntNew);
                ItemJournalLine.Modify;
            end;
        until ItemJournalLine.Next = 0;
        // << P0027
    end;
}
