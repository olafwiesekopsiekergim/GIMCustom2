pageextension 50045 gimSalesOrder extends "Sales Order"
{

    layout
    {
        modify("Sell-to Customer Name")
        {
            StyleExpr = CustomerIsBlocked;
        }

        addafter("Sell-to Customer No.")
        {
            // field(Blocked; Blocked)
            // {

            // }   
        }



    }
    var
        [InDataSet]
        CustomerIsBlocked: Boolean;

    local procedure IsCostumerBlocked()
    begin
        //     rec.CalcFields(Blocked);
        //     if rec.Blocked.AsInteger() > rec.Blocked::" ".AsInteger() then
        //         CustomerIsBlocked := true
        //     else
        //         CustomerIsBlocked := false;
    end;
}
