page 50022 "Internal Jobs List"
{
    // P0005 16.02.16 CCBIE.ARE New object

    Caption = 'Internal Jobs List';
    CardPageID = "Internal Jobs";
    PageType = List;
    SourceTable = "Internal Job";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("General Contractor Code"; Rec."General Contractor Code")
                {
                    ApplicationArea = All;
                }
                field("General Contractor"; Rec."General Contractor")
                {
                    ApplicationArea = All;
                }
                field("Planner Code"; Rec."Planner Code")
                {
                    ApplicationArea = All;
                }
                field(Planner; Rec.Planner)
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field("Bauvorhaben Description"; Rec."Bauvorhaben Description")
                {
                    ApplicationArea = All;
                }
                field("Bauvorhaben Description 2"; Rec."Bauvorhaben Description 2")
                {
                    ApplicationArea = All;
                }
                field("Make Desription"; Rec."Make Desription")
                {
                    ApplicationArea = All;
                }
                field("Item Descitption"; Rec."Item Descitption")
                {
                    ApplicationArea = All;
                }
                field("Cabinet Part Received"; Rec."Cabinet Part Received")
                {
                    ApplicationArea = All;
                }
                field("Supplement to"; Rec."Supplement to")
                {
                    ApplicationArea = All;
                }
                field("Win/Loss"; Rec."Win/Loss")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1106900016; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control1106900017; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control1106900018; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control1106900019; Links)
            {
                ApplicationArea = All;
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
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.ShowSalesDoc(0);
                    end;
                }
                action(Orders)
                {
                    Caption = 'Orders';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.ShowSalesDoc(1);
                    end;
                }
                action(Invoices)
                {
                    Caption = 'Invoices';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.ShowSalesDoc(2);
                    end;
                }
                action("Credit Memos")
                {
                    Caption = 'Credit Memos';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.ShowSalesDoc(3);
                    end;
                }
                separator(Action1106900026)
                {
                }
                action("Arch. Quotes")
                {
                    Caption = 'Arch. Quotes';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.ShowArchSalesDoc(0);
                    end;
                }
                action("Arch. Orders")
                {
                    Caption = 'Arch. Orders';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.ShowArchSalesDoc(1);
                    end;
                }
                separator(Action1106900035)
                {
                }
                action("Posted Sales Shipments")
                {
                    Caption = 'Posted Sales Shipments';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.ShowSalesShipment;
                    end;
                }
                action("Posted Sales Invoices")
                {
                    Caption = 'Posted Sales Invoices';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.ShowSalesInvoice;
                    end;
                }
                action("Posted Sales Credit Memos")
                {
                    Caption = 'Posted Sales Credit Memos';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.ShowSalesCrMemo;
                    end;
                }
            }
        }
    }
}

