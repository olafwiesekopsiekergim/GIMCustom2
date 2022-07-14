page 50008 "RMD Test"
{
    // P0001 25.02.16 DEBIE.ARE Fields added "Stand.Lagerort", "Lager RMD"
    // 
    // PR01 PRODUKT.01 15.12.14 DENUE.SKOL Integration cc|project
    // AM01 PRODUKT.01 15.12.14 DENUE.SKOL Integration cc|alloy management
    //                                 - Legierungsgewichte
    // #PXW16.00:106 29.01.09 DEMSR.IG
    //   New MenuButton "Manufacturing"
    //   MenuItem "Manufacturing Dimensions" on MenuButton "Manufacturing"
    //   Field "Shortcut Mfg. Dimension 1 Code" added
    //   Field "Shortcut Mfg. Dimension 2 Code" added
    //   Fields to show Shortcut Mfg. Dimension 3-8 added
    //   Show Shortcut Mfg. Dimensions in OnAfterGetRecord
    // 
    // #PXW16.00:103 29.01.09 DEMSR.IG
    //   MenuItem "Production Rates" on MenuButton "Manufacturing"
    // 
    // #PXW17.00:T102 14.09.12 DEMSR.IST
    //   Ribbon/Action redesign
    // 
    // #PXW17.10.00.03:T100 31.07.14 DEMSR.IST - Rebranding
    // #CAW16.00:T100 09.09.10 DEMSR.IST
    //   New function "ShowCalculation"
    //   New MenuButton "Manufacturing" with MenuItem "Calculation"
    // 
    // #CAW17.00:107 04.12.12 DEMSR.KHS
    //   Adjust Action Items
    // 
    // #CAW17.10.00.03:T100 31.07.14 DEMSR.IST - Rebranding
    // #TMW16.00:A1000         16.03.09 DEWUE.FB Creation of Text Module - Version 6.00:
    //                                             Added Menu Items on MenuButton Item: "Text Module"
    // #TMW17.00:A001 15.08.12 DEMSR.SSZ
    //   #Added Image to Action
    // #TMW17.00.00.01:A0001   02.05.13 DEMSR.SSZ Codereview
    // #TMW17.10.00.02:T100    31.07.14 DEMSR.IST - Rebranding
    // #TMW18.00.01:T100       10.08.15 DEDRS.WHEG AccessByPermission
    // #NAV20100:A1004 15.05.07 DEWUE.SE
    //   Added Menu item "Test Plan Setup" in "Item" Menu button
    // 
    // #QMW17.00.00.02:T101 14.05.13 DEMSR.KHS
    //   Control IDs corrected
    // 
    // #QMW17.10.00.03:T100 31.07.14 DEMSR.IST - Rebranding
    // 
    // #QMW18.00.01:T105 19.06.15 DEMSR.KHS
    //   New Action: Retain Sample Instruction
    // 
    // :PMW13.71:1:1
    //   # Aufruf Detailkalkulation  (Button Artikel)
    // 
    // :PMW14.00:2473:1
    //   # New function "ShowDeliveryToleranceEntries"
    //   # Neues MenuItem "Liefertoleranzposten" über Schaltfläche Artikel
    //   # Aufruf "ShowDeliveryToleranceEntries"
    // 
    // :PMW14.01:2457:1
    //   # New function "ShowItemByTradingUnit"
    //   # Neues MenuItem "Artikel nach Gebindenr." über Schaltfläche Artikel
    //   # Aufruf "ShowItemByTradingUnit"
    // 
    // :PMW14.01:2466:1
    //   # Neue Schaltfläche Produktion mit MenuItem Produktionsstruktur.
    // 
    // :PMW14.01.00.01 SP1:24:1
    //   # Changes in PMW14.01 due to SP1 Standard Navision
    // 
    // :PMW14.02:90:1
    //   # Description - OnFormat, call function "GetIndentForItemList"
    //   # No. - OnFormat, call function "GetFontBoldForItemList"
    //   # Description - OnFormat, call function "GetFontBoldForItemList"
    // 
    // :PMW14.02:91:1
    //   # New MenuItem "Production Structure Simulation" on MenuButton Manufacturing
    // 
    // :PMW14.02:53:1
    //   # New MenuItem "Returnable Containers" on MenuButton "Sales"
    // 
    // :PMW14.02:75:1
    //   # New MenuItem "Item Bottling" on MenuButton Manufacturing
    // 
    // :PMW14.02.01:12:1
    //   # MenuItem "Production Structure Simulation" renamed to "Production Simulation"
    // 
    // :PMW15.00:241:1
    //   # Changes due to UI and programming standards
    // 
    // :PMW15.00.01:45:1
    //   # Check license permissions
    // 
    // :PMW16.00:115:1
    //   # Allocation format for UPDATEFONTBOLD and UPDATEINDENT changed due to transformation
    // 
    // INCORPORATION:PMW16.00:135:1
    //   # MenuItem "Incorporation Usage" added on MenuButton Production
    // 
    // #PMW16.00.01.02:T503 05.03.10 DEMSR.IST
    //   Changes due to UI and programming standards
    // 
    // #PMW16.00.02:T100 16.09.10 DEMSR.IST
    //   Calculation programming rearranged --> #CAW16.00:T100
    // 
    // #PMW16.00.02:T230 01.10.10 DEMSR.BKR
    //   Management of Active Ingredients
    //   New MenuItem Ingredients on MenuButton Item
    // 
    // #PMW16.00.02:T250 13.10.10 DEMSR.KHS
    //   New MenuItem Restrictions on MenuButton Sales
    // 
    // #PMW16.00.02.02:T503 04.01.11 DEMSR.IST
    //   MenuItem Restrictions renamed to Restricted Sales
    // 
    // #PMW16.00.03:T101 14.07.11 DEMSR.IST
    //   New MenuItem "Remain. Shelf Life Setup" on MenuButton Sales
    // 
    // #PMW17.00:T101 12.10.12 DEMSR.IST
    //   Form variable changed to page
    // 
    // #PMW17.00:T102 12.10.12 DEMSR.IST
    //   Ribbon/Action redesign
    // 
    // #PMW17.00.00.02:T501 14.05.13 DEMSR.IST
    //   Corrections due to code review
    // 
    // #PMW17.00:00.03:T500 16.07.13 DEMSR.IST
    //   Missing indentation for description added, properties IndentationColumnName and IndentationControls
    // 
    // #PMW17.10.00.01:T511 08.01.14 DEMSR.IST
    //   Function to indent and emphasize trading unit items corrected
    //   Field "Base Trading Unit Item No." added, not visible
    //   Style and StyleExpr set for "No.", Description and "Base Trading Unit Item No."
    // 
    // #PMW17.10.00.02:T101 15.04.2014 DEMSR.IST
    //   Action Ingredient corrected
    // 
    // #PMW17.10.00.03:T100 31.07.14 DEMSR.IST - Rebranding
    // :CMIW15.00:41:1
    //   # New MenuItem "Commission Rates" on MenuButton Sales added
    // 
    // #PMW17.10.01:T108 26.09.14 DEMSR.KHS
    //   Add: Item Availability by LOT
    // 
    // #PMW18.00:T501 12.01.15 DEMSR.IST
    //   Sorting does not work in NAV 2015 if IndentationColumnName is set
    // 
    // #CMIW17.00:T102 12.11.12 DEMSR.BKR
    //   Ribbon/Action redesign
    // 
    // #RENW16.00.01:R053    12.10.09 DEMSR.KHS
    //   Rate Parts
    // 
    // #RENW16.00.01.02:T512 06.04.10 DEMSR.KHS
    //   Price Views were not filtered correctly
    // 
    // #RENW17.00:T101 04.01.13 DEMSR.KHS
    //   Update Action Items
    // 
    // :DMW14.02:1:01 #MB Artikel -> CTO Aufrufe wie auf Artikelkarte
    //  # MB Funktion -> CTO Aufrufe wie auf Artikelkarte
    // :DMW15.01:26:01 #PrimaryKey of table Attribute has changed
    // :DMW15.01:62:01 #New MenuItem: Item -> "Profi DB"
    // #DMW16.00.02:T102 19.10.10 DEMSR.SSZ
    //   #Description fields 2,3,4,5
    // 
    // #DMW16.00.03:A002 07.10.11 DEMSR.SSZ
    //   #Corrected Menu Item, created new menu item in MB Item --> KANBAN
    // #DMW17.00:A001 08.06.12 DEMSR.SSZ
    //   #Grammar issue
    //   #Inserted action images
    // #DMW17.00.00.01:A0001 15.05.13 DEMSR.SSZ Code Review
    // 
    // #AMPW17.10:T100 17.10.13 DEMSR.IST
    //   Restore Object Version List
    // 
    // #CMI7.10:T100 04.11.13 DEMSR.LV
    //   Delete Seperator
    // 
    // cc|dms (CCDMS)
    // 
    // #DMS:T006 10.03.15 DEDRS.WHEG
    //   Standard Implementation with DocumentBoxVisible
    // 
    // #DMSW18.00.01:T100 10.08.15 DEDRS.WHEG
    //   AccessByPermission
    // 
    // WF  cc|workflow context menu integration.

    Caption = 'Item List';
    CardPageID = "Item Card";
    DataCaptionExpression = ComponentGroupsText;
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Quality Management,cc Project';
    SourceTable = Item;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                IndentationControls = Description;
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    Editable = ESACC_F1_Editable;
                    HideValue = ESACC_F1_HideValue;
                    Style = Strong;
                    StyleExpr = "No.Emphasize";
                    Visible = ESACC_F1_Visible;
                }
                field("Lager RMD"; Rec."Lager RMD")
                {
                }
                field("Inventory 100"; Rec."Inventory 100")
                {
                    Editable = ESACC_F5012403_Editable;
                    HideValue = ESACC_F5012403_HideValue;
                    Style = Strong;
                    StyleExpr = "No.Emphasize";
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    Editable = ESACC_F3_Editable;
                    HideValue = ESACC_F3_HideValue;
                    Style = Strong;
                    StyleExpr = DescriptionEmphasize;
                    Visible = ESACC_F3_Visible;
                }
                field("Description 2"; Rec."Description 2")
                {
                    Editable = ESACC_F5_Editable;
                    HideValue = ESACC_F5_HideValue;
                    Visible = false;
                }
                field("Description 3"; "Description 3")
                {
                    Editable = ESACC_F5013000_Editable;
                    HideValue = ESACC_F5013000_HideValue;
                    Visible = false;
                }
                field("Description 4"; "Description 4")
                {
                    Editable = ESACC_F5013010_Editable;
                    HideValue = ESACC_F5013010_HideValue;
                    Visible = false;
                }
                field("Description 5"; "Description 5")
                {
                    Editable = ESACC_F5013020_Editable;
                    HideValue = ESACC_F5013020_HideValue;
                    Visible = false;
                }
                field("Created From Nonstock Item"; Rec."Created From Nonstock Item")
                {
                    Editable = ESACC_F5703_Editable;
                    HideValue = ESACC_F5703_HideValue;
                    Visible = false;
                }
                field("Substitutes Exist"; Rec."Substitutes Exist")
                {
                    HideValue = ESACC_F5706_HideValue;
                    Visible = ESACC_F5706_Visible;
                }
                field("Stockkeeping Unit Exists"; Rec."Stockkeeping Unit Exists")
                {
                    HideValue = ESACC_F5700_HideValue;
                    Visible = false;
                }
                field("Assembly BOM"; Rec."Assembly BOM")
                {
                    HideValue = ESACC_F6_HideValue;
                    Visible = ESACC_F6_Visible;
                }
                field("Production BOM No."; Rec."Production BOM No.")
                {
                    Editable = ESACC_F99000751_Editable;
                    HideValue = ESACC_F99000751_HideValue;
                    Visible = ESACC_F99000751_Visible;
                }
                field("Routing No."; Rec."Routing No.")
                {
                    Editable = ESACC_F99000750_Editable;
                    HideValue = ESACC_F99000750_HideValue;
                    Visible = ESACC_F99000750_Visible;
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    Editable = ESACC_F8_Editable;
                    HideValue = ESACC_F8_HideValue;
                    Visible = ESACC_F8_Visible;
                }
                field("Shelf No."; Rec."Shelf No.")
                {
                    Editable = ESACC_F12_Editable;
                    HideValue = ESACC_F12_HideValue;
                    Visible = false;
                }
                field("Costing Method"; Rec."Costing Method")
                {
                    Editable = ESACC_F21_Editable;
                    HideValue = ESACC_F21_HideValue;
                    Visible = false;
                }
                field("Cost is Adjusted"; Rec."Cost is Adjusted")
                {
                    Editable = ESACC_F29_Editable;
                    HideValue = ESACC_F29_HideValue;
                    Visible = ESACC_F29_Visible;
                }
                field("Standard Cost"; Rec."Standard Cost")
                {
                    Editable = ESACC_F24_Editable;
                    HideValue = ESACC_F24_HideValue;
                    Visible = false;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    Editable = ESACC_F22_Editable;
                    HideValue = ESACC_F22_HideValue;
                    Visible = ESACC_F22_Visible;
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                }
                field("Net Weight"; Rec."Net Weight")
                {
                }
                field("Last Direct Cost"; Rec."Last Direct Cost")
                {
                    Editable = ESACC_F25_Editable;
                    HideValue = ESACC_F25_HideValue;
                    Visible = false;
                }
                field("Price/Profit Calculation"; Rec."Price/Profit Calculation")
                {
                    Editable = ESACC_F19_Editable;
                    HideValue = ESACC_F19_HideValue;
                    Visible = false;
                }
                field("Profit %"; Rec."Profit %")
                {
                    Editable = ESACC_F20_Editable;
                    HideValue = ESACC_F20_HideValue;
                    Visible = false;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    Editable = ESACC_F18_Editable;
                    HideValue = ESACC_F18_HideValue;
                    Visible = ESACC_F18_Visible;
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    Editable = ESACC_F11_Editable;
                    HideValue = ESACC_F11_HideValue;
                    Visible = false;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    Editable = ESACC_F91_Editable;
                    HideValue = ESACC_F91_HideValue;
                    Visible = false;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    Editable = ESACC_F99_Editable;
                    HideValue = ESACC_F99_HideValue;
                    Visible = false;
                }
                field("Item Disc. Group"; Rec."Item Disc. Group")
                {
                    Editable = ESACC_F14_Editable;
                    HideValue = ESACC_F14_HideValue;
                    Visible = false;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    Editable = ESACC_F31_Editable;
                    HideValue = ESACC_F31_HideValue;
                    Visible = ESACC_F31_Visible;
                }
                field("Vendor Item No."; Rec."Vendor Item No.")
                {
                    Editable = ESACC_F32_Editable;
                    HideValue = ESACC_F32_HideValue;
                    Visible = false;
                }
                field("Tariff No."; Rec."Tariff No.")
                {
                    Editable = ESACC_F47_Editable;
                    HideValue = ESACC_F47_HideValue;
                    Visible = false;
                }
                field("Search Description"; Rec."Search Description")
                {
                    Editable = ESACC_F4_Editable;
                    HideValue = ESACC_F4_HideValue;
                    Visible = ESACC_F4_Visible;
                }
                field("Overhead Rate"; Rec."Overhead Rate")
                {
                    Editable = ESACC_F99000757_Editable;
                    HideValue = ESACC_F99000757_HideValue;
                    Visible = false;
                }
                field("Indirect Cost %"; Rec."Indirect Cost %")
                {
                    Editable = ESACC_F28_Editable;
                    HideValue = ESACC_F28_HideValue;
                    Visible = false;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    Editable = ESACC_F5702_Editable;
                    HideValue = ESACC_F5702_HideValue;
                    Visible = false;
                }
                field("Product Group Code"; Rec."Product Group Code")
                {
                    Editable = ESACC_F5704_Editable;
                    HideValue = ESACC_F5704_HideValue;
                    Visible = false;
                }
                field(Blocked; Rec.Blocked)
                {
                    Editable = ESACC_F54_Editable;
                    HideValue = ESACC_F54_HideValue;
                    Visible = false;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    Editable = ESACC_F62_Editable;
                    HideValue = ESACC_F62_HideValue;
                    Visible = false;
                }
                field("Stand.Lagerort"; Rec."Stand.Lagerort")
                {
                    Description = 'P0001';
                    Editable = ESACC_F50004_Editable;
                    HideValue = ESACC_F50004_HideValue;
                    Visible = ESACC_F50004_Visible;
                }
                field("Sales Unit of Measure"; Rec."Sales Unit of Measure")
                {
                    Editable = ESACC_F5425_Editable;
                    HideValue = ESACC_F5425_HideValue;
                    Visible = false;
                }
                field("Replenishment System"; Rec."Replenishment System")
                {
                    Editable = ESACC_F5419_Editable;
                    HideValue = ESACC_F5419_HideValue;
                    Visible = false;
                }
                field("Purch. Unit of Measure"; Rec."Purch. Unit of Measure")
                {
                    Editable = ESACC_F5426_Editable;
                    HideValue = ESACC_F5426_HideValue;
                    Visible = false;
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                    Editable = ESACC_F33_Editable;
                    HideValue = ESACC_F33_HideValue;
                    Visible = false;
                }
                field("Manufacturing Policy"; Rec."Manufacturing Policy")
                {
                    Editable = ESACC_F5442_Editable;
                    HideValue = ESACC_F5442_HideValue;
                    Visible = false;
                }
                field("Flushing Method"; Rec."Flushing Method")
                {
                    Editable = ESACC_F5417_Editable;
                    HideValue = ESACC_F5417_HideValue;
                    Visible = false;
                }
                field("Assembly Policy"; Rec."Assembly Policy")
                {
                    Editable = ESACC_F910_Editable;
                    HideValue = ESACC_F910_HideValue;
                    Visible = false;
                }
                field("Item Tracking Code"; Rec."Item Tracking Code")
                {
                    Editable = ESACC_F6500_Editable;
                    HideValue = ESACC_F6500_HideValue;
                    Visible = false;
                }
                field("Default Deferral Template Code"; Rec."Default Deferral Template Code")
                {
                    Caption = 'Default Deferral Template';
                    Editable = ESACC_F1700_Editable;
                    HideValue = ESACC_F1700_HideValue;
                    Visible = ESACC_F1700_Visible;
                }
                field("Shortcut Mfg. Dimension 1 Code"; "Shortcut Mfg. Dimension 1 Code")
                {
                    Editable = ESACC_F5012702_Editable;
                    HideValue = ESACC_F5012702_HideValue;
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        // >> #PXW16.00:106
                        Rec.LookupShortcutMfgDimCodeNoUpd(1, "Shortcut Mfg. Dimension 1 Code");
                        // << #PXW16.00:106
                    end;
                }
                field("Shortcut Mfg. Dimension 2 Code"; "Shortcut Mfg. Dimension 2 Code")
                {
                    Editable = ESACC_F5012703_Editable;
                    HideValue = ESACC_F5012703_HideValue;
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        // >> #PXW16.00:106
                        Rec.LookupShortcutMfgDimCodeNoUpd(2, "Shortcut Mfg. Dimension 2 Code");
                        // << #PXW16.00:106
                    end;
                }
                field("ShortcutMfgDimCode[3]"; ShortcutMfgDimCode[3])
                {
                    CaptionClass = '5012700,2,3';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        // >> #PXW16.00:106
                        Rec.LookupShortcutMfgDimCodeNoUpd(3, ShortcutMfgDimCode[3]);
                        // << #PXW16.00:106
                    end;
                }
                field("ShortcutMfgDimCode[4]"; ShortcutMfgDimCode[4])
                {
                    CaptionClass = '5012700,2,4';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        // >> #PXW16.00:106
                        Rec.LookupShortcutMfgDimCodeNoUpd(4, ShortcutMfgDimCode[4]);
                        // << #PXW16.00:106
                    end;
                }
                field("ShortcutMfgDimCode[5]"; ShortcutMfgDimCode[5])
                {
                    CaptionClass = '5012700,2,5';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        // >> #PXW16.00:106
                        Rec.LookupShortcutMfgDimCodeNoUpd(5, ShortcutMfgDimCode[5]);
                        // << #PXW16.00:106
                    end;
                }
                field("ShortcutMfgDimCode[6]"; ShortcutMfgDimCode[6])
                {
                    CaptionClass = '5012700,2,6';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        // >> #PXW16.00:106
                        Rec.LookupShortcutMfgDimCodeNoUpd(6, ShortcutMfgDimCode[6]);
                        // << #PXW16.00:106
                    end;
                }
                field("ShortcutMfgDimCode[7]"; ShortcutMfgDimCode[7])
                {
                    CaptionClass = '5012700,2,7';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        // >> #PXW16.00:106
                        Rec.LookupShortcutMfgDimCodeNoUpd(7, ShortcutMfgDimCode[7]);
                        // << #PXW16.00:106
                    end;
                }
                field("ShortcutMfgDimCode[8]"; ShortcutMfgDimCode[8])
                {
                    CaptionClass = '5012700,2,8';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        // >> #PXW16.00:106
                        Rec.LookupShortcutMfgDimCodeNoUpd(8, ShortcutMfgDimCode[8]);
                        // << #PXW16.00:106
                    end;
                }
                field(Abmessung1; Rec.Abmessung1)
                {
                    Editable = ESACC_F50301_Editable;
                    HideValue = ESACC_F50301_HideValue;
                    Visible = ESACC_F50301_Visible;
                }
                field(Abmessung2; Rec.Abmessung2)
                {
                    Editable = ESACC_F50302_Editable;
                    HideValue = ESACC_F50302_HideValue;
                    Visible = ESACC_F50302_Visible;
                }
                field(Abmessung3; Rec.Abmessung3)
                {
                    Editable = ESACC_F50303_Editable;
                    HideValue = ESACC_F50303_HideValue;
                    Visible = ESACC_F50303_Visible;
                }
            }
        }
        area(factboxes)
        {
            part(DocumentBox; "DMS - Doc. Box FactBox Async")
            {
                AccessByPermission = Page "DMS - Doc. Box FactBox Async" = X;
                Visible = DocumentBoxVisible;
            }
            part(Control3; "Social Listening FactBox")
            {
                SubPageLink = "Source Type" = CONST(Item),
                              "Source No." = FIELD("No.");
                Visible = SocialListeningVisible;
            }
            part(Control26; "Social Listening Setup FactBox")
            {
                SubPageLink = "Source Type" = CONST(Item),
                              "Source No." = FIELD("No.");
                UpdatePropagation = Both;
                Visible = SocialListeningSetupVisible;
            }
            part(Control1901314507; "Item Invoicing FactBox")
            {
                SubPageLink = "No." = FIELD("No."),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                              "Location Filter" = FIELD("Location Filter"),
                              "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                              "Bin Filter" = FIELD("Bin Filter"),
                              "Variant Filter" = FIELD("Variant Filter"),
                              "Lot No. Filter" = FIELD("Lot No. Filter"),
                              "Serial No. Filter" = FIELD("Serial No. Filter");
                Visible = true;
            }
            part(Control1903326807; "Item Replenishment FactBox")
            {
                SubPageLink = "No." = FIELD("No."),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                              "Location Filter" = FIELD("Location Filter"),
                              "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                              "Bin Filter" = FIELD("Bin Filter"),
                              "Variant Filter" = FIELD("Variant Filter"),
                              "Lot No. Filter" = FIELD("Lot No. Filter"),
                              "Serial No. Filter" = FIELD("Serial No. Filter");
                Visible = false;
            }
            part(Control1906840407; "Item Planning FactBox")
            {
                SubPageLink = "No." = FIELD("No."),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                              "Location Filter" = FIELD("Location Filter"),
                              "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                              "Bin Filter" = FIELD("Bin Filter"),
                              "Variant Filter" = FIELD("Variant Filter"),
                              "Lot No. Filter" = FIELD("Lot No. Filter"),
                              "Serial No. Filter" = FIELD("Serial No. Filter");
                Visible = true;
            }
            part(Control1901796907; "Item Warehouse FactBox")
            {
                SubPageLink = "No." = FIELD("No."),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                              "Location Filter" = FIELD("Location Filter"),
                              "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                              "Bin Filter" = FIELD("Bin Filter"),
                              "Variant Filter" = FIELD("Variant Filter"),
                              "Lot No. Filter" = FIELD("Lot No. Filter"),
                              "Serial No. Filter" = FIELD("Serial No. Filter");
                Visible = false;
            }
            systempart(Control1900383207; Links)
            {
                Visible = true;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Availability)
            {
                Caption = 'Availability';
                Image = Item;
                action("Items b&y Location")
                {
                    AccessByPermission = TableData Location = R;
                    Caption = 'Items b&y Location';
                    Enabled = ESACC_C73_Enabled;
                    Image = ItemAvailbyLoc;
                    Visible = ESACC_C73_Visible;

                    trigger OnAction()
                    var
                        ItemsByLocation: Page "Items by Location";
                    begin
                        ItemsByLocation.SetRecord(Rec);
                        ItemsByLocation.Run;
                    end;
                }
                action("Item by Trading &Unit No.")
                {
                    Caption = 'Item by Trading &Unit No.';
                    Enabled = ESACC_C5012400_Enabled;
                    Image = Stages;
                    Visible = ESACC_C5012400_Visible;

                    trigger OnAction()
                    begin
                        // >> :PMW14.01:2457:1
                        ShowItemByTradingUnit;
                        // << :PMW14.01:2457:1
                    end;
                }
                group("&Item Availability by")
                {
                    Caption = '&Item Availability by';
                    Image = ItemAvailability;
                    action("<Action5>")
                    {
                        Caption = 'Event';
                        Enabled = ESACC_C5_Enabled;
                        Image = "Event";
                        Visible = ESACC_C5_Visible;

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItem(Rec, ItemAvailFormsMgt.ByEvent);
                        end;
                    }
                    action(Period)
                    {
                        Caption = 'Period';
                        Enabled = ESACC_C21_Enabled;
                        Image = Period;
                        RunObject = Page "Item Availability by Periods";
                        RunPageLink = "No." = FIELD("No."),
                                      "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                      "Location Filter" = FIELD("Location Filter"),
                                      "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                                      "Variant Filter" = FIELD("Variant Filter");
                        Visible = ESACC_C21_Visible;
                    }
                    action(Variant)
                    {
                        Caption = 'Variant';
                        Enabled = ESACC_C80_Enabled;
                        Image = ItemVariant;
                        RunObject = Page "Item Availability by Variant";
                        RunPageLink = "No." = FIELD("No."),
                                      "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                      "Location Filter" = FIELD("Location Filter"),
                                      "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                                      "Variant Filter" = FIELD("Variant Filter");
                        Visible = ESACC_C80_Visible;
                    }
                    action(Location)
                    {
                        Caption = 'Location';
                        Enabled = ESACC_C78_Enabled;
                        Image = Warehouse;
                        RunObject = Page "Item Availability by Location";
                        RunPageLink = "No." = FIELD("No."),
                                      "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                      "Location Filter" = FIELD("Location Filter"),
                                      "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                                      "Variant Filter" = FIELD("Variant Filter");
                        Visible = ESACC_C78_Visible;
                    }
                    action("<Page Item Availability by Lot")
                    {
                        Caption = 'Lot';
                        Enabled = ESACC_C5012500_Enabled;
                        Image = Lot;
                        RunObject = Page "Item Availability by Lot";
                        RunPageLink = "No." = FIELD("No."),
                                      "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                      "Lot No. Filter" = FIELD("Lot No. Filter"),
                                      "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                                      "Variant Filter" = FIELD("Variant Filter");
                        Visible = ESACC_C5012500_Visible;
                    }
                    action("BOM Level")
                    {
                        Caption = 'BOM Level';
                        Enabled = ESACC_C13_Enabled;
                        Image = BOMLevel;
                        Visible = ESACC_C13_Visible;

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItem(Rec, ItemAvailFormsMgt.ByBOM);
                        end;
                    }
                    action(Timeline)
                    {
                        Caption = 'Timeline';
                        Enabled = ESACC_C19_Enabled;
                        Image = Timeline;
                        Visible = ESACC_C19_Visible;

                        trigger OnAction()
                        begin
                            Rec.ShowTimelineFromItem(Rec);
                        end;
                    }
                }
            }
            group(ActionGroupCRM)
            {
                Caption = 'Dynamics CRM';
                Visible = CRMIntegrationEnabled;
                action(CRMGoToProduct)
                {
                    Caption = 'Product';
                    Enabled = ESACC_C75_Enabled;
                    Image = CoupledItem;
                    ToolTip = 'Open the coupled Microsoft Dynamics CRM product.';
                    Visible = ESACC_C75_Visible;

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(Rec.RecordId);
                    end;
                }
                action(CRMSynchronizeNow)
                {
                    AccessByPermission = TableData "CRM Integration Record" = IM;
                    Caption = 'Synchronize Now';
                    Enabled = ESACC_C72_Enabled;
                    Image = Refresh;
                    ToolTip = 'Send updated data to Microsoft Dynamics CRM.';
                    Visible = ESACC_C72_Visible;

                    trigger OnAction()
                    var
                        Item: Record Item;
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        ItemRecordRef: RecordRef;
                    begin
                        CurrPage.SetSelectionFilter(Item);
                        Item.Next;

                        if Item.Count = 1 then
                            CRMIntegrationManagement.UpdateOneNow(Item.RecordId)
                        else begin
                            ItemRecordRef.GetTable(Item);
                            CRMIntegrationManagement.UpdateMultipleNow(ItemRecordRef);
                        end
                    end;
                }
                group(Coupling)
                {
                    Caption = 'Coupling', Comment = 'Coupling is a noun';
                    Image = LinkAccount;
                    ToolTip = 'Create, change, or delete a coupling between the Microsoft Dynamics NAV record and a Microsoft Dynamics CRM record.';
                    action(ManageCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = IM;
                        Caption = 'Set Up Coupling';
                        Enabled = ESACC_C68_Enabled;
                        Image = LinkAccount;
                        ToolTip = 'Create or modify the coupling to a Microsoft Dynamics CRM product.';
                        Visible = ESACC_C68_Visible;

                        trigger OnAction()
                        var
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.CreateOrUpdateCoupling(Rec.RecordId);
                        end;
                    }
                    action(DeleteCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = IM;
                        Caption = 'Delete Coupling';
                        Enabled = CRMIsCoupledToRecord;
                        Image = UnLinkAccount;
                        ToolTip = 'Delete the coupling to a Microsoft Dynamics CRM product.';
                        Visible = ESACC_C66_Visible;

                        trigger OnAction()
                        var
                            CRMCouplingManagement: Codeunit "CRM Coupling Management";
                        begin
                            CRMCouplingManagement.RemoveCoupling(Rec.RecordId);
                        end;
                    }
                }
            }
            group("Master Data")
            {
                Caption = 'Master Data';
                Image = DataEntry;
                action("&Units of Measure")
                {
                    Caption = '&Units of Measure';
                    Enabled = ESACC_C25_Enabled;
                    Image = UnitOfMeasure;
                    RunObject = Page "Item Units of Measure";
                    RunPageLink = "Item No." = FIELD("No.");
                    Visible = ESACC_C25_Visible;
                }
                action("Va&riants")
                {
                    Caption = 'Va&riants';
                    Enabled = ESACC_C30_Enabled;
                    Image = ItemVariant;
                    RunObject = Page "Item Variants";
                    RunPageLink = "Item No." = FIELD("No.");
                    Visible = ESACC_C30_Visible;
                }
                action("Te&xt Module")
                {
                    AccessByPermission = TableData "Text Module Header" = R;
                    Caption = 'Te&xt Module';
                    Enabled = ESACC_C5060600_Enabled;
                    Image = Text;
                    Visible = ESACC_C5060600_Visible;

                    trigger OnAction()
                    var
                        TMFunctions: Codeunit "Text Module Functions";
                    begin
                        TMFunctions.ShowHeader(DATABASE::Item, Rec);
                    end;
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        Caption = 'Dimensions-Single';
                        Enabled = ESACC_C184_Enabled;
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = CONST(27),
                                      "No." = FIELD("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                        Visible = ESACC_C184_Visible;
                    }
                    action("Dimensions-&Multiple")
                    {
                        AccessByPermission = TableData Dimension = R;
                        Caption = 'Dimensions-&Multiple';
                        Enabled = ESACC_C93_Enabled;
                        Image = DimensionSets;
                        Visible = ESACC_C93_Visible;

                        trigger OnAction()
                        var
                            Item: Record Item;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Item);
                            DefaultDimMultiple.SetMultiItem(Item);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                action("Substituti&ons")
                {
                    Caption = 'Substituti&ons';
                    Enabled = ESACC_C500_Enabled;
                    Image = ItemSubstitution;
                    RunObject = Page "Item Substitution Entry";
                    RunPageLink = Type = CONST(Item),
                                  "No." = FIELD("No.");
                    Visible = ESACC_C500_Visible;
                }
                action("Cross Re&ferences")
                {
                    Caption = 'Cross Re&ferences';
                    Enabled = ESACC_C82_Enabled;
                    Image = Change;
                    RunObject = Page "Item Cross Reference Entries";
                    RunPageLink = "Item No." = FIELD("No.");
                    Visible = ESACC_C82_Visible;
                }
                action("E&xtended Texts")
                {
                    Caption = 'E&xtended Texts';
                    Enabled = ESACC_C28_Enabled;
                    Image = Text;
                    RunObject = Page "Extended Text List";
                    RunPageLink = "Table Name" = CONST(Item),
                                  "No." = FIELD("No.");
                    RunPageView = SORTING("Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");
                    Visible = ESACC_C28_Visible;
                }
                action(Translations)
                {
                    Caption = 'Translations';
                    Enabled = ESACC_C27_Enabled;
                    Image = Translations;
                    RunObject = Page "Item Translations";
                    RunPageLink = "Item No." = FIELD("No."),
                                  "Variant Code" = CONST('');
                    Visible = ESACC_C27_Visible;
                }
                action("&Picture")
                {
                    Caption = '&Picture';
                    Enabled = ESACC_C20_Enabled;
                    Image = Picture;
                    RunObject = Page "Item Picture";
                    RunPageLink = "No." = FIELD("No."),
                                  "Date Filter" = FIELD("Date Filter"),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                  "Location Filter" = FIELD("Location Filter"),
                                  "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                                  "Variant Filter" = FIELD("Variant Filter");
                    Visible = ESACC_C20_Visible;
                }
                action(Identifiers)
                {
                    Caption = 'Identifiers';
                    Enabled = ESACC_C121_Enabled;
                    Image = BarCode;
                    RunObject = Page "Item Identifiers";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.", "Variant Code", "Unit of Measure Code");
                    Visible = ESACC_C121_Visible;
                }
                separator(Action5292630)
                {
                }
                action("<Action1100409001>")
                {
                    Caption = 'Alloy Weights';
                    Enabled = ESACC_C5292631_Enabled;
                    Image = IssueFinanceCharge;
                    RunObject = Page "AM - Item Alloy Weights";
                    RunPageLink = "Item No." = FIELD("No.");
                    Visible = AMGranuleEnabled;
                }
                action("&Delivery Tolerance Entries")
                {
                    Caption = '&Delivery Tolerance Entries';
                    Enabled = ESACC_C5012401_Enabled;
                    Image = Entry;
                    Visible = ESACC_C5012401_Visible;

                    trigger OnAction()
                    begin
                        // >> :PMW14.00:2473:1
                        ShowDeliveryToleranceEntries;
                        // << :PMW14.00:2473:1
                    end;
                }
                action("In&gredients")
                {
                    Caption = 'In&gredients';
                    Description = '#PMW16.00.02:T230';
                    Enabled = ESACC_C5012402_Enabled;
                    Image = BOMLedger;
                    RunObject = Page "Item Ingredients";
                    RunPageLink = "Item No." = FIELD("No."),
                                  "Variant Code" = CONST('');
                    Visible = ESACC_C5012402_Visible;
                }
                group("Master &BOM")
                {
                    Caption = 'Master &BOM';
                    Image = BOM;
                    action("&Master BOM")
                    {
                        Caption = '&Master BOM';
                        Enabled = ESACC_C5013412_Enabled;
                        Image = BOM;
                        RunObject = Page "Item - Master BOM";
                        RunPageLink = Item = FIELD("No.");
                        RunPageView = SORTING(Item, Type)
                                      ORDER(Ascending);
                        Visible = ESACC_C5013412_Visible;
                    }
                    action("Master BOM &Where Used")
                    {
                        Caption = 'Master BOM &Where Used';
                        Enabled = ESACC_C5013411_Enabled;
                        Image = "Where-Used";
                        Visible = ESACC_C5013411_Visible;

                        trigger OnAction()
                        var
                            MasterBOMWhereUsed: Page "Master BOM Where-Used";
                        begin
                            // >> :DMW13.71:1:02
                            MasterBOMWhereUsed.SetItem(Rec, 0D);
                            MasterBOMWhereUsed.RunModal;
                            // << :DMW13.71:1:02
                        end;
                    }
                }
                action("A&ttributes")
                {
                    Caption = 'A&ttributes';
                    Enabled = ESACC_C5013410_Enabled;
                    Image = ViewDetails;
                    RunObject = Page "Attribute Values";
                    RunPageLink = "Table No." = CONST(27),
                                  "No." = FIELD("No."),
                                  "Variant Code" = FILTER('');
                    RunPageView = SORTING("Table No.", "No.", "Variant Code", "Line No.")
                                  ORDER(Descending);
                    Visible = ESACC_C5013410_Visible;
                }
                action("&Checklist")
                {
                    Caption = '&Checklist';
                    Enabled = ESACC_C5013408_Enabled;
                    Image = CheckList;
                    RunObject = Page "Item Checklist Relations";
                    RunPageLink = "Table ID" = CONST(Item),
                                  Code = FIELD("No.");
                    Visible = ESACC_C5013408_Visible;
                }
                action("Sear&ch Characteristics")
                {
                    Caption = 'Sear&ch Characteristics';
                    Enabled = ESACC_C5013406_Enabled;
                    Image = ViewPage;
                    RunObject = Page "Item Search Characteristics";
                    RunPageLink = "No." = FIELD("No.");
                    Visible = ESACC_C5013406_Visible;
                }
                action("&Profi DB")
                {
                    Caption = '&Profi DB';
                    Enabled = ESACC_C5013404_Enabled;
                    Image = ImportExport;
                    RunObject = Page "Item Profi DB";
                    RunPageLink = "No." = FIELD("No.");
                    Visible = ESACC_C5013404_Visible;
                }
                action("KAN&BAN")
                {
                    Caption = 'KAN&BAN';
                    Enabled = ESACC_C5013400_Enabled;
                    Image = Card;
                    Visible = ESACC_C5013400_Visible;

                    trigger OnAction()
                    var
                        KANBANMgt: Codeunit "KANBAN Management";
                    begin
                        KANBANMgt.OpenKANBANCard(Rec."No.", '', '');   // #KANBAN:DMW16.00.03:A004
                    end;
                }
                action("Item &Drawing")
                {
                    Caption = 'Item &Drawing';
                    Enabled = ESACC_C5013402_Enabled;
                    Image = Picture;
                    RunObject = Page "Item Drawing";
                    RunPageLink = "Item No." = FIELD("No.");
                    Visible = ESACC_C5013402_Visible;
                }
            }
            group("Assembly/Production")
            {
                Caption = 'Assembly/Production';
                Image = Production;
                action(Structure)
                {
                    Caption = 'Structure';
                    Enabled = ESACC_C52_Enabled;
                    Image = Hierarchy;
                    Visible = ESACC_C52_Visible;

                    trigger OnAction()
                    var
                        BOMStructure: Page "BOM Structure";
                    begin
                        BOMStructure.InitItem(Rec);
                        BOMStructure.Run;
                    end;
                }
                action("Cost Shares")
                {
                    Caption = 'Cost Shares';
                    Enabled = ESACC_C50_Enabled;
                    Image = CostBudget;
                    Visible = ESACC_C50_Visible;

                    trigger OnAction()
                    var
                        BOMCostShares: Page "BOM Cost Shares";
                    begin
                        BOMCostShares.InitItem(Rec);
                        BOMCostShares.Run;
                    end;
                }
                group("Assemb&ly")
                {
                    Caption = 'Assemb&ly';
                    Image = AssemblyBOM;
                    action("<Action32>")
                    {
                        Caption = 'Assembly BOM';
                        Enabled = ESACC_C48_Enabled;
                        Image = BOM;
                        RunObject = Page "Assembly BOM";
                        RunPageLink = "Parent Item No." = FIELD("No.");
                        Visible = ESACC_C48_Visible;
                    }
                    action("Where-Used")
                    {
                        Caption = 'Where-Used';
                        Enabled = ESACC_C47_Enabled;
                        Image = Track;
                        RunObject = Page "Where-Used List";
                        RunPageLink = Type = CONST(Item),
                                      "No." = FIELD("No.");
                        RunPageView = SORTING(Type, "No.");
                        Visible = ESACC_C47_Visible;
                    }
                    action("Calc. Stan&dard Cost")
                    {
                        AccessByPermission = TableData "BOM Component" = R;
                        Caption = 'Calc. Stan&dard Cost';
                        Enabled = ESACC_C46_Enabled;
                        Image = CalculateCost;
                        Visible = ESACC_C46_Visible;

                        trigger OnAction()
                        begin
                            CalculateStdCost.CalcItem(Rec."No.", true);
                        end;
                    }
                    action("Calc. Unit Price")
                    {
                        AccessByPermission = TableData "BOM Component" = R;
                        Caption = 'Calc. Unit Price';
                        Enabled = ESACC_C44_Enabled;
                        Image = SuggestItemPrice;
                        Visible = ESACC_C44_Visible;

                        trigger OnAction()
                        begin
                            CalculateStdCost.CalcAssemblyItemPrice(Rec."No.");
                        end;
                    }
                }
                group(Production)
                {
                    Caption = 'Production';
                    Image = Production;
                    action("Production &Structures")
                    {
                        Caption = 'Production &Structures';
                        Enabled = ESACC_C5012406_Enabled;
                        Image = ProdBOMMatrixPerVersion;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Production Structure List";
                        RunPageLink = "Item No." = FIELD("No.");
                        RunPageView = SORTING("No.");
                        Visible = ESACC_C5012406_Visible;
                    }
                    action("Production BOM")
                    {
                        Caption = 'Production BOM';
                        Enabled = ESACC_C32_Enabled;
                        Image = BOM;
                        RunObject = Page "Production BOM";
                        RunPageLink = "No." = FIELD("Production BOM No.");
                        Visible = ESACC_C32_Visible;
                    }
                    action(Action29)
                    {
                        AccessByPermission = TableData "BOM Component" = R;
                        Caption = 'Where-Used';
                        Enabled = ESACC_C29_Enabled;
                        Image = "Where-Used";
                        Visible = ESACC_C29_Visible;

                        trigger OnAction()
                        var
                            ProdBOMWhereUsed: Page "Prod. BOM Where-Used";
                        begin
                            ProdBOMWhereUsed.SetItem(Rec, WorkDate);
                            ProdBOMWhereUsed.RunModal;
                        end;
                    }
                    action(Action24)
                    {
                        AccessByPermission = TableData "Production BOM Header" = R;
                        Caption = 'Calc. Stan&dard Cost';
                        Enabled = ESACC_C24_Enabled;
                        Image = CalculateCost;
                        Visible = ESACC_C24_Visible;

                        trigger OnAction()
                        begin
                            CalculateStdCost.CalcItem(Rec."No.", false);
                        end;
                    }
                    action("Detail Calc. &Standard Cost")
                    {
                        Caption = 'Detail Calc. &Standard Cost';
                        Enabled = ESACC_C5012411_Enabled;
                        Image = CalculateHierarchy;
                        Visible = ESACC_C5012411_Visible;

                        trigger OnAction()
                        var
                            DetailCalculationServices: Codeunit "Detail Calculation Services";
                        begin
                            // >> :PMW13.71:1:1
                            Rec.TestField("No.");
                            DetailCalculationServices.ShowCalculation(Rec);
                            // << :PMW13.71:1:1
                        end;
                    }
                    action("&Calculation")
                    {
                        Caption = '&Calculation';
                        Enabled = ESACC_C5012650_Enabled;
                        Image = CalculateInvoiceDiscount;
                        Promoted = true;
                        PromotedCategory = Process;
                        Visible = ESACC_C5012650_Visible;

                        trigger OnAction()
                        begin
                            ShowCalculation; // #CAW16.00:T100
                        end;
                    }
                    action("&Manufacturing Dimensions")
                    {
                        Caption = '&Manufacturing Dimensions';
                        Enabled = ESACC_C5012702_Enabled;
                        Image = Dimensions;
                        RunObject = Page "Default Mfg. Dimensions";
                        RunPageLink = "Source Type" = CONST(27),
                                      "Source ID" = FIELD("No.");
                        ShortCutKey = 'Shift+Ctrl+P';
                        Visible = ESACC_C5012702_Visible;
                    }
                    action("Work Cen&ter Production Rates")
                    {
                        Caption = 'Work Cen&ter Production Rates';
                        Enabled = ESACC_C5012700_Enabled;
                        Image = BlanketOrder;
                        RunObject = Page "Work Center Production Rates";
                        RunPageLink = "Item No." = FIELD("No.");
                        Visible = ESACC_C5012700_Visible;
                    }
                    action("Pr&oduction Simulation")
                    {
                        Caption = 'Pr&oduction Simulation';
                        Enabled = ESACC_C5012409_Enabled;
                        Image = PrepaymentSimulation;
                        Visible = ESACC_C5012409_Visible;

                        trigger OnAction()
                        var
                            ProductionStructureSimMgt: Codeunit "Production Simulation Mgt.";
                        begin
                            // >> :PMW14.02:91:1
                            ProductionStructureSimMgt.ShowStructureForItem(Rec);
                            // << :PMW14.02:91:1
                        end;
                    }
                    action("Item &Bottling")
                    {
                        Caption = 'Item &Bottling';
                        Enabled = ESACC_C5012408_Enabled;
                        Image = "Filter";
                        Visible = ESACC_C5012408_Visible;

                        trigger OnAction()
                        var
                            ItemBottling: Page "Item Bottling";
                        begin
                            // >> :PMW14.02:75:1
                            Rec.TestField("No.");
                            if "Trading Unit per Item UOM" = "Trading Unit per Item UOM"::Item then begin
                                ItemBottling.Def(Rec."No.", Rec.GetFilter("Location Filter"), '', '', '', '', Rec."Base Unit of Measure", '');
                            end else begin
                                ItemBottling.Def(Rec."No.", Rec.GetFilter("Location Filter"), '', '', '', '', '', '');
                            end;
                            ItemBottling.StartSearching;
                            ItemBottling.RunModal;
                            Clear(ItemBottling);
                            // << :PMW14.02:75:1
                        end;
                    }
                    action("&Incorporation Usage")
                    {
                        Caption = '&Incorporation Usage';
                        Enabled = ESACC_C5012407_Enabled;
                        Image = "Where-Used";
                        Visible = ESACC_C5012407_Visible;

                        trigger OnAction()
                        var
                            IncorporationMgt: Codeunit "Incorporation Mgt.";
                        begin
                            // >> INCORPORATION:PMW16.00:135:1
                            Rec.TestField("No.");
                            IncorporationMgt.ShowIncorporationUsage(Rec."No.");
                            // << INCORPORATION:PMW16.00:135:1
                        end;
                    }
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                group("E&ntries")
                {
                    Caption = 'E&ntries';
                    Image = Entries;
                    action("Ledger E&ntries")
                    {
                        Caption = 'Ledger E&ntries';
                        Enabled = ESACC_C14_Enabled;
                        Image = ItemLedger;
                        Promoted = false;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Item Ledger Entries";
                        RunPageLink = "Item No." = FIELD("No.");
                        RunPageView = SORTING("Item No.");
                        ShortCutKey = 'Ctrl+F7';
                        Visible = ESACC_C14_Visible;
                    }
                    action("&Reservation Entries")
                    {
                        Caption = '&Reservation Entries';
                        Enabled = ESACC_C77_Enabled;
                        Image = ReservationLedger;
                        RunObject = Page "Reservation Entries";
                        RunPageLink = "Reservation Status" = CONST(Reservation),
                                      "Item No." = FIELD("No.");
                        RunPageView = SORTING("Item No.", "Variant Code", "Location Code", "Reservation Status");
                        Visible = ESACC_C77_Visible;
                    }
                    action("&Phys. Inventory Ledger Entries")
                    {
                        Caption = '&Phys. Inventory Ledger Entries';
                        Enabled = ESACC_C23_Enabled;
                        Image = PhysicalInventoryLedger;
                        RunObject = Page "Phys. Inventory Ledger Entries";
                        RunPageLink = "Item No." = FIELD("No.");
                        RunPageView = SORTING("Item No.");
                        Visible = ESACC_C23_Visible;
                    }
                    action("&Value Entries")
                    {
                        Caption = '&Value Entries';
                        Enabled = ESACC_C5800_Enabled;
                        Image = ValueLedger;
                        RunObject = Page "Value Entries";
                        RunPageLink = "Item No." = FIELD("No.");
                        RunPageView = SORTING("Item No.");
                        Visible = ESACC_C5800_Visible;
                    }
                    action("Item &Tracking Entries")
                    {
                        Caption = 'Item &Tracking Entries';
                        Enabled = ESACC_C6500_Enabled;
                        Image = ItemTrackingLedger;
                        Visible = ESACC_C6500_Visible;

                        trigger OnAction()
                        var
                            ItemTrackingDocMgt: Codeunit "Item Tracking Doc. Management";
                        begin
                            ItemTrackingDocMgt.ShowItemTrackingForMasterData(3, '', Rec."No.", '', '', '', '');
                        end;
                    }
                    action("&Warehouse Entries")
                    {
                        Caption = '&Warehouse Entries';
                        Enabled = ESACC_C7_Enabled;
                        Image = BinLedger;
                        RunObject = Page "Warehouse Entries";
                        RunPageLink = "Item No." = FIELD("No.");
                        RunPageView = SORTING("Item No.", "Bin Code", "Location Code", "Variant Code", "Unit of Measure Code", "Lot No.", "Serial No.", "Entry Type", Dedicated);
                        Visible = ESACC_C7_Visible;
                    }
                }
                group(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    action(Action16)
                    {
                        Caption = 'Statistics';
                        Enabled = ESACC_C16_Enabled;
                        Image = Statistics;
                        Promoted = true;
                        PromotedCategory = Process;
                        ShortCutKey = 'F7';
                        Visible = ESACC_C16_Visible;

                        trigger OnAction()
                        var
                            ItemStatistics: Page "Item Statistics";
                        begin
                            ItemStatistics.SetItem(Rec);
                            ItemStatistics.RunModal;
                        end;
                    }
                    action("Entry Statistics")
                    {
                        Caption = 'Entry Statistics';
                        Enabled = ESACC_C17_Enabled;
                        Image = EntryStatistics;
                        RunObject = Page "Item Entry Statistics";
                        RunPageLink = "No." = FIELD("No."),
                                      "Date Filter" = FIELD("Date Filter"),
                                      "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                      "Location Filter" = FIELD("Location Filter"),
                                      "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                                      "Variant Filter" = FIELD("Variant Filter");
                        Visible = ESACC_C17_Visible;
                    }
                    action("T&urnover")
                    {
                        Caption = 'T&urnover';
                        Enabled = ESACC_C22_Enabled;
                        Image = Turnover;
                        RunObject = Page "Item Turnover";
                        RunPageLink = "No." = FIELD("No."),
                                      "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                      "Location Filter" = FIELD("Location Filter"),
                                      "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                                      "Variant Filter" = FIELD("Variant Filter");
                        Visible = ESACC_C22_Visible;
                    }
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Enabled = ESACC_C15_Enabled;
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST(Item),
                                  "No." = FIELD("No.");
                    Visible = ESACC_C15_Visible;
                }
            }
            group("&Quality Management")
            {
                Caption = '&Quality Management';
                action("&Test Status")
                {
                    Caption = '&Test Status';
                    Enabled = ESACC_C5034553_Enabled;
                    Image = ShowMatrix;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Quality and Test Status";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.", "Vendor No.");
                    Visible = ESACC_C5034553_Visible;
                }
                separator(Action5034552)
                {
                }
                action("Test Plan Set&up")
                {
                    Caption = 'Test Plan Set&up';
                    Enabled = ESACC_C5034551_Enabled;
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Test Plan Setup";
                    RunPageLink = "Item No." = FIELD("No.");
                    Visible = ESACC_C5034551_Visible;
                }
                action("Retain Sample Instruction")
                {
                    Caption = 'Retain Sample Instruction';
                    Enabled = ESACC_C5034554_Enabled;
                    Image = Evaluate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Retain Sample Instruction";
                    RunPageLink = "Item No." = FIELD("No.");
                    Visible = ESACC_C5034554_Visible;
                }
            }
            group("S&ales")
            {
                Caption = 'S&ales';
                Image = Sales;
                action(Prices)
                {
                    Caption = 'Prices';
                    Enabled = ESACC_C36_Enabled;
                    Image = Price;
                    RunObject = Page "Sales Prices";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.");
                    Visible = ESACC_C36_Visible;
                }
                action("Line Discounts")
                {
                    Caption = 'Line Discounts';
                    Enabled = ESACC_C34_Enabled;
                    Image = LineDiscount;
                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = Type = CONST(Item),
                                  Code = FIELD("No.");
                    RunPageView = SORTING(Type, Code);
                    Visible = ESACC_C34_Visible;
                }
                action("Prepa&yment Percentages")
                {
                    Caption = 'Prepa&yment Percentages';
                    Enabled = ESACC_C124_Enabled;
                    Image = PrepaymentPercentages;
                    RunObject = Page "Sales Prepayment Percentages";
                    RunPageLink = "Item No." = FIELD("No.");
                    Visible = ESACC_C124_Visible;
                }
                action("R&estricted Sales")
                {
                    Caption = 'R&estricted Sales';
                    Enabled = ESACC_C5012405_Enabled;
                    Image = CancelledEntries;
                    RunObject = Page "Restricted Sales Setup";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.");
                    Visible = ESACC_C5012405_Visible;
                }
                action("Remain. She&lf Life Setup")
                {
                    Caption = 'Remain. She&lf Life Setup';
                    Enabled = ESACC_C5012403_Enabled;
                    Image = SetupList;
                    RunObject = Page "Remain. Shelf Life Setup";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.", "Item Category Code", "Sales Type", "Sales Code");
                    Visible = ESACC_C5012403_Visible;
                }
                action(Orders)
                {
                    Caption = 'Orders';
                    Enabled = ESACC_C37_Enabled;
                    Image = Document;
                    RunObject = Page "Sales Orders";
                    RunPageLink = Type = CONST(Item),
                                  "No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", Type, "No.");
                    Visible = ESACC_C37_Visible;
                }
                action("Returns Orders")
                {
                    Caption = 'Returns Orders';
                    Enabled = ESACC_C114_Enabled;
                    Image = ReturnOrder;
                    RunObject = Page "Sales Return Orders";
                    RunPageLink = Type = CONST(Item),
                                  "No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", Type, "No.");
                    Visible = ESACC_C114_Visible;
                }
                action("Returnable &Containers")
                {
                    Caption = 'Returnable &Containers';
                    Enabled = ESACC_C5012404_Enabled;
                    Image = ReceiveLoaner;
                    RunObject = Page "Item Returnable Containers";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.", "No.");
                    Visible = ESACC_C5012404_Visible;
                }
                action("&Commission Rates")
                {
                    Caption = '&Commission Rates';
                    Enabled = ESACC_C5172103_Enabled;
                    Image = SalesLineDisc;
                    RunObject = Page "Commission Rates";
                    RunPageLink = Type = CONST(Item),
                                  Code = FIELD("No.");
                    RunPageView = SORTING(Type, Code);
                    Visible = ESACC_C5172103_Visible;
                }
            }
            group("&Purchases")
            {
                Caption = '&Purchases';
                Image = Purchasing;
                action("Ven&dors")
                {
                    Caption = 'Ven&dors';
                    Enabled = ESACC_C118_Enabled;
                    Image = Vendor;
                    RunObject = Page "Item Vendor Catalog";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.");
                    Visible = ESACC_C118_Visible;
                }
                action(Action39)
                {
                    Caption = 'Prices';
                    Enabled = ESACC_C39_Enabled;
                    Image = Price;
                    RunObject = Page "Purchase Prices";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.");
                    Visible = ESACC_C39_Visible;
                }
                action(Action42)
                {
                    Caption = 'Line Discounts';
                    Enabled = ESACC_C42_Enabled;
                    Image = LineDiscount;
                    RunObject = Page "Purchase Line Discounts";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.");
                    Visible = ESACC_C42_Visible;
                }
                action(Action125)
                {
                    Caption = 'Prepa&yment Percentages';
                    Enabled = ESACC_C125_Enabled;
                    Image = PrepaymentPercentages;
                    RunObject = Page "Purchase Prepmt. Percentages";
                    RunPageLink = "Item No." = FIELD("No.");
                    Visible = ESACC_C125_Visible;
                }
                action(Action40)
                {
                    Caption = 'Orders';
                    Enabled = ESACC_C40_Enabled;
                    Image = Document;
                    RunObject = Page "Purchase Orders";
                    RunPageLink = Type = CONST(Item),
                                  "No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", Type, "No.");
                    Visible = ESACC_C40_Visible;
                }
                action("Return Orders")
                {
                    Caption = 'Return Orders';
                    Enabled = ESACC_C115_Enabled;
                    Image = ReturnOrder;
                    RunObject = Page "Purchase Return Orders";
                    RunPageLink = Type = CONST(Item),
                                  "No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", Type, "No.");
                    Visible = ESACC_C115_Visible;
                }
                action("Nonstoc&k Items")
                {
                    Caption = 'Nonstoc&k Items';
                    Enabled = ESACC_C76_Enabled;
                    Image = NonStockItem;
                    RunObject = Page "Nonstock Item List";
                    Visible = ESACC_C76_Visible;
                }
            }
            group("&Job")
            {
                Caption = '&Job';
                action("C&omments and Documents")
                {
                    Caption = 'C&omments and Documents';
                    Enabled = ESACC_C5292333_Enabled;
                    Image = Comment;
                    RunObject = Page "PR - Job Comment Lines";
                    RunPageLink = "Table ID" = CONST(27),
                                  Code1 = FIELD("No."),
                                  Int1 = CONST(0);
                    RunPageView = SORTING("Table ID", Code1, Code2, Code3, Code4, Int1, Type, "Line No.");
                    Visible = ESACC_C5292333_Visible;
                }
                group("Component Groups")
                {
                    Caption = 'Component Groups';
                    Image = Setup;
                    action("Set Component Groups")
                    {
                        Caption = 'Set Component Groups';
                        Enabled = ESACC_C5292335_Enabled;
                        Image = Track;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Category4;
                        ShortCutKey = 'Ctrl+G';
                        Visible = ESACC_C5292335_Visible;

                        trigger OnAction()
                        var
                            ComponentGroup: Record "PR - Component Group";
                            GroupFilter: array[100] of Integer;
                            ComponentGroupsSelection: Page "PR - Component Groups Sel.";
                        begin
                            Clear(GroupFilter);
                            ComponentGroupsSelection.LoadExpandLevel(
                              "Component Group 1 No.",
                              "Component Group 2 No.",
                              "Component Group 3 No.",
                              "Component Group 4 No.",
                              "Component Group 5 No.");

                            ComponentGroupsSelection.LookupMode := true;
                            if ComponentGroupsSelection.RunModal = ACTION::LookupOK then begin
                                ComponentGroupsSelection.GetGroupFilter(GroupFilter);
                                "Component Group 1 No." := GroupFilter[1];
                                "Component Group 2 No." := GroupFilter[2];
                                "Component Group 3 No." := GroupFilter[3];
                                "Component Group 4 No." := GroupFilter[4];
                                "Component Group 5 No." := GroupFilter[5];
                                Rec.Modify;
                            end;
                        end;
                    }
                    action("Delete Component Groups")
                    {
                        Caption = 'Delete Component Groups';
                        Enabled = ESACC_C5292336_Enabled;
                        Image = Undo;
                        Visible = ESACC_C5292336_Visible;

                        trigger OnAction()
                        begin
                            "Component Group 1 No." := 0;
                            "Component Group 2 No." := 0;
                            "Component Group 3 No." := 0;
                            "Component Group 4 No." := 0;
                            "Component Group 5 No." := 0;
                            Rec.Modify;
                        end;
                    }
                }
                action("Set &Group Filters")
                {
                    Caption = 'Set &Group Filters';
                    Enabled = ESACC_C5292337_Enabled;
                    Image = FilterLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ShortCutKey = 'Ctrl+G';
                    Visible = ESACC_C5292337_Visible;

                    trigger OnAction()
                    var
                        ComponentGroup: Record "PR - Component Group";
                        ComponentGroupsSelection: Page "PR - Component Groups Sel.";
                        GroupFilter: array[100] of Integer;
                    begin
                        Rec.SetRange("Component Group 1 No.");
                        Rec.SetRange("Component Group 2 No.");
                        Rec.SetRange("Component Group 3 No.");
                        Rec.SetRange("Component Group 4 No.");
                        Rec.SetRange("Component Group 5 No.");
                        Rec.SetCurrentKey("No.");

                        Clear(GroupFilter);
                        ComponentGroupsText := '';

                        Clear(ComponentGroupsSelection);
                        ComponentGroupsSelection.LoadExpandLevel(
                          "Component Group 1 No.",
                          "Component Group 2 No.",
                          "Component Group 3 No.",
                          "Component Group 4 No.",
                          "Component Group 5 No.");

                        ComponentGroupsSelection.LookupMode := true;
                        if ComponentGroupsSelection.RunModal = ACTION::LookupOK then begin
                            ComponentGroupsSelection.GetGroupFilter(GroupFilter);

                            // Group Filter
                            if GroupFilter[1] <> 0 then begin
                                Rec.SetCurrentKey("Component Group 1 No.");
                                Rec.SetRange("Component Group 1 No.", GroupFilter[1]);
                            end;
                            if ComponentGroup.Get(GroupFilter[2]) then
                                Rec.SetRange("Component Group 2 No.", GroupFilter[2]);
                            if ComponentGroup.Get(GroupFilter[3]) then
                                Rec.SetRange("Component Group 3 No.", GroupFilter[3]);
                            if ComponentGroup.Get(GroupFilter[4]) then
                                Rec.SetRange("Component Group 4 No.", GroupFilter[4]);
                            if ComponentGroup.Get(GroupFilter[5]) then
                                Rec.SetRange("Component Group 5 No.", GroupFilter[5]);

                            // Group Text
                            if ComponentGroup.Get(GroupFilter[1]) then
                                ComponentGroupsText := ComponentGroup.Code;
                            if ComponentGroup.Get(GroupFilter[2]) then
                                ComponentGroupsText := ComponentGroupsText + '|' + ComponentGroup.Code;
                            if ComponentGroup.Get(GroupFilter[3]) then
                                ComponentGroupsText := ComponentGroupsText + '|' + ComponentGroup.Code;
                            if ComponentGroup.Get(GroupFilter[4]) then
                                ComponentGroupsText := ComponentGroupsText + '|' + ComponentGroup.Code;
                            if ComponentGroup.Get(GroupFilter[5]) then
                                ComponentGroupsText := ComponentGroupsText + '|' + ComponentGroup.Code;

                        end;
                    end;
                }
            }
            group("&Rental")
            {
                Caption = '&Rental';
                Image = Sales;
                action(Action5072651)
                {
                    Caption = 'Prices';
                    Enabled = ESACC_C5072651_Enabled;
                    Image = Price;
                    RunObject = Page "Sales Prices";
                    RunPageLink = "Item No." = FIELD("No."),
                                  "Rental Rate Code" = FILTER(<> ''),
                                  "Rate Component Type" = CONST(" ");
                    RunPageView = SORTING("Item No.");
                    Visible = ESACC_C5072651_Visible;
                }
                action(Action5072652)
                {
                    Caption = 'Line Discounts';
                    Enabled = ESACC_C5072652_Enabled;
                    Image = LineDiscount;
                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = Type = CONST(Item),
                                  Code = FIELD("No.");
                    RunPageView = SORTING(Type, Code)
                                  WHERE("Rental Rate Code" = FILTER(<> ''));
                    Visible = ESACC_C5072652_Visible;
                }
                action(Action5072653)
                {
                    Caption = 'Prepa&yment Percentages';
                    Enabled = ESACC_C5072653_Enabled;
                    Image = PrepaymentPercentages;
                    RunObject = Page "Sales Prepayment Percentages";
                    RunPageLink = "Item No." = FIELD("No.");
                    Visible = false;
                }
                separator(Action5072654)
                {
                }
                action(Action5072655)
                {
                    Caption = 'Orders';
                    Enabled = ESACC_C5072655_Enabled;
                    Image = Document;
                    RunObject = Page "Sales Orders";
                    RunPageLink = Type = CONST(Item),
                                  "No." = FIELD("No."),
                                  "Rental Position" = CONST(Rental);
                    RunPageView = SORTING("Document Type", Type, "No.");
                    Visible = ESACC_C5072655_Visible;
                }
                separator(Action5072656)
                {
                }
                action("Item Rent Rate Components")
                {
                    Caption = 'Item Rent Rate Components';
                    Enabled = ESACC_C5072657_Enabled;
                    Image = Agreement;
                    RunObject = Page "Item Rent Rate Components";
                    RunPageLink = "Item No." = FIELD("No.");
                    Visible = ESACC_C5072657_Visible;
                }
                action("Rate Component Prices")
                {
                    Caption = 'Rate Component Prices';
                    Enabled = ESACC_C5072660_Enabled;
                    Image = Price;
                    RunObject = Page "Rent Component Prices";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.", "Sales Type", "Sales Code", "Starting Date", "Currency Code", "Variant Code", "Unit of Measure Code", "Minimum Quantity", "Rental Rate Code", "Rate Component Type", "Rate Component No.");
                    Visible = ESACC_C5072660_Visible;
                }
            }
            group(Warehouse)
            {
                Caption = 'Warehouse';
                Image = Warehouse;
                action("&Bin Contents")
                {
                    Caption = '&Bin Contents';
                    Enabled = ESACC_C116_Enabled;
                    Image = BinContent;
                    RunObject = Page "Item Bin Contents";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.");
                    Visible = ESACC_C116_Visible;
                }
                action("Stockkeepin&g Units")
                {
                    Caption = 'Stockkeepin&g Units';
                    Enabled = ESACC_C81_Enabled;
                    Image = SKU;
                    RunObject = Page "Stockkeeping Unit List";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.");
                    Visible = ESACC_C81_Visible;
                }
            }
            group(Service)
            {
                Caption = 'Service';
                Image = ServiceItem;
                action("Ser&vice Items")
                {
                    Caption = 'Ser&vice Items';
                    Enabled = ESACC_C103_Enabled;
                    Image = ServiceItem;
                    RunObject = Page "Service Items";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.");
                    Visible = ESACC_C103_Visible;
                }
                action(Troubleshooting)
                {
                    AccessByPermission = TableData "Service Header" = R;
                    Caption = 'Troubleshooting';
                    Enabled = ESACC_C11_Enabled;
                    Image = Troubleshoot;
                    Visible = ESACC_C11_Visible;

                    trigger OnAction()
                    var
                        TroubleshootingHeader: Record "Troubleshooting Header";
                    begin
                        TroubleshootingHeader.ShowForItem(Rec);
                    end;
                }
                action("Troubleshooting Setup")
                {
                    Caption = 'Troubleshooting Setup';
                    Enabled = ESACC_C105_Enabled;
                    Image = Troubleshoot;
                    RunObject = Page "Troubleshooting Setup";
                    RunPageLink = Type = CONST(Item),
                                  "No." = FIELD("No.");
                    Visible = ESACC_C105_Visible;
                }
            }
            group(Resources)
            {
                Caption = 'Resources';
                Image = Resource;
                group("R&esource")
                {
                    Caption = 'R&esource';
                    Image = Resource;
                    action("Resource &Skills")
                    {
                        Caption = 'Resource &Skills';
                        Enabled = ESACC_C108_Enabled;
                        Image = ResourceSkills;
                        RunObject = Page "Resource Skills";
                        RunPageLink = Type = CONST(Item),
                                      "No." = FIELD("No.");
                        Visible = ESACC_C108_Visible;
                    }
                    action("Skilled R&esources")
                    {
                        AccessByPermission = TableData "Service Header" = R;
                        Caption = 'Skilled R&esources';
                        Enabled = ESACC_C109_Enabled;
                        Image = ResourceSkills;
                        Visible = ESACC_C109_Visible;

                        trigger OnAction()
                        var
                            ResourceSkill: Record "Resource Skill";
                        begin
                            Clear(SkilledResourceList);
                            SkilledResourceList.Initialize(ResourceSkill.Type::Item, Rec."No.", Rec.Description);
                            SkilledResourceList.RunModal;
                        end;
                    }
                }
            }
            action("Open DocumentBox")
            {
                AccessByPermission = TableData "DMS - Document Library" = R;
                Caption = 'Open DocumentBox';
                Enabled = ESACC_C5306001_Enabled;
                Image = ViewDocumentLine;
                Visible = ESACC_C5306001_Visible;

                trigger OnAction()
                var
                    AsyncDocumentBox: Page "DMS - Doc. Box FactBox Async";
                    RecRef: RecordRef;
                begin
                    // >> CCDMS
                    RecRef.GetTable(Rec);
                    AsyncDocumentBox.SetRecordRef(RecRef);
                    AsyncDocumentBox.SetIndependentPage(true, CurrPage.Caption);
                    AsyncDocumentBox.Run;
                    // << CCDMS
                end;
            }
        }
        area(processing)
        {
            action("&Workflow Context Menu")
            {
                Caption = '&Workflow Context Menu';
                Enabled = ESACC_C5103601_Enabled;
                Image = ExplodeBOM;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ShortCutKey = 'Shift+Ctrl+W';
                Visible = ESACC_C5103601_Visible;

                trigger OnAction()
                var
                    WorkflowContextMenu: Page "Workflow Context Menu";
                    RecRef: RecordRef;
                    MessagePageID: Integer;
                begin
                    // >> WF
                    RecRef.GetTable(Rec);
                    Evaluate(MessagePageID, CopyStr(CurrPage.ObjectId(false),
                      StrPos(CurrPage.ObjectId(false), ' ') + 1, StrLen(CurrPage.ObjectId(false))));
                    WorkflowContextMenu.SetRecRef(RecRef);
                    WorkflowContextMenu.SetObjectID(MessagePageID);
                    WorkflowContextMenu.RunModal;
                    Clear(WorkflowContextMenu);
                    // << WF
                end;
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Visible = ESACC_C87_Visible;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if ApprovalsMgmt.CheckItemApprovalsWorkflowEnabled(Rec) then
                            ApprovalsMgmt.OnSendItemForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Visible = ESACC_C86_Visible;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OnCancelItemApprovalRequest(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("&Create Stockkeeping Unit")
                {
                    AccessByPermission = TableData "Stockkeeping Unit" = R;
                    Caption = '&Create Stockkeeping Unit';
                    Enabled = ESACC_C111_Enabled;
                    Image = CreateSKU;
                    Visible = ESACC_C111_Visible;

                    trigger OnAction()
                    var
                        Item: Record Item;
                    begin
                        Item.SetRange("No.", Rec."No.");
                        REPORT.RunModal(REPORT::"Create Stockkeeping Unit", true, false, Item);
                    end;
                }
                action("C&alculate Counting Period")
                {
                    AccessByPermission = TableData "Phys. Invt. Item Selection" = R;
                    Caption = 'C&alculate Counting Period';
                    Enabled = ESACC_C7380_Enabled;
                    Image = CalculateCalendar;
                    Visible = ESACC_C7380_Visible;

                    trigger OnAction()
                    var
                        Item: Record Item;
                        PhysInvtCountMgt: Codeunit "Phys. Invt. Count.-Management";
                    begin
                        CurrPage.SetSelectionFilter(Item);
                        PhysInvtCountMgt.UpdateItemPhysInvtCount(Item);
                    end;
                }
                action(CopyItem)
                {
                    Caption = 'C&opy Item';
                    Enabled = ESACC_C1000000_Enabled;
                    Visible = ESACC_C1000000_Visible;

                    trigger OnAction()
                    var
                        CopyItem: Report "Item Copy";
                        ReturnItem: Record Item;
                    begin
                        CopyItem.ItemDef(Rec);
                        CopyItem.RunModal;
                        if CopyItem.ItemReturn(ReturnItem) then
                            if Confirm(Text11500, true) then
                                Rec := ReturnItem;
                    end;
                }
                action("&Search && Replace Item")
                {
                    Caption = '&Search && Replace Item';
                    Enabled = ESACC_C5013401_Enabled;
                    Image = ExchProdBOMItem;
                    Visible = ESACC_C5013401_Visible;

                    trigger OnAction()
                    var
                        ItemReplaceMgt: Codeunit "Item Replace Management";
                    begin
                        // >> :DMW14.00:1:01
                        ItemReplaceMgt.Code(Rec."No.");
                        // << :DMW14.00:1:01
                    end;
                }
            }
            action("Sales Prices")
            {
                Caption = 'Sales Prices';
                Enabled = ESACC_C1901240604_Enabled;
                Image = SalesPrices;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Sales Prices";
                RunPageLink = "Item No." = FIELD("No.");
                RunPageView = SORTING("Item No.");
                Visible = ESACC_C1901240604_Visible;
            }
            action("Sales Line Discounts")
            {
                Caption = 'Sales Line Discounts';
                Enabled = ESACC_C1900869004_Enabled;
                Image = SalesLineDisc;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Sales Line Discounts";
                RunPageLink = Type = CONST(Item),
                              Code = FIELD("No.");
                RunPageView = SORTING(Type, Code);
                Visible = ESACC_C1900869004_Visible;
            }
            action("Requisition Worksheet")
            {
                Caption = 'Requisition Worksheet';
                Enabled = ESACC_C1905370404_Enabled;
                Image = Worksheet;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Req. Worksheet";
                Visible = ESACC_C1905370404_Visible;
            }
            action("Item Journal")
            {
                Caption = 'Item Journal';
                Enabled = ESACC_C1904344904_Enabled;
                Image = Journals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Item Journal";
                Visible = ESACC_C1904344904_Visible;
            }
            action("Item Reclassification Journal")
            {
                Caption = 'Item Reclassification Journal';
                Enabled = ESACC_C1906716204_Enabled;
                Image = Journals;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Item Reclass. Journal";
                Visible = ESACC_C1906716204_Visible;
            }
            action("Item Tracing")
            {
                Caption = 'Item Tracing';
                Enabled = ESACC_C1902532604_Enabled;
                Image = ItemTracing;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Item Tracing";
                Visible = ESACC_C1902532604_Visible;
            }
            action("Adjust Item Cost/Price")
            {
                Caption = 'Adjust Item Cost/Price';
                Enabled = ESACC_C1900805004_Enabled;
                Image = AdjustItemCost;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Report "Adjust Item Costs/Prices";
                Visible = ESACC_C1900805004_Visible;
            }
            action("Adjust Cost - Item Entries")
            {
                Caption = 'Adjust Cost - Item Entries';
                Enabled = ESACC_C1907108104_Enabled;
                Image = AdjustEntries;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "Adjust Cost - Item Entries";
                Visible = ESACC_C1907108104_Visible;
            }
        }
        area(reporting)
        {
            action("Inventory - List")
            {
                Caption = 'Inventory - List';
                Enabled = ESACC_C1900907306_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - List";
                Visible = ESACC_C1900907306_Visible;
            }
            action("Item Register - Quantity")
            {
                Caption = 'Item Register - Quantity';
                Enabled = ESACC_C1907629906_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Register - Quantity";
                Visible = ESACC_C1907629906_Visible;
            }
            action("Inventory - Transaction Detail")
            {
                Caption = 'Inventory - Transaction Detail';
                Enabled = ESACC_C1904068306_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Transaction Detail";
                Visible = ESACC_C1904068306_Visible;
            }
            action("Inventory Availability")
            {
                Caption = 'Inventory Availability';
                Enabled = ESACC_C1901091106_Enabled;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory Availability";
                Visible = ESACC_C1901091106_Visible;
            }
            action(Status)
            {
                Caption = 'Status';
                Enabled = ESACC_C1901254106_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report Status;
                Visible = ESACC_C1901254106_Visible;
            }
            action("Inventory - Availability Plan")
            {
                Caption = 'Inventory - Availability Plan';
                Enabled = ESACC_C1906212206_Enabled;
                Image = ItemAvailability;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Availability Plan";
                Visible = ESACC_C1906212206_Visible;
            }
            action("Inventory Order Details")
            {
                Caption = 'Inventory Order Details';
                Enabled = ESACC_C1903262806_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory Order Details";
                Visible = ESACC_C1903262806_Visible;
            }
            action("Inventory Purchase Orders")
            {
                Caption = 'Inventory Purchase Orders';
                Enabled = ESACC_C1904739806_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory Purchase Orders";
                Visible = ESACC_C1904739806_Visible;
            }
            action("Inventory - Top 10 List")
            {
                Caption = 'Inventory - Top 10 List';
                Enabled = ESACC_C1907930606_Enabled;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory - Top 10 List";
                Visible = ESACC_C1907930606_Visible;
            }
            action("Inventory - Sales Statistics")
            {
                Caption = 'Inventory - Sales Statistics';
                Enabled = ESACC_C1900762706_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Sales Statistics";
                Visible = ESACC_C1900762706_Visible;
            }
            action("Assemble to Order - Sales")
            {
                Caption = 'Assemble to Order - Sales';
                Enabled = ESACC_C18_Enabled;
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Assemble to Order - Sales";
                Visible = ESACC_C18_Visible;
            }
            action("Inventory - Customer Sales")
            {
                Caption = 'Inventory - Customer Sales';
                Enabled = ESACC_C1904034006_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Customer Sales";
                Visible = ESACC_C1904034006_Visible;
            }
            action("Inventory - Vendor Purchases")
            {
                Caption = 'Inventory - Vendor Purchases';
                Enabled = ESACC_C1906231806_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Vendor Purchases";
                Visible = ESACC_C1906231806_Visible;
            }
            action("Price List")
            {
                Caption = 'Price List';
                Enabled = ESACC_C1905572506_Enabled;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Price List";
                Visible = ESACC_C1905572506_Visible;
            }
            action("Inventory Cost and Price List")
            {
                Caption = 'Inventory Cost and Price List';
                Enabled = ESACC_C1900128906_Enabled;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory Cost and Price List";
                Visible = ESACC_C1900128906_Visible;
            }
            action("Inventory - Reorders")
            {
                Caption = 'Inventory - Reorders';
                Enabled = ESACC_C1906101206_Enabled;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory - Reorders";
                Visible = ESACC_C1906101206_Visible;
            }
            action("Inventory - Sales Back Orders")
            {
                Caption = 'Inventory - Sales Back Orders';
                Enabled = ESACC_C1900210306_Enabled;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory - Sales Back Orders";
                Visible = ESACC_C1900210306_Visible;
            }
            action("Item/Vendor Catalog")
            {
                Caption = 'Item/Vendor Catalog';
                Enabled = ESACC_C1900430206_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item/Vendor Catalog";
                Visible = ESACC_C1900430206_Visible;
            }
            action("Inventory - Cost Variance")
            {
                Caption = 'Inventory - Cost Variance';
                Enabled = ESACC_C1900730006_Enabled;
                Image = ItemCosts;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Cost Variance";
                Visible = ESACC_C1900730006_Visible;
            }
            action("Phys. Inventory List")
            {
                Caption = 'Phys. Inventory List';
                Enabled = ESACC_C1907644006_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Phys. Inventory List";
                Visible = ESACC_C1907644006_Visible;
            }
            action("Inventory Valuation")
            {
                Caption = 'Inventory Valuation';
                Enabled = ESACC_C1906316306_Enabled;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory Valuation";
                Visible = ESACC_C1906316306_Visible;
            }
            action("Nonstock Item Sales")
            {
                Caption = 'Nonstock Item Sales';
                Enabled = ESACC_C1907253406_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Nonstock Item Sales";
                Visible = ESACC_C1907253406_Visible;
            }
            action("Item Substitutions")
            {
                Caption = 'Item Substitutions';
                Enabled = ESACC_C1905753506_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Substitutions";
                Visible = ESACC_C1905753506_Visible;
            }
            action("Invt. Valuation - Cost Spec.")
            {
                Caption = 'Invt. Valuation - Cost Spec.';
                Enabled = ESACC_C1904299906_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Invt. Valuation - Cost Spec.";
                Visible = ESACC_C1904299906_Visible;
            }
            action("Inventory Valuation - WIP")
            {
                Caption = 'Inventory Valuation - WIP';
                Enabled = ESACC_C1907928706_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory Valuation - WIP";
                Visible = ESACC_C1907928706_Visible;
            }
            action("Item Register - Value")
            {
                Caption = 'Item Register - Value';
                Enabled = ESACC_C1902962906_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Register - Value";
                Visible = ESACC_C1902962906_Visible;
            }
            action("Item Charges - Specification")
            {
                Caption = 'Item Charges - Specification';
                Enabled = ESACC_C1900461506_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Charges - Specification";
                Visible = ESACC_C1900461506_Visible;
            }
            action("Item Age Composition - Qty.")
            {
                Caption = 'Item Age Composition - Qty.';
                Enabled = ESACC_C1900111206_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Age Composition - Qty.";
                Visible = ESACC_C1900111206_Visible;
            }
            action("Item Age Composition - Value")
            {
                Caption = 'Item Age Composition - Value';
                Enabled = ESACC_C1903496006_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Age Composition - Value";
                Visible = ESACC_C1903496006_Visible;
            }
            action("Item Expiration - Quantity")
            {
                Caption = 'Item Expiration - Quantity';
                Enabled = ESACC_C1906747006_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Expiration - Quantity";
                Visible = ESACC_C1906747006_Visible;
            }
            action("Cost Shares Breakdown")
            {
                Caption = 'Cost Shares Breakdown';
                Enabled = ESACC_C1905889606_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Cost Shares Breakdown";
                Visible = ESACC_C1905889606_Visible;
            }
            action("Detailed Calculation")
            {
                Caption = 'Detailed Calculation';
                Enabled = ESACC_C1901374406_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Detailed Calculation";
                Visible = ESACC_C1901374406_Visible;
            }
            action("Rolled-up Cost Shares")
            {
                Caption = 'Rolled-up Cost Shares';
                Enabled = ESACC_C1900812706_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Rolled-up Cost Shares";
                Visible = ESACC_C1900812706_Visible;
            }
            action("Single-Level Cost Shares")
            {
                Caption = 'Single-Level Cost Shares';
                Enabled = ESACC_C1901316306_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Single-level Cost Shares";
                Visible = ESACC_C1901316306_Visible;
            }
            action("Where-Used (Top Level)")
            {
                Caption = 'Where-Used (Top Level)';
                Enabled = ESACC_C1902353206_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Where-Used (Top Level)";
                Visible = ESACC_C1902353206_Visible;
            }
            action("Quantity Explosion of BOM")
            {
                Caption = 'Quantity Explosion of BOM';
                Enabled = ESACC_C1907778006_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Quantity Explosion of BOM";
                Visible = ESACC_C1907778006_Visible;
            }
            action("Compare List")
            {
                Caption = 'Compare List';
                Enabled = ESACC_C1907846806_Enabled;
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Compare List";
                Visible = ESACC_C1907846806_Visible;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
    begin
        SetSocialListeningFactboxVisibility;

        CRMIsCoupledToRecord :=
          CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId) and CRMIntegrationEnabled;

        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);

        // >> CCDMS
        UpdateDocumentBox;
        // << CCDMS
    end;

    trigger OnAfterGetRecord()
    begin
        SetSocialListeningFactboxVisibility;
        DescriptionIndent := 0;
        // >> #PXW16.00:106
        Rec.ShowShortcutMfgDimCode(ShortcutMfgDimCode);
        // << #PXW16.00:106
        NoOnFormat;
        DescriptionOnFormat;
    end;

    trigger OnOpenPage()
    var
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
    begin
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
        // >> PR01
        AMGranuleEnabled := JobsSetup.GranuleCheckPermission(6, 2);
        // << PR01
        ;
        ESACC_EasySecurity(true);
    end;

    var
        ESACC_ESFLADSMgt: Codeunit "ES FLADS Management";
        [InDataSet]
        ESACC_C5_Visible: Boolean;
        [InDataSet]
        ESACC_C5_Enabled: Boolean;
        [InDataSet]
        ESACC_C7_Visible: Boolean;
        [InDataSet]
        ESACC_C7_Enabled: Boolean;
        [InDataSet]
        ESACC_C11_Visible: Boolean;
        [InDataSet]
        ESACC_C11_Enabled: Boolean;
        [InDataSet]
        ESACC_C13_Visible: Boolean;
        [InDataSet]
        ESACC_C13_Enabled: Boolean;
        [InDataSet]
        ESACC_C14_Visible: Boolean;
        [InDataSet]
        ESACC_C14_Enabled: Boolean;
        [InDataSet]
        ESACC_C15_Visible: Boolean;
        [InDataSet]
        ESACC_C15_Enabled: Boolean;
        [InDataSet]
        ESACC_C16_Visible: Boolean;
        [InDataSet]
        ESACC_C16_Enabled: Boolean;
        [InDataSet]
        ESACC_C17_Visible: Boolean;
        [InDataSet]
        ESACC_C17_Enabled: Boolean;
        [InDataSet]
        ESACC_C18_Visible: Boolean;
        [InDataSet]
        ESACC_C18_Enabled: Boolean;
        [InDataSet]
        ESACC_C19_Visible: Boolean;
        [InDataSet]
        ESACC_C19_Enabled: Boolean;
        [InDataSet]
        ESACC_C20_Visible: Boolean;
        [InDataSet]
        ESACC_C20_Enabled: Boolean;
        [InDataSet]
        ESACC_C21_Visible: Boolean;
        [InDataSet]
        ESACC_C21_Enabled: Boolean;
        [InDataSet]
        ESACC_C22_Visible: Boolean;
        [InDataSet]
        ESACC_C22_Enabled: Boolean;
        [InDataSet]
        ESACC_C23_Visible: Boolean;
        [InDataSet]
        ESACC_C23_Enabled: Boolean;
        [InDataSet]
        ESACC_C24_Visible: Boolean;
        [InDataSet]
        ESACC_C24_Enabled: Boolean;
        [InDataSet]
        ESACC_C25_Visible: Boolean;
        [InDataSet]
        ESACC_C25_Enabled: Boolean;
        [InDataSet]
        ESACC_C27_Visible: Boolean;
        [InDataSet]
        ESACC_C27_Enabled: Boolean;
        [InDataSet]
        ESACC_C28_Visible: Boolean;
        [InDataSet]
        ESACC_C28_Enabled: Boolean;
        [InDataSet]
        ESACC_C29_Visible: Boolean;
        [InDataSet]
        ESACC_C29_Enabled: Boolean;
        [InDataSet]
        ESACC_C30_Visible: Boolean;
        [InDataSet]
        ESACC_C30_Enabled: Boolean;
        [InDataSet]
        ESACC_C32_Visible: Boolean;
        [InDataSet]
        ESACC_C32_Enabled: Boolean;
        [InDataSet]
        ESACC_C34_Visible: Boolean;
        [InDataSet]
        ESACC_C34_Enabled: Boolean;
        [InDataSet]
        ESACC_C36_Visible: Boolean;
        [InDataSet]
        ESACC_C36_Enabled: Boolean;
        [InDataSet]
        ESACC_C37_Visible: Boolean;
        [InDataSet]
        ESACC_C37_Enabled: Boolean;
        [InDataSet]
        ESACC_C39_Visible: Boolean;
        [InDataSet]
        ESACC_C39_Enabled: Boolean;
        [InDataSet]
        ESACC_C40_Visible: Boolean;
        [InDataSet]
        ESACC_C40_Enabled: Boolean;
        [InDataSet]
        ESACC_C42_Visible: Boolean;
        [InDataSet]
        ESACC_C42_Enabled: Boolean;
        [InDataSet]
        ESACC_C44_Visible: Boolean;
        [InDataSet]
        ESACC_C44_Enabled: Boolean;
        [InDataSet]
        ESACC_C46_Visible: Boolean;
        [InDataSet]
        ESACC_C46_Enabled: Boolean;
        [InDataSet]
        ESACC_C47_Visible: Boolean;
        [InDataSet]
        ESACC_C47_Enabled: Boolean;
        [InDataSet]
        ESACC_C48_Visible: Boolean;
        [InDataSet]
        ESACC_C48_Enabled: Boolean;
        [InDataSet]
        ESACC_C50_Visible: Boolean;
        [InDataSet]
        ESACC_C50_Enabled: Boolean;
        [InDataSet]
        ESACC_C52_Visible: Boolean;
        [InDataSet]
        ESACC_C52_Enabled: Boolean;
        [InDataSet]
        ESACC_C66_Visible: Boolean;
        [InDataSet]
        ESACC_C66_Enabled: Boolean;
        [InDataSet]
        ESACC_C68_Visible: Boolean;
        [InDataSet]
        ESACC_C68_Enabled: Boolean;
        [InDataSet]
        ESACC_C72_Visible: Boolean;
        [InDataSet]
        ESACC_C72_Enabled: Boolean;
        [InDataSet]
        ESACC_C73_Visible: Boolean;
        [InDataSet]
        ESACC_C73_Enabled: Boolean;
        [InDataSet]
        ESACC_C75_Visible: Boolean;
        [InDataSet]
        ESACC_C75_Enabled: Boolean;
        [InDataSet]
        ESACC_C76_Visible: Boolean;
        [InDataSet]
        ESACC_C76_Enabled: Boolean;
        [InDataSet]
        ESACC_C77_Visible: Boolean;
        [InDataSet]
        ESACC_C77_Enabled: Boolean;
        [InDataSet]
        ESACC_C78_Visible: Boolean;
        [InDataSet]
        ESACC_C78_Enabled: Boolean;
        [InDataSet]
        ESACC_C80_Visible: Boolean;
        [InDataSet]
        ESACC_C80_Enabled: Boolean;
        [InDataSet]
        ESACC_C81_Visible: Boolean;
        [InDataSet]
        ESACC_C81_Enabled: Boolean;
        [InDataSet]
        ESACC_C82_Visible: Boolean;
        [InDataSet]
        ESACC_C82_Enabled: Boolean;
        [InDataSet]
        ESACC_C86_Visible: Boolean;
        [InDataSet]
        ESACC_C86_Enabled: Boolean;
        [InDataSet]
        ESACC_C87_Visible: Boolean;
        [InDataSet]
        ESACC_C87_Enabled: Boolean;
        [InDataSet]
        ESACC_C93_Visible: Boolean;
        [InDataSet]
        ESACC_C93_Enabled: Boolean;
        [InDataSet]
        ESACC_C103_Visible: Boolean;
        [InDataSet]
        ESACC_C103_Enabled: Boolean;
        [InDataSet]
        ESACC_C105_Visible: Boolean;
        [InDataSet]
        ESACC_C105_Enabled: Boolean;
        [InDataSet]
        ESACC_C108_Visible: Boolean;
        [InDataSet]
        ESACC_C108_Enabled: Boolean;
        [InDataSet]
        ESACC_C109_Visible: Boolean;
        [InDataSet]
        ESACC_C109_Enabled: Boolean;
        [InDataSet]
        ESACC_C111_Visible: Boolean;
        [InDataSet]
        ESACC_C111_Enabled: Boolean;
        [InDataSet]
        ESACC_C114_Visible: Boolean;
        [InDataSet]
        ESACC_C114_Enabled: Boolean;
        [InDataSet]
        ESACC_C115_Visible: Boolean;
        [InDataSet]
        ESACC_C115_Enabled: Boolean;
        [InDataSet]
        ESACC_C116_Visible: Boolean;
        [InDataSet]
        ESACC_C116_Enabled: Boolean;
        [InDataSet]
        ESACC_C118_Visible: Boolean;
        [InDataSet]
        ESACC_C118_Enabled: Boolean;
        [InDataSet]
        ESACC_C121_Visible: Boolean;
        [InDataSet]
        ESACC_C121_Enabled: Boolean;
        [InDataSet]
        ESACC_C124_Visible: Boolean;
        [InDataSet]
        ESACC_C124_Enabled: Boolean;
        [InDataSet]
        ESACC_C125_Visible: Boolean;
        [InDataSet]
        ESACC_C125_Enabled: Boolean;
        [InDataSet]
        ESACC_C184_Visible: Boolean;
        [InDataSet]
        ESACC_C184_Enabled: Boolean;
        [InDataSet]
        ESACC_C500_Visible: Boolean;
        [InDataSet]
        ESACC_C500_Enabled: Boolean;
        [InDataSet]
        ESACC_C5800_Visible: Boolean;
        [InDataSet]
        ESACC_C5800_Enabled: Boolean;
        [InDataSet]
        ESACC_C6500_Visible: Boolean;
        [InDataSet]
        ESACC_C6500_Enabled: Boolean;
        [InDataSet]
        ESACC_C7380_Visible: Boolean;
        [InDataSet]
        ESACC_C7380_Enabled: Boolean;
        [InDataSet]
        ESACC_C1000000_Visible: Boolean;
        [InDataSet]
        ESACC_C1000000_Enabled: Boolean;
        [InDataSet]
        ESACC_C5012400_Visible: Boolean;
        [InDataSet]
        ESACC_C5012400_Enabled: Boolean;
        [InDataSet]
        ESACC_C5012401_Visible: Boolean;
        [InDataSet]
        ESACC_C5012401_Enabled: Boolean;
        [InDataSet]
        ESACC_C5012402_Visible: Boolean;
        [InDataSet]
        ESACC_C5012402_Enabled: Boolean;
        [InDataSet]
        ESACC_C5012403_Visible: Boolean;
        [InDataSet]
        ESACC_C5012403_Enabled: Boolean;
        [InDataSet]
        ESACC_C5012404_Visible: Boolean;
        [InDataSet]
        ESACC_C5012404_Enabled: Boolean;
        [InDataSet]
        ESACC_C5012405_Visible: Boolean;
        [InDataSet]
        ESACC_C5012405_Enabled: Boolean;
        [InDataSet]
        ESACC_C5012406_Visible: Boolean;
        [InDataSet]
        ESACC_C5012406_Enabled: Boolean;
        [InDataSet]
        ESACC_C5012407_Visible: Boolean;
        [InDataSet]
        ESACC_C5012407_Enabled: Boolean;
        [InDataSet]
        ESACC_C5012408_Visible: Boolean;
        [InDataSet]
        ESACC_C5012408_Enabled: Boolean;
        [InDataSet]
        ESACC_C5012409_Visible: Boolean;
        [InDataSet]
        ESACC_C5012409_Enabled: Boolean;
        [InDataSet]
        ESACC_C5012411_Visible: Boolean;
        [InDataSet]
        ESACC_C5012411_Enabled: Boolean;
        [InDataSet]
        ESACC_C5012500_Visible: Boolean;
        [InDataSet]
        ESACC_C5012500_Enabled: Boolean;
        [InDataSet]
        ESACC_C5012650_Visible: Boolean;
        [InDataSet]
        ESACC_C5012650_Enabled: Boolean;
        [InDataSet]
        ESACC_C5012700_Visible: Boolean;
        [InDataSet]
        ESACC_C5012700_Enabled: Boolean;
        [InDataSet]
        ESACC_C5012702_Visible: Boolean;
        [InDataSet]
        ESACC_C5012702_Enabled: Boolean;
        [InDataSet]
        ESACC_C5013400_Visible: Boolean;
        [InDataSet]
        ESACC_C5013400_Enabled: Boolean;
        [InDataSet]
        ESACC_C5013401_Visible: Boolean;
        [InDataSet]
        ESACC_C5013401_Enabled: Boolean;
        [InDataSet]
        ESACC_C5013402_Visible: Boolean;
        [InDataSet]
        ESACC_C5013402_Enabled: Boolean;
        [InDataSet]
        ESACC_C5013404_Visible: Boolean;
        [InDataSet]
        ESACC_C5013404_Enabled: Boolean;
        [InDataSet]
        ESACC_C5013406_Visible: Boolean;
        [InDataSet]
        ESACC_C5013406_Enabled: Boolean;
        [InDataSet]
        ESACC_C5013408_Visible: Boolean;
        [InDataSet]
        ESACC_C5013408_Enabled: Boolean;
        [InDataSet]
        ESACC_C5013410_Visible: Boolean;
        [InDataSet]
        ESACC_C5013410_Enabled: Boolean;
        [InDataSet]
        ESACC_C5013411_Visible: Boolean;
        [InDataSet]
        ESACC_C5013411_Enabled: Boolean;
        [InDataSet]
        ESACC_C5013412_Visible: Boolean;
        [InDataSet]
        ESACC_C5013412_Enabled: Boolean;
        [InDataSet]
        ESACC_C5034551_Visible: Boolean;
        [InDataSet]
        ESACC_C5034551_Enabled: Boolean;
        [InDataSet]
        ESACC_C5034553_Visible: Boolean;
        [InDataSet]
        ESACC_C5034553_Enabled: Boolean;
        [InDataSet]
        ESACC_C5034554_Visible: Boolean;
        [InDataSet]
        ESACC_C5034554_Enabled: Boolean;
        [InDataSet]
        ESACC_C5060600_Visible: Boolean;
        [InDataSet]
        ESACC_C5060600_Enabled: Boolean;
        [InDataSet]
        ESACC_C5072651_Visible: Boolean;
        [InDataSet]
        ESACC_C5072651_Enabled: Boolean;
        [InDataSet]
        ESACC_C5072652_Visible: Boolean;
        [InDataSet]
        ESACC_C5072652_Enabled: Boolean;
        [InDataSet]
        ESACC_C5072653_Visible: Boolean;
        [InDataSet]
        ESACC_C5072653_Enabled: Boolean;
        [InDataSet]
        ESACC_C5072655_Visible: Boolean;
        [InDataSet]
        ESACC_C5072655_Enabled: Boolean;
        [InDataSet]
        ESACC_C5072657_Visible: Boolean;
        [InDataSet]
        ESACC_C5072657_Enabled: Boolean;
        [InDataSet]
        ESACC_C5072660_Visible: Boolean;
        [InDataSet]
        ESACC_C5072660_Enabled: Boolean;
        [InDataSet]
        ESACC_C5103601_Visible: Boolean;
        [InDataSet]
        ESACC_C5103601_Enabled: Boolean;
        [InDataSet]
        ESACC_C5172103_Visible: Boolean;
        [InDataSet]
        ESACC_C5172103_Enabled: Boolean;
        [InDataSet]
        ESACC_C5292333_Visible: Boolean;
        [InDataSet]
        ESACC_C5292333_Enabled: Boolean;
        [InDataSet]
        ESACC_C5292335_Visible: Boolean;
        [InDataSet]
        ESACC_C5292335_Enabled: Boolean;
        [InDataSet]
        ESACC_C5292336_Visible: Boolean;
        [InDataSet]
        ESACC_C5292336_Enabled: Boolean;
        [InDataSet]
        ESACC_C5292337_Visible: Boolean;
        [InDataSet]
        ESACC_C5292337_Enabled: Boolean;
        [InDataSet]
        ESACC_C5292631_Visible: Boolean;
        [InDataSet]
        ESACC_C5292631_Enabled: Boolean;
        [InDataSet]
        ESACC_C5306001_Visible: Boolean;
        [InDataSet]
        ESACC_C5306001_Enabled: Boolean;
        [InDataSet]
        ESACC_C1900111206_Visible: Boolean;
        [InDataSet]
        ESACC_C1900111206_Enabled: Boolean;
        [InDataSet]
        ESACC_C1900128906_Visible: Boolean;
        [InDataSet]
        ESACC_C1900128906_Enabled: Boolean;
        [InDataSet]
        ESACC_C1900210306_Visible: Boolean;
        [InDataSet]
        ESACC_C1900210306_Enabled: Boolean;
        [InDataSet]
        ESACC_C1900430206_Visible: Boolean;
        [InDataSet]
        ESACC_C1900430206_Enabled: Boolean;
        [InDataSet]
        ESACC_C1900461506_Visible: Boolean;
        [InDataSet]
        ESACC_C1900461506_Enabled: Boolean;
        [InDataSet]
        ESACC_C1900730006_Visible: Boolean;
        [InDataSet]
        ESACC_C1900730006_Enabled: Boolean;
        [InDataSet]
        ESACC_C1900762706_Visible: Boolean;
        [InDataSet]
        ESACC_C1900762706_Enabled: Boolean;
        [InDataSet]
        ESACC_C1900805004_Visible: Boolean;
        [InDataSet]
        ESACC_C1900805004_Enabled: Boolean;
        [InDataSet]
        ESACC_C1900812706_Visible: Boolean;
        [InDataSet]
        ESACC_C1900812706_Enabled: Boolean;
        [InDataSet]
        ESACC_C1900869004_Visible: Boolean;
        [InDataSet]
        ESACC_C1900869004_Enabled: Boolean;
        [InDataSet]
        ESACC_C1900907306_Visible: Boolean;
        [InDataSet]
        ESACC_C1900907306_Enabled: Boolean;
        [InDataSet]
        ESACC_C1901091106_Visible: Boolean;
        [InDataSet]
        ESACC_C1901091106_Enabled: Boolean;
        [InDataSet]
        ESACC_C1901240604_Visible: Boolean;
        [InDataSet]
        ESACC_C1901240604_Enabled: Boolean;
        [InDataSet]
        ESACC_C1901254106_Visible: Boolean;
        [InDataSet]
        ESACC_C1901254106_Enabled: Boolean;
        [InDataSet]
        ESACC_C1901316306_Visible: Boolean;
        [InDataSet]
        ESACC_C1901316306_Enabled: Boolean;
        [InDataSet]
        ESACC_C1901374406_Visible: Boolean;
        [InDataSet]
        ESACC_C1901374406_Enabled: Boolean;
        [InDataSet]
        ESACC_C1902353206_Visible: Boolean;
        [InDataSet]
        ESACC_C1902353206_Enabled: Boolean;
        [InDataSet]
        ESACC_C1902532604_Visible: Boolean;
        [InDataSet]
        ESACC_C1902532604_Enabled: Boolean;
        [InDataSet]
        ESACC_C1902962906_Visible: Boolean;
        [InDataSet]
        ESACC_C1902962906_Enabled: Boolean;
        [InDataSet]
        ESACC_C1903262806_Visible: Boolean;
        [InDataSet]
        ESACC_C1903262806_Enabled: Boolean;
        [InDataSet]
        ESACC_C1903496006_Visible: Boolean;
        [InDataSet]
        ESACC_C1903496006_Enabled: Boolean;
        [InDataSet]
        ESACC_C1904034006_Visible: Boolean;
        [InDataSet]
        ESACC_C1904034006_Enabled: Boolean;
        [InDataSet]
        ESACC_C1904068306_Visible: Boolean;
        [InDataSet]
        ESACC_C1904068306_Enabled: Boolean;
        [InDataSet]
        ESACC_C1904299906_Visible: Boolean;
        [InDataSet]
        ESACC_C1904299906_Enabled: Boolean;
        [InDataSet]
        ESACC_C1904344904_Visible: Boolean;
        [InDataSet]
        ESACC_C1904344904_Enabled: Boolean;
        [InDataSet]
        ESACC_C1904739806_Visible: Boolean;
        [InDataSet]
        ESACC_C1904739806_Enabled: Boolean;
        [InDataSet]
        ESACC_C1905370404_Visible: Boolean;
        [InDataSet]
        ESACC_C1905370404_Enabled: Boolean;
        [InDataSet]
        ESACC_C1905572506_Visible: Boolean;
        [InDataSet]
        ESACC_C1905572506_Enabled: Boolean;
        [InDataSet]
        ESACC_C1905753506_Visible: Boolean;
        [InDataSet]
        ESACC_C1905753506_Enabled: Boolean;
        [InDataSet]
        ESACC_C1905889606_Visible: Boolean;
        [InDataSet]
        ESACC_C1905889606_Enabled: Boolean;
        [InDataSet]
        ESACC_C1906101206_Visible: Boolean;
        [InDataSet]
        ESACC_C1906101206_Enabled: Boolean;
        [InDataSet]
        ESACC_C1906212206_Visible: Boolean;
        [InDataSet]
        ESACC_C1906212206_Enabled: Boolean;
        [InDataSet]
        ESACC_C1906231806_Visible: Boolean;
        [InDataSet]
        ESACC_C1906231806_Enabled: Boolean;
        [InDataSet]
        ESACC_C1906316306_Visible: Boolean;
        [InDataSet]
        ESACC_C1906316306_Enabled: Boolean;
        [InDataSet]
        ESACC_C1906716204_Visible: Boolean;
        [InDataSet]
        ESACC_C1906716204_Enabled: Boolean;
        [InDataSet]
        ESACC_C1906747006_Visible: Boolean;
        [InDataSet]
        ESACC_C1906747006_Enabled: Boolean;
        [InDataSet]
        ESACC_C1907108104_Visible: Boolean;
        [InDataSet]
        ESACC_C1907108104_Enabled: Boolean;
        [InDataSet]
        ESACC_C1907253406_Visible: Boolean;
        [InDataSet]
        ESACC_C1907253406_Enabled: Boolean;
        [InDataSet]
        ESACC_C1907629906_Visible: Boolean;
        [InDataSet]
        ESACC_C1907629906_Enabled: Boolean;
        [InDataSet]
        ESACC_C1907644006_Visible: Boolean;
        [InDataSet]
        ESACC_C1907644006_Enabled: Boolean;
        [InDataSet]
        ESACC_C1907778006_Visible: Boolean;
        [InDataSet]
        ESACC_C1907778006_Enabled: Boolean;
        [InDataSet]
        ESACC_C1907846806_Visible: Boolean;
        [InDataSet]
        ESACC_C1907846806_Enabled: Boolean;
        [InDataSet]
        ESACC_C1907928706_Visible: Boolean;
        [InDataSet]
        ESACC_C1907928706_Enabled: Boolean;
        [InDataSet]
        ESACC_C1907930606_Visible: Boolean;
        [InDataSet]
        ESACC_C1907930606_Enabled: Boolean;
        [InDataSet]
        ESACC_F1_Visible: Boolean;
        [InDataSet]
        ESACC_F1_Editable: Boolean;
        [InDataSet]
        ESACC_F1_HideValue: Boolean;
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
        ESACC_F6_Visible: Boolean;
        [InDataSet]
        ESACC_F6_HideValue: Boolean;
        [InDataSet]
        ESACC_F8_Visible: Boolean;
        [InDataSet]
        ESACC_F8_Editable: Boolean;
        [InDataSet]
        ESACC_F8_HideValue: Boolean;
        [InDataSet]
        ESACC_F11_Visible: Boolean;
        [InDataSet]
        ESACC_F11_Editable: Boolean;
        [InDataSet]
        ESACC_F11_HideValue: Boolean;
        [InDataSet]
        ESACC_F12_Visible: Boolean;
        [InDataSet]
        ESACC_F12_Editable: Boolean;
        [InDataSet]
        ESACC_F12_HideValue: Boolean;
        [InDataSet]
        ESACC_F14_Visible: Boolean;
        [InDataSet]
        ESACC_F14_Editable: Boolean;
        [InDataSet]
        ESACC_F14_HideValue: Boolean;
        [InDataSet]
        ESACC_F18_Visible: Boolean;
        [InDataSet]
        ESACC_F18_Editable: Boolean;
        [InDataSet]
        ESACC_F18_HideValue: Boolean;
        [InDataSet]
        ESACC_F19_Visible: Boolean;
        [InDataSet]
        ESACC_F19_Editable: Boolean;
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
        ESACC_F28_Visible: Boolean;
        [InDataSet]
        ESACC_F28_Editable: Boolean;
        [InDataSet]
        ESACC_F28_HideValue: Boolean;
        [InDataSet]
        ESACC_F29_Visible: Boolean;
        [InDataSet]
        ESACC_F29_Editable: Boolean;
        [InDataSet]
        ESACC_F29_HideValue: Boolean;
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
        ESACC_F47_Visible: Boolean;
        [InDataSet]
        ESACC_F47_Editable: Boolean;
        [InDataSet]
        ESACC_F47_HideValue: Boolean;
        [InDataSet]
        ESACC_F54_Visible: Boolean;
        [InDataSet]
        ESACC_F54_Editable: Boolean;
        [InDataSet]
        ESACC_F54_HideValue: Boolean;
        [InDataSet]
        ESACC_F62_Visible: Boolean;
        [InDataSet]
        ESACC_F62_Editable: Boolean;
        [InDataSet]
        ESACC_F62_HideValue: Boolean;
        [InDataSet]
        ESACC_F91_Visible: Boolean;
        [InDataSet]
        ESACC_F91_Editable: Boolean;
        [InDataSet]
        ESACC_F91_HideValue: Boolean;
        [InDataSet]
        ESACC_F99_Visible: Boolean;
        [InDataSet]
        ESACC_F99_Editable: Boolean;
        [InDataSet]
        ESACC_F99_HideValue: Boolean;
        [InDataSet]
        ESACC_F910_Visible: Boolean;
        [InDataSet]
        ESACC_F910_Editable: Boolean;
        [InDataSet]
        ESACC_F910_HideValue: Boolean;
        [InDataSet]
        ESACC_F1700_Visible: Boolean;
        [InDataSet]
        ESACC_F1700_Editable: Boolean;
        [InDataSet]
        ESACC_F1700_HideValue: Boolean;
        [InDataSet]
        ESACC_F5417_Visible: Boolean;
        [InDataSet]
        ESACC_F5417_Editable: Boolean;
        [InDataSet]
        ESACC_F5417_HideValue: Boolean;
        [InDataSet]
        ESACC_F5419_Visible: Boolean;
        [InDataSet]
        ESACC_F5419_Editable: Boolean;
        [InDataSet]
        ESACC_F5419_HideValue: Boolean;
        [InDataSet]
        ESACC_F5425_Visible: Boolean;
        [InDataSet]
        ESACC_F5425_Editable: Boolean;
        [InDataSet]
        ESACC_F5425_HideValue: Boolean;
        [InDataSet]
        ESACC_F5426_Visible: Boolean;
        [InDataSet]
        ESACC_F5426_Editable: Boolean;
        [InDataSet]
        ESACC_F5426_HideValue: Boolean;
        [InDataSet]
        ESACC_F5442_Visible: Boolean;
        [InDataSet]
        ESACC_F5442_Editable: Boolean;
        [InDataSet]
        ESACC_F5442_HideValue: Boolean;
        [InDataSet]
        ESACC_F5700_Visible: Boolean;
        [InDataSet]
        ESACC_F5700_HideValue: Boolean;
        [InDataSet]
        ESACC_F5702_Visible: Boolean;
        [InDataSet]
        ESACC_F5702_Editable: Boolean;
        [InDataSet]
        ESACC_F5702_HideValue: Boolean;
        [InDataSet]
        ESACC_F5703_Visible: Boolean;
        [InDataSet]
        ESACC_F5703_Editable: Boolean;
        [InDataSet]
        ESACC_F5703_HideValue: Boolean;
        [InDataSet]
        ESACC_F5704_Visible: Boolean;
        [InDataSet]
        ESACC_F5704_Editable: Boolean;
        [InDataSet]
        ESACC_F5704_HideValue: Boolean;
        [InDataSet]
        ESACC_F5706_Visible: Boolean;
        [InDataSet]
        ESACC_F5706_HideValue: Boolean;
        [InDataSet]
        ESACC_F6500_Visible: Boolean;
        [InDataSet]
        ESACC_F6500_Editable: Boolean;
        [InDataSet]
        ESACC_F6500_HideValue: Boolean;
        [InDataSet]
        ESACC_F50004_Visible: Boolean;
        [InDataSet]
        ESACC_F50004_Editable: Boolean;
        [InDataSet]
        ESACC_F50004_HideValue: Boolean;
        [InDataSet]
        ESACC_F50301_Visible: Boolean;
        [InDataSet]
        ESACC_F50301_Editable: Boolean;
        [InDataSet]
        ESACC_F50301_HideValue: Boolean;
        [InDataSet]
        ESACC_F50302_Visible: Boolean;
        [InDataSet]
        ESACC_F50302_Editable: Boolean;
        [InDataSet]
        ESACC_F50302_HideValue: Boolean;
        [InDataSet]
        ESACC_F50303_Visible: Boolean;
        [InDataSet]
        ESACC_F50303_Editable: Boolean;
        [InDataSet]
        ESACC_F50303_HideValue: Boolean;
        [InDataSet]
        ESACC_F50313_Visible: Boolean;
        [InDataSet]
        ESACC_F50313_Editable: Boolean;
        [InDataSet]
        ESACC_F50313_HideValue: Boolean;
        [InDataSet]
        ESACC_F5012403_Visible: Boolean;
        [InDataSet]
        ESACC_F5012403_Editable: Boolean;
        [InDataSet]
        ESACC_F5012403_HideValue: Boolean;
        [InDataSet]
        ESACC_F5012702_Visible: Boolean;
        [InDataSet]
        ESACC_F5012702_Editable: Boolean;
        [InDataSet]
        ESACC_F5012702_HideValue: Boolean;
        [InDataSet]
        ESACC_F5012703_Visible: Boolean;
        [InDataSet]
        ESACC_F5012703_Editable: Boolean;
        [InDataSet]
        ESACC_F5012703_HideValue: Boolean;
        [InDataSet]
        ESACC_F5013000_Visible: Boolean;
        [InDataSet]
        ESACC_F5013000_Editable: Boolean;
        [InDataSet]
        ESACC_F5013000_HideValue: Boolean;
        [InDataSet]
        ESACC_F5013010_Visible: Boolean;
        [InDataSet]
        ESACC_F5013010_Editable: Boolean;
        [InDataSet]
        ESACC_F5013010_HideValue: Boolean;
        [InDataSet]
        ESACC_F5013020_Visible: Boolean;
        [InDataSet]
        ESACC_F5013020_Editable: Boolean;
        [InDataSet]
        ESACC_F5013020_HideValue: Boolean;
        [InDataSet]
        ESACC_F99000750_Visible: Boolean;
        [InDataSet]
        ESACC_F99000750_Editable: Boolean;
        [InDataSet]
        ESACC_F99000750_HideValue: Boolean;
        [InDataSet]
        ESACC_F99000751_Visible: Boolean;
        [InDataSet]
        ESACC_F99000751_Editable: Boolean;
        [InDataSet]
        ESACC_F99000751_HideValue: Boolean;
        [InDataSet]
        ESACC_F99000757_Visible: Boolean;
        [InDataSet]
        ESACC_F99000757_Editable: Boolean;
        [InDataSet]
        ESACC_F99000757_HideValue: Boolean;
        SkilledResourceList: Page "Skilled Resource List";
        CalculateStdCost: Codeunit "Calculate Standard Cost";
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
        Text11500: Label 'Do you want to edit the new item?';
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        [InDataSet]
        SocialListeningSetupVisible: Boolean;
        [InDataSet]
        SocialListeningVisible: Boolean;
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
        OpenApprovalEntriesExist: Boolean;
        "--- PR ---": Integer;
        ComponentGroupsText: Text[1000];
        JobsSetup: Record "Jobs Setup";
        AMGranuleEnabled: Boolean;
        "---- PM Vars ----": Integer;
        LicPermission: Record "License Permission";
        TradingUnitManagement: Codeunit "Trading Unit Management";
        "---- PX Variables ----": Integer;
        ShortcutMfgDimCode: array[8] of Code[20];
        [InDataSet]
        "No.Emphasize": Boolean;
        [InDataSet]
        DescriptionEmphasize: Boolean;
        [InDataSet]
        DescriptionIndent: Integer;
        "--- CCDMS Vars. ---": Integer;
        DocumentBoxVisible: Boolean;

    local procedure ESACC_EasySecurity(OpenObject: Boolean)
    var
        SetFilters: Codeunit "ES FLADS Set Filters";
        TempBoolean: Boolean;
    begin
        if OpenObject then begin
            SetFilters.Filter27(Rec, 8, 31);

            TempBoolean := CurrPage.Editable;
            if ESACC_ESFLADSMgt.PageGeneral(27, 31, TempBoolean) then
                CurrPage.Editable := TempBoolean;
        end;

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5,
          ESACC_C5_Visible, ESACC_C5_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 7,
          ESACC_C7_Visible, ESACC_C7_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 11,
          ESACC_C11_Visible, ESACC_C11_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 13,
          ESACC_C13_Visible, ESACC_C13_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 14,
          ESACC_C14_Visible, ESACC_C14_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 15,
          ESACC_C15_Visible, ESACC_C15_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 16,
          ESACC_C16_Visible, ESACC_C16_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 17,
          ESACC_C17_Visible, ESACC_C17_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 18,
          ESACC_C18_Visible, ESACC_C18_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 19,
          ESACC_C19_Visible, ESACC_C19_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 20,
          ESACC_C20_Visible, ESACC_C20_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 21,
          ESACC_C21_Visible, ESACC_C21_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 22,
          ESACC_C22_Visible, ESACC_C22_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 23,
          ESACC_C23_Visible, ESACC_C23_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 24,
          ESACC_C24_Visible, ESACC_C24_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 25,
          ESACC_C25_Visible, ESACC_C25_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 27,
          ESACC_C27_Visible, ESACC_C27_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 28,
          ESACC_C28_Visible, ESACC_C28_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 29,
          ESACC_C29_Visible, ESACC_C29_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 30,
          ESACC_C30_Visible, ESACC_C30_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 32,
          ESACC_C32_Visible, ESACC_C32_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 34,
          ESACC_C34_Visible, ESACC_C34_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 36,
          ESACC_C36_Visible, ESACC_C36_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 37,
          ESACC_C37_Visible, ESACC_C37_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 39,
          ESACC_C39_Visible, ESACC_C39_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 40,
          ESACC_C40_Visible, ESACC_C40_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 42,
          ESACC_C42_Visible, ESACC_C42_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 44,
          ESACC_C44_Visible, ESACC_C44_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 46,
          ESACC_C46_Visible, ESACC_C46_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 47,
          ESACC_C47_Visible, ESACC_C47_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 48,
          ESACC_C48_Visible, ESACC_C48_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 50,
          ESACC_C50_Visible, ESACC_C50_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 52,
          ESACC_C52_Visible, ESACC_C52_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 66,
          ESACC_C66_Visible, ESACC_C66_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 68,
          ESACC_C68_Visible, ESACC_C68_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 72,
          ESACC_C72_Visible, ESACC_C72_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 73,
          ESACC_C73_Visible, ESACC_C73_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 75,
          ESACC_C75_Visible, ESACC_C75_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 76,
          ESACC_C76_Visible, ESACC_C76_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 77,
          ESACC_C77_Visible, ESACC_C77_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 78,
          ESACC_C78_Visible, ESACC_C78_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 80,
          ESACC_C80_Visible, ESACC_C80_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 81,
          ESACC_C81_Visible, ESACC_C81_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 82,
          ESACC_C82_Visible, ESACC_C82_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 86,
          ESACC_C86_Visible, ESACC_C86_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 87,
          ESACC_C87_Visible, ESACC_C87_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 93,
          ESACC_C93_Visible, ESACC_C93_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 103,
          ESACC_C103_Visible, ESACC_C103_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 105,
          ESACC_C105_Visible, ESACC_C105_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 108,
          ESACC_C108_Visible, ESACC_C108_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 109,
          ESACC_C109_Visible, ESACC_C109_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 111,
          ESACC_C111_Visible, ESACC_C111_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 114,
          ESACC_C114_Visible, ESACC_C114_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 115,
          ESACC_C115_Visible, ESACC_C115_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 116,
          ESACC_C116_Visible, ESACC_C116_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 118,
          ESACC_C118_Visible, ESACC_C118_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 121,
          ESACC_C121_Visible, ESACC_C121_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 124,
          ESACC_C124_Visible, ESACC_C124_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 125,
          ESACC_C125_Visible, ESACC_C125_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 184,
          ESACC_C184_Visible, ESACC_C184_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 500,
          ESACC_C500_Visible, ESACC_C500_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5800,
          ESACC_C5800_Visible, ESACC_C5800_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 6500,
          ESACC_C6500_Visible, ESACC_C6500_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 7380,
          ESACC_C7380_Visible, ESACC_C7380_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1000000,
          ESACC_C1000000_Visible, ESACC_C1000000_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5012400,
          ESACC_C5012400_Visible, ESACC_C5012400_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5012401,
          ESACC_C5012401_Visible, ESACC_C5012401_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5012402,
          ESACC_C5012402_Visible, ESACC_C5012402_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5012403,
          ESACC_C5012403_Visible, ESACC_C5012403_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5012404,
          ESACC_C5012404_Visible, ESACC_C5012404_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5012405,
          ESACC_C5012405_Visible, ESACC_C5012405_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5012406,
          ESACC_C5012406_Visible, ESACC_C5012406_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5012407,
          ESACC_C5012407_Visible, ESACC_C5012407_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5012408,
          ESACC_C5012408_Visible, ESACC_C5012408_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5012409,
          ESACC_C5012409_Visible, ESACC_C5012409_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5012411,
          ESACC_C5012411_Visible, ESACC_C5012411_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5012500,
          ESACC_C5012500_Visible, ESACC_C5012500_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5012650,
          ESACC_C5012650_Visible, ESACC_C5012650_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5012700,
          ESACC_C5012700_Visible, ESACC_C5012700_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5012702,
          ESACC_C5012702_Visible, ESACC_C5012702_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5013400,
          ESACC_C5013400_Visible, ESACC_C5013400_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5013401,
          ESACC_C5013401_Visible, ESACC_C5013401_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5013402,
          ESACC_C5013402_Visible, ESACC_C5013402_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5013404,
          ESACC_C5013404_Visible, ESACC_C5013404_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5013406,
          ESACC_C5013406_Visible, ESACC_C5013406_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5013408,
          ESACC_C5013408_Visible, ESACC_C5013408_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5013410,
          ESACC_C5013410_Visible, ESACC_C5013410_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5013411,
          ESACC_C5013411_Visible, ESACC_C5013411_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5013412,
          ESACC_C5013412_Visible, ESACC_C5013412_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5034551,
          ESACC_C5034551_Visible, ESACC_C5034551_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5034553,
          ESACC_C5034553_Visible, ESACC_C5034553_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5034554,
          ESACC_C5034554_Visible, ESACC_C5034554_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5060600,
          ESACC_C5060600_Visible, ESACC_C5060600_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5072651,
          ESACC_C5072651_Visible, ESACC_C5072651_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5072652,
          ESACC_C5072652_Visible, ESACC_C5072652_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5072653,
          ESACC_C5072653_Visible, ESACC_C5072653_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5072655,
          ESACC_C5072655_Visible, ESACC_C5072655_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5072657,
          ESACC_C5072657_Visible, ESACC_C5072657_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5072660,
          ESACC_C5072660_Visible, ESACC_C5072660_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5103601,
          ESACC_C5103601_Visible, ESACC_C5103601_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5172103,
          ESACC_C5172103_Visible, ESACC_C5172103_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5292333,
          ESACC_C5292333_Visible, ESACC_C5292333_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5292335,
          ESACC_C5292335_Visible, ESACC_C5292335_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5292336,
          ESACC_C5292336_Visible, ESACC_C5292336_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5292337,
          ESACC_C5292337_Visible, ESACC_C5292337_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5292631,
          ESACC_C5292631_Visible, ESACC_C5292631_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 5306001,
          ESACC_C5306001_Visible, ESACC_C5306001_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1900111206,
          ESACC_C1900111206_Visible, ESACC_C1900111206_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1900128906,
          ESACC_C1900128906_Visible, ESACC_C1900128906_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1900210306,
          ESACC_C1900210306_Visible, ESACC_C1900210306_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1900430206,
          ESACC_C1900430206_Visible, ESACC_C1900430206_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1900461506,
          ESACC_C1900461506_Visible, ESACC_C1900461506_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1900730006,
          ESACC_C1900730006_Visible, ESACC_C1900730006_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1900762706,
          ESACC_C1900762706_Visible, ESACC_C1900762706_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1900805004,
          ESACC_C1900805004_Visible, ESACC_C1900805004_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1900812706,
          ESACC_C1900812706_Visible, ESACC_C1900812706_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1900869004,
          ESACC_C1900869004_Visible, ESACC_C1900869004_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1900907306,
          ESACC_C1900907306_Visible, ESACC_C1900907306_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1901091106,
          ESACC_C1901091106_Visible, ESACC_C1901091106_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1901240604,
          ESACC_C1901240604_Visible, ESACC_C1901240604_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1901254106,
          ESACC_C1901254106_Visible, ESACC_C1901254106_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1901316306,
          ESACC_C1901316306_Visible, ESACC_C1901316306_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1901374406,
          ESACC_C1901374406_Visible, ESACC_C1901374406_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1902353206,
          ESACC_C1902353206_Visible, ESACC_C1902353206_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1902532604,
          ESACC_C1902532604_Visible, ESACC_C1902532604_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1902962906,
          ESACC_C1902962906_Visible, ESACC_C1902962906_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1903262806,
          ESACC_C1903262806_Visible, ESACC_C1903262806_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1903496006,
          ESACC_C1903496006_Visible, ESACC_C1903496006_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1904034006,
          ESACC_C1904034006_Visible, ESACC_C1904034006_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1904068306,
          ESACC_C1904068306_Visible, ESACC_C1904068306_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1904299906,
          ESACC_C1904299906_Visible, ESACC_C1904299906_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1904344904,
          ESACC_C1904344904_Visible, ESACC_C1904344904_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1904739806,
          ESACC_C1904739806_Visible, ESACC_C1904739806_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1905370404,
          ESACC_C1905370404_Visible, ESACC_C1905370404_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1905572506,
          ESACC_C1905572506_Visible, ESACC_C1905572506_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1905753506,
          ESACC_C1905753506_Visible, ESACC_C1905753506_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1905889606,
          ESACC_C1905889606_Visible, ESACC_C1905889606_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1906101206,
          ESACC_C1906101206_Visible, ESACC_C1906101206_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1906212206,
          ESACC_C1906212206_Visible, ESACC_C1906212206_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1906231806,
          ESACC_C1906231806_Visible, ESACC_C1906231806_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1906316306,
          ESACC_C1906316306_Visible, ESACC_C1906316306_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1906716204,
          ESACC_C1906716204_Visible, ESACC_C1906716204_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1906747006,
          ESACC_C1906747006_Visible, ESACC_C1906747006_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1907108104,
          ESACC_C1907108104_Visible, ESACC_C1907108104_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1907253406,
          ESACC_C1907253406_Visible, ESACC_C1907253406_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1907629906,
          ESACC_C1907629906_Visible, ESACC_C1907629906_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1907644006,
          ESACC_C1907644006_Visible, ESACC_C1907644006_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1907778006,
          ESACC_C1907778006_Visible, ESACC_C1907778006_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1907846806,
          ESACC_C1907846806_Visible, ESACC_C1907846806_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1907928706,
          ESACC_C1907928706_Visible, ESACC_C1907928706_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 1, 1907930606,
          ESACC_C1907930606_Visible, ESACC_C1907930606_Enabled, TempBoolean);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 1,
          ESACC_F1_Visible, ESACC_F1_Editable, ESACC_F1_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 3,
          ESACC_F3_Visible, ESACC_F3_Editable, ESACC_F3_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 4,
          ESACC_F4_Visible, ESACC_F4_Editable, ESACC_F4_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5,
          ESACC_F5_Visible, ESACC_F5_Editable, ESACC_F5_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 6,
          ESACC_F6_Visible, TempBoolean, ESACC_F6_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 8,
          ESACC_F8_Visible, ESACC_F8_Editable, ESACC_F8_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 11,
          ESACC_F11_Visible, ESACC_F11_Editable, ESACC_F11_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 12,
          ESACC_F12_Visible, ESACC_F12_Editable, ESACC_F12_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 14,
          ESACC_F14_Visible, ESACC_F14_Editable, ESACC_F14_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 18,
          ESACC_F18_Visible, ESACC_F18_Editable, ESACC_F18_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 19,
          ESACC_F19_Visible, ESACC_F19_Editable, ESACC_F19_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 20,
          ESACC_F20_Visible, ESACC_F20_Editable, ESACC_F20_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 21,
          ESACC_F21_Visible, ESACC_F21_Editable, ESACC_F21_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 22,
          ESACC_F22_Visible, ESACC_F22_Editable, ESACC_F22_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 24,
          ESACC_F24_Visible, ESACC_F24_Editable, ESACC_F24_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 25,
          ESACC_F25_Visible, ESACC_F25_Editable, ESACC_F25_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 28,
          ESACC_F28_Visible, ESACC_F28_Editable, ESACC_F28_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 29,
          ESACC_F29_Visible, ESACC_F29_Editable, ESACC_F29_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 31,
          ESACC_F31_Visible, ESACC_F31_Editable, ESACC_F31_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 32,
          ESACC_F32_Visible, ESACC_F32_Editable, ESACC_F32_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 33,
          ESACC_F33_Visible, ESACC_F33_Editable, ESACC_F33_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 47,
          ESACC_F47_Visible, ESACC_F47_Editable, ESACC_F47_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 54,
          ESACC_F54_Visible, ESACC_F54_Editable, ESACC_F54_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 62,
          ESACC_F62_Visible, ESACC_F62_Editable, ESACC_F62_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 91,
          ESACC_F91_Visible, ESACC_F91_Editable, ESACC_F91_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 99,
          ESACC_F99_Visible, ESACC_F99_Editable, ESACC_F99_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 910,
          ESACC_F910_Visible, ESACC_F910_Editable, ESACC_F910_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 1700,
          ESACC_F1700_Visible, ESACC_F1700_Editable, ESACC_F1700_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5417,
          ESACC_F5417_Visible, ESACC_F5417_Editable, ESACC_F5417_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5419,
          ESACC_F5419_Visible, ESACC_F5419_Editable, ESACC_F5419_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5425,
          ESACC_F5425_Visible, ESACC_F5425_Editable, ESACC_F5425_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5426,
          ESACC_F5426_Visible, ESACC_F5426_Editable, ESACC_F5426_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5442,
          ESACC_F5442_Visible, ESACC_F5442_Editable, ESACC_F5442_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5700,
          ESACC_F5700_Visible, TempBoolean, ESACC_F5700_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5702,
          ESACC_F5702_Visible, ESACC_F5702_Editable, ESACC_F5702_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5703,
          ESACC_F5703_Visible, ESACC_F5703_Editable, ESACC_F5703_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5704,
          ESACC_F5704_Visible, ESACC_F5704_Editable, ESACC_F5704_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5706,
          ESACC_F5706_Visible, TempBoolean, ESACC_F5706_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 6500,
          ESACC_F6500_Visible, ESACC_F6500_Editable, ESACC_F6500_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 50004,
          ESACC_F50004_Visible, ESACC_F50004_Editable, ESACC_F50004_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 50301,
          ESACC_F50301_Visible, ESACC_F50301_Editable, ESACC_F50301_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 50302,
          ESACC_F50302_Visible, ESACC_F50302_Editable, ESACC_F50302_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 50303,
          ESACC_F50303_Visible, ESACC_F50303_Editable, ESACC_F50303_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 50313,
          ESACC_F50313_Visible, ESACC_F50313_Editable, ESACC_F50313_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5012403,
          ESACC_F5012403_Visible, ESACC_F5012403_Editable, ESACC_F5012403_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5012702,
          ESACC_F5012702_Visible, ESACC_F5012702_Editable, ESACC_F5012702_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5012703,
          ESACC_F5012703_Visible, ESACC_F5012703_Editable, ESACC_F5012703_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5013000,
          ESACC_F5013000_Visible, ESACC_F5013000_Editable, ESACC_F5013000_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5013010,
          ESACC_F5013010_Visible, ESACC_F5013010_Editable, ESACC_F5013010_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 5013020,
          ESACC_F5013020_Visible, ESACC_F5013020_Editable, ESACC_F5013020_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 99000750,
          ESACC_F99000750_Visible, ESACC_F99000750_Editable, ESACC_F99000750_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 99000751,
          ESACC_F99000751_Visible, ESACC_F99000751_Editable, ESACC_F99000751_HideValue);

        ESACC_ESFLADSMgt.PageControl(
          27, 31, 0, 99000757,
          ESACC_F99000757_Visible, ESACC_F99000757_Editable, ESACC_F99000757_HideValue);

        ESACC_EasySecurityManual(OpenObject);
    end;

    local procedure ESACC_EasySecurityManual(OpenObject: Boolean)
    begin
    end;

    [Scope('OnPrem')]
    procedure GetSelectionFilter(): Text
    var
        Item: Record Item;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(Item);
        exit(SelectionFilterManagement.GetSelectionFilterForItem(Item));
    end;

    [Scope('OnPrem')]
    procedure SetSelection(var Item: Record Item)
    begin
        CurrPage.SetSelectionFilter(Item);
    end;

    local procedure SetSocialListeningFactboxVisibility()
    var
        SocialListeningMgt: Codeunit "Social Listening Management";
    begin
        SocialListeningMgt.GetItemFactboxVisibility(Rec, SocialListeningSetupVisible, SocialListeningVisible);
    end;

    [Scope('OnPrem')]
    procedure "---- CA Func ----"()
    begin
    end;

    [Scope('OnPrem')]
    procedure ShowCalculation()
    var
        CalculationMgt: Codeunit "Calculation Mgt.";
    begin
        // >> #CAW16.00:T100
        CalculationMgt.ShowItemCalculation(Rec);
        // << #CAW16.00:T100
    end;

    [Scope('OnPrem')]
    procedure "---- PM Func ----"()
    begin
    end;

    [Scope('OnPrem')]
    procedure ShowDeliveryToleranceEntries()
    var
        DeliveryTolerancesServices: Codeunit "Delivery Tolerances Services";
    begin
        // >> :PMW14.00:2473:1
        DeliveryTolerancesServices.ShowItemDelivTolEntries(Rec);
        // << :PMW14.00:2473:1
    end;

    [Scope('OnPrem')]
    procedure ShowItemByTradingUnit()
    var
        StructureManagement: Codeunit "Structure Management";
    begin
        // >> :PMW14.01:2466:1
        Rec.TestField("No.");
        StructureManagement.ShowItemByTrdgUnit(Rec."No.");
        // << :PMW14.01:2466:1
    end;

    local procedure NoOnFormat()
    begin
        // >> :PMW15.00.01:45:1
        LicPermission.Get(LicPermission."Object Type"::Codeunit, CODEUNIT::"Trading Unit Management");
        if LicPermission."Execute Permission" = LicPermission."Execute Permission"::Yes then begin
            // >> :PMW14.02:90:1
            "No.Emphasize" := TradingUnitManagement.GetFontBoldForItemList(Rec); // :PMW16.00:115:1
                                                                                 // << :PMW14.02:90:1
        end;
        // << :PMW15.00.01:45:1
    end;

    local procedure DescriptionOnFormat()
    begin
        // >> :PMW15.00.01:45:1
        LicPermission.Get(LicPermission."Object Type"::Codeunit, CODEUNIT::"Trading Unit Management");
        if LicPermission."Execute Permission" = LicPermission."Execute Permission"::Yes then begin
            // >> :PMW14.02:90:1
            // >> :PMW16.00:115:1
            DescriptionEmphasize := TradingUnitManagement.GetFontBoldForItemList(Rec);
            DescriptionIndent := TradingUnitManagement.GetIndentForItemList(Rec);
            // << :PMW16.00:115:1

            // >> #PMW18.00:T501
            if DescriptionIndent = 1 then begin
                Rec.Description := '   ' + Rec.Description;
            end;
            // << #PMW18.00:T501

            // << :PMW14.02:90:1
        end;
        // << :PMW15.00.01:45:1
    end;

    local procedure "--- CCDMS Fcts. ---"()
    begin
    end;

    [Scope('OnPrem')]
    procedure UpdateDocumentBox()
    var
        ChangeLog: Codeunit "Change Log Management";
        RecRef: RecordRef;
    begin
        // >> CCDMS
        DocumentBoxVisible := ChangeLog.CheckLicensePermission('CCDMS');
        if DocumentBoxVisible then begin
            RecRef.GetTable(Rec);
            if CurrPage.DocumentBox.PAGE.SetRecordRef(RecRef) then
                CurrPage.DocumentBox.PAGE.UpdateDocumentBox;
        end;
        // << CCDMS
    end;
}

