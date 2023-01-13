pageextension 50008 "gimVendorCardPageExt" extends "Vendor Card"
{
    layout
    {
        addlast("Address & Contact")
        {
            field("Bestellungs-E-Mail"; "Bestellungs-E-Mail")
            {
                ApplicationArea = All;
            }
            field("Zahlungsavise-E-Mail"; "Zahlungsavise-E-Mail")
            {
                ApplicationArea = All;
            }
            field("Reklamations-E-Mail"; "Reklamations-E-Mail")
            {
                ApplicationArea = All;
            }
            field("Warenmahnungs-E-Mail"; "Warenmahnungs-E-Mail")
            {
                ApplicationArea = All;
            }
        }


    }
}