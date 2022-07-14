/// <summary>
/// TableExtension Id.
/// </summary>
tableextension 50050 "GIMWarehouseActivityHeader" extends "Warehouse Activity Header"
{
    fields
    {
        // Add changes to table fields here
        field(50040; "RM Gewicht (RMD)"; Decimal)
        {
            Caption = 'RM Gewicht (RMD)';
            Description = 'P0001';
        }
        field(50041; "RM Anzahl Colli (RMD)"; Integer)
        {
            Caption = 'RM Anzahl Colli (RMD)';
            Description = 'P0001';
        }
        field(50042; "RM Paketnr. (RMD)"; Text[30])
        {
            Caption = 'RM Paketnr. (RMD)';
            Description = 'P0001';
        }
        field(50043; "RM Zusteller (RMD)"; Code[10])
        {
            Caption = 'RM Zusteller (RMD)';
            Description = 'P0001';
        }
        field(50044; "RM Lieferscheinnr. (RMD)"; Code[20])
        {
            Caption = 'RM Lieferscheinnr. (RMD)';
            Description = 'P0001';
        }
        field(50045; "RMD Status"; Option)
        {
            Caption = 'RMD Status';
            Description = 'P0001';
            OptionCaption = ' ,freigegeben,übertragen,rückgemeldet,fehlerhaft rückgemeldet';
            OptionMembers = " ",freigegeben,"übertragen","rückgemeldet","fehlerhaft rückgemeldet";
        }
        field(50046; "RMD Rückinfo an Düperthal"; Boolean)
        {
            Caption = 'RMD Rückinfo an Düperthal';
            Description = 'P0001';
        }
        field(50047; "RMD Sammelsendung"; Boolean)
        {
            Caption = 'RMD Sammelsendung';
            Description = 'P0001';
        }
        field(50048; "RMD Deb.-KD-Nr. bei Spedition"; Text[30])
        {
            Caption = 'RMD Deb.-KD-Nr. bei Spedition';
            Description = 'P0001';
        }
        field(50049; "RMD-Packzettel Löschen erlaubt"; Boolean)
        {
            Caption = 'RMD-Packzettel Löschen erlaubt';
            Description = 'P0001';
        }
    }

    var
        myInt: Integer;
}