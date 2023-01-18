page 50098 "SV/SO Processor Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Sales Cue";

    layout
    {
        area(content)
        {
            cuegroup(Fakturierung)
            {
                Caption = 'Fakturierung';
                field("CountShowSalesOrderToInvoice(FALSE,FALSE)"; CountShowSalesOrderToInvoice(false, false))
                {
                    Caption = 'zu fakturiende Aufträge';

                    trigger OnDrillDown()
                    begin
                        Rec.CountShowSalesOrderToInvoice(true, false);
                    end;
                }
                field("CountShowSalesOrderToPartiallyInvoice(FALSE,FALSE)"; CountShowSalesOrderToPartiallyInvoice(false, false))
                {
                    Caption = 'zu Teilen fakturierbare Aufträge';

                    trigger OnDrillDown()
                    begin
                        Rec.CountShowSalesOrderToPartiallyInvoice(true, false);
                    end;
                }
                field("ShowInvoicetosend(FALSE,FALSE)"; ShowInvoicetosend(false, false))
                {
                    Caption = 'zu versendende Rechnungen';

                    trigger OnDrillDown()
                    begin
                        Rec.ShowInvoicetosend(true, false);
                    end;
                }
            }
            cuegroup("Aufträge")
            {
                Caption = 'Aufträge';
                field("Sales Orders - Released"; "Sales Orders - Released")
                {

                    trigger OnDrillDown()
                    begin
                        ShowOrders2(FieldNo("Salesperson Code Filter"));
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Set Up Cues")
            {
                Caption = 'Set Up Cues';
                Image = Setup;

                trigger OnAction()
                var
                    CueRecordRef: RecordRef;
                begin
                    CueRecordRef.GetTable(Rec);
                    CueSetup.OpenCustomizePageForCurrentUser(CueRecordRef.Number);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        DocExchServiceSetup: Record "Doc. Exch. Service Setup";
    begin
        CalculateCueFieldValues;
        ShowDocumentsPendingDodExchService := false;
        if DocExchServiceSetup.Get then
            ShowDocumentsPendingDodExchService := DocExchServiceSetup.Enabled;
    end;

    trigger OnOpenPage()
    begin
        Reset;
        if not Get then begin
            Init;
            Insert;
        end;

        SetSalespersonFilter;
        SetRespCenterFilter;
        SetRange("Date Filter", 0D, WorkDate - 1);
        SetFilter("Date Filter2", '>=%1', WorkDate);
    end;

    var
        CueSetup: Codeunit "Cue Setup";
        ShowDocumentsPendingDodExchService: Boolean;

    local procedure CalculateCueFieldValues()
    begin
        if FieldActive("Average Days Delayed") then
            "Average Days Delayed" := CalculateAverageDaysDelayed;

        if FieldActive("Ready to Ship") then
            "Ready to Ship" := CountOrders(FieldNo("Ready to Ship"));

        if FieldActive("Partially Shipped") then
            "Partially Shipped" := CountOrders(FieldNo("Partially Shipped"));

        if FieldActive(Delayed) then
            Delayed := CountOrders(FieldNo(Delayed));

        if FieldActive("Sales Orders - Open") then
            "Sales Orders - Open" := CountOrders(FieldNo("Salesperson Code Filter"));

        if FieldActive("Sales Quotes - Open") then
            "Sales Quotes - Open" := CountQuotes;
    end;
}

