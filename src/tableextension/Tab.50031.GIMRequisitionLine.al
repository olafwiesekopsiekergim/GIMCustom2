/// <summary>
/// TableExtension "GIMRequisitionLine" (ID 50031) extends Record Requisition Line.
/// </summary>
tableextension 50031 GIMRequisitionLine extends "Requisition Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Run Card Pinted Date"; Date)
        {
            CalcFormula = Lookup("Production Order"."Run Card Pinted Date" WHERE(Status = FILTER(Released),
                                                                                  "No." = FIELD("Ref. Order No.")));
            Caption = 'Run card pinted date';
            Description = 'P0027';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}