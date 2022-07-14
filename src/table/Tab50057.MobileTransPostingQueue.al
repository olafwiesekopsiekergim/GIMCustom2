table 50057 "Mobile Trans. Posting Queue"
{
    Caption = 'Mobile Transaction Posting Queue';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; Type; Integer)
        {
            Caption = 'Type';
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(4; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
        }
        field(5; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
        field(6; "First Line No."; Integer)
        {
            Caption = 'First Line No.';
        }
        field(7; "Last Line No."; Integer)
        {
            Caption = 'Last Line No.';
        }
        field(10; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            Description = 'LM2.00.02';
        }
        field(11; "Recording No."; Integer)
        {
            Caption = 'Recording No.';
            Description = 'LM2.00.02';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

