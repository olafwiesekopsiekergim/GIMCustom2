/// <summary>
/// PageExtension "gimSourceDocuments" (ID 50015) extends Record Source Documents.
/// </summary>
pageextension 50015 gimSourceDocuments extends "Source Documents"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {

            field("Zusatzstatus Auftrag"; "Zusatzstatus Auftrag")
            {
                Description = 'P0023';
            }
        }
    }

    actions
    {
        // Add changes to page actions here

    }

    var
        myInt: Integer;
}