/// <summary>
/// TableExtension "GIMCertificateOfSupply" (ID 50036) extends Record MyTargetTable.
/// </summary>
tableextension 50036 GIMCertificateOfSupply extends "Certificate of Supply"
{
    fields
    {
        // Add changes to table fields here
        field(50001; Auftragsnummer; Code[20])
        {
            CalcFormula = Lookup("Sales Shipment Header"."Order No." WHERE("No." = FIELD("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; Rechnungsnummer; Code[20])
        {
            CalcFormula = Lookup("Sales Invoice Header"."No." WHERE("Order No." = FIELD(Auftragsnummer)));
            FieldClass = FlowField;
        }
        field(50003; "Sending Date"; Date)
        {
        }
    }

    var
        myInt: Integer;
}