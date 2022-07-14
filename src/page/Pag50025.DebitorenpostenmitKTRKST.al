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
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Due Date"; Rec."Due Date")
                {
                }
                field("Original Amt. (LCY)"; Rec."Original Amt. (LCY)")
                {
                }
                field("Remaining Amt. (LCY)"; Rec."Remaining Amt. (LCY)")
                {
                }
                field("Original Amount"; Rec."Original Amount")
                {
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                }
                field(Open; Rec.Open)
                {
                }
                field(KST; Rec.KST)
                {
                }
                field(KTR; Rec.KTR)
                {
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                }
                field(Debitorenname; Rec.Debitorenname)
                {
                }
                field(bis30T; bis30T)
                {
                    Caption = 'bis30T';
                }
                field(bis60T; bis60T)
                {
                    Caption = 'bis60T';
                }
                field(bis90T; bis90T)
                {
                    Caption = 'bis90T';
                }
                field(ueber90T; ueber90T)
                {
                    Caption = 'ueber90T';
                }
                field(Mahnstufe; Rec.Mahnstufe)
                {
                    Editable = false;
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

