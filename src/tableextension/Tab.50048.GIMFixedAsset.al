/// <summary>
/// TableExtension "GIMFixedAsset" (ID 50048) extends Record Fixed Asset.
/// </summary>
tableextension 50048 GIMFixedAsset extends "Fixed Asset"
{
    fields
    {
        // Add changes to table fields here
        field(50001; Startdatum; Date)
        {
            CalcFormula = Lookup("FA Depreciation Book"."Depreciation Starting Date" WHERE("FA No." = FIELD("No.")));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; Enddatum; Date)
        {
            CalcFormula = Lookup("FA Depreciation Book"."Depreciation Ending Date" WHERE("FA No." = FIELD("No.")));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; Nutzungsdauer; Decimal)
        {
            CalcFormula = Lookup("FA Depreciation Book"."No. of Depreciation Years" WHERE("FA No." = FIELD("No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50004; Anschaffungswert; Decimal)
        {
            CalcFormula = Sum("FA Ledger Entry".Amount WHERE("FA Posting Type" = CONST("Acquisition Cost"),
                                                              "FA No." = FIELD("No.")));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50005; Anlagenklassenbeschreibung; Text[50])
        {
            CalcFormula = Lookup("FA Class".Name WHERE(Code = FIELD("FA Class Code")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50006; "KST-Bezeichnung"; Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE("Dimension Code" = CONST('KST'),
                                                               Code = FIELD("Global Dimension 1 Code")));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50007; Anschaffungsdatum; Date)
        {
            CalcFormula = Lookup("FA Ledger Entry"."FA Posting Date" WHERE("FA No." = FIELD("No."),
                                                                            "FA Posting Type" = CONST("Acquisition Cost")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50008; Buchwert; Decimal)
        {
            CalcFormula = Sum("FA Ledger Entry".Amount WHERE("FA No." = FIELD("No."),
                                                              "FA Posting Type" = FILTER(<> "Proceeds on Disposal" & <> "Gain/Loss")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        //TODO Feld in COSMO-Lösung
        // field(50009; Verschrottungsdatum; Date)
        // {
        //     CalcFormula = Lookup ("FA Depreciation Book"."Scrapped at Date" WHERE ("FA No." = FIELD ("No.")));
        //     Description = '#AT';
        //     FieldClass = FlowField;
        // }

        field(50010; Verkaufsdatum; Date)
        {
            CalcFormula = Lookup("FA Depreciation Book"."Disposal Date" WHERE("FA No." = FIELD("No.")));
            Description = '#AT';
            FieldClass = FlowField;

        }
    }

    var
        myInt: Integer;
        faDB: record "FA Depreciation Book";



}