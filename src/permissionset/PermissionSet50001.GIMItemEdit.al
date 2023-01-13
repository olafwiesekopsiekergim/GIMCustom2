/// <summary>
/// Unknown "GIMItemEdit" (ID 50001).
/// </summary>
permissionset 50001 GIMItemEdit
{

    Assignable = true;
    Permissions =
        tabledata "Acceptance Protocol Header" = RIMD,
        tabledata "Acceptance Protocol Line" = RIMD,
        // tabledata "Beleg_Übergabe"=RIMD,
        tabledata Checklist = RIMD,
        tabledata "d3 Journal" = RIMD,
        tabledata "EAN-Nummern" = RIMD,
        tabledata "EMail per RMD-Beleg Setup" = RIMD,
        tabledata "Error Log" = RIMD,
        tabledata "Fracht1 (Frachtkosten)" = RIMD,
        tabledata Fracht2 = RIMD,
        tabledata "Frachtcodes (Fracht2)" = RIMD,
        tabledata "Gen. Jnl Post Log2" = RIMD,
        // tabledata "GIMPrüfzertifikatszeilen"=RIMD,
        // tabledata "Hanning Setup"=RIMD,
        tabledata "Internal Job" = RIMD,
        tabledata "Internal Job Line" = RIMD,
        tabledata "Item EAN" = RIMD,
        tabledata "Job Item Category" = RIMD,
        tabledata Kategorie = RIMD,
        tabledata "Location Service-DS" = RIMD,
        // tabledata "Mapping Sach Deb Kred"=RIMD,
        tabledata Messedaten = RIMD,
        // tabledata "Mobile Setup"=RIMD,
        // tabledata "Mobile Stock Control"=RIMD,
        // tabledata "Mobile Stock Control Function"=RIMD,
        // tabledata "Mobile Trans. Posting Queue"=RIMD,
        // tabledata "Mobile Transaction Effect"=RIMD,
        // tabledata "Mobile Transaction Head"=RIMD,
        // tabledata "Mobile Transaction Line"=RIMD,
        tabledata "Production Group" = RIMD,
        tabledata Pulverprogramm = RIMD,
        tabledata Reason = RIMD,
        // tabledata "RMD Einrichtung"=RIMD,
        tabledata "RMD Labelanweisung" = RIMD,
        // tabledata "RMDHist Erfolgreich&Fehlerhaft"=RIMD,
        // tabledata "Stammdaten_Übergabe"=RIMD,
        // tabledata "VIPPS Interface Entries"=RIMD,
        tabledata "Webshop-DS" = RIMD,
        tabledata "WebshopStammdaten- DS" = RIMD,
        tabledata WkzPuffer = RIMD,
        table "Acceptance Protocol Header" = X,
        table "Acceptance Protocol Line" = X,
        table "Beleg_Übergabe" = X,
        table Checklist = X,
        table "d3 Journal" = X,
        table "EAN-Nummern" = X,
        table "EMail per RMD-Beleg Setup" = X,
        table "Error Log" = X,
        table "Fracht1 (Frachtkosten)" = X,
        table Fracht2 = X,
        table "Frachtcodes (Fracht2)" = X,
        table "Gen. Jnl Post Log2" = X,
        table "GIMPrüfzertifikatszeilen" = X,
        table "Hanning Setup" = X,
        table "Internal Job" = X,
        table "Internal Job Line" = X,
        table "Item EAN" = X,
        table "Job Item Category" = X,
        table Kategorie = X,
        table "Location Service-DS" = X,
        table "Mapping Sach Deb Kred" = X,
        table Messedaten = X,
        table "Mobile Setup" = X,
        table "Mobile Stock Control" = X,
        table "Mobile Stock Control Function" = X,
        table "Mobile Trans. Posting Queue" = X,
        table "Mobile Transaction Effect" = X,
        table "Mobile Transaction Head" = X,
        table "Mobile Transaction Line" = X,
        table "Production Group" = X,
        table Pulverprogramm = X,
        table Reason = X,
        table "RMD Einrichtung" = X,
        table "RMD Labelanweisung" = X,
        table "RMDHist Erfolgreich&Fehlerhaft" = X,
        table "Stammdaten_Übergabe" = X,
        table "VIPPS Interface Entries" = X,
        table "Webshop-DS" = X,
        table "WebshopStammdaten- DS" = X,
        table WkzPuffer = X,
        codeunit "50100" = X,
        codeunit "Clean WithoutInventoryControl" = X,
        codeunit GIMServiceManagement = X,
        codeunit GLEntry_ModifyGIM = X,
        codeunit "Post Gen Jnl Line NEW" = X,
        codeunit ReterminateJobQueue = X,
        xmlport "Export Ext. Text" = X,
        xmlport "Import Bewegung ALT Daten" = X,
        xmlport "Import Mapping Sachkonto" = X,
        page "Acceptance Protocol" = X,
        page "Acceptance Protocol List" = X,
        page "Acceptance Protocol Subpage" = X,
        page "Arch. Sales Lines 2" = X,
        page "Auftrag-FA" = X,
        page "Cerificate Subpage" = X,
        page "Checklist List" = X,
        page "Debitorenposten mit KTR/KST" = X,
        page "Debitorenposten mit Skonto" = X,
        page "DS-Katalogartikel" = X,
        page "EMail per RMD-Beleg Setup" = X,
        page "Error Log" = X,
        page FieldsTable = X,
        page "Frachtcodes für Fracht2" = X,
        page GIMCertificate = X,
        page "GIMCertificate List" = X,
        page GIMCustomerlist = X,
        page "GIMPrüfzertifikatszeilen" = X,
        page "Hanning Belegübergabe" = X,
        page "Hanning Setup" = X,
        page "Hanning Stammdatenübergabe" = X,
        page "Internal Job Item Category" = X,
        page "Internal Job Subform" = X,
        page "Internal Jobs" = X,
        page "Internal Jobs List" = X,
        page Kategorie = X,
        page "Location Service" = X,
        page "Mahnungsvorschlagsübersicht" = X,
        page "Mapping Sach Deb Kred" = X,
        page "Messeübersicht" = X,
        page "Mobile Stock Control" = X,
        page "Mobile Stock Control Functions" = X,
        page "Mobile Transaction Card" = X,
        page "Mobile Transaction Subform" = X,
        page "Post. Sales Credit Memo Lines" = X,
        page "Post. Sales Invoice Lines" = X,
        page "Post. Service Cr. Memo  Lines" = X,
        page "Post. Service Invoice Lines" = X,
        page "Production Groups" = X,
        page "Production Orders" = X,
        page "Production Orders-Pulver" = X,
        page Pulverprogramm = X,
        page Reasons = X,
        page "RMD Einrichtung" = X,
        page "RMD Labelanweisung" = X,
        page "Sales Lines 2" = X,
        page "Sales Order Archive Overview" = X,
        page "Service Lines 2" = X,
        page "VIPPS Interface Entries" = X,
        page "Webshop-DS" = X,
        page "WebshopStammdaten-DS" = X,
        query "Count Sales Quotes" = X;
}