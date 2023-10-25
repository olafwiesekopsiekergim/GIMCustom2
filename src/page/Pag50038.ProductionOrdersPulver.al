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
                    Editable = ESACC_F24_Editable;
                    HideValue = ESACC_F24_HideValue;
                    Visible = ESACC_F24_Visible;
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    Editable = ESACC_F2_Editable;
                    HideValue = ESACC_F2_HideValue;
                    Visible = ESACC_F2_Visible;
                    ApplicationArea = All;
                }
                field("Source No."; Rec."Source No.")
                {
                    Editable = ESACC_F10_Editable;
                    HideValue = ESACC_F10_HideValue;
                    Visible = ESACC_F10_Visible;
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    Editable = ESACC_F3_Editable;
                    HideValue = ESACC_F3_HideValue;
                    Visible = ESACC_F3_Visible;
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    Editable = ESACC_F40_Editable;
                    HideValue = ESACC_F40_HideValue;
                    Visible = ESACC_F40_Visible;
                    ApplicationArea = All;
                }
                field("Starting Time"; Rec."Starting Date-Time")
                {
                    Description = 'P0034';
                    Editable = ESACC_F20_Editable;
                    HideValue = ESACC_F20_HideValue;
                    Visible = ESACC_F20_Visible;
                    ApplicationArea = All;
                }
                // field("Starting Date"; Rec."Starting Date")
                // {
                //     Description = 'P0034';
                //     Editable = ESACC_F21_Editable;
                //     HideValue = ESACC_F21_HideValue;
                //     Visible = ESACC_F21_Visible;
                // }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                    Description = 'P0027';
                    HideValue = ESACC_F50120_HideValue;
                    Visible = ESACC_F50120_Visible;
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
                //     Enabled = ESACC_C1106900038_Enabled;
                //     Image = Edit;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;
                //     ShortCutKey = 'Shift+F5';
                //     Visible = ESACC_C1106900038_Visible;

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
                        Enabled = ESACC_C1106900034_Enabled;
                        Image = ItemLedger;
                        RunObject = Page "Item Ledger Entries";
                        RunPageLink = "Order Type" = CONST(Production),
                                      "Order No." = FIELD("No.");
                        RunPageView = SORTING("Order Type", "Order No.");
                        ShortCutKey = 'Ctrl+F7';
                        Visible = ESACC_C1106900034_Visible;
                        ApplicationArea = All;
                    }
                    action("Capacity Ledger Entries")
                    {
                        Caption = 'Capacity Ledger Entries';
                        Enabled = ESACC_C1106900033_Enabled;
                        Image = CapacityLedger;
                        RunObject = Page "Capacity Ledger Entries";
                        RunPageLink = "Order Type" = CONST(Production),
                                      "Order No." = FIELD("No.");
                        RunPageView = SORTING("Order Type", "Order No.");
                        Visible = ESACC_C1106900033_Visible;
                        ApplicationArea = All;
                    }
                    action("Value Entries")
                    {
                        Caption = 'Value Entries';
                        Enabled = ESACC_C1106900032_Enabled;
                        Image = ValueLedger;
                        RunObject = Page "Value Entries";
                        RunPageLink = "Order Type" = CONST(Production),
                                      "Order No." = FIELD("No.");
                        RunPageView = SORTING("Order Type", "Order No.");
                        Visible = ESACC_C1106900032_Visible;
                        ApplicationArea = All;
                    }
                    action("&Warehouse Entries")
                    {
                        Caption = '&Warehouse Entries';
                        Enabled = ESACC_C1106900031_Enabled;
                        Image = BinLedger;
                        RunObject = Page "Warehouse Entries";
                        RunPageLink = "Source Type" = FILTER(83 | 5407),
                                      "Source Subtype" = FILTER("3" | "4" | "5"),
                                      "Source No." = FIELD("No.");
                        RunPageView = SORTING("Source Type", "Source Subtype", "Source No.");
                        Visible = ESACC_C1106900031_Visible;
                        ApplicationArea = All;
                    }
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Enabled = ESACC_C1106900030_Enabled;
                    Image = ViewComments;
                    RunObject = Page "Prod. Order Comment Sheet";
                    RunPageLink = Status = FIELD(Status),
                                  "Prod. Order No." = FIELD("No.");
                    Visible = ESACC_C1106900030_Visible;
                    ApplicationArea = All;
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    Caption = 'Dimensions';
                    Enabled = ESACC_C1106900029_Enabled;
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    Visible = ESACC_C1106900029_Visible;
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
                    Enabled = ESACC_C1106900027_Enabled;
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Production Order Statistics";
                    RunPageLink = Status = FIELD(Status),
                                  "No." = FIELD("No."),
                                  "Date Filter" = FIELD("Date Filter");
                    ShortCutKey = 'F7';
                    Visible = ESACC_C1106900027_Visible;
                    ApplicationArea = All;
                }
            }
        }
        area(processing)
        {
            // action("&Workflow Context Menu")
            // {
            //     Caption = '&Workflow Context Menu';
            //     Enabled = ESACC_C1106900053_Enabled;
            //     Image = ExplodeBOM;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     ShortCutKey = 'Shift+Ctrl+W';
            //     Visible = ESACC_C1106900053_Visible;

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
                    Enabled = ESACC_C1106900051_Enabled;
                    Image = ChangeStatus;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Codeunit "Prod. Order Status Management";
                    Visible = ESACC_C1106900051_Visible;
                    ApplicationArea = All;
                }
                action("&Update Unit Cost")
                {
                    Caption = '&Update Unit Cost';
                    Ellipsis = true;
                    Enabled = ESACC_C1106900050_Enabled;
                    Image = UpdateUnitCost;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = ESACC_C1106900050_Visible;
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
                    Enabled = ESACC_C1106900049_Enabled;
                    Image = CreatePutAway;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = ESACC_C1106900049_Visible;
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
                Enabled = ESACC_C1106900047_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Prod. Order - Detailed Calc.";
                Visible = ESACC_C1106900047_Visible;
                ApplicationArea = All;
            }
            action("Prod. Order - Precalc. Time")
            {
                Caption = 'Prod. Order - Precalc. Time';
                Enabled = ESACC_C1106900046_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Prod. Order - Precalc. Time";
                Visible = ESACC_C1106900046_Visible;
                ApplicationArea = All;
            }
            action("Production Order - Comp. and Routing")
            {
                Caption = 'Production Order - Comp. and Routing';
                Enabled = ESACC_C1106900045_Enabled;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Prod. Order Comp. and Routing";
                Visible = ESACC_C1106900045_Visible;
                ApplicationArea = All;
            }
            action("Production Order Job Card")
            {
                Caption = 'Production Order Job Card';
                Enabled = ESACC_C1106900044_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Prod. Order - Job Card";
                Visible = ESACC_C1106900044_Visible;
                ApplicationArea = All;
            }
            action("Production Order - Picking List")
            {
                Caption = 'Production Order - Picking List';
                Enabled = ESACC_C1106900043_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Prod. Order - Picking List";
                Visible = ESACC_C1106900043_Visible;
                ApplicationArea = All;
            }
            action("Production Order - Material Requisition")
            {
                Caption = 'Production Order - Material Requisition';
                Enabled = ESACC_C1106900042_Enabled;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Prod. Order - Mat. Requisition";
                Visible = ESACC_C1106900042_Visible;
                ApplicationArea = All;
            }
            action("Production Order List")
            {
                Caption = 'Production Order List';
                Enabled = ESACC_C1106900041_Enabled;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Prod. Order - List";
                Visible = ESACC_C1106900041_Visible;
                ApplicationArea = All;
            }
            action("Production Order - Shortage List")
            {
                Caption = 'Production Order - Shortage List';
                Enabled = ESACC_C1106900040_Enabled;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Prod. Order - Shortage List";
                Visible = ESACC_C1106900040_Visible;
                ApplicationArea = All;
            }
            action("Production Order Statistics")
            {
                Caption = 'Production Order Statistics';
                Enabled = ESACC_C1106900039_Enabled;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Production Order Statistics";
                Visible = ESACC_C1106900039_Visible;
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
        ;
        // ESACC_EasySecurity(true);
        Rec.SetFilter("Due Date", '..%1', CalcDate('+2W', Today));
    end;

    var
        // ESACC_ESFLADSMgt: Codeunit "ES FLADS Management";
        [InDataSet]
        ESACC_C1106900027_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900027_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900029_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900029_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900030_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900030_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900031_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900031_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900032_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900032_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900033_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900033_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900034_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900034_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900038_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900038_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900039_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900039_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900040_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900040_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900041_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900041_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900042_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900042_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900043_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900043_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900044_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900044_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900045_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900045_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900046_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900046_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900047_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900047_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900049_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900049_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900050_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900050_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900051_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900051_Enabled: Boolean;
        [InDataSet]
        ESACC_C1106900053_Visible: Boolean;
        [InDataSet]
        ESACC_C1106900053_Enabled: Boolean;
        [InDataSet]
        ESACC_F1_Visible: Boolean;
        [InDataSet]
        ESACC_F1_Editable: Boolean;
        [InDataSet]
        ESACC_F1_HideValue: Boolean;
        [InDataSet]
        ESACC_F2_Visible: Boolean;
        [InDataSet]
        ESACC_F2_Editable: Boolean;
        [InDataSet]
        ESACC_F2_HideValue: Boolean;
        [InDataSet]
        ESACC_F3_Visible: Boolean;
        [InDataSet]
        ESACC_F3_Editable: Boolean;
        [InDataSet]
        ESACC_F3_HideValue: Boolean;
        [InDataSet]
        ESACC_F4_Visible: Boolean;
        [InDataSet]
        ESACC_F4_Editable: Boolean;
        [InDataSet]
        ESACC_F4_HideValue: Boolean;
        [InDataSet]
        ESACC_F5_Visible: Boolean;
        [InDataSet]
        ESACC_F5_Editable: Boolean;
        [InDataSet]
        ESACC_F5_HideValue: Boolean;
        [InDataSet]
        ESACC_F7_Visible: Boolean;
        [InDataSet]
        ESACC_F7_Editable: Boolean;
        [InDataSet]
        ESACC_F7_HideValue: Boolean;
        [InDataSet]
        ESACC_F10_Visible: Boolean;
        [InDataSet]
        ESACC_F10_Editable: Boolean;
        [InDataSet]
        ESACC_F10_HideValue: Boolean;
        [InDataSet]
        ESACC_F11_Visible: Boolean;
        [InDataSet]
        ESACC_F11_Editable: Boolean;
        [InDataSet]
        ESACC_F11_HideValue: Boolean;
        [InDataSet]
        ESACC_F19_Visible: Boolean;
        [InDataSet]
        ESACC_F19_HideValue: Boolean;
        [InDataSet]
        ESACC_F20_Visible: Boolean;
        [InDataSet]
        ESACC_F20_Editable: Boolean;
        [InDataSet]
        ESACC_F20_HideValue: Boolean;
        [InDataSet]
        ESACC_F21_Visible: Boolean;
        [InDataSet]
        ESACC_F21_Editable: Boolean;
        [InDataSet]
        ESACC_F21_HideValue: Boolean;
        [InDataSet]
        ESACC_F22_Visible: Boolean;
        [InDataSet]
        ESACC_F22_Editable: Boolean;
        [InDataSet]
        ESACC_F22_HideValue: Boolean;
        [InDataSet]
        ESACC_F23_Visible: Boolean;
        [InDataSet]
        ESACC_F23_Editable: Boolean;
        [InDataSet]
        ESACC_F23_HideValue: Boolean;
        [InDataSet]
        ESACC_F24_Visible: Boolean;
        [InDataSet]
        ESACC_F24_Editable: Boolean;
        [InDataSet]
        ESACC_F24_HideValue: Boolean;
        [InDataSet]
        ESACC_F25_Visible: Boolean;
        [InDataSet]
        ESACC_F25_Editable: Boolean;
        [InDataSet]
        ESACC_F25_HideValue: Boolean;
        [InDataSet]
        ESACC_F30_Visible: Boolean;
        [InDataSet]
        ESACC_F30_Editable: Boolean;
        [InDataSet]
        ESACC_F30_HideValue: Boolean;
        [InDataSet]
        ESACC_F31_Visible: Boolean;
        [InDataSet]
        ESACC_F31_Editable: Boolean;
        [InDataSet]
        ESACC_F31_HideValue: Boolean;
        [InDataSet]
        ESACC_F32_Visible: Boolean;
        [InDataSet]
        ESACC_F32_Editable: Boolean;
        [InDataSet]
        ESACC_F32_HideValue: Boolean;
        [InDataSet]
        ESACC_F33_Visible: Boolean;
        [InDataSet]
        ESACC_F33_Editable: Boolean;
        [InDataSet]
        ESACC_F33_HideValue: Boolean;
        [InDataSet]
        ESACC_F40_Visible: Boolean;
        [InDataSet]
        ESACC_F40_Editable: Boolean;
        [InDataSet]
        ESACC_F40_HideValue: Boolean;
        [InDataSet]
        ESACC_F9000_Visible: Boolean;
        [InDataSet]
        ESACC_F9000_Editable: Boolean;
        [InDataSet]
        ESACC_F9000_HideValue: Boolean;
        [InDataSet]
        ESACC_F50003_Visible: Boolean;
        [InDataSet]
        ESACC_F50003_HideValue: Boolean;
        [InDataSet]
        ESACC_F50007_Visible: Boolean;
        [InDataSet]
        ESACC_F50007_Editable: Boolean;
        [InDataSet]
        ESACC_F50007_HideValue: Boolean;
        [InDataSet]
        ESACC_F50008_Visible: Boolean;
        [InDataSet]
        ESACC_F50008_Editable: Boolean;
        [InDataSet]
        ESACC_F50008_HideValue: Boolean;
        [InDataSet]
        ESACC_F50010_Visible: Boolean;
        [InDataSet]
        ESACC_F50010_Editable: Boolean;
        [InDataSet]
        ESACC_F50010_HideValue: Boolean;
        [InDataSet]
        ESACC_F50011_Visible: Boolean;
        [InDataSet]
        ESACC_F50011_Editable: Boolean;
        [InDataSet]
        ESACC_F50011_HideValue: Boolean;
        [InDataSet]
        ESACC_F50111_Visible: Boolean;
        [InDataSet]
        ESACC_F50111_Editable: Boolean;
        [InDataSet]
        ESACC_F50111_HideValue: Boolean;
        [InDataSet]
        ESACC_F50120_Visible: Boolean;
        [InDataSet]
        ESACC_F50120_HideValue: Boolean;
        [InDataSet]
        ESACC_F50130_Visible: Boolean;
        [InDataSet]
        ESACC_F50130_Editable: Boolean;
        [InDataSet]
        ESACC_F50130_HideValue: Boolean;
        [InDataSet]
        ESACC_F50200_Visible: Boolean;
        [InDataSet]
        ESACC_F50200_HideValue: Boolean;
        [InDataSet]
        ESACC_F80000_Visible: Boolean;
        [InDataSet]
        ESACC_F80000_Editable: Boolean;
        [InDataSet]
        ESACC_F80000_HideValue: Boolean;
        [InDataSet]
        ESACC_F80001_Visible: Boolean;
        [InDataSet]
        ESACC_F80001_Editable: Boolean;
        [InDataSet]
        ESACC_F80001_HideValue: Boolean;
        [InDataSet]
        ESACC_F80002_Visible: Boolean;
        [InDataSet]
        ESACC_F80002_Editable: Boolean;
        [InDataSet]
        ESACC_F80002_HideValue: Boolean;
        [InDataSet]
        ESACC_F80003_Visible: Boolean;
        [InDataSet]
        ESACC_F80003_Editable: Boolean;
        [InDataSet]
        ESACC_F80003_HideValue: Boolean;
        [InDataSet]
        ESACC_F80004_Visible: Boolean;
        [InDataSet]
        ESACC_F80004_Editable: Boolean;
        [InDataSet]
        ESACC_F80004_HideValue: Boolean;
        ProdOrderLine: Record "Prod. Order Line";
        ProdOrderComponent: Record "Prod. Order Component";
        Item: Record Item;
        ProductionOrder: Record "Production Order";

    // local procedure ESACC_EasySecurity(OpenObject: Boolean)
    // var
    //     SetFilters: Codeunit "ES FLADS Set Filters";
    //     TempBoolean: Boolean;
    // begin
    //     if OpenObject then begin
    //         SetFilters.Filter5405(Rec, 8, 50035);

    //         TempBoolean := CurrPage.Editable;
    //         if ESACC_ESFLADSMgt.PageGeneral(5405, 50035, TempBoolean) then
    //             CurrPage.Editable := TempBoolean;
    //     end;

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900027,
    //       ESACC_C1106900027_Visible, ESACC_C1106900027_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900029,
    //       ESACC_C1106900029_Visible, ESACC_C1106900029_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900030,
    //       ESACC_C1106900030_Visible, ESACC_C1106900030_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900031,
    //       ESACC_C1106900031_Visible, ESACC_C1106900031_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900032,
    //       ESACC_C1106900032_Visible, ESACC_C1106900032_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900033,
    //       ESACC_C1106900033_Visible, ESACC_C1106900033_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900034,
    //       ESACC_C1106900034_Visible, ESACC_C1106900034_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900038,
    //       ESACC_C1106900038_Visible, ESACC_C1106900038_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900039,
    //       ESACC_C1106900039_Visible, ESACC_C1106900039_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900040,
    //       ESACC_C1106900040_Visible, ESACC_C1106900040_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900041,
    //       ESACC_C1106900041_Visible, ESACC_C1106900041_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900042,
    //       ESACC_C1106900042_Visible, ESACC_C1106900042_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900043,
    //       ESACC_C1106900043_Visible, ESACC_C1106900043_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900044,
    //       ESACC_C1106900044_Visible, ESACC_C1106900044_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900045,
    //       ESACC_C1106900045_Visible, ESACC_C1106900045_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900046,
    //       ESACC_C1106900046_Visible, ESACC_C1106900046_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900047,
    //       ESACC_C1106900047_Visible, ESACC_C1106900047_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900049,
    //       ESACC_C1106900049_Visible, ESACC_C1106900049_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900050,
    //       ESACC_C1106900050_Visible, ESACC_C1106900050_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900051,
    //       ESACC_C1106900051_Visible, ESACC_C1106900051_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 1, 1106900053,
    //       ESACC_C1106900053_Visible, ESACC_C1106900053_Enabled, TempBoolean);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 1,
    //       ESACC_F1_Visible, ESACC_F1_Editable, ESACC_F1_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 2,
    //       ESACC_F2_Visible, ESACC_F2_Editable, ESACC_F2_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 3,
    //       ESACC_F3_Visible, ESACC_F3_Editable, ESACC_F3_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 4,
    //       ESACC_F4_Visible, ESACC_F4_Editable, ESACC_F4_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 5,
    //       ESACC_F5_Visible, ESACC_F5_Editable, ESACC_F5_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 7,
    //       ESACC_F7_Visible, ESACC_F7_Editable, ESACC_F7_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 10,
    //       ESACC_F10_Visible, ESACC_F10_Editable, ESACC_F10_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 11,
    //       ESACC_F11_Visible, ESACC_F11_Editable, ESACC_F11_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 19,
    //       ESACC_F19_Visible, TempBoolean, ESACC_F19_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 20,
    //       ESACC_F20_Visible, ESACC_F20_Editable, ESACC_F20_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 21,
    //       ESACC_F21_Visible, ESACC_F21_Editable, ESACC_F21_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 22,
    //       ESACC_F22_Visible, ESACC_F22_Editable, ESACC_F22_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 23,
    //       ESACC_F23_Visible, ESACC_F23_Editable, ESACC_F23_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 24,
    //       ESACC_F24_Visible, ESACC_F24_Editable, ESACC_F24_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 25,
    //       ESACC_F25_Visible, ESACC_F25_Editable, ESACC_F25_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 30,
    //       ESACC_F30_Visible, ESACC_F30_Editable, ESACC_F30_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 31,
    //       ESACC_F31_Visible, ESACC_F31_Editable, ESACC_F31_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 32,
    //       ESACC_F32_Visible, ESACC_F32_Editable, ESACC_F32_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 33,
    //       ESACC_F33_Visible, ESACC_F33_Editable, ESACC_F33_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 40,
    //       ESACC_F40_Visible, ESACC_F40_Editable, ESACC_F40_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 9000,
    //       ESACC_F9000_Visible, ESACC_F9000_Editable, ESACC_F9000_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 50003,
    //       ESACC_F50003_Visible, TempBoolean, ESACC_F50003_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 50007,
    //       ESACC_F50007_Visible, ESACC_F50007_Editable, ESACC_F50007_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 50008,
    //       ESACC_F50008_Visible, ESACC_F50008_Editable, ESACC_F50008_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 50010,
    //       ESACC_F50010_Visible, ESACC_F50010_Editable, ESACC_F50010_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 50011,
    //       ESACC_F50011_Visible, ESACC_F50011_Editable, ESACC_F50011_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 50111,
    //       ESACC_F50111_Visible, ESACC_F50111_Editable, ESACC_F50111_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 50120,
    //       ESACC_F50120_Visible, TempBoolean, ESACC_F50120_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 50130,
    //       ESACC_F50130_Visible, ESACC_F50130_Editable, ESACC_F50130_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 50200,
    //       ESACC_F50200_Visible, TempBoolean, ESACC_F50200_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 80000,
    //       ESACC_F80000_Visible, ESACC_F80000_Editable, ESACC_F80000_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 80001,
    //       ESACC_F80001_Visible, ESACC_F80001_Editable, ESACC_F80001_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 80002,
    //       ESACC_F80002_Visible, ESACC_F80002_Editable, ESACC_F80002_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 80003,
    //       ESACC_F80003_Visible, ESACC_F80003_Editable, ESACC_F80003_HideValue);

    //     ESACC_ESFLADSMgt.PageControl(
    //       5405, 50035, 0, 80004,
    //       ESACC_F80004_Visible, ESACC_F80004_Editable, ESACC_F80004_HideValue);

    //     ESACC_EasySecurityManual(OpenObject);
    // end;

    // local procedure ESACC_EasySecurityManual(OpenObject: Boolean)
    // begin
    // end;
}

