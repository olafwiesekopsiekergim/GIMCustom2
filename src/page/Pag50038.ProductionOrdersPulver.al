/// <summary>
/// Page Production Orders-Pulver (ID 50038).
/// </summary>
page 50038 "Production Orders-Pulver"
{
    // P0035 05.04.16 DEBIE.ARE Fields "Production Group Code" and ""Print Action Released" added
    // P0034 01.04.16 DEBIE.ARE Fields added
    // P0027 29.03.16 DEBIE.ARE New fields "Shipping Agent Code", "Run Card Pinted Date", "Run Card Pinted Time", "Remaining Quantity",
    //   "Auftr. Verk. an Deb.-Name", Erstellungsdatum, Erstellungsuhrzeit, Erstellungsuser, Änderungsdatum, Änderungsuhrzeit,
    //   "Evtl. Auftragsnr.", "Evtl. Auftragszeilennr.".
    // 
    // P0021 04.03.16 CCBIE.ARE New field SalesOrder."fix-Termin Lieferung"
    // P0020 02.03.16 DEBIE.ARE New object

    Caption = 'Production Orders';
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    PageType = List;
    SourceTable = "Production Order";
    SourceTableView = SORTING("No.", Status)
                      ORDER(Ascending)
                      WHERE(Status = FILTER(Released),
                            "Production Group Code" = FILTER('PULVERN'),
                            "Remaining Quantity" = FILTER(> 0));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Priorität"; Rec.Priorität)
                {
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    Description = 'P0034';

                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {

                    ApplicationArea = All;
                }
                field("Source No."; Rec."Source No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Starting Time"; Rec."Starting Date-Time")
                {
                    Description = 'P0034';
                    ApplicationArea = All;
                }
                // field("Starting Date"; Rec."Starting Date")
                // {
                //     Description = 'P0034';
                //     Editable = ESACC_F21_Editable;
                //     Visible = ESACC_F21_Visible;
                // }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                    Description = 'P0027';
                    ApplicationArea = All;
                }
                field("Lagerbestand 400"; Item."Inventory 400")
                {
                    ApplicationArea = All;
                }
                field("Lagerbestand 401"; Item."Inventory 401")
                {
                    ApplicationArea = All;
                }
                field("Pulver(einseitig)"; Rec."Pulver(einseitig)")
                {
                    Caption = 'Pulvernr.(einseitig)';
                    ApplicationArea = All;
                }
                field("<Pulver(einfach)>"; Rec."Pulver(beidseitig)")
                {
                    Caption = 'Pulvernr.(beidseitig)';
                    ApplicationArea = All;
                }
                field("Pulver(doppelt)"; Rec."Pulver(doppelt)")
                {
                    Caption = 'Pulvernr.(doppelt)';
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1106900010; Links)
            {
                ApplicationArea = All;
            }
            systempart(Control1106900008; Notes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Pro&d. Order")
            {
                // Caption = 'Pro&d. Order';
                // Image = "Order";
                // action(Card)
                // {
                //     Caption = 'Card';
                //     Image = Edit;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;
                //     ShortCutKey = 'Shift+F5';

                //     trigger OnAction()
                //     begin
                //         OpenProductionOrder;
                //     end;
                // }
                group("E&ntries")
                {
                    Caption = 'E&ntries';
                    Image = Entries;
                    action("Item Ledger E&ntries")
                    {
                        Caption = 'Item Ledger E&ntries';
                        Image = ItemLedger;
                        RunObject = Page "Item Ledger Entries";
                        RunPageLink = "Order Type" = CONST(Production),
                                      "Order No." = FIELD("No.");
                        RunPageView = SORTING("Order Type", "Order No.");
                        ShortCutKey = 'Ctrl+F7';
                        ApplicationArea = All;
                    }
                    action("Capacity Ledger Entries")
                    {
                        Caption = 'Capacity Ledger Entries';
                        Image = CapacityLedger;
                        RunObject = Page "Capacity Ledger Entries";
                        RunPageLink = "Order Type" = CONST(Production),
                                      "Order No." = FIELD("No.");
                        RunPageView = SORTING("Order Type", "Order No.");
                        ApplicationArea = All;
                    }
                    action("Value Entries")
                    {
                        Caption = 'Value Entries';
                        Image = ValueLedger;
                        RunObject = Page "Value Entries";
                        RunPageLink = "Order Type" = CONST(Production),
                                      "Order No." = FIELD("No.");
                        RunPageView = SORTING("Order Type", "Order No.");
                        ApplicationArea = All;
                    }
                    action("&Warehouse Entries")
                    {
                        Caption = '&Warehouse Entries';
                        Image = BinLedger;
                        RunObject = Page "Warehouse Entries";
                        RunPageLink = "Source Type" = FILTER(83 | 5407),
                                      "Source Subtype" = FILTER("3" | "4" | "5"),
                                      "Source No." = FIELD("No.");
                        RunPageView = SORTING("Source Type", "Source Subtype", "Source No.");
                        ApplicationArea = All;
                    }
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Prod. Order Comment Sheet";
                    RunPageLink = Status = FIELD(Status),
                                  "Prod. Order No." = FIELD("No.");
                    ApplicationArea = All;
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                separator(Action1106900028)
                {
                }
                action(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Production Order Statistics";
                    RunPageLink = Status = FIELD(Status),
                                  "No." = FIELD("No."),
                                  "Date Filter" = FIELD("Date Filter");
                    ShortCutKey = 'F7';
                    ApplicationArea = All;
                }
            }
        }
        area(processing)
        {
            // action("&Workflow Context Menu")
            // {
            //     Caption = '&Workflow Context Menu';
            //     Image = ExplodeBOM;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     ShortCutKey = 'Shift+Ctrl+W';
            //     trigger OnAction()
            //     var
            //         WorkflowContextMenu: Page "Workflow Context Menu";
            //         RecRef: RecordRef;
            //         MessagePageID: Integer;
            //     begin
            //         // >> WF
            //         RecRef.GetTable(Rec);
            //         Evaluate(MessagePageID, CopyStr(CurrPage.ObjectId(false),
            //           StrPos(CurrPage.ObjectId(false), ' ') + 1, StrLen(CurrPage.ObjectId(false))));
            //         WorkflowContextMenu.SetRecRef(RecRef);
            //         WorkflowContextMenu.SetObjectID(MessagePageID);
            //         WorkflowContextMenu.RunModal;
            //         Clear(WorkflowContextMenu);
            //         // << WF
            //     end;
            // }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Change &Status")
                {
                    Caption = 'Change &Status';
                    Ellipsis = true;
                    Image = ChangeStatus;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Codeunit "Prod. Order Status Management";
                    ApplicationArea = All;
                }
                action("&Update Unit Cost")
                {
                    Caption = '&Update Unit Cost';
                    Ellipsis = true;
                    Image = UpdateUnitCost;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        ProdOrder: Record "Production Order";
                    begin
                        ProdOrder.SetRange(Status, Rec.Status);
                        ProdOrder.SetRange("No.", Rec."No.");

                        REPORT.RunModal(REPORT::"Update Unit Cost", true, true, ProdOrder);
                    end;
                }
                action("Create Inventor&y Put-away/Pick/Movement")
                {
                    Caption = 'Create Inventor&y Put-away/Pick/Movement';
                    Ellipsis = true;
                    Image = CreatePutAway;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.CreateInvtPutAwayPick;
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Prod. Order - Detail Calc.")
            {
                Caption = 'Prod. Order - Detail Calc.';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Prod. Order - Detailed Calc.";
                ApplicationArea = All;
            }
            action("Prod. Order - Precalc. Time")
            {
                Caption = 'Prod. Order - Precalc. Time';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Prod. Order - Precalc. Time";
                ApplicationArea = All;
            }
            action("Production Order - Comp. and Routing")
            {
                Caption = 'Production Order - Comp. and Routing';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Prod. Order Comp. and Routing";
                ApplicationArea = All;
            }
            action("Production Order Job Card")
            {
                Caption = 'Production Order Job Card';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Prod. Order - Job Card";

                ApplicationArea = All;
            }
            action("Production Order - Picking List")
            {
                Caption = 'Production Order - Picking List';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Prod. Order - Picking List";

                ApplicationArea = All;
            }
            action("Production Order - Material Requisition")
            {
                Caption = 'Production Order - Material Requisition';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Prod. Order - Mat. Requisition";

                ApplicationArea = All;
            }
            action("Production Order List")
            {
                Caption = 'Production Order List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Prod. Order - List";

                ApplicationArea = All;
            }
            action("Production Order - Shortage List")
            {
                Caption = 'Production Order - Shortage List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Prod. Order - Shortage List";

                ApplicationArea = All;
            }
            action("Production Order Statistics")
            {
                Caption = 'Production Order Statistics';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Production Order Statistics";
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ProdOrderLine.SetRange(Status, Rec.Status::Released);
        ProdOrderLine.SetRange("Prod. Order No.", Rec."No.");
        ProdOrderLine.SetFilter("Item No.", '<>%1', '');
        ProdOrderLine.SetFilter("Remaining Quantity", '>%1', 0);
        if not ProdOrderLine.Find('-') then
            ProdOrderLine.Init;

        ProdOrderComponent.SetRange("Prod. Order No.", Rec."No.");
        ProdOrderComponent.FindFirst;
        if not Item.Get(ProdOrderComponent."Item No.") then
            Item.Init;

        Item.CalcFields("Inventory 400", "Inventory 401");
    end;

    trigger OnOpenPage()
    begin
        Rec.SetFilter("Due Date", '..%1', CalcDate('+2W', Today));
    end;

    var

        ProdOrderLine: Record "Prod. Order Line";
        ProdOrderComponent: Record "Prod. Order Component";
        Item: Record Item;
        ProductionOrder: Record "Production Order";


}

