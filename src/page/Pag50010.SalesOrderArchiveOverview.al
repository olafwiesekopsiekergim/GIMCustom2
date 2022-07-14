page 50010 "Sales Order Archive Overview"
{
    PageType = List;
    SourceTable = "Sales Header Archive";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Your Reference"; Rec."Your Reference")
                {
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                }
                field("Sell-to Customer Name 2"; Rec."Sell-to Customer Name 2")
                {
                }
                field("Sell-to Address"; Rec."Sell-to Address")
                {
                }
                field("Sell-to Address 2"; Rec."Sell-to Address 2")
                {
                }
                field("Sell-to City"; Rec."Sell-to City")
                {
                }
                field("VAT Country/Region Code"; Rec."VAT Country/Region Code")
                {
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                }
                field("Creation Date"; Rec."Creation Date")
                {
                }
                field("External Document No."; Rec."External Document No.")
                {
                }
                field(Webrequest; Rec.Webrequest)
                {
                }
                field("Sales Quote No."; Rec."Sales Quote No.")
                {
                }
                field("Version No."; Rec."Version No.")
                {
                }
                field("Date Archived"; Rec."Date Archived")
                {
                }
                field("Archived By"; Rec."Archived By")
                {
                }
            }
        }
        area(factboxes)
        {
            part(Control1000000021; "Sales Order Archive Subform")
            {
            }
            part(Control1000000022; "Sales Hist. Sell-to FactBox")
            {
            }
        }
    }

    actions
    {
    }
}

