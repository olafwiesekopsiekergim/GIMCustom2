table 50003 "Error Log"
{
    // P0004 15.02.16 DEBIE.ARE NAV2015 Modus changes
    // 
    // +--------------------------------------------------------------+
    // |                  Copyright MODUS Consult AG                  |
    // |                          Customizing                         |
    // +--------------------------------------------------------------+
    // Modul     Date      User      Description
    // MC        11.09.15  OK        Object created

    Caption = 'Error Log';
    DrillDownPageID = "Error Log";
    LookupPageID = "Error Log";

    fields
    {
        field(5; "Entry No."; BigInteger)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(7; "Error No."; Integer)
        {
            Caption = 'Error No.';
        }
        field(10; "Error Description"; Text[250])
        {
            Caption = 'Error Description';
        }
        field(15; "Attached to Entry No."; BigInteger)
        {
            Caption = 'Attached to Entry No.';
        }
        field(20; "Inserted at"; DateTime)
        {
            Caption = 'Inserted at';
        }
        field(30; "Inserted by"; Code[100])
        {
            Caption = 'Inserted by';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Error No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Inserted at" := CurrentDateTime;
        "Inserted by" := UserId;
    end;
}

