page 50086 "Certificate List"
{
    Caption = 'Certificates';
    CardPageID = Certificate;
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
                }
                field(Type; Rec.Type)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Report Cert Name"; Rec."Report Cert Name")
                {
                }
                field("Report Cert Name 2"; Rec."Report Cert Name 2")
                {
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

                    trigger OnAction()
                    var
                        Certificate: Report Zertifikat;
                    begin
                        Certificate.SetBlankReport(true, Rec.Code);
                        Certificate.RunModal;
                    end;
                }
            }
        }
    }
}

