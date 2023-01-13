pageextension 50012 "gimSalesOrderSubPageExt" extends "Sales Order Subform"
{
    layout
    {
        addfirst(Control1)
        {
            field(Position; Position)
            {
                ApplicationArea = All;
            }
            field("PZ drucken"; "PZ drucken")
            {
                ApplicationArea = All;
            }
            field(Frachtkosten; Frachtkosten)
            {
                ApplicationArea = All;
            }
            field(Frachtkostencode; Frachtkostencode)
            {
                ApplicationArea = All;
            }

        }
    }
}
