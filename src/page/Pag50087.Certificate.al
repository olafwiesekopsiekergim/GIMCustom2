page 50087 "GIMCertificate"
{
    // P0036 06.04.16 CCBIE.ARE New object

    Caption = 'Certificate';
    PageType = Card;
    SourceTable = "Acceptance Protocol Header";
    SourceTableView = SORTING(Code, Type)
                      ORDER(Ascending)
                      WHERE(Type = CONST("Inspection certificate"));

    layout
    {
        area(content)
        {
            group(Allgemein)
            {
                field("Code"; Rec.Code)
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
            part(Control1106900004; "Cerificate Subpage")
            {
                SubPageLink = "Test Certificate No." = FIELD(Code);
                UpdatePropagation = Both;
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

                    //TODO Report Zertifikat implementieren

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

