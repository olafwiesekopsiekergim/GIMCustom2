/// <summary>
/// PageExtension "gimPostedServiceCreditMemo" (ID 50041) extends Record Posted Service Credit Memo.
/// </summary>
pageextension 50041 gimPostedServiceCreditMemo extends "Posted Service Credit Memo"
{
    layout
    {
        addlast(General)
        {
            field("Service Salesperson Code"; "Service Salesperson Code")
            {

            }
        }
    }
}
