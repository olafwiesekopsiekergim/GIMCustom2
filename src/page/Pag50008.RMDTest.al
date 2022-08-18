// page 50008 "RMD Test"
// {
//     // P0001 25.02.16 DEBIE.ARE Fields added "Stand.Lagerort", "Lager RMD"
//     // 
//     // PR01 PRODUKT.01 15.12.14 DENUE.SKOL Integration cc|project
//     // AM01 PRODUKT.01 15.12.14 DENUE.SKOL Integration cc|alloy management
//     //                                 - Legierungsgewichte
//     // #PXW16.00:106 29.01.09 DEMSR.IG
//     //   New MenuButton "Manufacturing"
//     //   MenuItem "Manufacturing Dimensions" on MenuButton "Manufacturing"
//     //   Field "Shortcut Mfg. Dimension 1 Code" added
//     //   Field "Shortcut Mfg. Dimension 2 Code" added
//     //   Fields to show Shortcut Mfg. Dimension 3-8 added
//     //   Show Shortcut Mfg. Dimensions in OnAfterGetRecord
//     // 
//     // #PXW16.00:103 29.01.09 DEMSR.IG
//     //   MenuItem "Production Rates" on MenuButton "Manufacturing"
//     // 
//     // #PXW17.00:T102 14.09.12 DEMSR.IST
//     //   Ribbon/Action redesign
//     // 
//     // #PXW17.10.00.03:T100 31.07.14 DEMSR.IST - Rebranding
//     // #CAW16.00:T100 09.09.10 DEMSR.IST
//     //   New function "ShowCalculation"
//     //   New MenuButton "Manufacturing" with MenuItem "Calculation"
//     // 
//     // #CAW17.00:107 04.12.12 DEMSR.KHS
//     //   Adjust Action Items
//     // 
//     // #CAW17.10.00.03:T100 31.07.14 DEMSR.IST - Rebranding
//     // #TMW16.00:A1000         16.03.09 DEWUE.FB Creation of Text Module - Version 6.00:
//     //                                             Added Menu Items on MenuButton Item: "Text Module"
//     // #TMW17.00:A001 15.08.12 DEMSR.SSZ
//     //   #Added Image to Action
//     // #TMW17.00.00.01:A0001   02.05.13 DEMSR.SSZ Codereview
//     // #TMW17.10.00.02:T100    31.07.14 DEMSR.IST - Rebranding
//     // #TMW18.00.01:T100       10.08.15 DEDRS.WHEG AccessByPermission
//     // #NAV20100:A1004 15.05.07 DEWUE.SE
//     //   Added Menu item "Test Plan Setup" in "Item" Menu button
//     // 
//     // #QMW17.00.00.02:T101 14.05.13 DEMSR.KHS
//     //   Control IDs corrected
//     // 
//     // #QMW17.10.00.03:T100 31.07.14 DEMSR.IST - Rebranding
//     // 
//     // #QMW18.00.01:T105 19.06.15 DEMSR.KHS
//     //   New Action: Retain Sample Instruction
//     // 
//     // :PMW13.71:1:1
//     //   # Aufruf Detailkalkulation  (Button Artikel)
//     // 
//     // :PMW14.00:2473:1
//     //   # New function "ShowDeliveryToleranceEntries"
//     //   # Neues MenuItem "Liefertoleranzposten" über Schaltfläche Artikel
//     //   # Aufruf "ShowDeliveryToleranceEntries"
//     // 
//     // :PMW14.01:2457:1
//     //   # New function "ShowItemByTradingUnit"
//     //   # Neues MenuItem "Artikel nach Gebindenr." über Schaltfläche Artikel
//     //   # Aufruf "ShowItemByTradingUnit"
//     // 
//     // :PMW14.01:2466:1
//     //   # Neue Schaltfläche Produktion mit MenuItem Produktionsstruktur.
//     // 
//     // :PMW14.01.00.01 SP1:24:1
//     //   # Changes in PMW14.01 due to SP1 Standard Navision
//     // 
//     // :PMW14.02:90:1
//     //   # Description - OnFormat, call function "GetIndentForItemList"
//     //   # No. - OnFormat, call function "GetFontBoldForItemList"
//     //   # Description - OnFormat, call function "GetFontBoldForItemList"
//     // 
//     // :PMW14.02:91:1
//     //   # New MenuItem "Production Structure Simulation" on MenuButton Manufacturing
//     // 
//     // :PMW14.02:53:1
//     //   # New MenuItem "Returnable Containers" on MenuButton "Sales"
//     // 
//     // :PMW14.02:75:1
//     //   # New MenuItem "Item Bottling" on MenuButton Manufacturing
//     // 
//     // :PMW14.02.01:12:1
//     //   # MenuItem "Production Structure Simulation" renamed to "Production Simulation"
//     // 
//     // :PMW15.00:241:1
//     //   # Changes due to UI and programming standards
//     // 
//     // :PMW15.00.01:45:1
//     //   # Check license permissions
//     // 
//     // :PMW16.00:115:1
//     //   # Allocation format for UPDATEFONTBOLD and UPDATEINDENT changed due to transformation
//     // 
//     // INCORPORATION:PMW16.00:135:1
//     //   # MenuItem "Incorporation Usage" added on MenuButton Production
//     // 
//     // #PMW16.00.01.02:T503 05.03.10 DEMSR.IST
//     //   Changes due to UI and programming standards
//     // 
//     // #PMW16.00.02:T100 16.09.10 DEMSR.IST
//     //   Calculation programming rearranged --> #CAW16.00:T100
//     // 
//     // #PMW16.00.02:T230 01.10.10 DEMSR.BKR
//     //   Management of Active Ingredients
//     //   New MenuItem Ingredients on MenuButton Item
//     // 
//     // #PMW16.00.02:T250 13.10.10 DEMSR.KHS
//     //   New MenuItem Restrictions on MenuButton Sales
//     // 
//     // #PMW16.00.02.02:T503 04.01.11 DEMSR.IST
//     //   MenuItem Restrictions renamed to Restricted Sales
//     // 
//     // #PMW16.00.03:T101 14.07.11 DEMSR.IST
//     //   New MenuItem "Remain. Shelf Life Setup" on MenuButton Sales
//     // 
//     // #PMW17.00:T101 12.10.12 DEMSR.IST
//     //   Form variable changed to page
//     // 
//     // #PMW17.00:T102 12.10.12 DEMSR.IST
//     //   Ribbon/Action redesign
//     // 
//     // #PMW17.00.00.02:T501 14.05.13 DEMSR.IST
//     //   Corrections due to code review
//     // 
//     // #PMW17.00:00.03:T500 16.07.13 DEMSR.IST
//     //   Missing indentation for description added, properties IndentationColumnName and IndentationControls
//     // 
//     // #PMW17.10.00.01:T511 08.01.14 DEMSR.IST
//     //   Function to indent and emphasize trading unit items corrected
//     //   Field "Base Trading Unit Item No." added, not visible
//     //   Style and StyleExpr set for "No.", Description and "Base Trading Unit Item No."
//     // 
//     // #PMW17.10.00.02:T101 15.04.2014 DEMSR.IST
//     //   Action Ingredient corrected
//     // 
//     // #PMW17.10.00.03:T100 31.07.14 DEMSR.IST - Rebranding
//     // :CMIW15.00:41:1
//     //   # New MenuItem "Commission Rates" on MenuButton Sales added
//     // 
//     // #PMW17.10.01:T108 26.09.14 DEMSR.KHS
//     //   Add: Item Availability by LOT
//     // 
//     // #PMW18.00:T501 12.01.15 DEMSR.IST
//     //   Sorting does not work in NAV 2015 if IndentationColumnName is set
//     // 
//     // #CMIW17.00:T102 12.11.12 DEMSR.BKR
//     //   Ribbon/Action redesign
//     // 
//     // #RENW16.00.01:R053    12.10.09 DEMSR.KHS
//     //   Rate Parts
//     // 
//     // #RENW16.00.01.02:T512 06.04.10 DEMSR.KHS
//     //   Price Views were not filtered correctly
//     // 
//     // #RENW17.00:T101 04.01.13 DEMSR.KHS
//     //   Update Action Items
//     // 
//     // :DMW14.02:1:01 #MB Artikel -> CTO Aufrufe wie auf Artikelkarte
//     //  # MB Funktion -> CTO Aufrufe wie auf Artikelkarte
//     // :DMW15.01:26:01 #PrimaryKey of table Attribute has changed
//     // :DMW15.01:62:01 #New MenuItem: Item -> "Profi DB"
//     // #DMW16.00.02:T102 19.10.10 DEMSR.SSZ
//     //   #Description fields 2,3,4,5
//     // 
//     // #DMW16.00.03:A002 07.10.11 DEMSR.SSZ
//     //   #Corrected Menu Item, created new menu item in MB Item --> KANBAN
//     // #DMW17.00:A001 08.06.12 DEMSR.SSZ
//     //   #Grammar issue
//     //   #Inserted action images
//     // #DMW17.00.00.01:A0001 15.05.13 DEMSR.SSZ Code Review
//     // 
//     // #AMPW17.10:T100 17.10.13 DEMSR.IST
//     //   Restore Object Version List
//     // 
//     // #CMI7.10:T100 04.11.13 DEMSR.LV
//     //   Delete Seperator
//     // 
//     // cc|dms (CCDMS)
//     // 
//     // #DMS:T006 10.03.15 DEDRS.WHEG
//     //   Standard Implementation with DocumentBoxVisible
//     // 
//     // #DMSW18.00.01:T100 10.08.15 DEDRS.WHEG
//     //   AccessByPermission
//     // 
//     // WF  cc|workflow context menu integration.

//     Caption = 'Item List';
//     CardPageID = "Item Card";
//     DataCaptionExpression = ComponentGroupsText;
//     Editable = false;
//     PageType = List;
//     PromotedActionCategories = 'New,Process,Report,Quality Management,cc Project';
//     SourceTable = Item;

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 IndentationControls = Description;
//                 ShowCaption = false;
//                 field("No."; Rec."No.")
//                 {

//                     Style = Strong;
//                     StyleExpr = "No.Emphasize";

//                 }
//                 field("Lager RMD"; Rec."Lager RMD")
//                 {
//                 }
//                 field("Inventory 100"; Rec."Inventory 100")
//                 {

//                     Style = Strong;
//                     StyleExpr = "No.Emphasize";
//                     Visible = false;
//                 }
//                 field(Description; Rec.Description)
//                 {

//                     Style = Strong;
//                     StyleExpr = DescriptionEmphasize;

//                 }
//                 field("Description 2"; Rec."Description 2")
//                 {

//                     Visible = false;
//                 }
//                 field("Description 3"; "Description 3")
//                 {

//                     Visible = false;
//                 }
//                 field("Description 4"; "Description 4")
//                 {

//                     Visible = false;
//                 }
//                 field("Description 5"; "Description 5")
//                 {

//                     Visible = false;
//                 }
//                 field("Created From Nonstock Item"; Rec."Created From Nonstock Item")
//                 {

//                     Visible = false;
//                 }
//                 field("Substitutes Exist"; Rec."Substitutes Exist")
//                 {

//                 }
//                 field("Stockkeeping Unit Exists"; Rec."Stockkeeping Unit Exists")
//                 {

//                     Visible = false;
//                 }
//                 field("Assembly BOM"; Rec."Assembly BOM")
//                 {

//                 }
//                 field("Production BOM No."; Rec."Production BOM No.")
//                 {

//                 }
//                 field("Routing No."; Rec."Routing No.")
//                 {

//                 }
//                 field("Base Unit of Measure"; Rec."Base Unit of Measure")
//                 {

//                 }
//                 field("Shelf No."; Rec."Shelf No.")
//                 {

//                     Visible = false;
//                 }
//                 field("Costing Method"; Rec."Costing Method")
//                 {

