/// <summary>
/// TableExtension "GIMServiceContractHeader" (ID 50059) extends Record Service Contract Header.
/// </summary>
tableextension 50059 GIMServiceContractHeader extends "Service Contract Header"
{
    fields
    {
        // Add changes to table fields here
        field(50012; "Service Salesperson Code"; Code[10])
        {
            Caption = 'Service Salesperson Code';
            Description = '#AT';
            TableRelation = "Salesperson/Purchaser";
        }
        field(50020; "W/Ü pro Sicherheitsschrank"; Decimal)
        {
            Description = '#AT';
        }
        field(50021; "W/Ü pro Laborabzug"; Decimal)
        {
            Description = '#AT';
        }
        field(50022; "W/Ü pro Filteraufsatz"; Decimal)
        {
            Description = '#AT';
        }
        field(50023; "Montage/h"; Decimal)
        {
            Description = '#AT';
        }
        field(50024; "Fahrt/h"; Decimal)
        {
            Description = '#AT';
        }
        field(50025; "Fahrt/km"; Decimal)
        {
            Description = '#AT';
        }
        field(50026; "Menge Sicherheitsschrank"; Integer)
        {
            CalcFormula = Count("Service Contract Line" WHERE("Contract Type" = FIELD("Contract Type"),
                                                               "Contract No." = FIELD("Contract No."),
                                                               "Service Item Group Code" = CONST('SCHRANK')));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50027; "Menge Laborabzug"; Integer)
        {
            CalcFormula = Count("Service Contract Line" WHERE("Contract Type" = FIELD("Contract Type"),
                                                               "Contract No." = FIELD("Contract No."),
                                                               "Service Item Group Code" = FILTER('LABABZ')));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50028; "Menge Filteraufsatz"; Integer)
        {
            CalcFormula = Count("Service Contract Line" WHERE("Contract Type" = FIELD("Contract Type"),
                                                               "Contract No." = FIELD("Contract No."),
                                                               "Service Item Group Code" = CONST('FILTER')));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50030; "externe Belegnummer"; Text[50])
        {
            Description = '#AT';
        }
        field(50031; "Menge Austauschfilter"; Integer)
        {
            Description = '#AT';
        }
        field(50032; "Preis Austauschfilter"; Decimal)
        {
            Description = '#AT';
        }
        field(50400; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            Description = '#AT';
            Editable = false;
        }
        field(50401; Creationuser; Code[50])
        {
            Caption = 'Erstellungsnutzer';
            Description = '#AT';
            TableRelation = User;
        }
        field(50501; "Ship-to E-Mail"; Text[80])
        {
            CalcFormula = Lookup("Ship-to Address"."E-Mail" WHERE("Customer No." = FIELD("Customer No."),
                                                                   Code = FIELD("Ship-to Code")));
            Caption = 'Ship-to E-Mail';
            Editable = false;
            ExtendedDatatype = EMail;
            FieldClass = FlowField;
        }
        field(50502; "Ship-to Phone"; Text[30])
        {
            CalcFormula = Lookup("Ship-to Address"."Phone No." WHERE("Customer No." = FIELD("Customer No."),
                                                                      Code = FIELD("Ship-to Code")));
            Caption = 'Ship-to Phone';
            Editable = false;
            ExtendedDatatype = PhoneNo;
            FieldClass = FlowField;
        }
        field(50503; "Ship-to Contact"; Text[100])
        {
            CalcFormula = Lookup("Ship-to Address".Contact WHERE("Customer No." = FIELD("Customer No."),
                                                                  Code = FIELD("Ship-to Code")));
            Caption = 'Ship-to Contact';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}