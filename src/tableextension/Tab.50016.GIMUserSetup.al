/// <summary>
/// TableExtension GIM User Setup (ID 50016) extends Record User Setup.
/// </summary>
tableextension 50016 "GIM User Setup" extends "User Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50000; Innendienst; Boolean)
        {
        }
        field(50001; "Preis ändern"; Boolean)
        {
        }
        field(50002; Rechnungspfad; Text[100])
        {
            Description = '#AT';
        }
        field(50010; "Create PO From SO"; Boolean)
        {
            Caption = 'Create Prod. Order from Sales Order';
            DataClassification = ToBeClassified;
            Description = 'CC01';
        }
        field(80042; "Telefonnr."; Text[30])
        {
            Caption = 'Telefonnr.';
            Description = 'P0001';
        }
    }

    var
        myInt: Integer;
}