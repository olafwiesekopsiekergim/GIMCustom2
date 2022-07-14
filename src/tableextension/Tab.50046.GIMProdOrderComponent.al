/// <summary>
/// TableExtension "GIMProdOrderComponent" (ID 50046) extends Record Prod. Order Component.
/// </summary>
tableextension 50046 GIMProdOrderComponent extends "Prod. Order Component"
{
    fields
    {
        // Add changes to table fields here
        field(50000; Level; Integer)
        {
            Caption = 'Ebene';
            Description = 'für Begin/Ende Stückliste';
        }
        field(50001; "Auftragnr."; Code[20])
        {
            CalcFormula = Lookup("Production Order"."Evtl. Auftragsnr." WHERE("No." = FIELD("Prod. Order No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50002; "Drawing No."; Text[50])
        {
            Caption = 'Zeichnungsnr.';
            Description = '#AT';
        }
    }

    var
        myInt: Integer;
}