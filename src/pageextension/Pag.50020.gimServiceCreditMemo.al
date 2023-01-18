/// <summary>
/// PageExtension "gimServiceCreditMemo" (ID 50020) extends Record Service Credit Memo.
/// </summary>
pageextension 50020 gimServiceCreditMemo extends "Service Credit Memo"
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