//                     Visible = false;
//                 }
//                 field("Cost is Adjusted"; Rec."Cost is Adjusted")
//                 {


//                 }
//                 field("Standard Cost"; Rec."Standard Cost")
//                 {

//                     Visible = false;
//                 }
//                 field("Unit Cost"; Rec."Unit Cost")
//                 {

//                 }
//                 field("Gross Weight"; Rec."Gross Weight")
//                 {
//                 }
//                 field("Net Weight"; Rec."Net Weight")
//                 {
//                 }
//                 field("Last Direct Cost"; Rec."Last Direct Cost")
//                 {

//                     Visible = false;
//                 }
//                 field("Price/Profit Calculation"; Rec."Price/Profit Calculation")
//                 {

//                     Visible = false;
//                 }
//                 field("Profit %"; Rec."Profit %")
//                 {

//                     Visible = false;
//                 }
//                 field("Unit Price"; Rec."Unit Price")
//                 {

//                 }

//                 field("Inventory Posting Group"; Rec."Inventory Posting Group")
//                 {

//                     Visible = false;
//                 }
//                 field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
//                 {

//                     Visible = false;
//                 }
//                 field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
//                 {

//                     Visible = false;
//                 }
//                 field("Item Disc. Group"; Rec."Item Disc. Group")
//                 {

//                     Visible = false;
//                 }
//                 field("Vendor No."; Rec."Vendor No.")
//                 {

//                 }
//                 field("Vendor Item No."; Rec."Vendor Item No.")
//                 {
//                     Visible = false;
//                 }
//                 field("Tariff No."; Rec."Tariff No.")
//                 {

//                     Visible = false;
//                 }
//                 field("Search Description"; Rec."Search Description")
//                 {


//                 }
//                 field("Overhead Rate"; Rec."Overhead Rate")
//                 {

//                     Visible = false;
//                 }
//                 field("Indirect Cost %"; Rec."Indirect Cost %")
//                 {

//                     Visible = false;
//                 }
//                 field("Item Category Code"; Rec."Item Category Code")
//                 {

//                     Visible = false;
//                 }
//             //     field("Product Group Code"; Rec."Product Group Code")
//             //     {

//             //         Visible = false;
//             //  }
//                 field(Blocked; Rec.Blocked)
//                 {

//                     Visible = false;
//                 }
//                 field("Last Date Modified"; Rec."Last Date Modified")
//                 {

//                     Visible = false;
//                 }
//                 field("Stand.Lagerort"; Rec."Stand.Lagerort")
//                 {
//                     Description = 'P0001';

//                 }
//                 field("Sales Unit of Measure"; Rec."Sales Unit of Measure")
//                 {

//                     Visible = false;
//                 }
//                 field("Replenishment System"; Rec."Replenishment System")
//                 {

//                     Visible = false;
//                 }
//                 field("Purch. Unit of Measure"; Rec."Purch. Unit of Measure")
//                 {

//                     Visible = false;
//                 }
//                 field("Lead Time Calculation"; Rec."Lead Time Calculation")
//                 {

//                     Visible = false;
//                 }
//                 field("Manufacturing Policy"; Rec."Manufacturing Policy")
//                 {

//                     Visible = false;
//                 }
//                 field("Flushing Method"; Rec."Flushing Method")
//                 {

//                     Visible = false;
//                 }
//                 field("Assembly Policy"; Rec."Assembly Policy")
//                 {

//                     Visible = false;
//                 }
//                 field("Item Tracking Code"; Rec."Item Tracking Code")
//                 {

//                     Visible = false;
//                 }
//                 field("Default Deferral Template Code"; Rec."Default Deferral Template Code")
//                 {
//                     Caption = 'Default Deferral Template';

//                 }
//                 field("Shortcut Mfg. Dimension 1 Code"; "Shortcut Mfg. Dimension 1 Code")
//                 {

//                     Visible = false;

//                     trigger OnLookup(var Text: Text): Boolean
//                     begin
//                         // >> #PXW16.00:106
//                         Rec.LookupShortcutMfgDimCodeNoUpd(1, "Shortcut Mfg. Dimension 1 Code");
//                         // << #PXW16.00:106
//                     end;
//                 }
//                 field("Shortcut Mfg. Dimension 2 Code"; "Shortcut Mfg. Dimension 2 Code")
//                 {

//                     Visible = false;

//                     trigger OnLookup(var Text: Text): Boolean
//                     begin
//                         // >> #PXW16.00:106
//                         Rec.LookupShortcutMfgDimCodeNoUpd(2, "Shortcut Mfg. Dimension 2 Code");
//                         // << #PXW16.00:106
//                     end;
//                 }
//                 field("ShortcutMfgDimCode[3]"; ShortcutMfgDimCode[3])
//                 {
//                     CaptionClass = '5012700,2,3';
//                     Visible = false;

//                     trigger OnLookup(var Text: Text): Boolean
//                     begin
//                         // >> #PXW16.00:106
//                         Rec.LookupShortcutMfgDimCodeNoUpd(3, ShortcutMfgDimCode[3]);
//                         // << #PXW16.00:106
//                     end;
//                 }
//                 field("ShortcutMfgDimCode[4]"; ShortcutMfgDimCode[4])
//                 {
//                     CaptionClass = '5012700,2,4';
//                     Visible = false;

//                     trigger OnLookup(var Text: Text): Boolean
//                     begin
//                         // >> #PXW16.00:106
//                         Rec.LookupShortcutMfgDimCodeNoUpd(4, ShortcutMfgDimCode[4]);
//                         // << #PXW16.00:106
//                     end;
//                 }
//                 field("ShortcutMfgDimCode[5]"; ShortcutMfgDimCode[5])
//                 {
//                     CaptionClass = '5012700,2,5';
//                     Visible = false;

//                     trigger OnLookup(var Text: Text): Boolean
//                     begin
//                         // >> #PXW16.00:106
//                         Rec.LookupShortcutMfgDimCodeNoUpd(5, ShortcutMfgDimCode[5]);
//                         // << #PXW16.00:106
//                     end;
//                 }
//                 field("ShortcutMfgDimCode[6]"; ShortcutMfgDimCode[6])
//                 {
//                     CaptionClass = '5012700,2,6';
//                     Visible = false;

//                     trigger OnLookup(var Text: Text): Boolean
//                     begin
//                         // >> #PXW16.00:106
//                         Rec.LookupShortcutMfgDimCodeNoUpd(6, ShortcutMfgDimCode[6]);
//                         // << #PXW16.00:106
//                     end;
//                 }
//                 field("ShortcutMfgDimCode[7]"; ShortcutMfgDimCode[7])
//                 {
//                     CaptionClass = '5012700,2,7';
//                     Visible = false;

//                     trigger OnLookup(var Text: Text): Boolean
//                     begin
//                         // >> #PXW16.00:106
//                         Rec.LookupShortcutMfgDimCodeNoUpd(7, ShortcutMfgDimCode[7]);
//                         // << #PXW16.00:106
//                     end;
//                 }
//                 field("ShortcutMfgDimCode[8]"; ShortcutMfgDimCode[8])
//                 {
//                     CaptionClass = '5012700,2,8';
//                     Visible = false;

//                     trigger OnLookup(var Text: Text): Boolean
//                     begin
//                         // >> #PXW16.00:106
//                         Rec.LookupShortcutMfgDimCodeNoUpd(8, ShortcutMfgDimCode[8]);
//                         // << #PXW16.00:106
//                     end;
//                 }
//                 field(Abmessung1; Rec.Abmessung1)
//                 {

//                 }
//                 field(Abmessung2; Rec.Abmessung2)
//                 {

//                 }
//                 field(Abmessung3; Rec.Abmessung3)
//                 {

//                 }
//             }
//         }
//         area(factboxes)
//         {
//             // part(DocumentBox; "DMS - Doc. Box FactBox Async")
//             // {
//             //     AccessByPermission = Page "DMS - Doc. Box FactBox Async" = X;
//             //     Visible = DocumentBoxVisible;
//             // }
//             part(Control3; "Social Listening FactBox")
//             {
//                 SubPageLink = "Source Type" = CONST(Item),
//                               "Source No." = FIELD("No.");
//                 Visible = SocialListeningVisible;
//             }
//             part(Control26; "Social Listening Setup FactBox")
//             {
//                 SubPageLink = "Source Type" = CONST(Item),
//                               "Source No." = FIELD("No.");
//                 UpdatePropagation = Both;
//                 Visible = SocialListeningSetupVisible;
//             }
//             part(Control1901314507; "Item Invoicing FactBox")
//             {
//                 SubPageLink = "No." = FIELD("No."),
//                               "Date Filter" = FIELD("Date Filter"),
//                               "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
//                               "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
//                               "Location Filter" = FIELD("Location Filter"),
//                               "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
//                               "Bin Filter" = FIELD("Bin Filter"),
//                               "Variant Filter" = FIELD("Variant Filter"),
//                               "Lot No. Filter" = FIELD("Lot No. Filter"),
//                               "Serial No. Filter" = FIELD("Serial No. Filter");
//                 Visible = true;
//             }
//             part(Control1903326807; "Item Replenishment FactBox")
//             {
//                 SubPageLink = "No." = FIELD("No."),
//                               "Date Filter" = FIELD("Date Filter"),
//                               "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
//                               "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
//                               "Location Filter" = FIELD("Location Filter"),
//                               "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
//                               "Bin Filter" = FIELD("Bin Filter"),
//                               "Variant Filter" = FIELD("Variant Filter"),
//                               "Lot No. Filter" = FIELD("Lot No. Filter"),
//                               "Serial No. Filter" = FIELD("Serial No. Filter");
//                 Visible = false;
//             }
//             part(Control1906840407; "Item Planning FactBox")
//             {
//                 SubPageLink = "No." = FIELD("No."),
//                               "Date Filter" = FIELD("Date Filter"),
//                               "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
//                               "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
//                               "Location Filter" = FIELD("Location Filter"),
//                               "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
//                               "Bin Filter" = FIELD("Bin Filter"),
//                               "Variant Filter" = FIELD("Variant Filter"),
//                               "Lot No. Filter" = FIELD("Lot No. Filter"),
//                               "Serial No. Filter" = FIELD("Serial No. Filter");
//                 Visible = true;
//             }
//             part(Control1901796907; "Item Warehouse FactBox")
//             {
//                 SubPageLink = "No." = FIELD("No."),
//                               "Date Filter" = FIELD("Date Filter"),
//                               "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
//                               "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
//                               "Location Filter" = FIELD("Location Filter"),
//                               "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
//                               "Bin Filter" = FIELD("Bin Filter"),
//                               "Variant Filter" = FIELD("Variant Filter"),
//                               "Lot No. Filter" = FIELD("Lot No. Filter"),
//                               "Serial No. Filter" = FIELD("Serial No. Filter");
//                 Visible = false;
//             }
//             systempart(Control1900383207; Links)
//             {
//                 Visible = true;
//             }
//             systempart(Control1905767507; Notes)
//             {
//                 Visible = true;
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             group(Availability)
//             {
//                 Caption = 'Availability';
//                 Image = Item;
//                 action("Items b&y Location")
//                 {
//                     AccessByPermission = TableData Location = R;
//                     Caption = 'Items b&y Location';

//                     Image = ItemAvailbyLoc;


//                     trigger OnAction()
//                     var
//                         ItemsByLocation: Page "Items by Location";
//                     begin
//                         ItemsByLocation.SetRecord(Rec);
//                         ItemsByLocation.Run;
//                     end;
//                 }
//                 action("Item by Trading &Unit No.")
//                 {
//                     Caption = 'Item by Trading &Unit No.';

//                     Image = Stages;


