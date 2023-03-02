/// <summary>
/// Unknown DP_Einkauf (ID 50004).
/// </summary>
permissionset 50004 DP_Einkauf
{
    Assignable = true;
    Caption = 'Düperthal Einkauf', MaxLength = 30;
    Permissions =
        tabledata "Cust. Invoice Disc." = R,
        tabledata "Cust. Ledger Entry" = Rimd,
        tabledata "Job Journal Line" = RIM,
        tabledata "Drop Shpt. Post. Buffer" = R,
        tabledata "VAT Registration Log" = rimd,
        tabledata "Item Application Entry History" = RIM,
        tabledata "Certificate of Supply" = RIMD,
        tabledata "Contact" = RIMD,
        tabledata "Purch. Comment Line Archive" = RIM,
        tabledata "Sales Comment Line Archive" = RIMD,
        tabledata "Prod. Order Capacity Need" = RIMD,
        tabledata "Planning Error Log" = RIMD,
        tabledata "Capacity Ledger Entry" = Rim,
        tabledata "Inventory Adjmt. Entry (Order)" = Rim,
        tabledata "Posted Invt. Pick Header" = RIM,
        tabledata "Posted Invt. Pick Line" = RIM,
        tabledata "Purchase Cue" = RIMD,
        // tabledata "Cue Setup" = R,
        tabledata "EAN-Nummern" = RI,
        tabledata "d3 Journal" = RIM,
        tabledata "RMDHist Erfolgreich&Fehlerhaft" = R,
        tabledata "Hanning Setup" = R,
        tabledata "Acceptance Protocol Header" = R,
        tabledata "Acceptance Protocol Line" = R;
    // tabledata "COMSOL TG Verwaltung" = RIMD,
    // tabledata "Cost Account Setup" = RIMD,
    // tabledata "Project Account Setup" = RIMD,
    // tabledata "Bank Branch No." = R,
    // tabledata "Process Manufacturing Setup" = RIMD,
    // tabledata "Planning Extension Setup" = RIM,
    // tabledata "Configure to Order Setup" = RIMD,
    // tabledata "Item Drawing" = RIM,
    // tabledata "Sales Line Attribute" = RIMD,
    // tabledata "Sales Line Attribute Archive" = RIMD,
    // tabledata "Inventory Overview" = RIMD,
    // tabledata "Text Module Setup" = RIMD,
    // tabledata "Application detail line" = R,
    // tabledata "Scan Buffer" = RIMD,
    // tabledata "Scan Rules" = RIMD,
    // tabledata "Scan Command" = RIMD,
    // tabledata "Tracking Scan Doc. Lines" = RIMD,
    // tabledata "Scan Setup" = RIMD,
    // tabledata "Scan Process Buffer" = RIMD,
    // tabledata "Tracking Specification Scan" = RIMD,
    // tabledata "Scan Instruction" = RIMD,
    // tabledata "Detailed G/L Entry" = RIM,
    // tabledata "Routing Header" = RIM,
    // tabledata "Routing Line" = RIMD,
    // tabledata "Routing Version" = RIMD,
    // tabledata "Action Message Entry" = RIMD,
    // tabledata "Untracked Planning Element" = RIMD;

}
