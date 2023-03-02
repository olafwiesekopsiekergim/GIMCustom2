/// <summary>
/// PageExtension "gimServiceOrder" (ID 50016) extends Record Service Order.
/// </summary>
pageextension 50016 gimServiceOrder extends "Service Order"
{
    layout
    {
        addlast(General)
        {
            field("PO Date"; "PO Date")
            {
                Caption = 'Bestelldatum';
            }
            field("External Document No."; "External Document No.")
            {
            }
            field("Qty Service Items"; "Qty Service Items")
            {
            }
            field("Service Salesperson Code"; "Service Salesperson Code")
            {
            }
            field("fix Termin-Lieferung"; "fix Termin-Lieferung")
            {
            }

        }
    }

    actions
    {
        addlast(Action27)
        {
            action(CopyFromLine1ToAll)
            {
                Caption = 'Kopiere von Zeile 1 in Alle';

                trigger OnAction()
                var
                    ServiceItemLine: Record "Service Item Line";
                    GIMServMgmt: Codeunit GIMServiceManagement;
                begin
                end;
            }
            action(CreateAnswerGroups)
            {
                Caption = 'Create AnswerGroups';

                trigger OnAction()
                var
                    GIMServiceManagement: Codeunit GIMServiceManagement;
                begin
                    //GIM0005 29.3.2022 ++++
                    //GIMServiceManagement.CreateAnswerGroups(Rec);
                    //GIM0005 ----
                end;
            }
        }

    }
}