//                     trigger OnAction()
//                     begin
//                         // >> :PMW14.01:2457:1
//                         ShowItemByTradingUnit;
//                         // << :PMW14.01:2457:1
//                     end;
//                 }
//                 group("&Item Availability by")
//                 {
//                     Caption = '&Item Availability by';
//                     Image = ItemAvailability;
//                     action("<Action5>")
//                     {
//                         Caption = 'Event';

//                         Image = "Event";


//                         trigger OnAction()
//                         begin
//                             ItemAvailFormsMgt.ShowItemAvailFromItem(Rec, ItemAvailFormsMgt.ByEvent);
//                         end;
//                     }
//                     action(Period)
//                     {
//                         Caption = 'Period';

//                         Image = Period;
//                         RunObject = Page "Item Availability by Periods";
//                         RunPageLink = "No." = FIELD("No."),
//                                       "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
//                                       "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
//                                       "Location Filter" = FIELD("Location Filter"),
//                                       "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
//                                       "Variant Filter" = FIELD("Variant Filter");

//                     }
//                     action(Variant)
//                     {
//                         Caption = 'Variant';

//                         Image = ItemVariant;
//                         RunObject = Page "Item Availability by Variant";
//                         RunPageLink = "No." = FIELD("No."),
//                                       "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
//                                       "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
//                                       "Location Filter" = FIELD("Location Filter"),
//                                       "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
//                                       "Variant Filter" = FIELD("Variant Filter");

//                     }
//                     action(Location)
//                     {
//                         Caption = 'Location';

//                         Image = Warehouse;
//                         RunObject = Page "Item Availability by Location";
//                         RunPageLink = "No." = FIELD("No."),
//                                       "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
//                                       "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
//                                       "Location Filter" = FIELD("Location Filter"),
//                                       "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
//                                       "Variant Filter" = FIELD("Variant Filter");

//                     }
//                     // action("<Page Item Availability by Lot")
//                     // {
//                     //     Caption = 'Lot';

//                     //     Image = Lot;
//                     //     RunObject = Page "Item Availability by Lot";
//                     //     RunPageLink = "No." = FIELD("No."),
//                     //                   "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
//                     //                   "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
//                     //                   "Lot No. Filter" = FIELD("Lot No. Filter"),
//                     //                   "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
//                     //                   "Variant Filter" = FIELD("Variant Filter");
//                     //     Visible = ESACC_C5012500_Visible;
//                     // }
//                     action("BOM Level")
//                     {
//                         Caption = 'BOM Level';

//                         Image = BOMLevel;


//                         trigger OnAction()
//                         begin
//                             ItemAvailFormsMgt.ShowItemAvailFromItem(Rec, ItemAvailFormsMgt.ByBOM);
//                         end;
//                     }
//                     action(Timeline)
//                     {
//                         Caption = 'Timeline';

//                         Image = Timeline;


//                         trigger OnAction()
//                         begin
//                             Rec.ShowTimelineFromItem(Rec);
//                         end;
//                     }
//                 }
//             }
//             group(ActionGroupCRM)
//             {
//                 Caption = 'Dynamics CRM';
//                 Visible = CRMIntegrationEnabled;
//                 action(CRMGoToProduct)
//                 {
//                     Caption = 'Product';

//                     Image = CoupledItem;
//                     ToolTip = 'Open the coupled Microsoft Dynamics CRM product.';


//                     trigger OnAction()
//                     var
//                         CRMIntegrationManagement: Codeunit "CRM Integration Management";
//                     begin
//                         CRMIntegrationManagement.ShowCRMEntityFromRecordID(Rec.RecordId);
//                     end;
//                 }
//                 action(CRMSynchronizeNow)
//                 {
//                     AccessByPermission = TableData "CRM Integration Record" = IM;
//                     Caption = 'Synchronize Now';

//                     Image = Refresh;
//                     ToolTip = 'Send updated data to Microsoft Dynamics CRM.';


//                     trigger OnAction()
//                     var
//                         Item: Record Item;
//                         CRMIntegrationManagement: Codeunit "CRM Integration Management";
//                         ItemRecordRef: RecordRef;
//                     begin
//                         CurrPage.SetSelectionFilter(Item);
//                         Item.Next;

//                         if Item.Count = 1 then
//                             CRMIntegrationManagement.UpdateOneNow(Item.RecordId)
//                         else begin
//                             ItemRecordRef.GetTable(Item);
//                             CRMIntegrationManagement.UpdateMultipleNow(ItemRecordRef);
//                         end
//                     end;
//                 }
//                 group(Coupling)
//                 {
//                     Caption = 'Coupling', Comment = 'Coupling is a noun';
//                     Image = LinkAccount;
//                     ToolTip = 'Create, change, or delete a coupling between the Microsoft Dynamics NAV record and a Microsoft Dynamics CRM record.';
//                     action(ManageCRMCoupling)
//                     {
//                         AccessByPermission = TableData "CRM Integration Record" = IM;
//                         Caption = 'Set Up Coupling';

//                         Image = LinkAccount;
//                         ToolTip = 'Create or modify the coupling to a Microsoft Dynamics CRM product.';


//                         trigger OnAction()
//                         var
//                             CRMIntegrationManagement: Codeunit "CRM Integration Management";
//                         begin
//                             CRMIntegrationManagement.CreateOrUpdateCoupling(Rec.RecordId);
//                         end;
//                     }
//                     action(DeleteCRMCoupling)
//                     {
//                         AccessByPermission = TableData "CRM Integration Record" = IM;
//                         Caption = 'Delete Coupling';
//                         Enabled = CRMIsCoupledToRecord;
//                         Image = UnLinkAccount;
//                         ToolTip = 'Delete the coupling to a Microsoft Dynamics CRM product.';

//                         trigger OnAction()
//                         var
//                             CRMCouplingManagement: Codeunit "CRM Coupling Management";
//                         begin
//                             CRMCouplingManagement.RemoveCoupling(Rec.RecordId);
//                         end;
//                     }
//                 }
//             }
//             group("Master Data")
//             {
//                 Caption = 'Master Data';
//                 Image = DataEntry;
//                 action("&Units of Measure")
//                 {
//                     Caption = '&Units of Measure';
//                     Image = UnitOfMeasure;
//                     RunObject = Page "Item Units of Measure";
//                     RunPageLink = "Item No." = FIELD("No.");

//                 }
//                 action("Va&riants")
//                 {
//                     Caption = 'Va&riants';

//                     Image = ItemVariant;
//                     RunObject = Page "Item Variants";
//                     RunPageLink = "Item No." = FIELD("No.");

//                 }
//                 action("Te&xt Module")
//                 {
//                     AccessByPermission = TableData "Text Module Header" = R;
//                     Caption = 'Te&xt Module';

//                     Image = Text;


//                     trigger OnAction()
//                     var
//                         TMFunctions: Codeunit "Text Module Functions";
//                     begin
//                         TMFunctions.ShowHeader(DATABASE::Item, Rec);
//                     end;
//                 }
//                 group(Dimensions)
//                 {
//                     Caption = 'Dimensions';
//                     Image = Dimensions;
//                     action("Dimensions-Single")
//                     {
//                         Caption = 'Dimensions-Single';

//                         Image = Dimensions;
//                         RunObject = Page "Default Dimensions";
//                         RunPageLink = "Table ID" = CONST(27),
//                                       "No." = FIELD("No.");
//                         ShortCutKey = 'Shift+Ctrl+D';

//                     }
//                     action("Dimensions-&Multiple")
//                     {
//                         AccessByPermission = TableData Dimension = R;
//                         Caption = 'Dimensions-&Multiple';

//                         Image = DimensionSets;


//                         trigger OnAction()
//                         var
//                             Item: Record Item;
//                             DefaultDimMultiple: Page "Default Dimensions-Multiple";
//                         begin
//                             CurrPage.SetSelectionFilter(Item);
//                             DefaultDimMultiple.SetMultiItem(Item);
//                             DefaultDimMultiple.RunModal;
//                         end;
//                     }
//                 }
//                 action("Substituti&ons")
//                 {
//                     Caption = 'Substituti&ons';

//                     Image = ItemSubstitution;
//                     RunObject = Page "Item Substitution Entry";
//                     RunPageLink = Type = CONST(Item),
//                                   "No." = FIELD("No.");

//                 }
//                 action("Cross Re&ferences")
//                 {
//                     Caption = 'Cross Re&ferences';

//                     Image = Change;
//                     RunObject = Page "Item Cross Reference Entries";
//                     RunPageLink = "Item No." = FIELD("No.");

//                 }
//                 action("E&xtended Texts")
//                 {
//                     Caption = 'E&xtended Texts';

//                     Image = Text;
//                     RunObject = Page "Extended Text List";
//                     RunPageLink = "Table Name" = CONST(Item),
//                                   "No." = FIELD("No.");
//                     RunPageView = SORTING("Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");

//                 }
//                 action(Translations)
//                 {
//                     Caption = 'Translations';

//                     Image = Translations;
//                     RunObject = Page "Item Translations";
//                     RunPageLink = "Item No." = FIELD("No."),
//                                   "Variant Code" = CONST('');

//                 }
//                 action("&Picture")
//                 {
//                     Caption = '&Picture';

//                     Image = Picture;
//                     RunObject = Page "Item Picture";
//                     RunPageLink = "No." = FIELD("No."),
//                                   "Date Filter" = FIELD("Date Filter"),
//                                   "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
//                                   "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
//                                   "Location Filter" = FIELD("Location Filter"),
//                                   "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
//                                   "Variant Filter" = FIELD("Variant Filter");

//                 }
//                 action(Identifiers)
//                 {
//                     Caption = 'Identifiers';
//                     Image = BarCode;
//                     RunObject = Page "Item Identifiers";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     RunPageView = SORTING("Item No.", "Variant Code", "Unit of Measure Code");

//                 }
//                 separator(Action5292630)
//                 {
//                 }
//                 action("<Action1100409001>")
//                 {
//                     Caption = 'Alloy Weights';

//                     Image = IssueFinanceCharge;
//                     RunObject = Page "AM - Item Alloy Weights";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     Visible = AMGranuleEnabled;
//                 }
//                 action("&Delivery Tolerance Entries")
//                 {
//                     Caption = '&Delivery Tolerance Entries';

//                     Image = Entry;


//                     trigger OnAction()
//                     begin
//                         // >> :PMW14.00:2473:1
//                         ShowDeliveryToleranceEntries;
//                         // << :PMW14.00:2473:1
//                     end;
//                 }
//                 action("In&gredients")
//                 {
//                     Caption = 'In&gredients';
//                     Description = '#PMW16.00.02:T230';

//                     Image = BOMLedger;
//                     RunObject = Page "Item Ingredients";
//                     RunPageLink = "Item No." = FIELD("No."),
//                                   "Variant Code" = CONST('');

//                 }
//                 group("Master &BOM")
//                 {
//                     Caption = 'Master &BOM';
//                     Image = BOM;
//                     action("&Master BOM")
//                     {
//                         Caption = '&Master BOM';

//                         Image = BOM;
//                         RunObject = Page "Item - Master BOM";
//                         RunPageLink = Item = FIELD("No.");
//                         RunPageView = SORTING(Item, Type)
//                                       ORDER(Ascending);

//                     }
//                     action("Master BOM &Where Used")
//                     {
//                         Caption = 'Master BOM &Where Used';

//                         Image = "Where-Used";


//                         trigger OnAction()
//                         var
//                             MasterBOMWhereUsed: Page "Master BOM Where-Used";
//                         begin
//                             // >> :DMW13.71:1:02
//                             MasterBOMWhereUsed.SetItem(Rec, 0D);
//                             MasterBOMWhereUsed.RunModal;
//                             // << :DMW13.71:1:02
//                         end;
//                     }
//                 }
//                 action("A&ttributes")
//                 {
//                     Caption = 'A&ttributes';

