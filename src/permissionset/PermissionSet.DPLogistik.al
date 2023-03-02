/// <summary>
/// Unknown DP_Logistik (ID 50006).
/// </summary>
permissionset 50006 DP_Logistik
{
    Assignable = true;
    Caption = 'Düperthal Logistik', MaxLength = 30;
    Permissions =
        tabledata "Payment Terms" = R,
        tabledata "Cust. Invoice Disc." = R,
        tabledata "Sales Header" = RM,
        tabledata "Item Journal Line" = RIMD,
        tabledata "Production Order" = R,
        tabledata "Post Value Entry to G/L" = RIM;
    // tabledata "Configure to Order Setup" = R;

}
