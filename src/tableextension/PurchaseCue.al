/// <summary>
/// TableExtension GIMPurchaseCue (ID 50071) extends Record Purchase Cue.
/// </summary>
tableextension 50071 GIMPurchaseCue extends "Purchase Cue"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "Confirmation Received"; Integer)
        {
        }
        field(50002; "Purchaser Code Filter"; Code[30])
        {
        }
    }

    var
        myInt: Integer;
}