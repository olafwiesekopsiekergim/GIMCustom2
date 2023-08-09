/// <summary>
/// PageExtension gimContactCard (ID 50059) extends Record Contact Card.
/// </summary>
pageextension 50059 gimContactCard extends "Contact Card"
{
    layout
    {
        addafter("Territory Code"){
            field("Responsibility Center";"Responsibility Center")
            {
                ApplicationArea=All;
            }
        }
    }
}
