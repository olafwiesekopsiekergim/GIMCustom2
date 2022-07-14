page 50011 "Mobile Setup"
{
    // LM2.00
    //   object defined
    // 
    // L-MOBILE LM2.00.05
    //   Admin Role functionality implemented
    // 
    // L-MOBILE 2017-05-30 LMD1.01
    //   field
    //     "Post Warehouse Shipment"
    //   added from the sourcetable to the Processing fasttab

    Caption = 'Mobile Setup';
    SourceTable = "Mobile Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Timer Interval"; Rec."Timer Interval")
                {
                }
                field("Event Log Level"; Rec."Event Log Level")
                {
                }
                field("SUPER is Admin"; Rec."SUPER is Admin")
                {
                }
                field("Mobile Administrator Role"; Rec."Mobile Administrator Role")
                {
                }
                field("Use Background Printing"; Rec."Use Background Printing")
                {
                }
                group(Barcode)
                {
                    Caption = 'Barcode';
                    field("Barcode Type"; Rec."Barcode Type")
                    {
                    }
                    field("Barcode Size"; Rec."Barcode Size")
                    {
                    }
                    field("Barcode Orientation"; Rec."Barcode Orientation")
                    {
                    }
                }
                field("Item Report No."; Rec."Item Report No.")
                {
                }
                field("Item Report Name"; Rec."Item Report Name")
                {
                }
                field("Stock Report No."; Rec."Stock Report No.")
                {
                }
                field("Stock Report Name"; Rec."Stock Report Name")
                {
                }
            }
            group(Posting)
            {
                Caption = 'Posting';
                group(Control1000000076)
                {
                    ShowCaption = false;
                    field("Directed Put and Pick In Use"; Rec."Directed Put and Pick In Use")
                    {
                    }
                }
                grid(Control1000000006)
                {
                    GridLayout = Rows;
                    ShowCaption = false;
                    group(Relocation)
                    {
                        Caption = 'Relocation';
                        field("Reclass Journal Template Name"; Rec."Reclass Journal Template Name")
                        {
                            ShowCaption = false;
                        }
                        field("Reclass Journal Batch Name"; Rec."Reclass Journal Batch Name")
                        {
                            ShowCaption = false;
                        }
                    }
                }
                grid(Control1000000028)
                {
                    GridLayout = Rows;
                    ShowCaption = false;
                    group("Batch Relocation")
                    {
                        Caption = 'Batch Relocation';
                        field("Batch Relocation Template Name"; Rec."Batch Relocation Template Name")
                        {
                            ShowCaption = false;
                        }
                        field("Batch Relocation Batch Name"; Rec."Batch Relocation Batch Name")
                        {
                            ShowCaption = false;
                        }
                    }
                }
                grid(Control1000000020)
                {
                    GridLayout = Rows;
                    ShowCaption = false;
                    group("Batch Storage")
                    {
                        Caption = 'Batch Storage';
                        field("Batch Storage Template Name"; Rec."Batch Storage Template Name")
                        {
                            ShowCaption = false;
                        }
                        field("Batch Storage Batch Name"; Rec."Batch Storage Batch Name")
                        {
                            ShowCaption = false;
                        }
                    }
                }
                grid(Control1000000017)
                {
                    GridLayout = Rows;
                    ShowCaption = false;
                    group("Storage Replenishment 1+2")
                    {
                        Caption = 'Storage Replenishment 1+2';
                        field("Replenishment Template Name"; Rec."Replenishment Template Name")
                        {
                            ShowCaption = false;
                        }
                        field("Replenishment Batch Name"; Rec."Replenishment Batch Name")
                        {
                            ShowCaption = false;
                        }
                    }
                }
                grid(Control1000000008)
                {
                    GridLayout = Rows;
                    ShowCaption = false;
                    group("Planned Relocation")
                    {
                        Caption = 'Planned Relocation';
                        field("Planned Relocation Temp. Name"; Rec."Planned Relocation Temp. Name")
                        {
                            ShowCaption = false;
                        }
                        field("Planned Relocation Batch Name"; Rec."Planned Relocation Batch Name")
                        {
                            ShowCaption = false;
                        }
                    }
                }
                grid(Control1000000040)
                {
                    GridLayout = Rows;
                    ShowCaption = false;
                    group("Production Receipt")
                    {
                        Caption = 'Production Receipt';
                        field("Prod. Receipt Template Name"; Rec."Prod. Receipt Template Name")
                        {
                            ShowCaption = false;
                        }
                        field("Production Receipt Batch Name"; Rec."Production Receipt Batch Name")
                        {
                            ShowCaption = false;
                        }
                    }
                }
                grid(Control1000000044)
                {
                    GridLayout = Rows;
                    ShowCaption = false;
                    group("Return Production")
                    {
                        Caption = 'Return Production';
                        field("Return Prod. Template Name"; Rec."Return Prod. Template Name")
                        {
                            ShowCaption = false;
                        }
                        field("Return Production Batch Name"; Rec."Return Production Batch Name")
                        {
                            ShowCaption = false;
                        }
                    }
                }
                grid(Control1000000048)
                {
                    GridLayout = Rows;
                    ShowCaption = false;
                    group("Production Issue")
                    {
                        Caption = 'Production Issue';
                        field("Production Issue Template Name"; Rec."Production Issue Template Name")
                        {
                            ShowCaption = false;
                        }
                        field("Production Issue Batch Name"; Rec."Production Issue Batch Name")
                        {
                            ShowCaption = false;
                        }
                    }
                }
                grid(Control1000000052)
                {
                    GridLayout = Rows;
                    ShowCaption = false;
                    group("Production Unplanned Issue")
                    {
                        Caption = 'Production Unplanned Issue';
                        field("Prod. Unplan. Issue Temp. Name"; Rec."Prod. Unplan. Issue Temp. Name")
                        {
                            ShowCaption = false;
                        }
                        field("Prod. Unplanned Issue Batch N."; Rec."Prod. Unplanned Issue Batch N.")
                        {
                            ShowCaption = false;
                        }
                    }
                }
                grid(Control1000000056)
                {
                    GridLayout = Rows;
                    ShowCaption = false;
                    group("Stock Correction - Correction")
                    {
                        Caption = 'Stock Correction - Correction';
                        field("Stock Correction Template Name"; Rec."Stock Correction Template Name")
                        {
                            ShowCaption = false;
                        }
                        field("Stock Correction Batch Name"; Rec."Stock Correction Batch Name")
                        {
                            ShowCaption = false;
                        }
                    }
                }
                grid(Control1000000060)
                {
                    GridLayout = Rows;
                    ShowCaption = false;
                    group("Stock Correction - Pick")
                    {
                        Caption = 'Stock Correction - Pick';
                        field("Stock Corr. Pick Template Name"; Rec."Stock Corr. Pick Template Name")
                        {
                            ShowCaption = false;
                        }
                        field("Stock Corr. Pick Batch Name"; Rec."Stock Corr. Pick Batch Name")
                        {
                            ShowCaption = false;
                        }
                    }
                }
                grid(Control1000000064)
                {
                    GridLayout = Rows;
                    ShowCaption = false;
                    group("Stock Correction - Put")
                    {
                        Caption = 'Stock Correction - Put';
                        field("Stock Corr. Put Template Name"; Rec."Stock Corr. Put Template Name")
                        {
                            ShowCaption = false;
                        }
                        field("Stock Corr. Put Batch Name"; Rec."Stock Corr. Put Batch Name")
                        {
                            ShowCaption = false;
                        }
                    }
                }
                grid(Control1000000068)
                {
                    GridLayout = Rows;
                    ShowCaption = false;
                    group("Item Inventory")
                    {
                        Caption = 'Item Inventory';
                        field("Invt. Journal Template Name"; Rec."Invt. Journal Template Name")
                        {
                            ShowCaption = false;
                        }
                        field("Invt. Journal Batch Name"; Rec."Invt. Journal Batch Name")
                        {
                            ShowCaption = false;
                        }
                    }
                }
                grid(Control1000000072)
                {
                    GridLayout = Rows;
                    ShowCaption = false;
                    group("Warehouse Inventory")
                    {
                        Caption = 'Warehouse Inventory';
                        field("Warehouse Inventory Temp. Name"; Rec."Warehouse Inventory Temp. Name")
                        {
                            ShowCaption = false;
                        }
                        field("Warehouse Inventory Batch Name"; Rec."Warehouse Inventory Batch Name")
                        {
                            ShowCaption = false;
                        }
                    }
                }
                group(Processing)
                {
                    Caption = 'Processing';
                    //The GridLayout property is only supported on controls of type Grid
                    //GridLayout = Rows;
                    field("Post Inventory Recording"; Rec."Post Inventory Recording")
                    {
                    }
                    field("Post Stock Correction"; Rec."Post Stock Correction")
                    {
                    }
                    field("Post Adjustment"; Rec."Post Adjustment")
                    {
                    }
                    field("Post Item Inventory"; Rec."Post Item Inventory")
                    {
                    }
                    field("Post Warehouse Inventory"; Rec."Post Warehouse Inventory")
                    {
                    }
                    field("Post Warehouse Shipment"; Rec."Post Warehouse Shipment")
                    {
                    }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(TestEL)
            {

                trigger OnAction()
                var
                    EventLog: DotNet EventLog;
                    EventLogEntryType: DotNet EventLogEntryType;
                begin
                    //EventLog := EventLog.EventLog('');
                    //EventLog.Source := 'L-Mobile Scheduler';
                    //EventLog.WriteEntry('L-Mobile Scheduler','test started',EventLogEntryType.Information);
                    //EventLog.Dispose;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get then
            Rec.Insert;
    end;
}

