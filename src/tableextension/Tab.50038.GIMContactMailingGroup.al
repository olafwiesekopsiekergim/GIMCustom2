/// <summary>
/// TableExtension "GIMContactMailingGroup" (ID 50038) extends Record Contact Mailing Group.
/// </summary>
tableextension 50038 GIMContactMailingGroup extends "Contact Mailing Group"
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
        field(50004; "Language Code"; Code[10])
        {
            CalcFormula = Lookup(Contact."Language Code" WHERE("No." = FIELD("Contact No.")));
            Caption = 'Language Code';
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50005; "Company No."; Code[20])
        {
            CalcFormula = Lookup(Contact."Company No." WHERE("No." = FIELD("Contact No.")));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}