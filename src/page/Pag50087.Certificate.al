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
            part(Control1106900004; "Cerificate Subpage")
            {
                SubPageLink = "Test Certificate No." = FIELD(Code);
                UpdatePropagation = Both;
                ApplicationArea = All;
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

