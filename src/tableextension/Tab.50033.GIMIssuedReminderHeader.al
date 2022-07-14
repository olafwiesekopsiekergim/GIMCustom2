/// <summary>
/// TableExtension "GIMIssuedReminderHeader" (ID 50033) extends Record Issued Reminder Header.
/// </summary>
tableextension 50033 GIMIssuedReminderHeader extends "Issued Reminder Header"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "E-Mail"; Text[200])
        {
            CalcFormula = Lookup("Custom Report Selection"."Send To Email" WHERE("Source No." = FIELD("Customer No."),
                                                                                  "Report ID" = FILTER(50087 | 50063)));
            Description = '#AT';
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}