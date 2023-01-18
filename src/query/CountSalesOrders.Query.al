/// <summary>
/// Query gimCountSalesOrders (ID 50003).
/// </summary>
query 50003 "gimCountSalesOrders"
{
    Caption = 'Count Sales Orders';

    elements
    {
        dataitem(Sales_Header; "Sales Header")
        {
            DataItemTableFilter = "Document Type" = CONST(Order);
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

