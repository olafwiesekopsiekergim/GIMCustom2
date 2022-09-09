page 50003 "Error Log"
{
    // P0004 09.03.16 DEBIE.ARE NAV2015 Modus changes
    // 
    // +--------------------------------------------------------------+
    // |                  Copyright MODUS Consult AG                  |
    // |                          Customizing                         |
    // +--------------------------------------------------------------+
    // Modul     Date      User      Description
    // MC        11.09.15  OK        Object created

    Caption = 'Error Log';
    PageType = List;
    SourceTable = "Error Log";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Error No."; Rec."Error No.")
                {
                    ApplicationArea = All;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Error Description"; Rec."Error Description")
                {
                    ApplicationArea = All;
                }
                field("Attached to Entry No."; Rec."Attached to Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Inserted at"; Rec."Inserted at")
                {
                    ApplicationArea = All;
                }
                field("Inserted by"; Rec."Inserted by")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

