pageextension 50001 "gimShipmentMethodPageExt" extends "Shipment Methods"
{
    layout
    {
        addlast(content)
        {
            field("Print Checklist"; "Print Checklist")
            {
                ApplicationArea = All;
                Description = 'P0008';
            }

        }
    }
}