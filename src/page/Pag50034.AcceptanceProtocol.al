page 50034 "Acceptance Protocol"
{
    // P0036 06.04.16 CCBIE.ARE New object

    Caption = 'Acceptance Protocol';
    PageType = Card;
    SourceTable = "Acceptance Protocol Header";
    SourceTableView = SORTING(Code, Type)
                      ORDER(Ascending)
                      WHERE(Type = FILTER("Test Certificate"));

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
            }
            part(Control1106900004; "Acceptance Protocol Subpage")
            {
                SubPageLink = "Test Certificate No." = FIELD(Code);
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::"Test Certificate";
    end;
}

