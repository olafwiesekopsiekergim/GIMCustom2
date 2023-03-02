/// <summary>
/// Unknown DP_Marketing (ID 50007).
/// </summary>
permissionset 50007 DP_Marketing
{
    Assignable = true;
    Caption = 'Düperthal Marketing', MaxLength = 30;
    Permissions =
           tabledata "Item" = RIMD,
        tabledata "Webshop-DS" = RIMD,
        tabledata "WebshopStammdaten- DS" = RIMD,
        // tabledata "Configure to Order Setup" = R,
        // tabledata "Variable/Attribute Type" = RIMD,
        // tabledata "Attribute" = RIMD,
        Report "Customer/Item Sales" = X,
        Page "Webshop-DS" = X,
        Page "WebshopStammdaten-DS" = X;


}