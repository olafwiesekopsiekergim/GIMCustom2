/// <summary>
/// TableExtension "GIMSegmentLine" (ID 50040) extends Record Segment Line.
/// </summary>
tableextension 50040 GIMSegmentLine extends "Segment Line"
{
    fields
    {
        // Add changes to table fields here
        field(50002; "E-Mail"; Text[80])
        {
            CalcFormula = Lookup(Contact."E-Mail" WHERE("No." = FIELD("Contact No.")));
            Caption = 'E-Mail';
            Description = '#AT';
            Editable = false;
            ExtendedDatatype = EMail;
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
        field(50004; Sprachcode; Code[10])
        {
            CalcFormula = Lookup(Contact."Language Code" WHERE("No." = FIELD("Contact No.")));
            Caption = 'Language Code';
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}