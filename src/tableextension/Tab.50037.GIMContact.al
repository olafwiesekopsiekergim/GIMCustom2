/// <summary>
/// TableExtension "GIMContact" (ID 50037) extends Record MyTargetTable.
/// </summary>
tableextension 50037 GIMContact extends Contact
{
    fields
    {
        // Add changes to table fields here
        field(50011; EstosLink; Text[250])
        {
            Description = '#AT';
        }
        field(50016; "Weiterleiten an"; Code[10])
        {
            Description = '#AT';
            TableRelation = "Salesperson/Purchaser";
        }
        field(50017; Messe; Code[10])
        {
            Description = '#AT';
            TableRelation = Messedaten;
        }
        field(50018; Visitenkarte; BLOB)
        {
            Description = '#AT';
            SubType = Bitmap;
        }
        field(50019; "Creation Date"; Date)
        {
        }
        field(50700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            Description = 'P0028';
            TableRelation = "Responsibility Center";
        }
    }

    var
        myInt: Integer;
}