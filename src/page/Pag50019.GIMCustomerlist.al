page 50019 "GIMCustomerlist"
{
    Caption = 'Customerlist';
    Editable = false;
    PageType = List;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Name 2"; Rec."Name 2")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Address 2"; Rec."Address 2")
                {
                }
                field(City; Rec.City)
                {
                }
                field("Phone No."; Rec."Phone No.")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Territory Code"; Rec."Territory Code")
                {
                }
                field("Chain Name"; Rec."Chain Name")
                {
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Language Code"; Rec."Language Code")
                {
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field(Balance; Rec.Balance)
                {
                }
                field("Net Change"; Rec."Net Change")
                {
                }
                field("Fax No."; Rec."Fax No.")
                {
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                }
                field("Post Code"; Rec."Post Code")
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                }
                field("Home Page"; Rec."Home Page")
                {
                }
                field("Bill-To E-Mail"; rec."Bill-To E-Mail")
                {
                }
            }
        }
    }

    actions
    {
    }
}

