page 50005 ApprovCommentFactBoxGIM
{
    Caption = 'ApprovCommentFactBoxGIM';
    PageType = ListPart;
    SourceTable = "Approval Comment Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("User ID"; "User ID")
                {
                }
                field("Date and Time"; "Date and Time")
                {
                }
                field(Comment; Comment)
                {
                }
            }
        }
    }

    /// <summary>
    /// SetFilterFromApprovalEntry.
    /// </summary>
    /// <param name="ApprovalEntry">Record "Approval Entry".</param>
    /// <returns>Return variable ReturnValue of type Boolean.</returns>
    procedure SetFilterFromApprovalEntry(ApprovalEntry: Record "Approval Entry") ReturnValue: Boolean
    begin
        SetRange("Table ID", ApprovalEntry."Table ID");
        SetRange("Record ID to Approve", ApprovalEntry."Record ID to Approve");

        ReturnValue := FindSet;
        CurrPage.Update(false);
    end;
}
