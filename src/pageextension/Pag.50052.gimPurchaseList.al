/// <summary>
/// PageExtension gimPurchaseList (ID 50052) extends Record Purchase List.
/// </summary>
pageextension 50052 gimPurchaseList extends "Purchase List"
{
    layout
    {
        addlast(Control1)
        {
            field(Sachbearbeiter; Sachbearbeiter)
            {


                trigger OnLookup(var Text: Text): Boolean
                var
                    UserMgt: Codeunit "User Management";
                begin
                    // >> P0014
                    UserMgt.DisplayUserInformation(Sachbearbeiter);
                    // << P0014
                end;
            }

            field("Confirmation received"; "Confirmation received")
            {
            }
            field(Genehmigungsstatus; Genehmigungsstatus)
            {
            }
        }
    }

}
