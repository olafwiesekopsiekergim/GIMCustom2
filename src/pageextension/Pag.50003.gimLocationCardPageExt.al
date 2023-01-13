pageextension 50003 "gimLocationCardPageExt" extends "Location Card"
{
    layout
    {
        addafter(General)
        {
            field("Debitorennr."; "Debitorennr.")
            {
                Description = 'P0001';
                ApplicationArea = All;
            }
            field("Lief. an Code"; "Lief. an Code")
            {
                Description = 'P0001';
                ApplicationArea = All;
            }
            field("RMD Lagerort"; "RMD Lagerort")
            {
                Description = 'P0001';
                ApplicationArea = All;
            }
        }

    }
}