/// <summary>
/// TableExtension "GIMServiceCommentLine" (ID 50055) extends Record Service Comment Line.
/// </summary>
tableextension 50055 GIMServiceCommentLine extends "Service Comment Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; ServiceItemNo; Code[20])
        {
            CalcFormula = Lookup("Service Item Line"."Service Item No." WHERE("Document No." = FIELD("No."),
                                                                               "Line No." = FIELD("Table Line No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}