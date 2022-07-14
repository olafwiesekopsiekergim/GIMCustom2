/// <summary>
/// TableExtension "GIMItemJournalBatch" (ID 50029) extends Record Item Journal Batch.
/// </summary>
tableextension 50029 GIMItemJournalBatch extends "Item Journal Batch"
{
    fields
    {
        // Add changes to table fields here
        field(50045; "RMD Status"; Option)
        {
            Caption = 'RMD Status';
            Description = 'P0001';
            OptionMembers = " ",freigegeben,"übertragen","rückgemeldet","fehlerhaft rückgemeldet";
        }
        field(50046; "RMD Auftragsdatum"; Date)
        {
            Caption = 'RMD Auftragsdatum';
            Description = 'P0001';
        }
        field(50047; "RMD Lieferdatum"; Date)
        {
            Caption = 'RMD Lieferdatum';
            Description = 'P0001';
        }
        field(50048; "RMD Ihre Referenz"; Text[30])
        {
            Caption = 'RMD Ihre Referenz';
            Description = 'P0001';
        }
        field(50049; "RMD Externe Belegnummer"; Text[30])
        {
            Caption = 'RMD Externe Belegnummer';
            Description = 'P0001';
        }
        field(50050; "RMD BuBl-Zeilen Bedienercode"; Code[10])
        {
            Caption = 'RMD BuBl-Zeilen Bedienercode';
            Description = 'P0001';
        }
        field(50051; "RMD Status Auftrag"; Option)
        {
            Description = 'P0001';
            OptionMembers = normal,"Abruf gesperrt","Vorkasse gesperrt",Gesamtauftrag,Musterauftrag,Sammelrechnung,Montageauftrag,Vorabrechnung,Einlagerung,Sonderkommission,Feinabstimmung;
        }
        field(50052; "RMD Rückinfo an Düperthal"; Boolean)
        {
            Caption = 'RMD Rückinfo an Düperthal';
            Description = 'P0001';
        }
        field(50053; "RMD Sammelsendung"; Boolean)
        {
            Caption = 'RMD Sammelsendung';
            Description = 'P0001';
        }
        field(50054; "RMD Deb.-KD-Nr. bei Spedition"; Text[30])
        {
            Caption = 'RMD Deb.-KD-Nr. bei Spedition';
            Description = 'P0001';
        }
    }

    var
        myInt: Integer;
}