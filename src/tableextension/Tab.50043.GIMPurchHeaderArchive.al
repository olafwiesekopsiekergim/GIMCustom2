/// <summary>
/// TableExtension "GIMPurchHeaderArchive" (ID 50043) extends Record Purchase Header Archive.
/// </summary>
tableextension 50043 GIMPurchHeaderArchive extends "Purchase Header Archive"
{
    fields
    {
        // Add changes to table fields here
        field(50014; "Our Account No."; Text[20])
        {
            Caption = 'Our Account No.';
            Description = 'P0010';
        }
        field(50400; RegistrierNr; Code[20])
        {
            Caption = 'Registration No.';
            Description = 'P0013 - Anbindung an D3';
            Numeric = true;
        }
    }

    var
        myInt: Integer;
}