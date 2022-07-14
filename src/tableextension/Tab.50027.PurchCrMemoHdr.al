tableextension 50027 "PurchCrMemoHdr" extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        // Add changes to table fields here
        field(50014; "Our Account No."; Text[20])
        {
            Caption = 'Our Account No.';
            Description = 'P0010';
        }
        field(50400; RegistrierNr; Code[20])
        {
            Caption = 'Registration No.';
            Description = 'P0013 - Anbindung an D3';
            Numeric = true;
        }
        field(50401; d3_doc_id; Code[20])
        {
            CalcFormula = Lookup("d3 Journal".d3_doc_id WHERE("Source Type" = CONST(124),
                                                               "Source ID" = FIELD("No.")));
            Caption = 'd3 Dokument ID';
            Description = 'Anbindung an D3';
            Editable = false;
            FieldClass = FlowField;
        }
        field(77000; Sachbearbeiter; Code[50])
        {
            Description = 'P0014';
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            var
                UserSelection: Codeunit "User Selection";
            begin
                // >> P0014
                UserSelection.ValidateUserName(Sachbearbeiter);
                // << P0014
            end;
        }
    }

    var
        myInt: Integer;
}