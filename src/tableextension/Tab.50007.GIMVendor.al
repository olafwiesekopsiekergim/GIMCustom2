/// <summary>
/// TableExtension GIM Vendor (ID 50007) extends Record Vendor.
/// </summary>
tableextension 50007 "GIM Vendor" extends Vendor
{
    fields
    {
        // Add changes to table fields here
        field(50000; Buchungssperre; Integer)
        {
            Description = 'MC Datenübernahme';
        }
        field(50001; Mahnsperre; Integer)
        {
            Description = 'MC Datenübernahme';
        }
        field(50002; Regulierungssperre; Integer)
        {
            Description = 'MC Datenübernahme';
        }
        field(50003; Auslandskreditversicherung; Code[20])
        {
            Description = 'MC Datenübernahme';
        }
        field(50011; EstosLink; Text[250])
        {
            Description = '#AT';
        }
        field(50100; "Bestellungs-E-Mail"; Text[80])
        {
            Caption = 'Bestellungs-E-Mail';
            Description = 'P0018';
        }
        field(50110; "Zahlungsavise-E-Mail"; Text[80])
        {
            Caption = 'Zahlungsavise-E-Mail';
            Description = 'P0018';
        }
        field(50120; "Reklamations-E-Mail"; Text[80])
        {
            Caption = 'Reklamations-E-Mail';
            Description = 'P0018';
        }
        field(50130; "Warenmahnungs-E-Mail"; Text[80])
        {
            Caption = 'Warenmahnungs-E-Mail';
            Description = 'P0018';
        }

    }

    var
        myInt: Integer;
}