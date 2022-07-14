/// <summary>
/// TableExtension "GIMServiceOrderAllocation" (ID 50057) extends Record Service Order Allocation.
/// </summary>
tableextension 50057 GIMServiceOrderAllocation extends "Service Order Allocation"
{
    fields
    {
        // Add changes to table fields here
        field(50012; "Service Item Servicebarcode"; Code[10])
        {

            trigger OnLookup()
            begin
                ServItemLine.Reset;
                ServItemLine.SetRange("Document Type", "Document Type");
                ServItemLine.SetRange("Document No.", "Document No.");
                ServItemLine.Servicebarcode := "Service Item Servicebarcode";
                if PAGE.RunModal(0, ServItemLine) = ACTION::LookupOK then
                    Validate("Service Item Line No.", ServItemLine."Line No.");
            end;

            trigger OnValidate()
            begin
                if "Service Item Serial No." <> '' then begin
                    ServItemLine.Reset;
                    ServItemLine.SetRange("Document Type", "Document Type");
                    ServItemLine.SetRange("Document No.", "Document No.");
                    ServItemLine.SetRange(Servicebarcode, "Service Item Servicebarcode");
                    ServItemLine.FindFirst;
                    Validate("Service Item Line No.", ServItemLine."Line No.");
                end;
            end;
        }
    }

    var
        myInt: Integer;
        ServItemLine: Record "Service Item Line";
}