//                     Image = ViewDetails;
//                     RunObject = Page "Attribute Values";
//                     RunPageLink = "Table No." = CONST(27),
//                                   "No." = FIELD("No."),
//                                   "Variant Code" = FILTER('');
//                     RunPageView = SORTING("Table No.", "No.", "Variant Code", "Line No.")
//                                   ORDER(Descending);

//                 }
//                 action("&Checklist")
//                 {
//                     Caption = '&Checklist';

//                     Image = CheckList;
//                     RunObject = Page "Item Checklist Relations";
//                     RunPageLink = "Table ID" = CONST(Item),
//                                   Code = FIELD("No.");
//                                     }
//                 action("Sear&ch Characteristics")
//                 {
//                     Caption = 'Sear&ch Characteristics';

//                     Image = ViewPage;
//                     RunObject = Page "Item Search Characteristics";
//                     RunPageLink = "No." = FIELD("No.");

//                 }
//                 action("&Profi DB")
//                 {
//                     Caption = '&Profi DB';

//                     Image = ImportExport;
//                     RunObject = Page "Item Profi DB";
//                     RunPageLink = "No." = FIELD("No.");

//                 }
//                 action("KAN&BAN")
//                 {
//                     Caption = 'KAN&BAN';

//                     Image = Card;

//                     trigger OnAction()
//                     var
//                         KANBANMgt: Codeunit "ccs dm KANBAN Management";
//                     begin
//                         KANBANMgt.OpenKANBANCard(Rec."No.", '', '');   // #KANBAN:DMW16.00.03:A004
//                     end;
//                 }
//                 action("Item &Drawing")
//                 {
//                     Caption = 'Item &Drawing';

//                     Image = Picture;
//                     RunObject = Page "Item Drawing";
//                     RunPageLink = "Item No." = FIELD("No.");

//                 }
//             }
//             group("Assembly/Production")
//             {
//                 Caption = 'Assembly/Production';
//                 Image = Production;
//                 action(Structure)
//                 {
//                     Caption = 'Structure';

//                     Image = Hierarchy;


//                     trigger OnAction()
//                     var
//                         BOMStructure: Page "BOM Structure";
//                     begin
//                         BOMStructure.InitItem(Rec);
//                         BOMStructure.Run;
//                     end;
//                 }
//                 action("Cost Shares")
//                 {
//                     Caption = 'Cost Shares';

//                     Image = CostBudget;


//                     trigger OnAction()
//                     var
//                         BOMCostShares: Page "BOM Cost Shares";
//                     begin
//                         BOMCostShares.InitItem(Rec);
//                         BOMCostShares.Run;
//                     end;
//                 }
//                 group("Assemb&ly")
//                 {
//                     Caption = 'Assemb&ly';
//                     Image = AssemblyBOM;
//                     action("<Action32>")
//                     {
//                         Caption = 'Assembly BOM';

//                         Image = BOM;
//                         RunObject = Page "Assembly BOM";
//                         RunPageLink = "Parent Item No." = FIELD("No.");

//                     }
//                     action("Where-Used")
//                     {
//                         Caption = 'Where-Used';

//                         Image = Track;
//                         RunObject = Page "Where-Used List";
//                         RunPageLink = Type = CONST(Item),
//                                       "No." = FIELD("No.");
//                         RunPageView = SORTING(Type, "No.");

//                     }
//                     action("Calc. Stan&dard Cost")
//                     {
//                         AccessByPermission = TableData "BOM Component" = R;
//                         Caption = 'Calc. Stan&dard Cost';

//                         Image = CalculateCost;

//                         trigger OnAction()
//                         begin
//                             CalculateStdCost.CalcItem(Rec."No.", true);
//                         end;
//                     }
//                     action("Calc. Unit Price")
//                     {
//                         AccessByPermission = TableData "BOM Component" = R;
//                         Caption = 'Calc. Unit Price';

//                         Image = SuggestItemPrice;


//                         trigger OnAction()
//                         begin
//                             CalculateStdCost.CalcAssemblyItemPrice(Rec."No.");
//                         end;
//                     }
//                 }
//                 group(Production)
//                 {
//                     Caption = 'Production';
//                     Image = Production;
//                     action("Production &Structures")
//                     {
//                         Caption = 'Production &Structures';

//                         Image = ProdBOMMatrixPerVersion;
//                         Promoted = true;
//                         PromotedCategory = Process;
//                         RunObject = Page "Production Structure List";
//                         RunPageLink = "Item No." = FIELD("No.");
//                         RunPageView = SORTING("No.");

//                     }
//                     action("Production BOM")
//                     {
//                         Caption = 'Production BOM';

//                         Image = BOM;
//                         RunObject = Page "Production BOM";
//                         RunPageLink = "No." = FIELD("Production BOM No.");

//                     }
//                     action(Action29)
//                     {
//                         AccessByPermission = TableData "BOM Component" = R;
//                         Caption = 'Where-Used';

//                         Image = "Where-Used";


//                         trigger OnAction()
//                         var
//                             ProdBOMWhereUsed: Page "Prod. BOM Where-Used";
//                         begin
//                             ProdBOMWhereUsed.SetItem(Rec, WorkDate);
//                             ProdBOMWhereUsed.RunModal;
//                         end;
//                     }
//                     action(Action24)
//                     {
//                         AccessByPermission = TableData "Production BOM Header" = R;
//                         Caption = 'Calc. Stan&dard Cost';

//                         Image = CalculateCost;


//                         trigger OnAction()
//                         begin
//                             CalculateStdCost.CalcItem(Rec."No.", false);
//                         end;
//                     }
//                     action("Detail Calc. &Standard Cost")
//                     {
//                         Caption = 'Detail Calc. &Standard Cost';

//                         Image = CalculateHierarchy;


//                         trigger OnAction()
//                         var
//                             DetailCalculationServices: Codeunit "Detail Calculation Services";
//                         begin
//                             // >> :PMW13.71:1:1
//                             Rec.TestField("No.");
//                             DetailCalculationServices.ShowCalculation(Rec);
//                             // << :PMW13.71:1:1
//                         end;
//                     }
//                     action("&Calculation")
//                     {
//                         Caption = '&Calculation';

//                         Image = CalculateInvoiceDiscount;
//                         Promoted = true;
//                         PromotedCategory = Process;


//                         trigger OnAction()
//                         begin
//                             ShowCalculation; // #CAW16.00:T100
//                         end;
//                     }
//                     action("&Manufacturing Dimensions")
//                     {
//                         Caption = '&Manufacturing Dimensions';

//                         Image = Dimensions;
//                         RunObject = Page "Default Mfg. Dimensions";
//                         RunPageLink = "Source Type" = CONST(27),
//                                       "Source ID" = FIELD("No.");
//                         ShortCutKey = 'Shift+Ctrl+P';
//                          }
//                     action("Work Cen&ter Production Rates")
//                     {
//                         Caption = 'Work Cen&ter Production Rates';
//                         Enabled = ESACC_C5012700_Enabled;
//                         Image = BlanketOrder;
//                         RunObject = Page "Work Center Production Rates";
//                         RunPageLink = "Item No." = FIELD("No.");
//                         Visible = ESACC_C5012700_Visible;
//                     }
//                     action("Pr&oduction Simulation")
//                     {
//                         Caption = 'Pr&oduction Simulation';
//                         Enabled = ESACC_C5012409_Enabled;
//                         Image = PrepaymentSimulation;
//                         Visible = ESACC_C5012409_Visible;

//                         trigger OnAction()
//                         var
//                             ProductionStructureSimMgt: Codeunit "Production Simulation Mgt.";
//                         begin
//                             // >> :PMW14.02:91:1
//                             ProductionStructureSimMgt.ShowStructureForItem(Rec);
//                             // << :PMW14.02:91:1
//                         end;
//                     }
//                     action("Item &Bottling")
//                     {
//                         Caption = 'Item &Bottling';
//                         Enabled = ESACC_C5012408_Enabled;
//                         Image = "Filter";
//                         Visible = ESACC_C5012408_Visible;

//                         trigger OnAction()
//                         var
//                             ItemBottling: Page "Item Bottling";
//                         begin
//                             // >> :PMW14.02:75:1
//                             Rec.TestField("No.");
//                             if "Trading Unit per Item UOM" = "Trading Unit per Item UOM"::Item then begin
//                                 ItemBottling.Def(Rec."No.", Rec.GetFilter("Location Filter"), '', '', '', '', Rec."Base Unit of Measure", '');
//                             end else begin
//                                 ItemBottling.Def(Rec."No.", Rec.GetFilter("Location Filter"), '', '', '', '', '', '');
//                             end;
//                             ItemBottling.StartSearching;
//                             ItemBottling.RunModal;
//                             Clear(ItemBottling);
//                             // << :PMW14.02:75:1
//                         end;
//                     }
//                     action("&Incorporation Usage")
//                     {
//                         Caption = '&Incorporation Usage';
//                         Enabled = ESACC_C5012407_Enabled;
//                         Image = "Where-Used";
//                         Visible = ESACC_C5012407_Visible;

//                         trigger OnAction()
//                         var
//                             IncorporationMgt: Codeunit "Incorporation Mgt.";
//                         begin
//                             // >> INCORPORATION:PMW16.00:135:1
//                             Rec.TestField("No.");
//                             IncorporationMgt.ShowIncorporationUsage(Rec."No.");
//                             // << INCORPORATION:PMW16.00:135:1
//                         end;
//                     }
//                 }
//             }
//             group(History)
//             {
//                 Caption = 'History';
//                 Image = History;
//                 group("E&ntries")
//                 {
//                     Caption = 'E&ntries';
//                     Image = Entries;
//                     action("Ledger E&ntries")
//                     {
//                         Caption = 'Ledger E&ntries';
//                         Enabled = ESACC_C14_Enabled;
//                         Image = ItemLedger;
//                         Promoted = false;
//                         //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                         //PromotedCategory = Process;
//                         RunObject = Page "Item Ledger Entries";
//                         RunPageLink = "Item No." = FIELD("No.");
//                         RunPageView = SORTING("Item No.");
//                         ShortCutKey = 'Ctrl+F7';
//                         Visible = ESACC_C14_Visible;
//                     }
//                     action("&Reservation Entries")
//                     {
//                         Caption = '&Reservation Entries';
//                         Enabled = ESACC_C77_Enabled;
//                         Image = ReservationLedger;
//                         RunObject = Page "Reservation Entries";
//                         RunPageLink = "Reservation Status" = CONST(Reservation),
//                                       "Item No." = FIELD("No.");
//                         RunPageView = SORTING("Item No.", "Variant Code", "Location Code", "Reservation Status");
//                         Visible = ESACC_C77_Visible;
//                     }
//                     action("&Phys. Inventory Ledger Entries")
//                     {
//                         Caption = '&Phys. Inventory Ledger Entries';
//                         Enabled = ESACC_C23_Enabled;
//                         Image = PhysicalInventoryLedger;
//                         RunObject = Page "Phys. Inventory Ledger Entries";
//                         RunPageLink = "Item No." = FIELD("No.");
//                         RunPageView = SORTING("Item No.");
//                         Visible = ESACC_C23_Visible;
//                     }
//                     action("&Value Entries")
//                     {
//                         Caption = '&Value Entries';
//                         Enabled = ESACC_C5800_Enabled;
//                         Image = ValueLedger;
//                         RunObject = Page "Value Entries";
//                         RunPageLink = "Item No." = FIELD("No.");
//                         RunPageView = SORTING("Item No.");
//                         Visible = ESACC_C5800_Visible;
//                     }
//                     action("Item &Tracking Entries")
//                     {
//                         Caption = 'Item &Tracking Entries';
//                         Enabled = ESACC_C6500_Enabled;
//                         Image = ItemTrackingLedger;
//                         Visible = ESACC_C6500_Visible;

