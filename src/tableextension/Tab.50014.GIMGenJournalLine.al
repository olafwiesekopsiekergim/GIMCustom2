/// <summary>
/// TableExtension GIM Gen. Journal Line (ID 50014) extends Record Gen. Journal Line.
/// </summary>
tableextension 50014 "GIM Gen. Journal Line" extends "Gen. Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; Vertreter; Code[20])
        {
        }
        field(50001; Zahlungsbedingung; Code[100])
        {
            CalcFormula = Lookup("Payment Terms".Description WHERE(Code = FIELD("Payment Terms Code")));
            FieldClass = FlowField;
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
        field(50020; ZahlungbedingungenAusgleich; Code[10])
        {
            CalcFormula = Lookup("Sales Invoice Header"."Payment Terms Code" WHERE("No." = FIELD("Applies-to Doc. No.")));
            FieldClass = FlowField;
        }
        field(50025; "UST-ID Stamm"; Text[20])
        {
            CalcFormula = Lookup(Customer."VAT Registration No." WHERE("No." = FIELD("Account No.")));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50401; d3_doc_id; Code[20])
        {
            CalcFormula = Lookup("d3 Journal".d3_doc_id WHERE("Source ID" = FIELD("Applies-to Doc. No.")));
            Caption = 'd3 Dokument ID';
            Description = 'Anbindung an D3';
            Editable = true;
            FieldClass = FlowField;
        }

    }

    var
        myInt: Integer;
}