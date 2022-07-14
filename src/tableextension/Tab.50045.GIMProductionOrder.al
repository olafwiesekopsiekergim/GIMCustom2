/// <summary>
/// TableExtension "GIMProductionOrder" (ID 50045) extends Record Production Order.
/// </summary>
tableextension 50045 GIMProductionOrder extends "Production Order"
{
    fields
    {
        // Add changes to table fields here
        field(50003; "Shipping Agent Code"; Code[10])
        {
            CalcFormula = Lookup("Sales Header"."Shipping Agent Code" WHERE("Document Type" = CONST(Order),
                                                                             "No." = FIELD("Evtl. Auftragsnr.")));
            Caption = 'Shipping Agent Code';
            Description = 'P0027';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50004; "Lief. an Name"; Code[100])
        {
            CalcFormula = Lookup("Sales Header"."Ship-to Name" WHERE("No." = FIELD("Evtl. Auftragsnr.")));
            FieldClass = FlowField;
        }
        field(50005; "Priorität"; Code[2])
        {
            Description = '#AT';
        }
        field(50007; "Evtl. Auftragsnr."; Code[20])
        {
            Caption = 'Evtl. Auftragsnr.';
            Description = 'P0020,P0027';
            Editable = false;
            TableRelation = "Sales Header"."No." WHERE("Document Type" = CONST(Order));
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(50008; "Evtl. Auftragszeilennr."; Integer)
        {
            BlankZero = true;
            Caption = 'Evtl. Auftragszeilennr.';
            Description = 'P0020,P0027';
            Editable = false;
            TableRelation = "Sales Line"."Line No." WHERE("Document Type" = CONST(Order),
                                                           "Document No." = FIELD("Evtl. Auftragsnr."));
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(50010; "Run Card Pinted Date"; Date)
        {
            Caption = 'Run card pinted date';
            Description = 'P0027';
        }
        field(50011; "Run Card Pinted Time"; Time)
        {
            Caption = 'Run card pinted time';
            Description = 'P0027';
        }
        field(50015; "Pulver(einseitig)"; Code[20])
        {
            CalcFormula = Lookup(Item."Pulvernr.(einseitig)" WHERE("No." = FIELD("Source No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50016; "Pulver(beidseitig)"; Code[20])
        {
            CalcFormula = Lookup(Item."Pulvernr.(beidseitig)" WHERE("No." = FIELD("Source No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50017; "Pulver(doppelt)"; Code[20])
        {
            CalcFormula = Lookup(Item."Pulvernr.(doppelt)" WHERE("No." = FIELD("Source No.")));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(50111; "Production Group Code"; Code[10])
        {
            Caption = 'Production Group Code';
            Description = 'P0035';
            TableRelation = "Production Group";

            trigger OnValidate()
            var
                ProductionGroup: Record "Production Group";
            begin
                if not ProductionGroup.Get("Production Group Code") then
                    ProductionGroup.Init;

                "Print Action Released" := ProductionGroup."Print Action Released";
            end;
        }
        field(50120; "Remaining Quantity"; Decimal)
        {
            CalcFormula = Sum("Prod. Order Line"."Remaining Quantity" WHERE(Status = FIELD(Status),
                                                                             "Prod. Order No." = FIELD("No.")));
            Caption = 'Remaining Quantity';
            DecimalPlaces = 0 : 5;
            Description = 'P0027';
            Editable = false;
            FieldClass = FlowField;
            MinValue = 0;
        }
        field(50130; "Print Action Released"; Option)
        {
            Caption = 'Print Action Released';
            Description = 'P0035';
            OptionMembers = "mit Details","ohne Details","kein Druck",Listendruck;
        }
        field(50200; "Auftr. Verk. an Deb.-Name"; Text[100])
        {
            CalcFormula = Lookup("Sales Header"."Sell-to Customer Name" WHERE("Document Type" = CONST(Order),
                                                                               "No." = FIELD("Evtl. Auftragsnr.")));
            Description = 'P0027';
            Editable = false;
            FieldClass = FlowField;
            TableRelation = Customer;
        }
        field(80000; Erstellungsdatum; Date)
        {
            Description = 'P0027';
            Editable = false;
        }
        field(80001; Erstellungsuhrzeit; Time)
        {
            Description = 'P0027';
            Editable = false;
        }
        field(80002; Erstellungsuser; Code[50])
        {
            Description = 'P0027';
            Editable = false;
            TableRelation = User;
        }
        field(80003; "Änderungsdatum"; Date)
        {
            Description = 'P0027';
            Editable = false;
        }
        field(80004; "Änderungsuhrzeit"; Time)
        {
            Description = 'P0027';
            Editable = false;
        }
        field(80005; "Änderungsuser"; Code[50])
        {
            Description = 'P0027';
            Editable = false;
            TableRelation = User;
        }
    }

    var
        myInt: Integer;
}