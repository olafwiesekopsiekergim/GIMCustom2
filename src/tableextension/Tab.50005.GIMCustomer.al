tableextension 50005 "GIM Customer" extends Customer
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
        field(50005; "Verpackungskosten Ja/Nein"; Boolean)
        {
            Caption = 'Verpackungskosten Ja/Nein';
            Description = 'P0002';
        }
        field(50006; "Versandkosten Ja/Nein"; Boolean)
        {
            Caption = 'Versandkosten Ja/Nein';
            Description = 'P0002';
        }
        field(50007; "Bill-To E-Mail"; Text[80])
        {
            Caption = 'Bill-To E-Mail';
            Description = 'P0002';
        }
        field(50008; "E-Invoicing"; Boolean)
        {
            Description = 'P0002';
        }
        field(50009; Bounsagreement; Boolean)
        {
            Caption = 'Bonusvereinbarung';
            Description = '#AT';
        }
        field(50010; ReminderDate; Date)
        {
            Caption = 'Mahndatum';
            Description = '#AT';
        }
        field(50011; EstosLink; Text[250])
        {
            Description = '#AT';
        }
        field(50012; "Service Salesperson Code"; Code[10])
        {
            Caption = 'Service Salesperson Code';
            Description = '#AT';
            TableRelation = "Salesperson/Purchaser";
        }
        field(50015; "Kette Kreditlimit"; Code[20])
        {
            Caption = 'Kette Kreditlimit';
            Description = 'P0002';
        }
        field(50016; "Weiterleiten An"; Code[10])
        {
            Description = '#AT';
            TableRelation = "Salesperson/Purchaser";
        }
        field(50099; "Salesperson Code 2"; Code[10])
        {
            Caption = 'Salesperson Code 2';
            Description = 'P0034';
            TableRelation = "Salesperson/Purchaser";
        }
        field(50100; "Kostenträger (Standard)"; Code[20])
        {
        }
        field(50110; "Geschäftsbereich (Standard)"; Code[20])
        {
        }
        field(50130; "Vertriebs-E-Mail"; Text[80])
        {
            Caption = 'Vertriebs-E-Mail';
            Description = 'P0002';
        }
        field(50140; "Warenavise-E-Mail"; Text[80])
        {
            Caption = 'Warenavise-E-Mail';
            Description = 'P0002';
        }
        field(50150; "Mahnungs-E-Mail"; Text[80])
        {
            Caption = 'Mahnungs-E-Mail';
            Description = 'P0002,P0027';
        }
        field(50160; "Gelangensbestätigungs-E-Mail"; Text[80])
        {
            Caption = 'Gelangensbestätigungs-E-Mail';
            Description = 'P0002';
        }
        field(50170; "Serviceavise-E-Mail"; Text[80])
        {
            Caption = 'Serviceavise-E-Mail';
            Description = 'P0002';
        }
        field(50180; "Servicerechnungs-E-Mail"; Text[80])
        {
            Caption = 'Servicerechnung-E-Mail';
            Description = 'P0002';
        }
        field(50190; "Servicemahnungs-E-Mail"; Text[80])
        {
            Caption = 'Servicemahnungs-E-Mail';
            Description = 'P0002';
        }
        field(50200; "Net Change - VKR(LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Document No." = FILTER(<> 'VRK*')));
            Caption = 'Net Change (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50210; "Balance -VKR(LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Document No." = FILTER(<> 'VRK*')));
            Caption = 'Balance (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(75000; Rechnungsadresse; Text[50])
        {
            Caption = 'Invoice Address';
            Description = 'P0002';
        }
    }

    var
        myInt: Integer;
}