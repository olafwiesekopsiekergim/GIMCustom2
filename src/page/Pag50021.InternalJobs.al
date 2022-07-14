page 50021 "Internal Jobs"
{
    // P0005 16.02.16 CCBIE.ARE New object

    Caption = 'Internal Jobs';
    RefreshOnActivate = true;
    SourceTable = "Internal Job";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                }
                field("General Contractor Code"; Rec."General Contractor Code")
                {
                }
                field("General Contractor"; Rec."General Contractor")
                {
                }
                field("Planner Code"; Rec."Planner Code")
                {
                }
                field(Planner; Rec.Planner)
                {
                }
                field(City; Rec.City)
                {
                }
                field("Bauvorhaben Description"; Rec."Bauvorhaben Description")
                {
                }
                field("Bauvorhaben Description 2"; Rec."Bauvorhaben Description 2")
                {
                }
                field("Make Desription"; Rec."Make Desription")
                {
                }
                field("Item Descitption"; Rec."Item Descitption")
                {
                }
                field("Supplement to"; Rec."Supplement to")
                {
                }
                field("Cabinet Part Received"; Rec."Cabinet Part Received")
                {
                }
                field("Win/Loss"; Rec."Win/Loss")
                {
                }
                part(Control1106900015; "Internal Job Subform")
                {
                    SubPageLink = "Internal Job No." = FIELD("No.");
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Sales Documents")
            {
                Caption = 'Sales Documents';
                action(Quotes)
                {
                    Caption = 'Quotes';

                    trigger OnAction()
                    begin
                        Rec.ShowSalesDoc(0);
                    end;
                }
                action(Orders)
                {
                    Caption = 'Orders';

                    trigger OnAction()
                    begin
                        Rec.ShowSalesDoc(1);
                    end;
                }
                action(Invoices)
                {
                    Caption = 'Invoices';

                    trigger OnAction()
                    begin
                        Rec.ShowSalesDoc(2);
                    end;
                }
                action("Credit Memos")
                {
                    Caption = 'Credit Memos';

                    trigger OnAction()
                    begin
                        Rec.ShowSalesDoc(3);
                    end;
                }
                separator(Action1106900022)
                {
                }
                action("Arch. Quotes")
                {
                    Caption = 'Arch. Quotes';

                    trigger OnAction()
                    begin
                        Rec.ShowArchSalesDoc(0);
                    end;
                }
                action("Arch. Orders")
                {
                    Caption = 'Arch. Orders';

                    trigger OnAction()
                    begin
                        Rec.ShowArchSalesDoc(1);
                    end;
                }
                separator(Action1106900019)
                {
                }
                action("Posted Sales Shipments")
                {
                    Caption = 'Posted Sales Shipments';

                    trigger OnAction()
                    begin
                        Rec.ShowSalesShipment;
                    end;
                }
                action("Posted Sales Invoices")
                {
                    Caption = 'Posted Sales Invoices';

                    trigger OnAction()
                    begin
                        Rec.ShowSalesInvoice;
                    end;
                }
                action("Posted Sales Credit Memos")
                {
                    Caption = 'Posted Sales Credit Memos';

                    trigger OnAction()
                    begin
                        Rec.ShowSalesCrMemo;
                    end;
                }
            }
        }
    }
}

