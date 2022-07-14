/// <summary>
/// TableExtension "GIMSalesReceivablesSetup" (ID 50034) extends Record MyTargetTable.
/// </summary>
tableextension 50034 GIMSalesReceivablesSetup extends "Sales & Receivables Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "Service Contract Nos."; Code[10])
        {
            Caption = 'Service Contract Nos.';
            Description = '#AT';
            TableRelation = "No. Series";
        }
        field(50020; "Artikel Fracht1"; Code[20])
        {
            Caption = 'Artikel Fracht1';
            Description = 'P0001';
        }
        field(50021; "Artikel Fracht2"; Code[20])
        {
            Caption = 'Artikel Fracht2';
            Description = 'P0001';
        }
        field(50022; "Artikel Verpackung"; Code[20])
        {
            Caption = 'Artikel Verpackung';
            Description = 'P0001';
        }
        field(50100; "Default Credit Limit (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Default Credit Limit (LCY)';
            Description = 'P0028';
        }
        field(50151; Datenbereitstellungspfad; Text[128])
        {
            Caption = 'Datenbereitstellungspfad';
            Description = 'P0001';
        }
        field(50160; "RMD Auftragsgrundkosten"; Decimal)
        {
            Caption = 'RMD Auftragsgrundkosten';
            Description = 'P0001';
        }
        field(50161; "RMD Auftragspositionskosten"; Decimal)
        {
            Caption = 'RMD Auftragspositionskosten';
            Description = 'P0001';
        }
        field(50170; "Checklist Template"; Text[250])
        {
            Caption = 'Checklist Template';
            Description = 'xx';
        }
        field(77600; "Einst.Preis prüfen"; Boolean)
        {
            Description = 'P0003';
        }
    }

    var
        myInt: Integer;
}