//                         trigger OnAction()
//                         var
//                             ItemTrackingDocMgt: Codeunit "Item Tracking Doc. Management";
//                         begin
//                             ItemTrackingDocMgt.ShowItemTrackingForMasterData(3, '', Rec."No.", '', '', '', '');
//                         end;
//                     }
//                     action("&Warehouse Entries")
//                     {
//                         Caption = '&Warehouse Entries';
//                         Enabled = ESACC_C7_Enabled;
//                         Image = BinLedger;
//                         RunObject = Page "Warehouse Entries";
//                         RunPageLink = "Item No." = FIELD("No.");
//                         RunPageView = SORTING("Item No.", "Bin Code", "Location Code", "Variant Code", "Unit of Measure Code", "Lot No.", "Serial No.", "Entry Type", Dedicated);
//                         Visible = ESACC_C7_Visible;
//                     }
//                 }
//                 group(Statistics)
//                 {
//                     Caption = 'Statistics';
//                     Image = Statistics;
//                     action(Action16)
//                     {
//                         Caption = 'Statistics';
//                         Enabled = ESACC_C16_Enabled;
//                         Image = Statistics;
//                         Promoted = true;
//                         PromotedCategory = Process;
//                         ShortCutKey = 'F7';
//                         Visible = ESACC_C16_Visible;

//                         trigger OnAction()
//                         var
//                             ItemStatistics: Page "Item Statistics";
//                         begin
//                             ItemStatistics.SetItem(Rec);
//                             ItemStatistics.RunModal;
//                         end;
//                     }
//                     action("Entry Statistics")
//                     {
//                         Caption = 'Entry Statistics';
//                         Enabled = ESACC_C17_Enabled;
//                         Image = EntryStatistics;
//                         RunObject = Page "Item Entry Statistics";
//                         RunPageLink = "No." = FIELD("No."),
//                                       "Date Filter" = FIELD("Date Filter"),
//                                       "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
//                                       "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
//                                       "Location Filter" = FIELD("Location Filter"),
//                                       "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
//                                       "Variant Filter" = FIELD("Variant Filter");
//                         Visible = ESACC_C17_Visible;
//                     }
//                     action("T&urnover")
//                     {
//                         Caption = 'T&urnover';
//                         Enabled = ESACC_C22_Enabled;
//                         Image = Turnover;
//                         RunObject = Page "Item Turnover";
//                         RunPageLink = "No." = FIELD("No."),
//                                       "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
//                                       "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
//                                       "Location Filter" = FIELD("Location Filter"),
//                                       "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
//                                       "Variant Filter" = FIELD("Variant Filter");
//                         Visible = ESACC_C22_Visible;
//                     }
//                 }
//                 action("Co&mments")
//                 {
//                     Caption = 'Co&mments';
//                     Enabled = ESACC_C15_Enabled;
//                     Image = ViewComments;
//                     RunObject = Page "Comment Sheet";
//                     RunPageLink = "Table Name" = CONST(Item),
//                                   "No." = FIELD("No.");
//                     Visible = ESACC_C15_Visible;
//                 }
//             }
//             group("&Quality Management")
//             {
//                 Caption = '&Quality Management';
//                 action("&Test Status")
//                 {
//                     Caption = '&Test Status';
//                     Enabled = ESACC_C5034553_Enabled;
//                     Image = ShowMatrix;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     RunObject = Page "Quality and Test Status";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     RunPageView = SORTING("Item No.", "Vendor No.");
//                     Visible = ESACC_C5034553_Visible;
//                 }
//                 separator(Action5034552)
//                 {
//                 }
//                 action("Test Plan Set&up")
//                 {
//                     Caption = 'Test Plan Set&up';
//                     Enabled = ESACC_C5034551_Enabled;
//                     Image = Approvals;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;
//                     RunObject = Page "Test Plan Setup";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     Visible = ESACC_C5034551_Visible;
//                 }
//                 action("Retain Sample Instruction")
//                 {
//                     Caption = 'Retain Sample Instruction';
//                     Enabled = ESACC_C5034554_Enabled;
//                     Image = Evaluate;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     RunObject = Page "Retain Sample Instruction";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     Visible = ESACC_C5034554_Visible;
//                 }
//             }
//             group("S&ales")
//             {
//                 Caption = 'S&ales';
//                 Image = Sales;
//                 action(Prices)
//                 {
//                     Caption = 'Prices';
//                     Enabled = ESACC_C36_Enabled;
//                     Image = Price;
//                     RunObject = Page "Sales Prices";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     RunPageView = SORTING("Item No.");
//                     Visible = ESACC_C36_Visible;
//                 }
//                 action("Line Discounts")
//                 {
//                     Caption = 'Line Discounts';
//                     Enabled = ESACC_C34_Enabled;
//                     Image = LineDiscount;
//                     RunObject = Page "Sales Line Discounts";
//                     RunPageLink = Type = CONST(Item),
//                                   Code = FIELD("No.");
//                     RunPageView = SORTING(Type, Code);
//                     Visible = ESACC_C34_Visible;
//                 }
//                 action("Prepa&yment Percentages")
//                 {
//                     Caption = 'Prepa&yment Percentages';
//                     Enabled = ESACC_C124_Enabled;
//                     Image = PrepaymentPercentages;
//                     RunObject = Page "Sales Prepayment Percentages";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     Visible = ESACC_C124_Visible;
//                 }
//                 action("R&estricted Sales")
//                 {
//                     Caption = 'R&estricted Sales';
//                     Enabled = ESACC_C5012405_Enabled;
//                     Image = CancelledEntries;
//                     RunObject = Page "Restricted Sales Setup";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     RunPageView = SORTING("Item No.");
//                     Visible = ESACC_C5012405_Visible;
//                 }
//                 action("Remain. She&lf Life Setup")
//                 {
//                     Caption = 'Remain. She&lf Life Setup';
//                     Enabled = ESACC_C5012403_Enabled;
//                     Image = SetupList;
//                     RunObject = Page "Remain. Shelf Life Setup";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     RunPageView = SORTING("Item No.", "Item Category Code", "Sales Type", "Sales Code");
//                     Visible = ESACC_C5012403_Visible;
//                 }
//                 action(Orders)
//                 {
//                     Caption = 'Orders';
//                     Enabled = ESACC_C37_Enabled;
//                     Image = Document;
//                     RunObject = Page "Sales Orders";
//                     RunPageLink = Type = CONST(Item),
//                                   "No." = FIELD("No.");
//                     RunPageView = SORTING("Document Type", Type, "No.");
//                     Visible = ESACC_C37_Visible;
//                 }
//                 action("Returns Orders")
//                 {
//                     Caption = 'Returns Orders';
//                     Enabled = ESACC_C114_Enabled;
//                     Image = ReturnOrder;
//                     RunObject = Page "Sales Return Orders";
//                     RunPageLink = Type = CONST(Item),
//                                   "No." = FIELD("No.");
//                     RunPageView = SORTING("Document Type", Type, "No.");
//                     Visible = ESACC_C114_Visible;
//                 }
//                 action("Returnable &Containers")
//                 {
//                     Caption = 'Returnable &Containers';
//                     Enabled = ESACC_C5012404_Enabled;
//                     Image = ReceiveLoaner;
//                     RunObject = Page "Item Returnable Containers";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     RunPageView = SORTING("Item No.", "No.");
//                     Visible = ESACC_C5012404_Visible;
//                 }
//                 action("&Commission Rates")
//                 {
//                     Caption = '&Commission Rates';
//                     Enabled = ESACC_C5172103_Enabled;
//                     Image = SalesLineDisc;
//                     RunObject = Page "Commission Rates";
//                     RunPageLink = Type = CONST(Item),
//                                   Code = FIELD("No.");
//                     RunPageView = SORTING(Type, Code);
//                     Visible = ESACC_C5172103_Visible;
//                 }
//             }
//             group("&Purchases")
//             {
//                 Caption = '&Purchases';
//                 Image = Purchasing;
//                 action("Ven&dors")
//                 {
//                     Caption = 'Ven&dors';
//                     Enabled = ESACC_C118_Enabled;
//                     Image = Vendor;
//                     RunObject = Page "Item Vendor Catalog";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     RunPageView = SORTING("Item No.");
//                     Visible = ESACC_C118_Visible;
//                 }
//                 action(Action39)
//                 {
//                     Caption = 'Prices';
//                     Enabled = ESACC_C39_Enabled;
//                     Image = Price;
//                     RunObject = Page "Purchase Prices";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     RunPageView = SORTING("Item No.");
//                     Visible = ESACC_C39_Visible;
//                 }
//                 action(Action42)
//                 {
//                     Caption = 'Line Discounts';
//                     Enabled = ESACC_C42_Enabled;
//                     Image = LineDiscount;
//                     RunObject = Page "Purchase Line Discounts";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     RunPageView = SORTING("Item No.");
//                     Visible = ESACC_C42_Visible;
//                 }
//                 action(Action125)
//                 {
//                     Caption = 'Prepa&yment Percentages';
//                     Enabled = ESACC_C125_Enabled;
//                     Image = PrepaymentPercentages;
//                     RunObject = Page "Purchase Prepmt. Percentages";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     Visible = ESACC_C125_Visible;
//                 }
//                 action(Action40)
//                 {
//                     Caption = 'Orders';
//                     Enabled = ESACC_C40_Enabled;
//                     Image = Document;
//                     RunObject = Page "Purchase Orders";
//                     RunPageLink = Type = CONST(Item),
//                                   "No." = FIELD("No.");
//                     RunPageView = SORTING("Document Type", Type, "No.");
//                     Visible = ESACC_C40_Visible;
//                 }
//                 action("Return Orders")
//                 {
//                     Caption = 'Return Orders';
//                     Enabled = ESACC_C115_Enabled;
//                     Image = ReturnOrder;
//                     RunObject = Page "Purchase Return Orders";
//                     RunPageLink = Type = CONST(Item),
//                                   "No." = FIELD("No.");
//                     RunPageView = SORTING("Document Type", Type, "No.");
//                     Visible = ESACC_C115_Visible;
//                 }
//                 action("Nonstoc&k Items")
//                 {
//                     Caption = 'Nonstoc&k Items';
//                     Enabled = ESACC_C76_Enabled;
//                     Image = NonStockItem;
//                     RunObject = Page "Nonstock Item List";
//                     Visible = ESACC_C76_Visible;
//                 }
//             }
//             group("&Job")
//             {
//                 Caption = '&Job';
//                 action("C&omments and Documents")
//                 {
//                     Caption = 'C&omments and Documents';
//                     Enabled = ESACC_C5292333_Enabled;
//                     Image = Comment;
//                     RunObject = Page "PR - Job Comment Lines";
//                     RunPageLink = "Table ID" = CONST(27),
//                                   Code1 = FIELD("No."),
//                                   Int1 = CONST(0);
//                     RunPageView = SORTING("Table ID", Code1, Code2, Code3, Code4, Int1, Type, "Line No.");
//                     Visible = ESACC_C5292333_Visible;
//                 }
//                 group("Component Groups")
//                 {
//                     Caption = 'Component Groups';
//                     Image = Setup;
//                     action("Set Component Groups")
//                     {
//                         Caption = 'Set Component Groups';
//                         Enabled = ESACC_C5292335_Enabled;
//                         Image = Track;
//                         //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                         //PromotedCategory = Category4;
//                         ShortCutKey = 'Ctrl+G';
//                         Visible = ESACC_C5292335_Visible;

