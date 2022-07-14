codeunit 50010 "Clean WithoutInventoryControl"
{
    // CC01 CCMUE.KPET 21.03.19 new function to clean 1016..

    Permissions = TableData "Item Ledger Entry" = rm,
                  TableData "Value Entry" = rm;

    trigger OnRun()
    begin

        Clean_WithoutInventoryControl();
    end;

    local procedure Clean_WithoutInventoryControl()
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        Item: Record Item;
        ItemApplicationEntry: Record "Item Application Entry";
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry2: Record "Item Ledger Entry";
        i: Integer;
        AP: Integer;
        WP: Integer;
    begin

        ItemLedgerEntry.Reset;
        //ItemLedgerEntry.SETRANGE("Entry No.",1700006);   ///Fester Filter Lösen !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //ItemLedgerEntry.SETRANGE("Item No.", '1016');  ///Fester Filter Lösen !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //KP     ItemLedgerEntry.SETRANGE("Invoiced Quantity" , 0);
        ItemLedgerEntry.SetRange("Document No.", 'INVENTORYCORRECTION');
        if ItemLedgerEntry.FindSet then begin
            repeat
                ItemLedgerEntry."Invoiced Quantity" := ItemLedgerEntry.Quantity;
                ItemLedgerEntry.Modify;
                AP += 1;

                ValueEntry.Reset;
                ValueEntry.SetRange("Item Ledger Entry No.", ItemLedgerEntry."Entry No.");
                ValueEntry.FindFirst;
                ValueEntry."Invoiced Quantity" := ValueEntry."Item Ledger Entry Quantity";

                if ItemLedgerEntry."Entry Type" = ItemLedgerEntry."Entry Type"::"Negative Adjmt." then begin
                    ItemApplicationEntry.Reset;
                    ItemApplicationEntry.SetRange("Item Ledger Entry No.", ItemLedgerEntry."Entry No.");
                    ItemApplicationEntry.SetRange("Outbound Item Entry No.", ItemLedgerEntry."Entry No.");
                    ItemApplicationEntry.SetFilter("Inbound Item Entry No.", '<>%1', 0);
                    ItemApplicationEntry.FindFirst;

                    ItemLedgerEntry2.Get(ItemApplicationEntry."Inbound Item Entry No.");
                    ItemLedgerEntry2.CalcFields("Cost Amount (Expected)", "Cost Amount (Actual) (ACY)", "Cost Amount (Actual)");

                    //IF ValueEntry."Cost Amount (Actual)" <> ItemLedgerEntry2."Cost Amount (Actual)" THEN BEGIN  //Nur bei Änderung

                    ValueEntry."Cost Amount (Actual)" := ItemLedgerEntry2."Cost Amount (Actual)" * -1; //Einstandsbetrag (tatsächl.)
                    ValueEntry."Cost Amount (Actual) (ACY)" := ItemLedgerEntry2."Cost Amount (Actual) (ACY)" * -1;
                    ValueEntry."Cost Amount (Expected)" := ItemLedgerEntry2."Cost Amount (Actual)";  //Einstandsbetrag (erwartet)

                end else begin
                    ItemLedgerEntry."Applied Entry to Adjust" := true;
                    ItemLedgerEntry.Modify;
                    Item.Get(ItemLedgerEntry."Item No.");
                    Item."Cost is Adjusted" := false;
                    Item.Modify;
                end;

                ValueEntry.Modify;

                //MESSAGE('Wertposten: %1 : %2 : %3 : %4 : %5', ItemLedgerEntry2."Cost Amount (Actual)",  ValueEntry."Item Ledger Entry Quantity");
                WP += 1;
            until ItemLedgerEntry.Next = 0;
        end;

        Message('Artikelposten %1 Wertposten %2 ', AP, WP);
    end;
}

