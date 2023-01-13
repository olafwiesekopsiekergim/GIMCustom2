pageextension 50011 "gimSalesOrderListPageext" extends "Sales Order List"
{
    layout
    {
        addlast(Control1)
        {
            field(Zusatzstatus; Zusatzstatus)
            {
                ApplicationArea = All;
            }
        }
    }
}