//                         trigger OnAction()
//                         var
//                             ComponentGroup: Record "PR - Component Group";
//                             GroupFilter: array[100] of Integer;
//                             ComponentGroupsSelection: Page "PR - Component Groups Sel.";
//                         begin
//                             Clear(GroupFilter);
//                             ComponentGroupsSelection.LoadExpandLevel(
//                               "Component Group 1 No.",
//                               "Component Group 2 No.",
//                               "Component Group 3 No.",
//                               "Component Group 4 No.",
//                               "Component Group 5 No.");

//                             ComponentGroupsSelection.LookupMode := true;
//                             if ComponentGroupsSelection.RunModal = ACTION::LookupOK then begin
//                                 ComponentGroupsSelection.GetGroupFilter(GroupFilter);
//                                 "Component Group 1 No." := GroupFilter[1];
//                                 "Component Group 2 No." := GroupFilter[2];
//                                 "Component Group 3 No." := GroupFilter[3];
//                                 "Component Group 4 No." := GroupFilter[4];
//                                 "Component Group 5 No." := GroupFilter[5];
//                                 Rec.Modify;
//                             end;
//                         end;
//                     }
//                     action("Delete Component Groups")
//                     {
//                         Caption = 'Delete Component Groups';
//                         Enabled = ESACC_C5292336_Enabled;
//                         Image = Undo;
//                         Visible = ESACC_C5292336_Visible;

//                         trigger OnAction()
//                         begin
//                             "Component Group 1 No." := 0;
//                             "Component Group 2 No." := 0;
//                             "Component Group 3 No." := 0;
//                             "Component Group 4 No." := 0;
//                             "Component Group 5 No." := 0;
//                             Rec.Modify;
//                         end;
//                     }
//                 }
//                 action("Set &Group Filters")
//                 {
//                     Caption = 'Set &Group Filters';
//                     Enabled = ESACC_C5292337_Enabled;
//                     Image = FilterLines;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'Ctrl+G';
//                     Visible = ESACC_C5292337_Visible;

//                     trigger OnAction()
//                     var
//                         ComponentGroup: Record "PR - Component Group";
//                         ComponentGroupsSelection: Page "PR - Component Groups Sel.";
//                         GroupFilter: array[100] of Integer;
//                     begin
//                         Rec.SetRange("Component Group 1 No.");
//                         Rec.SetRange("Component Group 2 No.");
//                         Rec.SetRange("Component Group 3 No.");
//                         Rec.SetRange("Component Group 4 No.");
//                         Rec.SetRange("Component Group 5 No.");
//                         Rec.SetCurrentKey("No.");

//                         Clear(GroupFilter);
//                         ComponentGroupsText := '';

//                         Clear(ComponentGroupsSelection);
//                         ComponentGroupsSelection.LoadExpandLevel(
//                           "Component Group 1 No.",
//                           "Component Group 2 No.",
//                           "Component Group 3 No.",
//                           "Component Group 4 No.",
//                           "Component Group 5 No.");

//                         ComponentGroupsSelection.LookupMode := true;
//                         if ComponentGroupsSelection.RunModal = ACTION::LookupOK then begin
//                             ComponentGroupsSelection.GetGroupFilter(GroupFilter);

//                             // Group Filter
//                             if GroupFilter[1] <> 0 then begin
//                                 Rec.SetCurrentKey("Component Group 1 No.");
//                                 Rec.SetRange("Component Group 1 No.", GroupFilter[1]);
//                             end;
//                             if ComponentGroup.Get(GroupFilter[2]) then
//                                 Rec.SetRange("Component Group 2 No.", GroupFilter[2]);
//                             if ComponentGroup.Get(GroupFilter[3]) then
//                                 Rec.SetRange("Component Group 3 No.", GroupFilter[3]);
//                             if ComponentGroup.Get(GroupFilter[4]) then
//                                 Rec.SetRange("Component Group 4 No.", GroupFilter[4]);
//                             if ComponentGroup.Get(GroupFilter[5]) then
//                                 Rec.SetRange("Component Group 5 No.", GroupFilter[5]);

//                             // Group Text
//                             if ComponentGroup.Get(GroupFilter[1]) then
//                                 ComponentGroupsText := ComponentGroup.Code;
//                             if ComponentGroup.Get(GroupFilter[2]) then
//                                 ComponentGroupsText := ComponentGroupsText + '|' + ComponentGroup.Code;
//                             if ComponentGroup.Get(GroupFilter[3]) then
//                                 ComponentGroupsText := ComponentGroupsText + '|' + ComponentGroup.Code;
//                             if ComponentGroup.Get(GroupFilter[4]) then
//                                 ComponentGroupsText := ComponentGroupsText + '|' + ComponentGroup.Code;
//                             if ComponentGroup.Get(GroupFilter[5]) then
//                                 ComponentGroupsText := ComponentGroupsText + '|' + ComponentGroup.Code;

//                         end;
//                     end;
//                 }
//             }
//             group("&Rental")
//             {
//                 Caption = '&Rental';
//                 Image = Sales;
//                 action(Action5072651)
//                 {
//                     Caption = 'Prices';
//                     Enabled = ESACC_C5072651_Enabled;
//                     Image = Price;
//                     RunObject = Page "Sales Prices";
//                     RunPageLink = "Item No." = FIELD("No."),
//                                   "Rental Rate Code" = FILTER(<> ''),
//                                   "Rate Component Type" = CONST(" ");
//                     RunPageView = SORTING("Item No.");
//                     Visible = ESACC_C5072651_Visible;
//                 }
//                 action(Action5072652)
//                 {
//                     Caption = 'Line Discounts';
//                     Enabled = ESACC_C5072652_Enabled;
//                     Image = LineDiscount;
//                     RunObject = Page "Sales Line Discounts";
//                     RunPageLink = Type = CONST(Item),
//                                   Code = FIELD("No.");
//                     RunPageView = SORTING(Type, Code)
//                                   WHERE("Rental Rate Code" = FILTER(<> ''));
//                     Visible = ESACC_C5072652_Visible;
//                 }
//                 action(Action5072653)
//                 {
//                     Caption = 'Prepa&yment Percentages';
//                     Enabled = ESACC_C5072653_Enabled;
//                     Image = PrepaymentPercentages;
//                     RunObject = Page "Sales Prepayment Percentages";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     Visible = false;
//                 }
//                 separator(Action5072654)
//                 {
//                 }
//                 action(Action5072655)
//                 {
//                     Caption = 'Orders';
//                     Enabled = ESACC_C5072655_Enabled;
//                     Image = Document;
//                     RunObject = Page "Sales Orders";
//                     RunPageLink = Type = CONST(Item),
//                                   "No." = FIELD("No."),
//                                   "Rental Position" = CONST(Rental);
//                     RunPageView = SORTING("Document Type", Type, "No.");
//                     Visible = ESACC_C5072655_Visible;
//                 }
//                 separator(Action5072656)
//                 {
//                 }
//                 action("Item Rent Rate Components")
//                 {
//                     Caption = 'Item Rent Rate Components';
//                     Enabled = ESACC_C5072657_Enabled;
//                     Image = Agreement;
//                     RunObject = Page "Item Rent Rate Components";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     Visible = ESACC_C5072657_Visible;
//                 }
//                 action("Rate Component Prices")
//                 {
//                     Caption = 'Rate Component Prices';
//                     Enabled = ESACC_C5072660_Enabled;
//                     Image = Price;
//                     RunObject = Page "Rent Component Prices";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     RunPageView = SORTING("Item No.", "Sales Type", "Sales Code", "Starting Date", "Currency Code", "Variant Code", "Unit of Measure Code", "Minimum Quantity", "Rental Rate Code", "Rate Component Type", "Rate Component No.");
//                     Visible = ESACC_C5072660_Visible;
//                 }
//             }
//             group(Warehouse)
//             {
//                 Caption = 'Warehouse';
//                 Image = Warehouse;
//                 action("&Bin Contents")
//                 {
//                     Caption = '&Bin Contents';
//                     Enabled = ESACC_C116_Enabled;
//                     Image = BinContent;
//                     RunObject = Page "Item Bin Contents";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     RunPageView = SORTING("Item No.");
//                     Visible = ESACC_C116_Visible;
//                 }
//                 action("Stockkeepin&g Units")
//                 {
//                     Caption = 'Stockkeepin&g Units';
//                     Enabled = ESACC_C81_Enabled;
//                     Image = SKU;
//                     RunObject = Page "Stockkeeping Unit List";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     RunPageView = SORTING("Item No.");
//                     Visible = ESACC_C81_Visible;
//                 }
//             }
//             group(Service)
//             {
//                 Caption = 'Service';
//                 Image = ServiceItem;
//                 action("Ser&vice Items")
//                 {
//                     Caption = 'Ser&vice Items';
//                     Enabled = ESACC_C103_Enabled;
//                     Image = ServiceItem;
//                     RunObject = Page "Service Items";
//                     RunPageLink = "Item No." = FIELD("No.");
//                     RunPageView = SORTING("Item No.");
//                     Visible = ESACC_C103_Visible;
//                 }
//                 action(Troubleshooting)
//                 {
//                     AccessByPermission = TableData "Service Header" = R;
//                     Caption = 'Troubleshooting';
//                     Enabled = ESACC_C11_Enabled;
//                     Image = Troubleshoot;
//                     Visible = ESACC_C11_Visible;

//                     trigger OnAction()
//                     var
//                         TroubleshootingHeader: Record "Troubleshooting Header";
//                     begin
//                         TroubleshootingHeader.ShowForItem(Rec);
//                     end;
//                 }
//                 action("Troubleshooting Setup")
//                 {
//                     Caption = 'Troubleshooting Setup';
//                     Enabled = ESACC_C105_Enabled;
//                     Image = Troubleshoot;
//                     RunObject = Page "Troubleshooting Setup";
//                     RunPageLink = Type = CONST(Item),
//                                   "No." = FIELD("No.");
//                     Visible = ESACC_C105_Visible;
//                 }
//             }
//             group(Resources)
//             {
//                 Caption = 'Resources';
//                 Image = Resource;
//                 group("R&esource")
//                 {
//                     Caption = 'R&esource';
//                     Image = Resource;
//                     action("Resource &Skills")
//                     {
//                         Caption = 'Resource &Skills';
//                         Enabled = ESACC_C108_Enabled;
//                         Image = ResourceSkills;
//                         RunObject = Page "Resource Skills";
//                         RunPageLink = Type = CONST(Item),
//                                       "No." = FIELD("No.");
//                         Visible = ESACC_C108_Visible;
//                     }
//                     action("Skilled R&esources")
//                     {
//                         AccessByPermission = TableData "Service Header" = R;
//                         Caption = 'Skilled R&esources';
//                         Enabled = ESACC_C109_Enabled;
//                         Image = ResourceSkills;
//                         Visible = ESACC_C109_Visible;

//                         trigger OnAction()
//                         var
//                             ResourceSkill: Record "Resource Skill";
//                         begin
//                             Clear(SkilledResourceList);
//                             SkilledResourceList.Initialize(ResourceSkill.Type::Item, Rec."No.", Rec.Description);
//                             SkilledResourceList.RunModal;
//                         end;
//                     }
//                 }
//             }
//             action("Open DocumentBox")
//             {
//                 AccessByPermission = TableData "DMS - Document Library" = R;
//                 Caption = 'Open DocumentBox';
//                 Enabled = ESACC_C5306001_Enabled;
//                 Image = ViewDocumentLine;
//                 Visible = ESACC_C5306001_Visible;

//                 trigger OnAction()
//                 var
//                     AsyncDocumentBox: Page "DMS - Doc. Box FactBox Async";
//                     RecRef: RecordRef;
//                 begin
//                     // >> CCDMS
//                     RecRef.GetTable(Rec);
//                     AsyncDocumentBox.SetRecordRef(RecRef);
//                     AsyncDocumentBox.SetIndependentPage(true, CurrPage.Caption);
//                     AsyncDocumentBox.Run;
//                     // << CCDMS
//                 end;
//             }
//         }
//         area(processing)
//         {
//             action("&Workflow Context Menu")
//             {
//                 Caption = '&Workflow Context Menu';
//                 Enabled = ESACC_C5103601_Enabled;
//                 Image = ExplodeBOM;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 ShortCutKey = 'Shift+Ctrl+W';
//                 Visible = ESACC_C5103601_Visible;

