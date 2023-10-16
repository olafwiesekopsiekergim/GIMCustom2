/// <summary>
/// TableExtension GIMProdOrderLine (ID 50075) extends Record Prod. Order Line.
/// </summary>
tableextension 50075 GIMProdOrderLine extends "Prod. Order Line"
{
    fields
    {
        field(50000; "Sales Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            Description = 'CC01';
            Editable = false;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,,,,,,,,,,Reservation';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",,,,,,,,,,Reservation;
        }
        field(50001; "Sales Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
            Description = 'CC01';
            Editable = false;
        }
        field(50002; "Sales Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
            Description = 'CC01';
            Editable = false;
        }
        field(50003; "Fix Date Delivery"; Text[20])
        {
            CalcFormula = Lookup("Sales Header"."fix-Termin Lieferung" WHERE("Document Type" = FIELD("Sales Document Type"),
                                                                              "No." = FIELD("Sales Document No.")));
            Caption = 'Fix Date Delivery';
            Description = 'CC01';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50004; Position; Text[5])
        {
            CalcFormula = Lookup("Sales Line".Position WHERE("Document Type" = FIELD("Sales Document Type"),
                                                              "Document No." = FIELD("Sales Document No."),
                                                              "Line No." = FIELD("Sales Line No.")));
            Caption = 'Position';
            Description = 'CC01';
            Editable = false;
            FieldClass = FlowField;
        }

    }
}
