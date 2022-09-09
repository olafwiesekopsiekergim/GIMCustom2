page 50025 "Debitorenposten mit KTR/KST"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Cust. Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                }
                field("Original Amt. (LCY)"; Rec."Original Amt. (LCY)")
                {
                    ApplicationArea = All;
                }
                field("Remaining Amt. (LCY)"; Rec."Remaining Amt. (LCY)")
                {
                    ApplicationArea = All;
                }
                field("Original Amount"; Rec."Original Amount")
                {
                    ApplicationArea = All;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = All;
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                    ApplicationArea = All;
                }
                field(Open; Rec.Open)
                {
                    ApplicationArea = All;
                }
                field(KST; Rec.KST)
                {
                    ApplicationArea = All;
                }
                field(KTR; Rec.KTR)
                {
                    ApplicationArea = All;
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ApplicationArea = All;
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    ApplicationArea = All;
                }
                field(Debitorenname; Rec.Debitorenname)
                {
                    ApplicationArea = All;
                }
                field(bis30T; bis30T)
                {
                    Caption = 'bis30T';
                    ApplicationArea = All;
                }
                field(bis60T; bis60T)
                {
                    Caption = 'bis60T';
                    ApplicationArea = All;
                }
                field(bis90T; bis90T)
                {
                    Caption = 'bis90T';
                    ApplicationArea = All;
                }
                field(ueber90T; ueber90T)
                {
                    Caption = 'ueber90T';
                    ApplicationArea = All;
                }
                field(Mahnstufe; Rec.Mahnstufe)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Rec.SetRange(Open, true);

        CalculateDate;
        Ueberfaelligkeit;
    end;

    var
        DueDate1: Date;
        DueDate2: Date;
        DueDate3: Date;
        bis30T: Decimal;
        bis60T: Decimal;
        bis90T: Decimal;
        ueber90T: Decimal;

    local procedure CalculateDate()
    begin
        DueDate1 := CalcDate('<+30D>', Rec."Due Date");
        DueDate2 := CalcDate('<+60D>', Rec."Due Date");
        DueDate3 := CalcDate('<+90D>', Rec."Due Date");
    end;

    local procedure Ueberfaelligkeit()
    begin
        if (Rec."Due Date" < Today) and (Today <= DueDate1) then
            bis30T := Rec."Remaining Amount"
        else
            bis30T := 0;
        if (DueDate1 < Today) and (Today <= DueDate2) then
            bis60T := Rec."Remaining Amount"
        else
            bis60T := 0;
        if (DueDate2 < Today) and (Today <= DueDate3) then
            bis90T := Rec."Remaining Amount"
        else
            bis90T := 0;
        if (DueDate3 < Today) then
            ueber90T := Rec."Remaining Amount"
        else
            ueber90T := 0;
    end;
}

