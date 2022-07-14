tableextension 50022 "GIMSalesCrMemoLine" extends "Sales Cr.Memo Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Proportion of freight"; Decimal)
        {
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