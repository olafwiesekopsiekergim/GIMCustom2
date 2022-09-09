page 50090 "Mapping Sach Deb Kred"
{
    PageType = List;
    SourceTable = "Mapping Sach Deb Kred";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Art; Rec.Art)
                {
                    ApplicationArea = All;
                }
                field("Konto Alt"; Rec."Konto Alt")
                {
                    ApplicationArea = All;
                }
                field("Konto Neu"; Rec."Konto Neu")
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
            group("F&unktion")
            {
                Caption = 'F&unktion';
                action("Übernahme Sachkonto")
                {
                    Caption = 'Übernahme Sachkonto';
                    Image = Import;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        XMLPORT.Run(XMLPORT::"Import Mapping Sachkonto");
                    end;
                }
                action("Übernahme Debitoren/Kreditoren")
                {
                    Caption = 'Übernahme Debitoren/Kreditoren';
                    Image = Import;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        REPORT.Run(50140);
                    end;
                }
            }
        }
    }
}

