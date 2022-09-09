page 50033 "Acceptance Protocol List"
{
    Caption = 'Acceptance Protocols';
    CardPageID = "Acceptance Protocol";
    Editable = false;
    PageType = List;
    SourceTable = "Acceptance Protocol Header";
    SourceTableView = SORTING(Code, Type)
                      ORDER(Ascending)
                      WHERE(Type = FILTER("Test Certificate"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Print")
            {
                Caption = '&Print';
                Image = Print;
                action("Print Blank Certificate")
                {
                    Caption = 'Print Blank Certificate';
                    Image = Print;
                    ApplicationArea = All;

                    // trigger OnAction()
                    // var
                    //     Certificate: Report Zertifikat;
                    // begin
                    //     Certificate.SetBlankReport(true, Rec.Code);
                    //     Certificate.RunModal;
                    // end;
                }
            }
        }
    }
}

