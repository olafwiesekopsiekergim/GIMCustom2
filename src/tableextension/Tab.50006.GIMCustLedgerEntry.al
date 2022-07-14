/// <summary>
/// TableExtension GIM Cust. Ledger Entry (ID 50006) extends Record Cust. Ledger Entry.
/// </summary>
tableextension 50006 "GIM Cust. Ledger Entry" extends "Cust. Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50000; Vertreter; Code[20])
        {
        }
        field(50005; Sachbearbeiter; Code[20])
        {
        }
        field(50010; "Provision %"; Decimal)
        {
        }
        field(50015; "Geschäftsbereich"; Code[20])
        {
        }
        field(50020; KST; Code[20])
        {
            CalcFormula = Lookup("G/L Entry"."Global Dimension 1 Code" WHERE("Document No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(50021; KTR; Code[20])
        {
            CalcFormula = Lookup("G/L Entry"."Global Dimension 2 Code" WHERE("Document No." = FIELD("Document No."),
                                                                              "Global Dimension 2 Code" = FILTER(<> '')));
            FieldClass = FlowField;
        }
        field(50025; Debitorenname; Text[100])
        {
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Customer No.")));
            FieldClass = FlowField;
        }
        field(50030; Mahnstufe; Integer)
        {
        }
    }

    var
        myInt: Integer;
}