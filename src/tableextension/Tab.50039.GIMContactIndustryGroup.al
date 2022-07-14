/// <summary>
/// TableExtension "GIMContactIndustryGroup" (ID 50039) extends Record MyTargetTable.
/// </summary>
tableextension 50039 GIMContactIndustryGroup extends "Contact Industry Group"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "Salesperson Code"; Code[20])
        {
            CalcFormula = Lookup(Contact."Salesperson Code" WHERE("No." = FIELD("Contact No.")));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; "Country/Region Code"; Code[10])
        {
            CalcFormula = Lookup(Contact."Country/Region Code" WHERE("No." = FIELD("Contact No.")));
            Caption = 'Country/Region Code';
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}