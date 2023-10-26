/// <summary>
/// Page Production Orders (ID 50035).
/// </summary>
page 50035 "Production Orders"
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
    SourceTableView = SORTING(Status, "No.")
                      ORDER(Ascending)
                      WHERE(Status = FILTER(.. Released));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Status; Rec.Status)
                {

                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {

                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
                {

                    ApplicationArea = All;
                }
                field("SalesOrderLine.""Shipment Date"""; SalesOrderLine."Shipment Date")
                {
                    Caption = 'Auftrag. WA-Datum';
                    StyleExpr = StyleTextSOShipmentDate;
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {

                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {

                    ApplicationArea = All;
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                    ApplicationArea = All;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                    ApplicationArea = All;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                    ApplicationArea = All;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                    ApplicationArea = All;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                    ApplicationArea = All;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Production Group Code"; Rec."Production Group Code")
                {
                    Description = 'P0035';
                    ApplicationArea = All;
                }
                field("Print Action Released"; Rec."Print Action Released")
                {
                    Description = 'P0035';
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
                field("Description 2"; Rec."Description 2")
                {

                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {

                    ApplicationArea = All;
                }
                field("ProdOrderLine.""Unit of Measure Code"""; ProdOrderLine."Unit of Measure Code")
                {
                    Caption = 'Einheit';
                    ApplicationArea = All;
                }
                field("Item.""Gross Weight"""; Item."Gross Weight")
                {
                    Caption = 'Bruttogewicht';
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {

                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    Description = 'P0034';
                    ApplicationArea = All;
                }
                field("Routing No."; Rec."Routing No.")
                {
                    Description = 'P0034';
                    ApplicationArea = All;
                }
                field("Starting Time"; Rec."Starting date-Time")
                {
                    Description = 'P0034';
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    Description = 'P0034';
                    ApplicationArea = All;
                }
                field("Ending Time"; Rec."Ending Date-Time")
                {
                    Description = 'P0034';
                    ApplicationArea = All;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    Description = 'P0034';
                    ApplicationArea = All;
                }
                field("Finished Date"; Rec."Finished Date")
                {
                    Description = 'P0034';
                    ApplicationArea = All;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    Description = 'P0034';
                    ApplicationArea = All;
                }
                field("Search Description"; Rec."Search Description")
                {
                    Description = 'P0034';
                    ApplicationArea = All;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    Description = 'P0034';
                    ApplicationArea = All;
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    Description = 'P0034';
                    ApplicationArea = All;
                }
                field("SalesOrderLine.""Line Amount"""; SalesOrderLine."Line Amount")
                {
                    Caption = 'Verkaufsbetrag';
                    ApplicationArea = All;
                }
                field("SalesOrder.""Internal Job No."""; SalesOrder."Internal Job No.")
                {
                    Caption = 'interne Projektnr.';
                    ApplicationArea = All;
                }
                field("SalesOrder.""Ship-to Country/Region Code"""; SalesOrder."Ship-to Country/Region Code")
                {
                    Caption = 'Lief. an Ländercode';
                    ApplicationArea = All;
                }
                field("ShipmentMethod.Description"; ShipmentMethod.Description)
                {
                    Caption = 'Lieferbedingung';
                    ApplicationArea = All;
                }
                field("SalesOrder.""fix-Termin Lieferung"""; SalesOrder."fix-Termin Lieferung")
                {
                    Caption = 'Fix-Termin Lieferung';
                    Description = 'P0021';
                    ApplicationArea = All;
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    Description = 'P0027';
                    ApplicationArea = All;
                }
                field("Run Card Pinted Date"; Rec."Run Card Pinted Date")
                {
                    Description = 'P0027';
                    ApplicationArea = All;
                }
                field("Run Card Pinted Time"; Rec."Run Card Pinted Time")
                {
                    Description = 'P0027';
                    ApplicationArea = All;
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                    Description = 'P0027';
                    ApplicationArea = All;
                }
                field("Evtl. Auftragsnr."; Rec."Evtl. Auftragsnr.")
                {
                    Description = 'P0020,P0027';
                    ApplicationArea = All;
                }
                field("Evtl. Auftragszeilennr."; Rec."Evtl. Auftragszeilennr.")
                {
                    Description = 'P0020,P0027';
                    ApplicationArea = All;
                }
                field("Auftr. Verk. an Deb.-Name"; Rec."Auftr. Verk. an Deb.-Name")
                {
                    Description = 'P0027';
                    ApplicationArea = All;
                }
                field(Erstellungsdatum; Rec.Erstellungsdatum)
                {
                    Description = 'P0027';
                    ApplicationArea = All;
                }
                field(Erstellungsuhrzeit; Rec.Erstellungsuhrzeit)
                {
                    Description = 'P0027';
                    ApplicationArea = All;
                }
                field(Erstellungsuser; Rec.Erstellungsuser)
                {
                    Description = 'P0027';
                    ApplicationArea = All;
                }
                field("Änderungsdatum"; Rec.Änderungsdatum)
                {
                    Description = 'P0027';
                    ApplicationArea = All;
                }
                field("Änderungsuhrzeit"; Rec.Änderungsuhrzeit)
                {
                    Description = 'P0027';
                    ApplicationArea = All;
                }
                field("Lief. an Name"; Rec."Lief. an Name")
                {
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
                Caption = 'Pro&d. Order';
                Image = "Order";
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
        ProdOrderLine.SetRange(Status, Rec.Status);
        ProdOrderLine.SetRange("Prod. Order No.", Rec."No.");
        ProdOrderLine.SetFilter("Item No.", '<>%1', '');
        if not ProdOrderLine.Find('-') then
            ProdOrderLine.Init;

        if not SalesOrder.Get(1, Rec."Evtl. Auftragsnr.") then
            SalesOrder.Init;
        if not SalesOrderLine.Get(1, Rec."Evtl. Auftragsnr.", Rec."Evtl. Auftragszeilennr.") then
            SalesOrderLine.Init;

        if not Item.Get(Rec."Source No.") then
            Item.Init;
        if not ShipmentMethod.Get(SalesOrder."Shipment Method Code") then
            ShipmentMethod.Init;

        if (SalesOrderLine."Shipment Date" <> Rec."Due Date") then
            StyleTextSOShipmentDate := 'Unfavorable'
        else
            StyleTextSOShipmentDate := 'Standard';

        // ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Clear(ShortcutDimCode);
    end;

    trigger OnOpenPage()
    begin

    end;

    var
        ProdOrderLine: Record "Prod. Order Line";
        SalesOrder: Record "Sales Header";
        SalesOrderLine: Record "Sales Line";
        Item: Record Item;
        ShipmentMethod: Record "Shipment Method";
        ManuPrintReport: Codeunit "Manu. Print Report";
        StyleTextSOShipmentDate: Text;
        ShortcutDimCode: array[8] of Code[20];

}

