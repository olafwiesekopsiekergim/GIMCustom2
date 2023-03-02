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
}
