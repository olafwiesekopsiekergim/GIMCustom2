page 50026 "Debitorenposten mit Skonto"
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
                field("Pmt. Disc. Given (LCY)"; Rec."Pmt. Disc. Given (LCY)")
                {
                    Editable = false;
                }
                field("Original Pmt. Disc. Possible"; Rec."Original Pmt. Disc. Possible")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Rec.SetRange(Open, false);
        Rec.SetFilter("Pmt. Disc. Given (LCY)", '<>0');
    end;
}

