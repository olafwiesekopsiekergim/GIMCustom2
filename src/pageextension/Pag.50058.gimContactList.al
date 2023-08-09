/// <summary>
/// PageExtension gimContactList (ID 50058) extends Record Contact List.
/// </summary>
pageextension 50058 gimContactList extends "Contact List"
{
    layout
    {
        addafter("Territory Code")
        {
            field("Responsibility Center";"Responsibility Center")
            {
                ApplicationArea=All;
            }
        }
    }
}
