/// <summary>
/// PageExtension gimServiceQuoteSubform (ID 50028) extends Record Service Quote Subform.
/// </summary>
pageextension 50028 "gimServiceQuoteLines" extends "Service Quote Lines"
{
    layout
    {
        addlast(Control1)
        {
            field(Position; Position)
            {
            }
        }
    }

    actions
    {
        addlast("F&unctions")
        {
            action(CopyServItemFromServItemLine)
            {
                Caption = 'Kopiere Serviceartikel aus Serviceartikelzeile';

                trigger OnAction()
                var
                    ServHeader: Record "Service Header";
                    GIMServiceManagement: Codeunit GIMServiceManagement;
                begin
                    ServHeader.Get("Document Type", "Document No.");
                    GIMServiceManagement.CopyServItemsFromServItemLineToServLine(ServHeader);
                end;
            }
            action(CopyFrom1toAll)
            {
                Caption = 'Kopiere von Zeile 1 in alle';
                Image = Allocate;

                trigger OnAction()
                var
                    ServLine: Record "Service Line";
                    GIMServiceMgmt: Codeunit GIMServiceManagement;
                begin
                    if Rec.FindFirst then
                        GIMServiceMgmt.ServiceLineCopyFromCurrToBeyond(Rec);
                end;
            }

        }
    }
}
