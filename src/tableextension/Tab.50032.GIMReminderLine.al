/// <summary>
/// TableExtension "GIMReminderLine" (ID 50032) extends Record Reminder Line.
/// </summary>
tableextension 50032 GIMReminderLine extends "Reminder Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Customer No."; Code[20])
        {
            CalcFormula = Lookup("Reminder Header"."Customer No." WHERE("No." = FIELD("Reminder No.")));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "Salesperson Code"; Code[20])
        {
            CalcFormula = Lookup("Cust. Ledger Entry"."Salesperson Code" WHERE("Document Type" = FIELD("Document Type"),
                                                                                "Document No." = FIELD("Document No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50002; "Customer Name"; Text[100])
        {
            CalcFormula = Lookup("Reminder Header".Name WHERE("No." = FIELD("Reminder No.")));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; KTR; Code[20])
        {
            CalcFormula = Lookup("G/L Entry"."Global Dimension 2 Code" WHERE("Document No." = FIELD("Document No."),
                                                                              "Global Dimension 2 Code" = FILTER(<> '')));
            Description = '#AT';
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}