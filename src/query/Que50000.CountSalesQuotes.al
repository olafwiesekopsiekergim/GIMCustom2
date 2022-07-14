query 50000 "Count Sales Quotes"
{
    Caption = 'Count Sales Orders';

    elements
    {
        dataitem(Sales_Header; "Sales Header")
        {
            DataItemTableFilter = "Document Type" = CONST(Quote);
            filter(Status; Status)
            {
            }
            filter(Completely_Shipped; "Completely Shipped")
            {
            }
            filter(Responsibility_Center; "Responsibility Center")
            {
            }
            filter(Ship; Ship)
            {
            }
            filter(Invoice; Invoice)
            {
            }
            filter(Shipment_Date; "Shipment Date")
            {
            }
            filter(Salesperson_Code; "Salesperson Code")
            {
            }
            filter(Salesperson_Code_2; "Salesperson Code 2")
            {
            }
            column(Count_Orders)
            {
                Method = Count;
            }
        }
    }
}

