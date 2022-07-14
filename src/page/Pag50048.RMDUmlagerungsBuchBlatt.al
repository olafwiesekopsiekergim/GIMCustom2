page 50048 "RMD Umlagerungs BuchBlatt"
{
    // P0001 24.02.16 CCBIE.ARE New object (standard object P393 was copied and changed)

    AutoSplitKey = true;
    Caption = 'RMD Item Reclass. Journal';
    DataCaptionFields = "Journal Batch Name";
    DelayedInsert = true;
    PageType = Worksheet;
    Permissions = TableData "Item Journal Batch" = rimd;
    SaveValues = true;
    SourceTable = "Item Journal Line";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("PADSTR(""Journal Template Name"", 10, '_')+PADSTR(CurrentJnlBatchName, 10, '_')"; PadStr(Rec."Journal Template Name", 10, '_') + PadStr(CurrentJnlBatchName, 10, '_'))
                {
                    Editable = false;
                }
                field(CurrentJnlBatchName; CurrentJnlBatchName)
                {
                    Editable = true;
                    Lookup = true;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        CurrPage.SaveRecord;
                        ItemJnlMgt.LookupName(CurrentJnlBatchName, Rec);
                        CurrPage.Update(false);

                        getArtikelBuchBlattName;
                        CurrPage.Editable(ArtikelBuchBlattName."RMD Status" <= ArtikelBuchBlattName."RMD Status"::freigegeben);
                    end;

                    trigger OnValidate()
                    begin
                        ItemJnlMgt.CheckName(CurrentJnlBatchName, Rec);
                        CurrentJnlBatchNameOnAfterVali;
                    end;
                }
                field("ArtikelBuchBlattName.""RMD Status"""; ArtikelBuchBlattName."RMD Status")
                {
                    Caption = 'RMD Status';
                    OptionCaption = ' ,freigegeben,übertragen,rückgemeldet,fehlerhaft rückgemeldet';

                    trigger OnValidate()
                    begin
                        if (xRecArtBuBlName."RMD Status" <> xRecArtBuBlName."RMD Status"::" ")
     and
   (xRecArtBuBlName."RMD Status" <> xRecArtBuBlName."RMD Status"::freigegeben)
then
                            "RMD Status" := xRecArtBuBlName."RMD Status"
                        else
                            if ("RMD Status" <> "RMD Status"::freigegeben) and ("RMD Status" <> "RMD Status"::" ") then
                                "RMD Status" := xRecArtBuBlName."RMD Status";

                        if ("RMD Status" = "RMD Status"::freigegeben) then begin
                            if not ZeilenExistieren then begin
                                "RMD Status" := xRecArtBuBlName."RMD Status";
                                Message('Es gibt nichts freizugeben');
                            end else begin
                                if (ArtikelBuchBlattName."RMD Auftragsdatum" = 0D) or (ArtikelBuchBlattName."RMD Lieferdatum" = 0D) then begin
                                    "RMD Status" := xRecArtBuBlName."RMD Status";
                                    Message('Liefer.- und Auftragsdatum müssen gefüllt sein!');
                                end;
                            end;
                        end;
                        ArtikelBuchBlattNameMODIFY(true);
                    end;
                }
                field("ArtikelBuchBlattName.""RMD Auftragsdatum"""; ArtikelBuchBlattName."RMD Auftragsdatum")
                {
                    Caption = 'Auftragsdatum';

                    trigger OnValidate()
                    begin
                        ArtikelBuchBlattNameMODIFY(true);
                    end;
                }
                field("ArtikelBuchBlattName.""RMD Lieferdatum"""; ArtikelBuchBlattName."RMD Lieferdatum")
                {
                    Caption = 'Lieferdatum';

                    trigger OnValidate()
                    begin
                        ArtikelBuchBlattNameMODIFY(true);
                    end;
                }
                field("ArtikelBuchBlattName.""RMD Externe Belegnummer"""; ArtikelBuchBlattName."RMD Externe Belegnummer")
                {
                    Caption = 'Externe Belegnummer';

                    trigger OnValidate()
                    begin
                        ArtikelBuchBlattNameMODIFY(true);
                    end;
                }
                field("ArtikelBuchBlattName.""RMD Ihre Referenz"""; ArtikelBuchBlattName."RMD Ihre Referenz")
                {
                    Caption = 'Ihre Referenz';

                    trigger OnValidate()
                    begin
                        ArtikelBuchBlattNameMODIFY(true);
                    end;
                }
            }
            group(Weiteres)
            {
                Caption = 'Weiteres';
                field(Control1106900002; PadStr(Rec."Journal Template Name", 10, '_') + PadStr(CurrentJnlBatchName, 10, '_'))
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("ArtikelBuchBlattName.""RMD Status Auftrag"""; ArtikelBuchBlattName."RMD Status Auftrag")
                {
                    Caption = 'Status Auftrag';
                }
                field("ArtikelBuchBlattName.""RMD Deb.-KD-Nr. bei Spedition"""; ArtikelBuchBlattName."RMD Deb.-KD-Nr. bei Spedition")
                {
                    Caption = 'Deb.-KD-Nr. bei Spedition';
                }
                field("ArtikelBuchBlattName.""RMD Rückinfo an Düperthal"""; ArtikelBuchBlattName."RMD Rückinfo an Düperthal")
                {
                    Caption = 'Rückinfo an Düperthal';
                }
                field("ArtikelBuchBlattName.""RMD Sammelsendung"""; ArtikelBuchBlattName."RMD Sammelsendung")
                {
                    Caption = 'Sammelsendung';
                }
            }
            repeater(Control1)
            {
                ShowCaption = false;
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                    Visible = false;
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {

                    trigger OnValidate()
                    begin
                        ItemJnlMgt.GetItem(Rec."Item No.", ItemDescription);
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                        Rec.ShowNewShortcutDimCode(NewShortcutDimCode);
                    end;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("New Shortcut Dimension 1 Code"; Rec."New Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("New Shortcut Dimension 2 Code"; Rec."New Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field("NewShortcutDimCode[3]"; NewShortcutDimCode[3])
                {
                    CaptionClass = Text000;
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupNewShortcutDimCode(3, NewShortcutDimCode[3]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.TestField("Entry Type", Rec."Entry Type"::Transfer);
                        Rec.ValidateNewShortcutDimCode(3, NewShortcutDimCode[3]);
                    end;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                    end;
                }
                field("NewShortcutDimCode[4]"; NewShortcutDimCode[4])
                {
                    CaptionClass = Text001;
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupNewShortcutDimCode(4, NewShortcutDimCode[4]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.TestField("Entry Type", Rec."Entry Type"::Transfer);
                        Rec.ValidateNewShortcutDimCode(4, NewShortcutDimCode[4]);
                    end;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                    end;
                }
                field("NewShortcutDimCode[5]"; NewShortcutDimCode[5])
                {
                    CaptionClass = Text002;
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupNewShortcutDimCode(5, NewShortcutDimCode[5]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.TestField("Entry Type", Rec."Entry Type"::Transfer);
                        Rec.ValidateNewShortcutDimCode(5, NewShortcutDimCode[5]);
                    end;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                    end;
                }
                field("NewShortcutDimCode[6]"; NewShortcutDimCode[6])
                {
                    CaptionClass = Text003;
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupNewShortcutDimCode(6, NewShortcutDimCode[6]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.TestField("Entry Type", Rec."Entry Type"::Transfer);
                        Rec.ValidateNewShortcutDimCode(6, NewShortcutDimCode[6]);
                    end;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                    end;
                }
                field("NewShortcutDimCode[7]"; NewShortcutDimCode[7])
                {
                    CaptionClass = Text004;
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupNewShortcutDimCode(7, NewShortcutDimCode[7]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.TestField("Entry Type", Rec."Entry Type"::Transfer);
                        Rec.ValidateNewShortcutDimCode(7, NewShortcutDimCode[7]);
                    end;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                    end;
                }
                field("NewShortcutDimCode[8]"; NewShortcutDimCode[8])
                {
                    CaptionClass = Text005;
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupNewShortcutDimCode(8, NewShortcutDimCode[8]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.TestField("Entry Type", Rec."Entry Type"::Transfer);
                        Rec.ValidateNewShortcutDimCode(8, NewShortcutDimCode[8]);
                    end;
                }
                field("Location Code"; Rec."Location Code")
                {
                    Visible = true;

                    trigger OnValidate()
                    var
                        WMSManagement: Codeunit "WMS Management";
                    begin
                        WMSManagement.CheckItemJnlLineLocation(Rec, xRec);
                    end;
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    Visible = false;
                }
                field("New Location Code"; Rec."New Location Code")
                {
                    Visible = false;

                    trigger OnValidate()
                    var
                        WMSManagement: Codeunit "WMS Management";
                    begin
                        WMSManagement.CheckItemJnlLineLocation(Rec, xRec);
                    end;
                }
                field("New Bin Code"; Rec."New Bin Code")
                {
                    Visible = false;
                }
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    Visible = false;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    Visible = false;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    Visible = false;
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
                field("Unit Amount"; Rec."Unit Amount")
                {
                    Visible = false;
                }
                field(Amount; Rec.Amount)
                {
                    Visible = false;
                }
                field("Indirect Cost %"; Rec."Indirect Cost %")
                {
                    Visible = false;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    Visible = false;
                }
                field("Applies-to Entry"; Rec."Applies-to Entry")
                {
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    Visible = false;
                }
            }
            group(Control22)
            {
                ShowCaption = false;
                fixed(Control1900669001)
                {
                    ShowCaption = false;
                    group("Item Description")
                    {
                        Caption = 'Item Description';
                        field(ItemDescription; ItemDescription)
                        {
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
                    AccessByPermission = TableData Dimension = R;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowReclasDimensions;
                        CurrPage.SaveRecord;
                    end;
                }
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction()
                    begin
                        Rec.OpenItemTrackingLines(true);
                    end;
                }
                action("Bin Contents")
                {
                    Caption = 'Bin Contents';
                    Image = BinContent;
                    RunObject = Page "Bin Contents List";
                    RunPageLink = "Location Code" = FIELD("Location Code"),
                                  "Item No." = FIELD("Item No."),
                                  "Variant Code" = FIELD("Variant Code");
                    RunPageView = SORTING("Location Code", "Item No.", "Variant Code");
                }
            }
            group("&Item")
            {
                Caption = '&Item';
                Image = Item;
                action(Card)
                {
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Page "Item Card";
                    RunPageLink = "No." = FIELD("Item No.");
                    ShortCutKey = 'Shift+F7';
                }
                action("Ledger E&ntries")
                {
                    Caption = 'Ledger E&ntries';
                    Image = ItemLedger;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Item Ledger Entries";
                    RunPageLink = "Item No." = FIELD("Item No.");
                    RunPageView = SORTING("Item No.");
                    ShortCutKey = 'Ctrl+F7';
                }
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    Image = ItemAvailability;
                    action("Event")
                    {
                        Caption = 'Event';
                        Image = "Event";

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItemJnlLine(Rec, ItemAvailFormsMgt.ByEvent)
                        end;
                    }
                    action(Period)
                    {
                        Caption = 'Period';
                        Image = Period;

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItemJnlLine(Rec, ItemAvailFormsMgt.ByPeriod)
                        end;
                    }
                    action(Variant)
                    {
                        Caption = 'Variant';
                        Image = ItemVariant;

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItemJnlLine(Rec, ItemAvailFormsMgt.ByVariant)
                        end;
                    }
                    action(Location)
                    {
                        AccessByPermission = TableData Location = R;
                        Caption = 'Location';
                        Image = Warehouse;

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItemJnlLine(Rec, ItemAvailFormsMgt.ByLocation)
                        end;
                    }
                    action("BOM Level")
                    {
                        Caption = 'BOM Level';
                        Image = BOMLevel;

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItemJnlLine(Rec, ItemAvailFormsMgt.ByBOM)
                        end;
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
                action("E&xplode BOM")
                {
                    Caption = 'E&xplode BOM';
                    Image = ExplodeBOM;
                    RunObject = Codeunit "Item Jnl.-Explode BOM";
                }
                separator(Action52)
                {
                }
                action("Get Bin Content")
                {
                    AccessByPermission = TableData "Bin Content" = R;
                    Caption = 'Get Bin Content';
                    Ellipsis = true;
                    Image = GetBinContent;

                    trigger OnAction()
                    var
                        BinContent: Record "Bin Content";
                        GetBinContent: Report "Whse. Get Bin Content";
                    begin
                        BinContent.SetRange("Location Code", Rec."Location Code");
                        GetBinContent.SetTableView(BinContent);
                        GetBinContent.InitializeItemJournalLine(Rec);
                        GetBinContent.RunModal;
                        CurrPage.Update(false);
                    end;
                }
                action("Neu übertragen")
                {
                    Caption = 'Neu übertragen';

                    trigger OnAction()
                    begin
                        NewTransfer;
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
                        CODEUNIT.Run(CODEUNIT::"Item Jnl.-Post", Rec);
                        CurrentJnlBatchName := Rec.GetRangeMax("Journal Batch Name");
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
                        CODEUNIT.Run(CODEUNIT::"Item Jnl.-Post+Print", Rec);
                        CurrentJnlBatchName := Rec.GetRangeMax("Journal Batch Name");
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
                    ItemJnlLine.SetRange("Journal Template Name", Rec."Journal Template Name");
                    ItemJnlLine.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                    REPORT.RunModal(REPORT::"Inventory Movement", true, true, ItemJnlLine);
                end;
            }
            group(DSBS)
            {
                Caption = 'DSBS';
                Visible = DSBSVisivle;
                action("Wenn RMD Status: mindestens übertragen im Nachhinein 0-Menge in aktueller Zeile löschen")
                {
                    Caption = 'Wenn RMD Status: mindestens übertragen im Nachhinein 0-Menge in aktueller Zeile löschen';

                    trigger OnAction()
                    begin
                        DeleteZeroQtyAfterwards;
                    end;
                }
                action("Neuen Lagerplatzcode in aktueller Zeile setzen")
                {
                    Caption = 'Neuen Lagerplatzcode in aktueller Zeile setzen';

                    trigger OnAction()
                    var
                        ItemJournalLine: Record "Item Journal Line";
                        Bin: Record Bin;
                        BinList: Page "Bin List";
                    begin
                        ItemJournalLine := Rec;
                        Bin.SetRange("Location Code", Rec."New Location Code");
                        BinList.SetTableView(Bin);
                        BinList.LookupMode(true);
                        if BinList.RunModal = ACTION::LookupOK then begin
                            BinList.GetRecord(Bin);
                            ItemJournalLine."New Bin Code" := Bin.Code;
                            ItemJournalLine.Modify;
                            CurrPage.Update();
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        ItemJnlMgt.GetItem(Rec."Item No.", ItemDescription);
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
        Rec.ShowNewShortcutDimCode(NewShortcutDimCode);
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
        Rec.SetUpNewLine(xRec);
        Clear(ShortcutDimCode);
        Clear(NewShortcutDimCode);
        Rec."Entry Type" := Rec."Entry Type"::Transfer;


        begin //c/gw/Juni05: - Projektab:1342  "Logistikanbindung RMD" ***************************************************

            Rec.SetUpNewLine(xRec);

            Rec."Entry Type" := Rec."Entry Type"::Transfer;
            Rec."Document No." := StrSubstNo('%1%2', PadStr(Rec."Journal Template Name", 10, '_'), PadStr(CurrentJnlBatchName, 10, '_'));
            Rec."Location Code" := '100'; //default umlagern von Lagertort
            Rec."New Location Code" := Rec."Journal Template Name";

        end; //c/gw/Juni05: - Projektab:1342  "Logistikanbindung RMD"  ***************************************************
    end;

    trigger OnOpenPage()
    begin
        ItemJnlMgt.RMD_OpenJnl(CurrentJnlBatchName, Rec);

        getArtikelBuchBlattName;
        CurrPage.Editable(ArtikelBuchBlattName."RMD Status" <= ArtikelBuchBlattName."RMD Status"::freigegeben);
        // ToDo ARE USERID
        DSBSVisivle := (UserId = 'SUPPORT') or (UserId = 'DSBS'); // SUPPORT oder Benjamin Sauer ist am Werk
    end;

    var
        Text000: Label '1,2,3,New ';
        Text001: Label '1,2,4,New ';
        Text002: Label '1,2,5,New ';
        Text003: Label '1,2,6,New ';
        Text004: Label '1,2,7,New ';
        Text005: Label '1,2,8,New ';
        ItemJnlMgt: Codeunit ItemJnlManagement;
        ReportPrint: Codeunit "Test Report-Print";
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
        CurrentJnlBatchName: Code[10];
        ItemDescription: Text[50];
        ShortcutDimCode: array[8] of Code[20];
        NewShortcutDimCode: array[8] of Code[20];
        DSBSVisivle: Boolean;
        "---CC----": Integer;
        ArtikelBuchBlattName: Record "Item Journal Batch";
        xRecArtBuBlName: Record "Item Journal Batch";
        Lagerort: Record Location;
        Text50000: Label 'Soll der Status auf auf Freigegeben zurückgesetzt werden?';

    local procedure CurrentJnlBatchNameOnAfterVali()
    begin
        CurrPage.SaveRecord;
        ItemJnlMgt.SetName(CurrentJnlBatchName, Rec);
        CurrPage.Update(false);

        getArtikelBuchBlattName;
        CurrPage.Editable(ArtikelBuchBlattName."RMD Status" <= ArtikelBuchBlattName."RMD Status"::freigegeben);
    end;

    local procedure "--CC--"()
    begin
    end;

    local procedure getArtikelBuchBlattName()
    var
        ItemJournalLine: Record "Item Journal Line";
    begin
        ItemJournalLine.Copy(Rec);
        ItemJournalLine.FilterGroup(2);
        ArtikelBuchBlattName.Get(ItemJournalLine.GetFilter("Journal Template Name"), ItemJournalLine.GetFilter("Journal Batch Name"));
        xRecArtBuBlName := ArtikelBuchBlattName;
        ItemJournalLine.FilterGroup(0);
    end;

    local procedure getLagerort()
    var
        ItemJournalLine: Record "Item Journal Line";
    begin
        ItemJournalLine.Copy(Rec);
        ItemJournalLine.FilterGroup(2);
        Lagerort.Get(ItemJournalLine.GetFilter("Journal Template Name"));
        ItemJournalLine.FilterGroup(0);
    end;

    local procedure ZeilenExistieren(): Boolean
    begin
        exit(Rec.Count > 0);
    end;

    local procedure ArtikelBuchBlattNameMODIFY(BoolVal: Boolean)
    begin
        ArtikelBuchBlattName.Modify(BoolVal);
        xRecArtBuBlName := ArtikelBuchBlattName;
    end;

    local procedure NewTransfer()
    begin
        if ArtikelBuchBlattName."RMD Status" = ArtikelBuchBlattName."RMD Status"::"übertragen" then
            if Confirm(StrSubstNo(Text50000)) then begin
                ArtikelBuchBlattName."RMD Status" := ArtikelBuchBlattName."RMD Status"::freigegeben;
                ArtikelBuchBlattName.Modify(true);
            end;
    end;

    local procedure DeleteZeroQtyAfterwards()
    begin
        if (ArtikelBuchBlattName."RMD Status" < ArtikelBuchBlattName."RMD Status"::"übertragen") or (Rec.Quantity <> 0) then
            Error('Bevor diese Funktion sinnvoll genutzt wird, wird die Plausibilität dieser Nutzung geprüft...\'
                 + '... 1. die %1 muß 0 sein\'
                 + '... 2. Der RMD Status muß mindestens übertragen sein\\\'
                 + 'DAS IST NICHT DER FALL'
                 , Rec.FieldCaption(Quantity));

        if Confirm('Sie sind sich sicher, daß die aktuelle Zeile gelöscht werden kann') then
            Rec.Delete;
    end;
}