//                 trigger OnAction()
//                 var
//                     WorkflowContextMenu: Page "Workflow Context Menu";
//                     RecRef: RecordRef;
//                     MessagePageID: Integer;
//                 begin
//                     // >> WF
//                     RecRef.GetTable(Rec);
//                     Evaluate(MessagePageID, CopyStr(CurrPage.ObjectId(false),
//                       StrPos(CurrPage.ObjectId(false), ' ') + 1, StrLen(CurrPage.ObjectId(false))));
//                     WorkflowContextMenu.SetRecRef(RecRef);
//                     WorkflowContextMenu.SetObjectID(MessagePageID);
//                     WorkflowContextMenu.RunModal;
//                     Clear(WorkflowContextMenu);
//                     // << WF
//                 end;
//             }
//             group("Request Approval")
//             {
//                 Caption = 'Request Approval';
//                 Image = SendApprovalRequest;
//                 action(SendApprovalRequest)
//                 {
//                     Caption = 'Send A&pproval Request';
//                     Enabled = NOT OpenApprovalEntriesExist;
//                     Image = SendApprovalRequest;
//                     Visible = ESACC_C87_Visible;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         if ApprovalsMgmt.CheckItemApprovalsWorkflowEnabled(Rec) then
//                             ApprovalsMgmt.OnSendItemForApproval(Rec);
//                     end;
//                 }
//                 action(CancelApprovalRequest)
//                 {
//                     Caption = 'Cancel Approval Re&quest';
//                     Enabled = OpenApprovalEntriesExist;
//                     Image = Cancel;
//                     Visible = ESACC_C86_Visible;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         ApprovalsMgmt.OnCancelItemApprovalRequest(Rec);
//                     end;
//                 }
//             }
//             group("F&unctions")
//             {
//                 Caption = 'F&unctions';
//                 Image = "Action";
//                 action("&Create Stockkeeping Unit")
//                 {
//                     AccessByPermission = TableData "Stockkeeping Unit" = R;
//                     Caption = '&Create Stockkeeping Unit';
//                     Enabled = ESACC_C111_Enabled;
//                     Image = CreateSKU;
//                     Visible = ESACC_C111_Visible;

//                     trigger OnAction()
//                     var
//                         Item: Record Item;
//                     begin
//                         Item.SetRange("No.", Rec."No.");
//                         REPORT.RunModal(REPORT::"Create Stockkeeping Unit", true, false, Item);
//                     end;
//                 }
//                 action("C&alculate Counting Period")
//                 {
//                     AccessByPermission = TableData "Phys. Invt. Item Selection" = R;
//                     Caption = 'C&alculate Counting Period';
//                     Enabled = ESACC_C7380_Enabled;
//                     Image = CalculateCalendar;
//                     Visible = ESACC_C7380_Visible;

//                     trigger OnAction()
//                     var
//                         Item: Record Item;
//                         PhysInvtCountMgt: Codeunit "Phys. Invt. Count.-Management";
//                     begin
//                         CurrPage.SetSelectionFilter(Item);
//                         PhysInvtCountMgt.UpdateItemPhysInvtCount(Item);
//                     end;
//                 }
//                 action(CopyItem)
//                 {
//                     Caption = 'C&opy Item';
//                     Enabled = ESACC_C1000000_Enabled;
//                     Visible = ESACC_C1000000_Visible;

//                     trigger OnAction()
//                     var
//                         CopyItem: Report "Item Copy";
//                         ReturnItem: Record Item;
//                     begin
//                         CopyItem.ItemDef(Rec);
//                         CopyItem.RunModal;
//                         if CopyItem.ItemReturn(ReturnItem) then
//                             if Confirm(Text11500, true) then
//                                 Rec := ReturnItem;
//                     end;
//                 }
//                 action("&Search && Replace Item")
//                 {
//                     Caption = '&Search && Replace Item';
//                     Enabled = ESACC_C5013401_Enabled;
//                     Image = ExchProdBOMItem;
//                     Visible = ESACC_C5013401_Visible;

//                     trigger OnAction()
//                     var
//                         ItemReplaceMgt: Codeunit "Item Replace Management";
//                     begin
//                         // >> :DMW14.00:1:01
//                         ItemReplaceMgt.Code(Rec."No.");
//                         // << :DMW14.00:1:01
//                     end;
//                 }
//             }
//             action("Sales Prices")
//             {
//                 Caption = 'Sales Prices';
//                 Enabled = ESACC_C1901240604_Enabled;
//                 Image = SalesPrices;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 RunObject = Page "Sales Prices";
//                 RunPageLink = "Item No." = FIELD("No.");
//                 RunPageView = SORTING("Item No.");
//                 Visible = ESACC_C1901240604_Visible;
//             }
//             action("Sales Line Discounts")
//             {
//                 Caption = 'Sales Line Discounts';
//                 Enabled = ESACC_C1900869004_Enabled;
//                 Image = SalesLineDisc;
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = Process;
//                 RunObject = Page "Sales Line Discounts";
//                 RunPageLink = Type = CONST(Item),
//                               Code = FIELD("No.");
//                 RunPageView = SORTING(Type, Code);
//                 Visible = ESACC_C1900869004_Visible;
//             }
//             action("Requisition Worksheet")
//             {
//                 Caption = 'Requisition Worksheet';
//                 Enabled = ESACC_C1905370404_Enabled;
//                 Image = Worksheet;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 RunObject = Page "Req. Worksheet";
//                 Visible = ESACC_C1905370404_Visible;
//             }
//             action("Item Journal")
//             {
//                 Caption = 'Item Journal';
//                 Enabled = ESACC_C1904344904_Enabled;
//                 Image = Journals;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 RunObject = Page "Item Journal";
//                 Visible = ESACC_C1904344904_Visible;
//             }
//             action("Item Reclassification Journal")
//             {
//                 Caption = 'Item Reclassification Journal';
//                 Enabled = ESACC_C1906716204_Enabled;
//                 Image = Journals;
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = Process;
//                 RunObject = Page "Item Reclass. Journal";
//                 Visible = ESACC_C1906716204_Visible;
//             }
//             action("Item Tracing")
//             {
//                 Caption = 'Item Tracing';
//                 Enabled = ESACC_C1902532604_Enabled;
//                 Image = ItemTracing;
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = Process;
//                 RunObject = Page "Item Tracing";
//                 Visible = ESACC_C1902532604_Visible;
//             }
//             action("Adjust Item Cost/Price")
//             {
//                 Caption = 'Adjust Item Cost/Price';
//                 Enabled = ESACC_C1900805004_Enabled;
//                 Image = AdjustItemCost;
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = Process;
//                 RunObject = Report "Adjust Item Costs/Prices";
//                 Visible = ESACC_C1900805004_Visible;
//             }
//             action("Adjust Cost - Item Entries")
//             {
//                 Caption = 'Adjust Cost - Item Entries';
//                 Enabled = ESACC_C1907108104_Enabled;
//                 Image = AdjustEntries;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 RunObject = Report "Adjust Cost - Item Entries";
//                 Visible = ESACC_C1907108104_Visible;
//             }
//         }
//         area(reporting)
//         {
//             action("Inventory - List")
//             {
//                 Caption = 'Inventory - List';
//                 Enabled = ESACC_C1900907306_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Inventory - List";
//                 Visible = ESACC_C1900907306_Visible;
//             }
//             action("Item Register - Quantity")
//             {
//                 Caption = 'Item Register - Quantity';
//                 Enabled = ESACC_C1907629906_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Item Register - Quantity";
//                 Visible = ESACC_C1907629906_Visible;
//             }
//             action("Inventory - Transaction Detail")
//             {
//                 Caption = 'Inventory - Transaction Detail';
//                 Enabled = ESACC_C1904068306_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Inventory - Transaction Detail";
//                 Visible = ESACC_C1904068306_Visible;
//             }
//             action("Inventory Availability")
//             {
//                 Caption = 'Inventory Availability';
//                 Enabled = ESACC_C1901091106_Enabled;
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 RunObject = Report "Inventory Availability";
//                 Visible = ESACC_C1901091106_Visible;
//             }
//             action(Status)
//             {
//                 Caption = 'Status';
//                 Enabled = ESACC_C1901254106_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report Status;
//                 Visible = ESACC_C1901254106_Visible;
//             }
//             action("Inventory - Availability Plan")
//             {
//                 Caption = 'Inventory - Availability Plan';
//                 Enabled = ESACC_C1906212206_Enabled;
//                 Image = ItemAvailability;
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Inventory - Availability Plan";
//                 Visible = ESACC_C1906212206_Visible;
//             }
//             action("Inventory Order Details")
//             {
//                 Caption = 'Inventory Order Details';
//                 Enabled = ESACC_C1903262806_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Inventory Order Details";
//                 Visible = ESACC_C1903262806_Visible;
//             }
//             action("Inventory Purchase Orders")
//             {
//                 Caption = 'Inventory Purchase Orders';
//                 Enabled = ESACC_C1904739806_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Inventory Purchase Orders";
//                 Visible = ESACC_C1904739806_Visible;
//             }
//             action("Inventory - Top 10 List")
//             {
//                 Caption = 'Inventory - Top 10 List';
//                 Enabled = ESACC_C1907930606_Enabled;
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 RunObject = Report "Inventory - Top 10 List";
//                 Visible = ESACC_C1907930606_Visible;
//             }
//             action("Inventory - Sales Statistics")
//             {
//                 Caption = 'Inventory - Sales Statistics';
//                 Enabled = ESACC_C1900762706_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Inventory - Sales Statistics";
//                 Visible = ESACC_C1900762706_Visible;
//             }
//             action("Assemble to Order - Sales")
//             {
//                 Caption = 'Assemble to Order - Sales';
//                 Enabled = ESACC_C18_Enabled;
//                 Image = "Report";
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Assemble to Order - Sales";
//                 Visible = ESACC_C18_Visible;
//             }
//             action("Inventory - Customer Sales")
//             {
//                 Caption = 'Inventory - Customer Sales';
//                 Enabled = ESACC_C1904034006_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Inventory - Customer Sales";
//                 Visible = ESACC_C1904034006_Visible;
//             }
//             action("Inventory - Vendor Purchases")
//             {
//                 Caption = 'Inventory - Vendor Purchases';
//                 Enabled = ESACC_C1906231806_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Inventory - Vendor Purchases";
//                 Visible = ESACC_C1906231806_Visible;
//             }
//             action("Price List")
//             {
//                 Caption = 'Price List';
//                 Enabled = ESACC_C1905572506_Enabled;
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 RunObject = Report "Price List";
//                 Visible = ESACC_C1905572506_Visible;
//             }
//             action("Inventory Cost and Price List")
//             {
//                 Caption = 'Inventory Cost and Price List';
//                 Enabled = ESACC_C1900128906_Enabled;
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 RunObject = Report "Inventory Cost and Price List";
//                 Visible = ESACC_C1900128906_Visible;
//             }
//             action("Inventory - Reorders")
//             {
//                 Caption = 'Inventory - Reorders';
//                 Enabled = ESACC_C1906101206_Enabled;
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 RunObject = Report "Inventory - Reorders";
//                 Visible = ESACC_C1906101206_Visible;
//             }
//             action("Inventory - Sales Back Orders")
//             {
//                 Caption = 'Inventory - Sales Back Orders';
//                 Enabled = ESACC_C1900210306_Enabled;
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 RunObject = Report "Inventory - Sales Back Orders";
//                 Visible = ESACC_C1900210306_Visible;
//             }
//             action("Item/Vendor Catalog")
//             {
//                 Caption = 'Item/Vendor Catalog';
//                 Enabled = ESACC_C1900430206_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Item/Vendor Catalog";
//                 Visible = ESACC_C1900430206_Visible;
//             }
//             action("Inventory - Cost Variance")
//             {
//                 Caption = 'Inventory - Cost Variance';
//                 Enabled = ESACC_C1900730006_Enabled;
//                 Image = ItemCosts;
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Inventory - Cost Variance";
//                 Visible = ESACC_C1900730006_Visible;
//             }
//             action("Phys. Inventory List")
//             {
//                 Caption = 'Phys. Inventory List';
//                 Enabled = ESACC_C1907644006_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Phys. Inventory List";
//                 Visible = ESACC_C1907644006_Visible;
//             }
//             action("Inventory Valuation")
//             {
//                 Caption = 'Inventory Valuation';
//                 Enabled = ESACC_C1906316306_Enabled;
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 RunObject = Report "Inventory Valuation";
//                 Visible = ESACC_C1906316306_Visible;
//             }
//             action("Nonstock Item Sales")
//             {
//                 Caption = 'Nonstock Item Sales';
//                 Enabled = ESACC_C1907253406_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Nonstock Item Sales";
//                 Visible = ESACC_C1907253406_Visible;
//             }
//             action("Item Substitutions")
//             {
//                 Caption = 'Item Substitutions';
//                 Enabled = ESACC_C1905753506_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Item Substitutions";
//                 Visible = ESACC_C1905753506_Visible;
//             }
//             action("Invt. Valuation - Cost Spec.")
//             {
//                 Caption = 'Invt. Valuation - Cost Spec.';
//                 Enabled = ESACC_C1904299906_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Invt. Valuation - Cost Spec.";
//                 Visible = ESACC_C1904299906_Visible;
//             }
//             action("Inventory Valuation - WIP")
//             {
//                 Caption = 'Inventory Valuation - WIP';
//                 Enabled = ESACC_C1907928706_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Inventory Valuation - WIP";
//                 Visible = ESACC_C1907928706_Visible;
//             }
//             action("Item Register - Value")
//             {
//                 Caption = 'Item Register - Value';
//                 Enabled = ESACC_C1902962906_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Item Register - Value";
//                 Visible = ESACC_C1902962906_Visible;
//             }
//             action("Item Charges - Specification")
//             {
//                 Caption = 'Item Charges - Specification';
//                 Enabled = ESACC_C1900461506_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Item Charges - Specification";
//                 Visible = ESACC_C1900461506_Visible;
//             }
//             action("Item Age Composition - Qty.")
//             {
//                 Caption = 'Item Age Composition - Qty.';
//                 Enabled = ESACC_C1900111206_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Item Age Composition - Qty.";
//                 Visible = ESACC_C1900111206_Visible;
//             }
//             action("Item Age Composition - Value")
//             {
//                 Caption = 'Item Age Composition - Value';
//                 Enabled = ESACC_C1903496006_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Item Age Composition - Value";
//                 Visible = ESACC_C1903496006_Visible;
//             }
//             action("Item Expiration - Quantity")
//             {
//                 Caption = 'Item Expiration - Quantity';
//                 Enabled = ESACC_C1906747006_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Item Expiration - Quantity";
//                 Visible = ESACC_C1906747006_Visible;
//             }
//             action("Cost Shares Breakdown")
//             {
//                 Caption = 'Cost Shares Breakdown';
//                 Enabled = ESACC_C1905889606_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Cost Shares Breakdown";
//                 Visible = ESACC_C1905889606_Visible;
//             }
//             action("Detailed Calculation")
//             {
//                 Caption = 'Detailed Calculation';
//                 Enabled = ESACC_C1901374406_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Detailed Calculation";
//                 Visible = ESACC_C1901374406_Visible;
//             }
//             action("Rolled-up Cost Shares")
//             {
//                 Caption = 'Rolled-up Cost Shares';
//                 Enabled = ESACC_C1900812706_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Rolled-up Cost Shares";
//                 Visible = ESACC_C1900812706_Visible;
//             }
//             action("Single-Level Cost Shares")
//             {
//                 Caption = 'Single-Level Cost Shares';
//                 Enabled = ESACC_C1901316306_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Single-level Cost Shares";
//                 Visible = ESACC_C1901316306_Visible;
//             }
//             action("Where-Used (Top Level)")
//             {
//                 Caption = 'Where-Used (Top Level)';
//                 Enabled = ESACC_C1902353206_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Where-Used (Top Level)";
//                 Visible = ESACC_C1902353206_Visible;
//             }
//             action("Quantity Explosion of BOM")
//             {
//                 Caption = 'Quantity Explosion of BOM';
//                 Enabled = ESACC_C1907778006_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Quantity Explosion of BOM";
//                 Visible = ESACC_C1907778006_Visible;
//             }
//             action("Compare List")
//             {
//                 Caption = 'Compare List';
//                 Enabled = ESACC_C1907846806_Enabled;
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Report "Compare List";
//                 Visible = ESACC_C1907846806_Visible;
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     var
//         CRMCouplingManagement: Codeunit "CRM Coupling Management";
//     begin
//         SetSocialListeningFactboxVisibility;

