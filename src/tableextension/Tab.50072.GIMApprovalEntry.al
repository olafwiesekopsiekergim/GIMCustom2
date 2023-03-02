/// <summary>
/// TableExtension GIMApprovalEntry (ID 50072) extends Record Approval Entry.
/// </summary>
tableextension 50072 GIMApprovalEntry extends "Approval Entry"
{
    fields
    {
        field(50000; DelegateToUserID; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }
}
