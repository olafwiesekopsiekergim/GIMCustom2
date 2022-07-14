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
                }
                field("Konto Alt"; Rec."Konto Alt")
                {
                }
                field("Konto Neu"; Rec."Konto Neu")
                {
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

                    trigger OnAction()
                    begin
                        XMLPORT.Run(XMLPORT::"Import Mapping Sachkonto");
                    end;
                }
                action("Übernahme Debitoren/Kreditoren")
                {
                    Caption = 'Übernahme Debitoren/Kreditoren';
                    Image = Import;

                    trigger OnAction()
                    begin
                        REPORT.Run(50140);
                    end;
                }
            }
        }
    }
}

