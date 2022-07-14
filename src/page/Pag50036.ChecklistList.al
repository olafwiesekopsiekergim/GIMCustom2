page 50036 "Checklist List"
{
    // P0040 19.04.16 DEBIE.ARE Field added "VAT Registration No.". New object

    Caption = 'Checklist List';
    PageType = List;
    SourceTable = Checklist;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Language Code"; Rec."Language Code")
                {
                }
                field("Checklist Template"; Rec."Checklist Template")
                {
                }
            }
        }
    }

    actions
    {
    }
}

