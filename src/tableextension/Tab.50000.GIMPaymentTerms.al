/// <summary>
/// TableExtension GIM Payment Terms (ID 50000) extends Record Payment Terms.
/// </summary>
tableextension 50000 "GIM Payment Terms" extends "Payment Terms"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Gültig für"; Option)
        {
            OptionCaption = 'Always,Customer,Vendor';
            OptionMembers = Immer,Debitor,Kreditor;
        }
        field(50005; "Gültig von"; Date)
        {
            Caption = 'Valid from';
        }
        field(50010; "Gültig bis"; Date)
        {
            Caption = 'Valid until';
        }

    }

    var
        myInt: Integer;
}