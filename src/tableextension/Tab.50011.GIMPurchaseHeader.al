

tableextension 50011 "GIM Purchase Header" extends "Purchase Header"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "Confirmation received"; Boolean)
        {
            Caption = 'Bestätigung erhalten';
            Editable = false;
        }
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
        field(50401; Genehmigungsstatus; enum "Approval Status")
        {
            CalcFormula = Max("Approval Entry".Status WHERE("Table ID" = CONST(38),
                                                             "Document Type" = FIELD("Document Type"),
                                                             "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
            // OptionCaption = 'Created,Open,Canceled,Rejected,Approved';
            // OptionMembers = Created,Open,Canceled,Rejected,Approved;
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
                UserSelection.ValidateUserName("Sachbearbeiter");
            end;
        }
    }

    var
        myInt: Integer;
}