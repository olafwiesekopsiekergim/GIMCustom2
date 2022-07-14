/// <summary>
/// TableExtension GIM Location (ID 50003) extends Record Location.
/// </summary>
tableextension 50003 "GIM Location" extends Location
{
    fields
    {
        // Add changes to table fields here
        field(50006; "RMD Lagerort"; Boolean)
        {
            Caption = 'RMD Lagerort';
            Description = 'P0001';
        }
        field(50011; Monteur; Code[10])
        {
            Description = 'Verkäufertabelle';
            TableRelation = "Salesperson/Purchaser";
        }
        field(50020; "Debitorennr."; Code[20])
        {
            Caption = 'Debitorennr.';
            Description = 'P0001';
            TableRelation = Customer;
        }
        field(50021; "Lief. an Code"; Code[10])
        {
            Caption = 'Lief. an Code';
            Description = 'P0001';
        }
    }

    var
        myInt: Integer;
}