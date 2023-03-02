/// <summary>
/// Unknown DP_Konstruktion (ID 50005).
/// </summary>
permissionset 50005 DP_Konstruktion
{
    Assignable = true;
    Caption = 'Düperthal Konstruktion', MaxLength = 30;
    Permissions =
       tabledata "Sales Line" = R,
    tabledata "Purch. Rcpt. Header" = Rim,
    tabledata "Resource Group" = RIM,
    tabledata "Resource" = RIM,
    tabledata "Res. Ledger Entry" = Rim,
    tabledata "Resource Unit of Measure" = RIM,
    tabledata "Req. Wksh. Template" = RIM,
    tabledata "Transfer Route" = RIM,
    tabledata "Warehouse Request" = RIMD,
    tabledata "Warehouse Activity Line" = RIMD,
    tabledata "Avg. Cost Adjmt. Entry Point" = RIMD,
    tabledata "Inventory Adjmt. Entry (Order)" = RIM,
    tabledata "EAN-Nummern" = RIMD,
    tabledata "Kategorie" = RIMD,
    tabledata "Webshop-DS" = RIMD,
    tabledata "WebshopStammdaten- DS" = RIMD,
    tabledata "Acceptance Protocol Header" = RIM,
    tabledata "Acceptance Protocol Line" = RIMD,
    // tabledata "Process Manufacturing Setup" = RIM,
    // tabledata "Planning Extension Setup" = RIMD,
    // tabledata "Manufacturing Dimension" = RIMD,
    // tabledata "Manufacturing Dimension Value" = RIMD,
    // tabledata "Default Mfg. Dimension" = RIMD,
    // tabledata "Configure to Order Setup" = RIM,
    // tabledata "Item Drawing" = RIMD,
    // tabledata "Text Module Setup" = RIMD,
    // tabledata "Text Module Header" = RIMD,
    tabledata "Routing Version" = RIMD,
    Page "Kategorie" = X,
    Page "Webshop-DS" = X,
    Page "WebshopStammdaten-DS" = X;

}
