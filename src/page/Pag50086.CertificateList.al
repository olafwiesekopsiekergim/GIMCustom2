page 50086 "GIMCertificate List"
{
    Caption = 'Certificates';
    CardPageID = GIMCertificate;
    Editable = false;
    PageType = List;
    SourceTable = "Acceptance Protocol Header";
    SourceTableView = SORTING(Code, Type)
                      ORDER(Ascending)
                      WHERE(Type = CONST("Inspection certificate"));

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
                field("Report Cert Name"; Rec."Report Cert Name")
                {
                    ApplicationArea = All;
                }
                field("Report Cert Name 2"; Rec."Report Cert Name 2")
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

