/// <summary>
/// TableExtension GIMSalesCue (ID 50070) extends Record Sales Cue.
/// </summary>
tableextension 50070 "GIMSalesCue" extends "Sales Cue"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Salesperson Code Filter"; Code[30])
        {
            FieldClass = FlowFilter;
        }
        field(50001; "Overdue Sales Documents"; Integer)
        {
            CalcFormula = Count("Cust. Ledger Entry" WHERE(Open = CONST(true),
                                                            "Due Date" = FIELD("Date Filter"),
                                                            "Document Type" = FILTER(Invoice | "Credit Memo"),
                                                            "Salesperson Code" = FIELD("Salesperson Code Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Sales Quotes - Released"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Quote),
                                                      Status = FILTER(Released),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Verkaufsangebote - Freigegeben';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; "Sales Orders - Released"; Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER(Order),
                                                      Status = FILTER(Released),
                                                      "Responsibility Center" = FIELD("Responsibility Center Filter"),
                                                      "Salesperson Code" = FIELD("Salesperson Code Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
        UserSetup: record "User Setup";


    /// <summary>
    /// CountShowSalesOrderToInvoice.
    /// </summary>
    /// <param name="ShowDocument">Boolean.</param>
    /// <param name="ShowAll">Boolean.</param>
    /// <returns>Return variable CountOfOrder of type Integer.</returns>
    procedure CountShowSalesOrderToInvoice(ShowDocument: Boolean; ShowAll: Boolean) CountOfOrder: Integer
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        DocIsOK: Boolean;

    begin
        // #AT
        CountOfOrder := 0;
        SalesHeader.ClearMarks;
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange(Status, SalesHeader.Status::Released);
        FilterGroup(2);
        SalesHeader.SetFilter("Responsibility Center", GetFilter("Responsibility Center Filter"));
        UserSetup.Get(UserId);
        if not ShowAll then begin
            if UserSetup.Innendienst then
                SalesHeader.SetFilter("Salesperson Code 2", UserSetup."Salespers./Purch. Code")
            else
                SalesHeader.SetFilter("Salesperson Code", UserSetup."Salespers./Purch. Code");
        end;
        FilterGroup(0);
        if not SalesHeader.FindSet then
            exit;

        repeat
            SalesLine.SetRange("Document Type", SalesHeader."Document Type");
            SalesLine.SetRange("Document No.", SalesHeader."No.");
            DocIsOK := false;
            if SalesLine.FindSet then begin
                repeat
                    DocIsOK := SalesLine.Quantity = SalesLine."Quantity Shipped";
                until (SalesLine.Next = 0) or (not DocIsOK);
            end;

            if DocIsOK then begin
                if ShowDocument then
                    SalesHeader.Mark(true)
                else
                    CountOfOrder += 1;
            end;

        until SalesHeader.Next = 0;

        if not ShowDocument then
            exit;

        SalesHeader.MarkedOnly(true);
        PAGE.RunModal(9305, SalesHeader);
        // #AT
    end;


    /// <summary>
    /// CountShowSalesOrderToPartiallyInvoice.
    /// </summary>
    /// <param name="ShowDocument">Boolean.</param>
    /// <param name="ShowAll">Boolean.</param>
    /// <returns>Return variable CountOfOrder of type Integer.</returns>
    procedure CountShowSalesOrderToPartiallyInvoice(ShowDocument: Boolean; ShowAll: Boolean) CountOfOrder: Integer
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        DocIsOK: Boolean;
    begin
        // #AT
        CountOfOrder := 0;
        SalesHeader.ClearMarks;
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange(Status, SalesHeader.Status::Released);
        FilterGroup(2);
        SalesHeader.SetFilter("Responsibility Center", GetFilter("Responsibility Center Filter"));
        UserSetup.Get(UserId);
        if not ShowAll then begin
            if UserSetup.Innendienst then
                SalesHeader.SetFilter("Salesperson Code 2", UserSetup."Salespers./Purch. Code")
            else
                SalesHeader.SetFilter("Salesperson Code", UserSetup."Salespers./Purch. Code");
        end;
        FilterGroup(0);
        if not SalesHeader.FindSet then
            exit;

        repeat
            SalesLine.SetRange("Document Type", SalesHeader."Document Type");
            SalesLine.SetRange("Document No.", SalesHeader."No.");
            DocIsOK := false;
            if SalesLine.FindSet then begin
                repeat
                    DocIsOK := (SalesLine."Quantity Shipped" <> 0) and (SalesLine."Qty. Shipped (Base)" > SalesLine."Qty. Invoiced (Base)");
                until (SalesLine.Next = 0) or DocIsOK;
            end;

            if DocIsOK then begin
                if ShowDocument then
                    SalesHeader.Mark(true)
                else
                    CountOfOrder += 1;
            end;

        until SalesHeader.Next = 0;

        if not ShowDocument then
            exit;

        SalesHeader.MarkedOnly(true);
        PAGE.RunModal(9305, SalesHeader);
        // #AT
    end;


    /// <summary>
    /// ShowInvoicetosend.
    /// </summary>
    /// <param name="ShowDocument">Boolean.</param>
    /// <param name="ShowAll">Boolean.</param>
    /// <returns>Return variable CountOfOrder of type Integer.</returns>
    procedure ShowInvoicetosend(ShowDocument: Boolean; ShowAll: Boolean) CountOfOrder: Integer
    var
        SalesInvHeader: Record "Sales Invoice Header";
        SalesInvLine: Record "Sales Invoice Line";
        DocIsOK: Boolean;
    begin
        // #AT
        CountOfOrder := 0;
        FilterGroup(2);
        SalesInvHeader.SetFilter("Responsibility Center", GetFilter("Responsibility Center Filter"));
        SalesInvHeader.SetRange("No. Printed", 0);
        UserSetup.Get(UserId);
        if not ShowAll then begin
            if UserSetup.Innendienst then
                SalesInvHeader.SetFilter("Salesperson Code 2", UserSetup."Salespers./Purch. Code")
            else
                SalesInvHeader.SetFilter("Salesperson Code", UserSetup."Salespers./Purch. Code");
        end;
        FilterGroup(0);
        if not SalesInvHeader.FindSet then
            exit;

        if not ShowDocument then
            CountOfOrder := SalesInvHeader.Count;

        if not ShowDocument then
            exit;

        PAGE.RunModal(143, SalesInvHeader);
        // #AT
    end;

    /// <summary>
    /// CountQuotesOverdue.
    /// </summary>
    /// <param name="ShowDocument">Boolean.</param>
    /// <param name="ShowAll">Boolean.</param>
    /// <returns>Return variable CountofQuote of type Integer.</returns>
    procedure CountQuotesOverdue(ShowDocument: Boolean; ShowAll: Boolean) CountofQuote: Integer
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
    begin
        // #AT
        CountofQuote := 0;
        SalesHeader.ClearMarks;
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Quote);
        SalesHeader.SetFilter("Quote Expiration Date", '..%1', WorkDate);
        FilterGroup(2);
        SalesHeader.SetFilter("Responsibility Center", GetFilter("Responsibility Center Filter"));
        UserSetup.Get(UserId);
        if not ShowAll then begin
            if UserSetup.Innendienst then
                SalesHeader.SetFilter("Salesperson Code 2", UserSetup."Salespers./Purch. Code")
            else
                SalesHeader.SetFilter("Salesperson Code", UserSetup."Salespers./Purch. Code");
        end;
        FilterGroup(0);
        if not SalesHeader.FindSet then
            exit;

        if not ShowDocument then
            CountofQuote := SalesHeader.Count;

        if not ShowDocument then
            exit;

        PAGE.RunModal(9300, SalesHeader);
        // #AT
    end;

    /// <summary>
    /// CountQuotesUpcomming.
    /// </summary>
    /// <param name="ShowDocument">Boolean.</param>
    /// <param name="ShowAll">Boolean.</param>
    /// <returns>Return variable CountofQuote of type Integer.</returns>
    procedure CountQuotesUpcomming(ShowDocument: Boolean; ShowAll: Boolean) CountofQuote: Integer
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
    begin
        // #AT
        CountofQuote := 0;
        SalesHeader.ClearMarks;
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Quote);
        SalesHeader.SetFilter("Quote Expiration Date", '>%1', WorkDate);
        FilterGroup(2);
        SalesHeader.SetFilter("Responsibility Center", GetFilter("Responsibility Center Filter"));
        UserSetup.Get(UserId);
        if not ShowAll then begin
            if UserSetup.Innendienst then
                SalesHeader.SetFilter("Salesperson Code 2", UserSetup."Salespers./Purch. Code")
            else
                SalesHeader.SetFilter("Salesperson Code", UserSetup."Salespers./Purch. Code");
        end;
        FilterGroup(0);
        if not SalesHeader.FindSet then
            exit;

        if not ShowDocument then
            CountofQuote := SalesHeader.Count;

        if not ShowDocument then
            exit;

        PAGE.RunModal(9300, SalesHeader);
        // #AT
    end;

    /// <summary>
    /// CountWiedervorlage.
    /// </summary>
    /// <param name="ShowDocument">Boolean.</param>
    /// <param name="ShowAll">Boolean.</param>
    /// <returns>Return variable CountofDocuments of type Integer.</returns>
    procedure CountWiedervorlage(ShowDocument: Boolean; ShowAll: Boolean) CountofDocuments: Integer
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
    begin
        // #AT
        CountofDocuments := 0;
        SalesHeader.ClearMarks;
        SalesHeader.SetFilter(Wiedervorlage, '<>%1', 0D);
        FilterGroup(2);
        SalesHeader.SetFilter("Responsibility Center", GetFilter("Responsibility Center Filter"));
        UserSetup.Get(UserId);
        if not ShowAll then begin
            if UserSetup.Innendienst then
                SalesHeader.SetFilter("Salesperson Code 2", UserSetup."Salespers./Purch. Code")
            else
                SalesHeader.SetFilter("Salesperson Code", UserSetup."Salespers./Purch. Code");
        end;
        FilterGroup(0);
        if not SalesHeader.FindSet then
            exit;

        if not ShowDocument then
            CountofDocuments := SalesHeader.Count;

        if not ShowDocument then
            exit;

        PAGE.RunModal(50005, SalesHeader);
        // #AT
    end;

    local procedure FilterOrders2(var SalesHeader: Record "Sales Header"; FieldNumber: Integer)
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange(Status, SalesHeader.Status::Released);
        SalesHeader.SetRange("Completely Shipped", false);
        case FieldNumber of
            FieldNo("Ready to Ship"):
                begin
                    SalesHeader.SetRange(Ship);
                    SalesHeader.SetFilter("Shipment Date", GetFilter("Date Filter2"));
                    SalesHeader.SetFilter("Responsibility Center", GetFilter("Responsibility Center Filter"));
                    UserSetup.Get(UserId);
                    if UserSetup.Innendienst then
                        SalesHeader.SetFilter("Salesperson Code 2", UserSetup."Salespers./Purch. Code")
                    else
                        SalesHeader.SetFilter("Salesperson Code", UserSetup."Salespers./Purch. Code");
                end;
            FieldNo("Partially Shipped"):
                begin
                    SalesHeader.SetRange(Ship, true);
                    SalesHeader.SetFilter("Shipment Date", GetFilter("Date Filter2"));
                    SalesHeader.SetFilter("Responsibility Center", GetFilter("Responsibility Center Filter"));
                    UserSetup.Get(UserId);
                    if UserSetup.Innendienst then
                        SalesHeader.SetFilter("Salesperson Code 2", UserSetup."Salespers./Purch. Code")
                    else
                        SalesHeader.SetFilter("Salesperson Code", UserSetup."Salespers./Purch. Code");
                end;
            FieldNo(Delayed):
                begin
                    SalesHeader.SetRange(Ship);
                    SalesHeader.SetFilter("Shipment Date", GetFilter("Date Filter"));
                    SalesHeader.FilterGroup(2);
                    SalesHeader.SetFilter("Shipment Date", '<>%1', 0D);
                    SalesHeader.FilterGroup(0);
                    SalesHeader.SetFilter("Responsibility Center", GetFilter("Responsibility Center Filter"));
                    UserSetup.Get(UserId);
                    if UserSetup.Innendienst then
                        SalesHeader.SetFilter("Salesperson Code 2", UserSetup."Salespers./Purch. Code")
                    else
                        SalesHeader.SetFilter("Salesperson Code", UserSetup."Salespers./Purch. Code");
                end;
            FieldNo("Salesperson Code Filter"):
                begin
                    SalesHeader.SetRange(Status, SalesHeader.Status::Released);
                end;
        end;
        FilterGroup(2);
        SalesHeader.SetFilter("Responsibility Center", GetFilter("Responsibility Center Filter"));
        UserSetup.Get(UserId);
        if UserSetup.Innendienst then
            SalesHeader.SetFilter("Salesperson Code 2", UserSetup."Salespers./Purch. Code")
        else
            SalesHeader.SetFilter("Salesperson Code", UserSetup."Salespers./Purch. Code");
        FilterGroup(0);
    end;


    /// <summary>
    /// ShowOrders2.
    /// </summary>
    /// <param name="FieldNumber">Integer.</param>
    procedure ShowOrders2(FieldNumber: Integer)
    var
        SalesHeader: Record "Sales Header";
    begin
        FilterOrders2(SalesHeader, FieldNumber);
        PAGE.Run(PAGE::"Sales Order List", SalesHeader);
    end;

    /// <summary>
    /// CountOrders2.
    /// </summary>
    /// <param name="FieldNumber">Integer.</param>
    /// <returns>Return value of type Integer.</returns>
    procedure CountOrders2(FieldNumber: Integer): Integer
    var
        CountSalesOrders: Query "gimCountSalesOrders";
        SalesOrderWithBlankShipmentDateCount: Integer;
        CountSalesQuotes: Query "Count Sales Quotes";
        Counter: Integer;
    begin
        CountSalesOrders.SetRange(Status, CountSalesOrders.Status::Released);
        CountSalesOrders.SetRange(Completely_Shipped, false);
        FilterGroup(2);
        CountSalesOrders.SetFilter(Responsibility_Center, GetFilter("Responsibility Center Filter"));
        UserSetup.Get(UserId);
        if UserSetup.Innendienst then
            CountSalesOrders.SetFilter(Salesperson_Code_2, UserSetup."Salespers./Purch. Code")
        else
            CountSalesOrders.SetFilter(Salesperson_Code, UserSetup."Salespers./Purch. Code");

        FilterGroup(0);

        case FieldNumber of
            FieldNo("Ready to Ship"):
                begin
                    CountSalesOrders.SetRange(Ship);
                    CountSalesOrders.SetFilter(Shipment_Date, GetFilter("Date Filter2"));
                    UserSetup.Get(UserId);
                    if UserSetup.Innendienst then
                        CountSalesOrders.SetFilter(Salesperson_Code_2, UserSetup."Salespers./Purch. Code")
                    else
                        CountSalesOrders.SetFilter(Salesperson_Code, UserSetup."Salespers./Purch. Code");

                end;
            FieldNo("Partially Shipped"):
                begin
                    CountSalesOrders.SetRange(Ship, true);
                    CountSalesOrders.SetFilter(Shipment_Date, GetFilter("Date Filter2"));
                    UserSetup.Get(UserId);
                    if UserSetup.Innendienst then
                        CountSalesOrders.SetFilter(Salesperson_Code_2, UserSetup."Salespers./Purch. Code")
                    else
                        CountSalesOrders.SetFilter(Salesperson_Code, UserSetup."Salespers./Purch. Code");
                end;
            FieldNo(Delayed):
                begin
                    CountSalesOrders.SetRange(Ship);
                    CountSalesOrders.SetRange(Shipment_Date, 0D);
                    CountSalesOrders.Open;
                    CountSalesOrders.Read;
                    SalesOrderWithBlankShipmentDateCount := CountSalesOrders.Count_Orders;
                    CountSalesOrders.SetFilter(Shipment_Date, GetFilter("Date Filter"));
                    UserSetup.Get(UserId);
                    if UserSetup.Innendienst then
                        CountSalesOrders.SetFilter(Salesperson_Code_2, UserSetup."Salespers./Purch. Code")
                    else
                        CountSalesOrders.SetFilter(Salesperson_Code, UserSetup."Salespers./Purch. Code");
                end;
            FieldNo("Salesperson Code Filter"):
                begin
                    CountSalesOrders.SetRange(Status, CountSalesOrders.Status::Released);
                end;

        end;
        CountSalesOrders.Open;
        CountSalesOrders.Read;
        exit(CountSalesOrders.Count_Orders - SalesOrderWithBlankShipmentDateCount);
    end;

    /// <summary>
    /// SetSalespersonFilter.
    /// </summary>
    procedure SetSalespersonFilter()
    var
        UserSetupMgt: Codeunit "User Setup Management";
        RespCenterCode: Code[10];
    begin
        UserSetup.Get(UserId);
        if UserSetup."Salespers./Purch. Code" <> '' then begin
            FilterGroup(2);
            SetRange("Salesperson Code Filter", UserSetup."Salespers./Purch. Code");
            FilterGroup(0);
        end;
    end;
    /// <summary>
    /// CountQuotes.
    /// </summary>
    /// <returns>Return value of type Integer.</returns>
    procedure CountQuotes(): Integer
    var
        CountSalesOrders: Query "Count Sales Orders";
        SalesOrderWithBlankShipmentDateCount: Integer;
        CountSalesQuotes: Query "Count Sales Quotes";
        Counter: Integer;
    begin
        CountSalesOrders.SetRange(Status, CountSalesOrders.Status::Released);
        CountSalesOrders.SetRange(Completely_Shipped, false);
        FilterGroup(2);
        CountSalesQuotes.SetFilter(Responsibility_Center, GetFilter("Responsibility Center Filter"));
        UserSetup.Get(UserId);
        if UserSetup.Innendienst then
            CountSalesQuotes.SetFilter(Salesperson_Code_2, UserSetup."Salespers./Purch. Code")
        else
            CountSalesQuotes.SetFilter(Salesperson_Code, UserSetup."Salespers./Purch. Code");
        FilterGroup(0);
        CountSalesQuotes.SetRange(Status, CountSalesQuotes.Status::Open);
        CountSalesQuotes.Open;
        CountSalesQuotes.Read;
        exit(CountSalesQuotes.Count_Orders);
    end;

}