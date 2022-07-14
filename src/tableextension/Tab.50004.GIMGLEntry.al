/// <summary>
/// TableExtension GIM GL/Entry (ID 50004) extends Record GL/Entry.
/// </summary>
tableextension 50004 "GIM G/L Entry" extends "G/L Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50000; Dimesionscode; Code[20])
        {
            CalcFormula = Lookup("Dimension Set Entry"."Dimension Value Code" WHERE("Dimension Code" = FILTER('INTERNER-AUFTRAG'),
                                                                                     "Dimension Set ID" = FIELD("Dimension Set ID")));
            FieldClass = FlowField;
        }

    }

    var
        myInt: Integer;
}