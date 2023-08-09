/// <summary>
/// TableExtension GIM Sales Line (ID 50010) extends Record Sales Line.
/// </summary>
tableextension 50010 "GIM Sales Line" extends "Sales Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Proportion of freight"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            Caption = 'Proportion of freight';
            Description = 'P0003';
            MinValue = 0;
        }
        field(50001; "Salesperson Code"; Code[10])
        {
            Caption = 'Salesperson Code';
            Description = 'P0032';
            TableRelation = "Salesperson/Purchaser";

            trigger OnValidate()
            var
                ApprovalEntry: Record "Approval Entry";
            begin
            end;
        }
        field(50002; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            Description = 'P0029';
        }
        field(50005; Frachtkosten; Boolean)
        {
            Description = 'P0007';

            trigger OnValidate()
            begin
                // >> P0007
                TestField(Type, Type::Item);
                if not Frachtkosten then
                    Frachtkostencode := '';
                // << P0007
            end;
        }
        field(50006; Frachtkostencode; Code[10])
        {
            Caption = 'Frachtkostencode';
            Description = 'P0007';
            TableRelation = "Frachtcodes (Fracht2)";

            trigger OnValidate()
            begin
                // >> P0007
                TestField(Type, Type::Item);
                if Frachtkostencode <> '' then
                    TestField(Frachtkosten, true);
                // << P0007
            end;
        }
        field(50007; "Line Gross Weight"; Decimal)
        {
            Caption = 'Line Gross Weight';
            DecimalPlaces = 0 : 5;
            Description = 'P0040';
            Editable = false;
        }
        field(50012; Position; Text[5])
        {
            Caption = 'Position';
            Description = 'P0008';
        }
        field(50030; "Qty. to Shipment"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Warehouse Activity Line"."Qty. Outstanding" WHERE("Activity Type" = CONST("Invt. Pick"),
                                                                                  "Source Type" = CONST(37),
                                                                                  "Source Subtype" = FIELD("Document Type"),
                                                                                  "Source No." = FIELD("Document No."),
                                                                                  "Source Line No." = FIELD("Line No.")));
            Caption = 'Qty. to Assign';
            Description = 'P0008';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50151; "PZ drucken"; Boolean)
        {
            Caption = 'PZ drucken';
            Description = 'P0008';

            trigger OnValidate()
            begin
                // >> P0008
                if Type <> Type::" " then
                    "PZ drucken" := false;
                // << P0008
            end;
        }
        field(50400; "Print on Slip"; Boolean)
        {
            Caption = 'Print on Slip';
            Description = '';

            trigger OnValidate()
            begin

            end;
        }

    }

    var
        myInt: Integer;
}