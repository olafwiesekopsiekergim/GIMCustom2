/// <summary>
/// PageExtension gimRequestsToApprove (ID 50054) extends Record Requests to Approve.
/// </summary>
pageextension 50054 gimRequestsToApprove extends "Requests to Approve"
{
    layout
    {
        addfirst(factboxes)
        {
            part(ApprovCommentFactBoxGIM; ApprovCommentFactBoxGIM)
            {
                ShowFilter = true;
            }

        }
    }
}
