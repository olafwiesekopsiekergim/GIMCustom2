page 5012410 "TAN Output Journal"
{
    // Copyright (Exclusive Rights): COSMO CONSULT Licensing GmbH, Sarnen, Switzerland
    // 
    // :PMW14.00:11:1
    //   # Ocject deleted.
    // 
    // :PMW14.02:28:1
    //   # Object created.
    // 
    // :PMW15.00:241:1
    //   # Changes due to UI and programming standards
    // 
    // :PMW15.00:238:1
    //   # Usage of new data access commands
    // 
    // :PMW15.00.01:26:1
    //   # From property ActiveControlOnOpen changed
    //   # Field property NextControl of field "Routing TAN" changed
    // 
    // :PMW16.00:116:1
    //   # Connection between add. information controls deleted due to tansforamtion
    // 
    // #PMW16.00.02.05:T511 16.06.11 DEMSR.IST
    //   Save changes before processing next TAN
    // 
    // #PMW17.00:T101 12.10.12 DEMSR.IST
    //   Update to NAV 2013
    //   ISSERVICETIER condition deleted
    //   Obsolet function OnAfterGetCurrRecord deleted
    // 
    // #PMW17.10.00.03:T100 31.07.14 DEMSR.IST - Rebranding
    // 
    // GIM0009 16.5.2022 MultiFunction im Routing TAN Feld
    //                   Prefix T Standardfunktion
    //                   Prefix S öffnet zugehörige Produktionsstückliste
    // 
    // GIM0016 29.11.2022 Prefix B öffnet gegebenes Journalblatt

    AutoSplitKey = true;
    Caption = 'TAN Output Journal';
    DataCaptionFields = "Journal Batch Name";
    DelayedInsert = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = "Item Journal Line";

    layout
    {
        area(content)
        {
            field(CurrentJnlBatchName; CurrentJnlBatchName)
            {
                Caption = 'Batch Name';
                Editable = false;
                Enabled = false;
                Lookup = true;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    CurrPage.SaveRecord;
                    ItemJnlMgt.LookupName(CurrentJnlBatchName, Rec);
                    CurrPage.Update(false);
                    ItemJnlMgt.CheckName(CurrentJnlBatchName, Rec);
                end;

                trigger OnValidate()
                begin
                    ItemJnlMgt.CheckName(CurrentJnlBatchName, Rec);
                    CurrentJnlBatchNameOnAfterVali;
                end;
            }
            field(currTester; currTester)
            {
                Caption = 'Aktueller Tester';
                Editable = false;
                Enabled = false;
            }
            field(RoutingTAN; RoutingTAN)
            {
                Caption = 'Routing TAN';

                trigger OnValidate()
                begin
                    RoutingTANOnAfterValidate;
                end;
            }
            repeater(Control5012400)
            {
                Editable = false;
                Enabled = false;
                ShowCaption = false;
                field("Routing TAN"; "Routing TAN")
                {
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field("Order No."; "Order No.")
                {

                    trigger OnValidate()
                    begin
                        ItemJnlMgt.GetOutput(Rec, ProdOrderDescription, OperationName);
                    end;
                }
                field("Order Line No."; "Order Line No.")
                {
                    Visible = false;
                }
                field("Document No."; "Document No.")
                {
                }
                field("Item No."; "Item No.")
                {

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupItemNo;
                        ShowShortcutDimCode(ShortcutDimCode);
                    end;

                    trigger OnValidate()
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field("Operation No."; "Operation No.")
                {

                    trigger OnValidate()
                    begin
                        ItemJnlMgt.GetOutput(Rec, ProdOrderDescription, OperationName);
                    end;
                }
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {
                }
                field("Variant Code"; "Variant Code")
                {
                    Visible = false;
                }
                field(Description; Description)
                {
                }
                field("Work Shift Code"; "Work Shift Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
                {
                    Visible = false;
                }
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    CaptionClass = '1,2,3';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(3, ShortcutDimCode[3]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    CaptionClass = '1,2,4';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(4, ShortcutDimCode[4]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                    end;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    CaptionClass = '1,2,5';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(5, ShortcutDimCode[5]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                    end;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(6, ShortcutDimCode[6]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                    end;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(7, ShortcutDimCode[7]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                    end;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(8, ShortcutDimCode[8]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                    end;
                }
                field("Starting Time"; "Starting Time")
                {
                    Visible = false;
                }
                field("Ending Time"; "Ending Time")
                {
                    Visible = false;
                }
                field("Concurrent Capacity"; "Concurrent Capacity")
                {
                    Visible = false;
                }
                field("Setup Time"; "Setup Time")
                {
                    Visible = false;
                }
                field("Run Time"; "Run Time")
                {
                }
                field("Cap. Unit of Measure Code"; "Cap. Unit of Measure Code")
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                    Visible = false;
                }
                field("Location Code"; "Location Code")
                {
                    Visible = false;
                }
                field("Bin Code"; "Bin Code")
                {
                    Visible = false;
                }
                field("Scrap Code"; "Scrap Code")
                {
                    Visible = false;
                }
                field("Output Quantity"; "Output Quantity")
                {
                }
                field("Scrap Quantity"; "Scrap Quantity")
                {
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field(Finished; Finished)
                {
                }
                field("Applies-to Entry"; "Applies-to Entry")
                {
                }
                field("Document Date"; "Document Date")
                {
                    Visible = false;
                }
                field("External Document No."; "External Document No.")
                {
                    Visible = false;
                }
                field("Serial No."; "Serial No.")
                {
                }
            }
            group(Control5012420)
            {
                ShowCaption = false;
                fixed(Control1900925601)
                {
                    ShowCaption = false;
                    group("Prod. Order Name")
                    {
                        Caption = 'Prod. Order Name';
                        field(ProdOrderDescription; ProdOrderDescription)
                        {
                            Editable = false;
                        }
                    }
                    group(Operation)
                    {
                        Caption = 'Operation';
                        field(OperationName; OperationName)
                        {
                            Caption = 'Operation';
                            Editable = false;
                        }
                    }
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        ShowDimensions;
                        CurrPage.SaveRecord;
                    end;
                }
                action("Item Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction()
                    begin
                        OpenItemTrackingLines(false);
                    end;
                }
                action("Bin Contents")
                {
                    Caption = 'Bin Contents';
                    Image = BinContent;
                    RunObject = Page "Bin Contents List";
                    RunPageLink = "Location Code" = FIELD ("Location Code"),
                                  "Item No." = FIELD ("Item No."),
                                  "Variant Code" = FIELD ("Variant Code");
                    RunPageView = SORTING ("Location Code", "Bin Code", "Item No.", "Variant Code");
                }
            }
            group("Pro&d. Order")
            {
                Caption = 'Pro&d. Order';
                Image = "Order";
                action(Card)
                {
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Page "Released Production Order";
                    RunPageLink = "No." = FIELD ("Order No.");
                    ShortCutKey = 'Shift+F7';
                }
                group("Ledger E&ntries")
                {
                    Caption = 'Ledger E&ntries';
                    Image = Entries;
                    action("Item Ledger E&ntries")
                    {
                        Caption = 'Item Ledger E&ntries';
                        Image = ItemLedger;
                        RunObject = Page "Item Ledger Entries";
                        RunPageLink = "Order Type" = CONST (Production),
                                      "Order No." = FIELD ("Order No.");
                        RunPageView = SORTING ("Order Type", "Order No.");
                        ShortCutKey = 'Ctrl+F7';
                    }
                    action("Capacity Ledger Entries")
                    {
                        Caption = 'Capacity Ledger Entries';
                        Image = CapacityLedger;
                        Promoted = false;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Capacity Ledger Entries";
                        RunPageLink = "Order Type" = CONST (Production),
                                      "Order No." = FIELD ("Order No.");
                        RunPageView = SORTING ("Order Type", "Order No.");
                    }
                    action("Value Entries")
                    {
                        Caption = 'Value Entries';
                        Image = ValueLedger;
                        RunObject = Page "Value Entries";
                        RunPageLink = "Order Type" = CONST (Production),
                                      "Order No." = FIELD ("Order No.");
                        RunPageView = SORTING ("Order Type", "Order No.");
                    }
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Explode &Routing")
                {
                    Caption = 'Explode &Routing';
                    Image = ExplodeRouting;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Codeunit "Output Jnl.-Expl. Route";
                }
                action("Arbeitsblatt wechseln..")
                {
                    Caption = 'Arbeitsblatt wechseln..';

                    trigger OnAction()
                    begin
                        CurrPage.SaveRecord;
                        ItemJnlMgt.LookupName(CurrentJnlBatchName, Rec);
                        CurrPage.Update(false);
                        ItemJnlMgt.CheckName(CurrentJnlBatchName, Rec);
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action("Test Report")
                {
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;

                    trigger OnAction()
                    begin
                        ReportPrint.PrintItemJnlLine(Rec);
                    end;
                }
                action(Post)
                {
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    begin
                        TrySetApplyToEntries;
                        PostingItemJnlFromProduction(false);
                        CurrentJnlBatchName := GetRangeMax("Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
                action("Post and &Print")
                {
                    Caption = 'Post and &Print';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction()
                    begin
                        TrySetApplyToEntries;
                        PostingItemJnlFromProduction(true);
                        CurrentJnlBatchName := GetRangeMax("Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
            }
            action("&Print")
            {
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    ItemJnlLine: Record "Item Journal Line";
                begin
                    ItemJnlLine.Copy(Rec);
                    ItemJnlLine.SetRange("Journal Template Name", "Journal Template Name");
                    ItemJnlLine.SetRange("Journal Batch Name", "Journal Batch Name");
                    REPORT.RunModal(REPORT::"Inventory Movement", true, true, ItemJnlLine);
                end;
            }
            action("Produktionsplan Reihenfolgenplanung")
            {
                Caption = 'Produktionsplan Reihenfolgenplanung';
                RunObject = Page SequenceProductionPlanGIM;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        ItemJnlMgt.GetOutput(Rec, ProdOrderDescription, OperationName);
    end;

    trigger OnAfterGetRecord()
    begin
        ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnDeleteRecord(): Boolean
    var
        ReserveItemJnlLine: Codeunit "Item Jnl. Line-Reserve";
    begin
        Commit;
        if not ReserveItemJnlLine.DeleteLineConfirm(Rec) then
            exit(false);
        ReserveItemJnlLine.DeleteLine(Rec);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        SetUpNewLine(xRec);
        Validate("Entry Type", "Entry Type"::Output);
        Clear(ShortcutDimCode);
    end;

    trigger OnOpenPage()
    var
        JnlSelected: Boolean;
    begin
        OpenedFromBatch := ("Journal Batch Name" <> '') and ("Journal Template Name" = '');
        if OpenedFromBatch then begin
            CurrentJnlBatchName := "Journal Batch Name";
            ItemJnlMgt.OpenJnl(CurrentJnlBatchName, Rec);
            exit;
        end;
        ItemJnlMgt.TemplateSelection(PAGE::"Output Journal", 5, false, Rec, JnlSelected);
        if not JnlSelected then
            Error('');
        ItemJnlMgt.OpenJnl(CurrentJnlBatchName, Rec);

        //GIM0009
        currTester := '';
    end;

    var
        ItemJnlMgt: Codeunit ItemJnlManagement;
        ReportPrint: Codeunit "Test Report-Print";
        ProdOrderDescription: Text[50];
        OperationName: Text[50];
        CurrentJnlBatchName: Code[10];
        ShortcutDimCode: array[8] of Code[20];
        OpenedFromBatch: Boolean;
        RoutingTAN: Code[20];
        currTester: Code[20];

    local procedure CurrentJnlBatchNameOnAfterVali()
    begin
        CurrPage.SaveRecord;
        ItemJnlMgt.SetName(CurrentJnlBatchName, Rec);
        CurrPage.Update(false);
    end;

    [Scope('Internal')]
    procedure TrySetApplyToEntries()
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        ItemJournalLine2: Record "Item Journal Line";
        ReservationEntry: Record "Reservation Entry";
    begin
        ItemJournalLine2.Copy(Rec);
        if ItemJournalLine2.FindSet then
            repeat
                if FindReservationsReverseOutput(ReservationEntry, ItemJournalLine2) then
                    repeat
                        if FindILEFromReservation(ItemLedgerEntry, ItemJournalLine2, ReservationEntry, "Order No.") then begin
                            ReservationEntry.Validate("Appl.-to Item Entry", ItemLedgerEntry."Entry No.");
                            ReservationEntry.Modify(true);
                        end;
                    until ReservationEntry.Next = 0;

            until ItemJournalLine2.Next = 0;
    end;

    local procedure FindReservationsReverseOutput(var ReservationEntry: Record "Reservation Entry"; ItemJnlLine: Record "Item Journal Line"): Boolean
    begin
        if ItemJnlLine.Quantity >= 0 then
            exit(false);

        ReservationEntry.SetCurrentKey(
          "Source ID", "Source Ref. No.", "Source Type", "Source Subtype",
          "Source Batch Name", "Source Prod. Order Line");
        ReservationEntry.SetRange("Source ID", ItemJnlLine."Journal Template Name");
        ReservationEntry.SetRange("Source Ref. No.", ItemJnlLine."Line No.");
        ReservationEntry.SetRange("Source Type", DATABASE::"Item Journal Line");
        ReservationEntry.SetRange("Source Subtype", ItemJnlLine."Entry Type");
        ReservationEntry.SetRange("Source Batch Name", ItemJnlLine."Journal Batch Name");

        ReservationEntry.SetFilter("Serial No.", '<>%1', '');
        ReservationEntry.SetRange("Qty. to Handle (Base)", -1);
        ReservationEntry.SetRange("Appl.-to Item Entry", 0);

        exit(ReservationEntry.FindSet);
    end;

    local procedure FindILEFromReservation(var ItemLedgerEntry: Record "Item Ledger Entry"; ItemJnlLine: Record "Item Journal Line"; ReservationEntry: Record "Reservation Entry"; ProductionOrderNo: Code[20]): Boolean
    begin
        ItemLedgerEntry.SetCurrentKey("Item No.", Open, "Variant Code", Positive,
          "Location Code", "Posting Date", "Expiration Date", "Lot No.", "Serial No.");

        ItemLedgerEntry.SetRange("Item No.", ItemJnlLine."Item No.");
        ItemLedgerEntry.SetRange(Open, true);
        ItemLedgerEntry.SetRange("Variant Code", ItemJnlLine."Variant Code");
        ItemLedgerEntry.SetRange(Positive, true);
        ItemLedgerEntry.SetRange("Location Code", ItemJnlLine."Location Code");
        ItemLedgerEntry.SetRange("Serial No.", ReservationEntry."Lot No.");
        ItemLedgerEntry.SetRange("Serial No.", ReservationEntry."Serial No.");
        ItemLedgerEntry.SetRange("Document No.", ProductionOrderNo);

        exit(ItemLedgerEntry.FindSet);
    end;

    [Scope('Internal')]
    procedure HandleRoutingTAN()
    var
        lProdOrderFeedbackService: Codeunit "Prod. Order Feedback Service";
        myNotification: Notification;
    begin
        // >> #PMW16.00.02.05:T511
        if "Line No." <> 0 then begin
            if Modify then;
        end;
        // << #PMW16.00.02.05:T511
        if currTester <> '' then begin
            if lProdOrderFeedbackService.InsertTANOutputJnlLine(Rec, RoutingTAN, currTester, 0, 0) then
                FindLast;

        end else begin
            myNotification.Message('Bitte legen Sie zuerst einen Prüfer fest');
            myNotification.Send;
        end;
    end;

    local procedure RoutingTANOnAfterValidate()
    var
        strPrefix: Text;
    begin
        //GIM0009 Flexibles Barcodefeld mit verknüpfter Action
        strPrefix := CopyStr(RoutingTAN, 1, 1);
        case UpperCase(strPrefix) of
            'T':
                HandleRoutingTAN;
            'S':
                OpenProdOrderComponents;
            'P':
                setCurrTester;
            'B':
                setJnlBatchname;
            'Q':
                ProcessPulver;
        end;


        //reset Barcode
        CurrPage.Update(false);
        Clear(RoutingTAN);
    end;

    local procedure OpenProdOrderComponents()
    var
        ProdOrderComponent: Record "Prod. Order Component";
        ProdOrderLine: Record "Prod. Order Line";
        ProdOrderRoutingLine: Record "Prod. Order Routing Line";
        ProdOrderComponents: Page ProdOrderCompGIM;
        posDivider: Integer;
    begin
        //GIM0009
        posDivider := StrPos(RoutingTAN, '$');
        if posDivider > 0 then
            RoutingTAN := CopyStr(RoutingTAN, 1, posDivider - 1);
        ProdOrderRoutingLine.SetRange("Routing TAN", CopyStr(RoutingTAN, 2));

        if ProdOrderRoutingLine.FindFirst then begin
            ProdOrderLine.SetRange(Status, ProdOrderRoutingLine.Status);
            ProdOrderLine.SetRange("Prod. Order No.", ProdOrderRoutingLine."Prod. Order No.");
            ProdOrderLine.SetRange("Line No.", ProdOrderRoutingLine."Routing Reference No.");
            if ProdOrderLine.FindFirst then begin
                ProdOrderComponent.SetRange(Status, ProdOrderLine.Status);
                ProdOrderComponent.SetRange("Prod. Order No.", ProdOrderLine."Prod. Order No.");
                ProdOrderComponent.SetRange("Prod. Order Line No.", ProdOrderLine."Line No.");
                if ProdOrderComponent.FindSet then begin
                    ProdOrderComponents.SetTableView(ProdOrderComponent);
                    ProdOrderComponents.Editable(false);
                    ProdOrderComponents.RunModal;
                end;
            end;
        end;
    end;

    local procedure setCurrTester()
    begin
        //GIM0009
        currTester := CopyStr(RoutingTAN, 2);
    end;

    [Scope('Internal')]
    procedure setCurrJnlBatchName(strName: Code[10])
    begin
        CurrentJnlBatchName := strName;
    end;

    local procedure setJnlBatchname()
    begin
        CurrPage.SaveRecord;
        //ItemJnlMgt.LookupName(CurrentJnlBatchName,Rec);
        setCurrJnlBatchName := CopyStr(RoutingTAN, 2);
        ItemJnlMgt.SetName(CurrentJnlBatchName, Rec);
        CurrPage.Update(false);
        ItemJnlMgt.CheckName(CurrentJnlBatchName, Rec);
    end;

    local procedure ProcessPulver()
    var
        dialogPulvern: Page DialogPulvern;
        OutputQty: Decimal;
        ScrapQty: Decimal;
        LableQty: Decimal;
        lProdOrderFeedbackService: Codeunit "Prod. Order Feedback Service";
        IsLastOperation: Boolean;
    begin
        //Ermittle FA-Zeile

        //Fertiggestellte Menge (Output Qty) abfragen
        //Etikettenanzahl abfragen (max 50)
        IsLastOperation := true; //lProdOrderFeedbackService.IsLastOperationWithTAN(COPYSTR(RoutingTAN,2));
        dialogPulvern.SetVisiblity(IsLastOperation);
        if dialogPulvern.RunModal = ACTION::OK then begin
            OutputQty := dialogPulvern.GetOutputQty;
            ScrapQty := dialogPulvern.GetScrapQuantity;
            LableQty := dialogPulvern.GetLableQty;
        end;

        //MESSAGE('Fertigestellte Menge: %1 Anzahl Etiketten: %2',OutputQty,LableQty);
        //Buchungszeile erstellen
        if lProdOrderFeedbackService.InsertTANOutputJnlLine(Rec, CopyStr(RoutingTAN, 2), currTester, OutputQty, ScrapQty) then
            FindLast;
        if lProdOrderFeedbackService.InsertTANOutputJnlLine(Rec, CopyStr(IncStr(RoutingTAN), 2), currTester, OutputQty, ScrapQty) then
            FindLast;


        //Etiketten drucken
        if LableQty > 0 then
            PrintPulverLable;
    end;

    [Scope('Internal')]
    procedure PrintPulverLable()
    var
        ProdLine: Record "Prod. Order Line";
        ProdLabel: Report "Etikett Fertigung";
        ProdRouting: Record "Prod. Order Routing Line";
    begin
        //GIM Simes 13.02.2023: Hier wurde die ProdLine direkt nach der RoutingTAN gefiltert, das musste erst über die ProdRoutings gehen, sonst war der Bericht immer leer
        ProdRouting.SetRange("Routing TAN", CopyStr(RoutingTAN, 2));
        if ProdRouting.FindFirst then begin
            ProdLine.SetRange(Status, 3);
            ProdLine.SetRange("Prod. Order No.", ProdRouting."Prod. Order No.");
            ProdLabel.SetTableView(ProdLine);
            ProdLabel.UseRequestPage(false);
            //ProdLabel.
            ProdLabel.RunModal;
        end;
    end;
}