//         CRMIsCoupledToRecord :=
//           CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId) and CRMIntegrationEnabled;

//         OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);

//         // >> CCDMS
//         UpdateDocumentBox;
//         // << CCDMS
//     end;

//     trigger OnAfterGetRecord()
//     begin
//         SetSocialListeningFactboxVisibility;
//         DescriptionIndent := 0;
//         // >> #PXW16.00:106
//         Rec.ShowShortcutMfgDimCode(ShortcutMfgDimCode);
//         // << #PXW16.00:106
//         NoOnFormat;
//         DescriptionOnFormat;
//     end;

//     trigger OnOpenPage()
//     var
//         CRMIntegrationManagement: Codeunit "CRM Integration Management";
//     begin
//         CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
//         // >> PR01
//         AMGranuleEnabled := JobsSetup.GranuleCheckPermission(6, 2);
//         // << PR01
//         ;
//         ESACC_EasySecurity(true);
//     end;

//     var

//         SkilledResourceList: Page "Skilled Resource List";
//  CalculateStdCost: Codeunit "Calculate Standard Cost";
//         ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
//         Text11500: Label 'Do you want to edit the new item?';
//         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//         [InDataSet]
//         SocialListeningSetupVisible: Boolean;
//         [InDataSet]
//         SocialListeningVisible: Boolean;
//         CRMIntegrationEnabled: Boolean;
//         CRMIsCoupledToRecord: Boolean;
//         OpenApprovalEntriesExist: Boolean;
//         "--- PR ---": Integer;
//         ComponentGroupsText: Text[1000];
//         JobsSetup: Record "Jobs Setup";
//         AMGranuleEnabled: Boolean;
//         "---- PM Vars ----": Integer;
//         LicPermission: Record "License Permission";
//         TradingUnitManagement: Codeunit "Trading Unit Management";
//         "---- PX Variables ----": Integer;
//         ShortcutMfgDimCode: array[8] of Code[20];
//         [InDataSet]
//         "No.Emphasize": Boolean;
//         [InDataSet]
//         DescriptionEmphasize: Boolean;
//         [InDataSet]
//         DescriptionIndent: Integer;
//         "--- CCDMS Vars. ---": Integer;
//         DocumentBoxVisible: Boolean;



// [Scope('OnPrem')]
//     procedure GetSelectionFilter(): Text
//     var
//         Item: Record Item;
//         SelectionFilterManagement: Codeunit SelectionFilterManagement;
//     begin
//         CurrPage.SetSelectionFilter(Item);
//         exit(SelectionFilterManagement.GetSelectionFilterForItem(Item));
// ;

//             [Scope('OnPrem')]
//     procedure SetSelection(var Item: Record Item)
//     begin
//         CurrPage.SetSelectionFilter(Item);
//     end;

//     local procedure SetSocialListeningFactboxVisibility()
//     var
//         SocialListeningMgt: Codeunit "Social Listening Management";
//     begin
//         SocialListeningMgt.GetItemFactboxVisibility(Rec, SocialListeningSetupVisible, SocialListeningVisible);
//     end;

//     [Scope('OnPrem')]
//     procedure "---- CA Func ----"()
//     begin
//     end;

//     [Scope('OnPrem')]
//     procedure ShowCalculation()
//     var
//         CalculationMgt: Codeunit "CCS CA Calculation Mgt.";
//     begin
//         // >> #CAW16.00:T100
//         CalculationMgt.ShowItemCalculation(Rec);
//         // << #CAW16.00:T100
//     end;

//     [Scope('OnPrem')]
// procedure "---- PM Func ----"()
//     begin
//         end;

//     [Scope('OnPrem')]
//     procedure ShowDeliveryToleranceEntries()
//     var
//         DeliveryTolerancesServices: Codeunit "CCS PM Deliv. Tol. Services";
//     begin
//         // >> :PMW14.00:2473:1
//         DeliveryTolerancesServices.ShowItemDelivTolEntries(Rec);
//         // << :PMW14.00:2473:1
//     end;

//     [Scope('OnPrem')]
//     procedure ShowItemByTradingUnit()
//     var
//         StructureManagement: Codeunit "Structure Management";
//     begin
//         // >> :PMW14.01:2466:1
//         Rec.TestField("No.");
//         StructureManagement.ShowItemByTrdgUnit(Rec."No.");
//         // << :PMW14.01:2466:1
//     end;

//     local procedure NoOnFormat()
//     begin
//         // >> :PMW15.00.01:45:1
//         LicPermission.Get(LicPermission."Object Type"::Codeunit, CODEUNIT::"Trading Unit Management");
//         if LicPermission."Execute Permission" = LicPermission."Execute Permission"::Yes then begin
//             // >> :PMW14.02:90:1
//             "No.Emphasize" := TradingUnitManagement.GetFontBoldForItemList(Rec); // :PMW16.00:115:1
//                                                                                  // << :PMW14.02:90:1
//         end;
//         // << :PMW15.00.01:45:1
//     end;

//     local procedure DescriptionOnFormat()
//     begin
//         // >> :PMW15.00.01:45:1
//         LicPermission.Get(LicPermission."Object Type"::Codeunit, CODEUNIT::"Trading Unit Management");
//         if LicPermission."Execute Permission" = LicPermission."Execute Permission"::Yes then begin
//             // >> :PMW14.02:90:1
//             // >> :PMW16.00:115:1
//             DescriptionEmphasize := TradingUnitManagement.GetFontBoldForItemList(Rec);
//             DescriptionIndent := TradingUnitManagement.GetIndentForItemList(Rec);
//             // << :PMW16.00:115:1

//             // >> #PMW18.00:T501
//             if DescriptionIndent = 1 then begin
//                 Rec.Description := '   ' + Rec.Description;
//             end;
//             // << #PMW18.00:T501

//             // << :PMW14.02:90:1
//         end;
//         // << :PMW15.00.01:45:1
//     end;

//     local procedure "--- CCDMS Fcts. ---"()
//     begin
//     end;

//     [Scope('OnPrem')]
//     procedure UpdateDocumentBox()
//     var
//         ChangeLog: Codeunit "Change Log Management";
//         RecRef: RecordRef;
//     begin
//         // >> CCDMS
//         DocumentBoxVisible := ChangeLog.CheckLicensePermission('CCDMS');
//         if DocumentBoxVisible then begin
//             RecRef.GetTable(Rec);
//             if CurrPage.DocumentBox.PAGE.SetRecordRef(RecRef) then
//                 CurrPage.DocumentBox.PAGE.UpdateDocumentBox;
//         end;
//         // << CCDMS
//     end;
// }

