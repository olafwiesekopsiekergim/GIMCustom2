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
}