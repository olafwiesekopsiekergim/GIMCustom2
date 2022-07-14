
/// <summary>
/// TableExtension "GIMSalesLineArchive" (ID 50042) extends Record Sales Line Archive.
/// </summary>
tableextension 50042 GIMSalesLineArchive extends "Sales Line Archive"
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
        field(50151; "PZ drucken"; Boolean)
        {
            Caption = 'PZ drucken';
            Description = 'P0008';
        }
    }

    var
        myInt: Integer;
}