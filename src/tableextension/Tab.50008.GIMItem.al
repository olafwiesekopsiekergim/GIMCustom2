tableextension 50008 "GIM Item" extends Item
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Lagerlabel drucken"; Boolean)
        {
            Caption = 'Lagerlabel drucken';
            Description = 'P0019';
        }
        field(50001; "Qty. on Sales Quote"; Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = Sum("Sales Line"."Outstanding Qty. (Base)" WHERE("Document Type" = CONST(Quote),
                                                                            Type = CONST(Item),
                                                                            "No." = FIELD("No."),
                                                                            "Shortcut Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                            "Shortcut Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                            "Location Code" = FIELD("Location Filter"),
                                                                            "Drop Shipment" = FIELD("Drop Shipment Filter"),
                                                                            "Variant Code" = FIELD("Variant Filter"),
                                                                            "Shipment Date" = FIELD("Date Filter")));
            Caption = 'Qty. on Sales Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Production Group Code"; Code[10])
        {
            Caption = 'Production Group Code';
            Description = 'P0035';
            TableRelation = "Production Group";
        }
        field(50003; "Disable Etikett"; Boolean)
        {
            Caption = 'Etikett nicht drucken';
            Description = '#AT';
        }
        field(50004; "Stand.Lagerort"; Code[10])
        {
            Caption = 'Stand. Lagerort';
            Description = 'P0001,P0003';
            TableRelation = Location;
        }
        field(50005; "Pulvernr.(einseitig)"; Code[20])
        {
            Description = '#AT';
            TableRelation = Pulverprogramm;
            ValidateTableRelation = true;
        }
        field(50006; "Pulvernr.(beidseitig)"; Code[20])
        {
            Description = '#AT';
            TableRelation = Pulverprogramm;
            ValidateTableRelation = true;
        }
        field(50007; Kategorie; Code[30])
        {
            Description = '#AT';
            TableRelation = Kategorie;
        }
        field(50008; "Vimeo-ID-DE"; Text[30])
        {
            Caption = '<Vimeo-ID-DE>';
            Description = '#AT';
        }
        field(50009; "Vimeo-ID2-DE"; Text[30])
        {
            Caption = '<Vimeo-ID2-DE>';
            Description = '#AT';
        }
        field(50010; "Vimeo-ID3-DE"; Text[30])
        {
            Caption = '<Vimeo-ID3-DE>';
            Description = '#AT';
        }
        field(50011; "Vimeo-ID4-DE"; Text[30])
        {
            Caption = '<Vimeo-ID4-DE>';
            Description = '#AT';
        }
        field(50012; "Vimeo-ID-ENU"; Text[30])
        {
            Caption = '<Vimeo-ID-ENU>';
            Description = '#AT';
        }
        field(50013; "Vimeo-ID2-ENU"; Text[30])
        {
            Caption = '<Vimeo-ID2-ENU>';
            Description = '#AT';
        }
        field(50014; "Vimeo-ID3-ENU"; Text[30])
        {
            Caption = '<Vimeo-ID3-ENU>';
            Description = '#AT';
        }
        field(50015; "Vimeo-ID4-ENU"; Text[30])
        {
            Caption = '<Vimeo-ID4-ENU>';
            Description = '#AT';
        }
        field(50016; Partnerportal; Boolean)
        {
            Description = '#AT';
        }
        field(50019; "Pulvernr.(doppelt)"; Code[20])
        {
            Description = '#AT';
            TableRelation = Pulverprogramm;
            ValidateTableRelation = true;
        }
        field(50020; "Without Inventory Control"; Boolean)
        {
            Caption = 'Without Inventory Control';
            Description = 'P0042';
        }
        field(50025; Frachtkosten; Boolean)
        {
            Caption = 'Frachtkosten';
            Description = 'P0006';
            InitValue = true;

            trigger OnValidate()
            begin
                // >> P0006
                if not Frachtkosten then
                    Frachtkostencode := '';
                // << P0006
            end;
        }
        field(50026; Frachtkostencode; Code[10])
        {
            Caption = 'Frachtkostencode';
            Description = 'P0006';
            TableRelation = "Frachtcodes (Fracht2)";

            trigger OnValidate()
            begin
                // >> P0006
                if Frachtkostencode <> '' then
                    TestField(Frachtkosten, true);
                // << P0006
            end;
        }
        field(50030; "Description(ENU)"; Text[100])
        {
            CalcFormula = Lookup("Item Translation".Description WHERE("Item No." = FIELD("No."),
                                                                       "Language Code" = CONST('ENU')));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50031; "Description2(ENU)"; Text[50])
        {
            CalcFormula = Lookup("Item Translation"."Description 2" WHERE("Item No." = FIELD("No."),
                                                                           "Language Code" = CONST('ENU')));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50032; "Description(FRA)"; Text[100])
        {
            CalcFormula = Lookup("Item Translation".Description WHERE("Item No." = FIELD("No."),
                                                                       "Language Code" = CONST('FRA')));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50033; "Description2(FRA)"; Text[50])
        {
            CalcFormula = Lookup("Item Translation"."Description 2" WHERE("Item No." = FIELD("No."),
                                                                           "Language Code" = CONST('FRA')));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50045; "RMD Bestand Datum"; Date)
        {
            Caption = 'RMD Bestand Datum';
            Description = 'P0001';
        }
        field(50046; "RMD Bestand"; Decimal)
        {
            Caption = 'RMD Bestand';
            Description = 'P0001';
        }
        field(50047; "RMD Labelanweisungscode"; Code[10])
        {
            Caption = 'RMD Labelanweisungscode';
            Description = 'P0001,P0003';
            TableRelation = "RMD Labelanweisung";
        }
        field(50049; "Qty. to Pick (Base)"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Qty. Outstanding (Base)" WHERE("Activity Type" = CONST("Invt. Pick"),
                                                                                         "Item No." = FIELD("No."),
                                                                                         "Variant Code" = FIELD("Variant Filter"),
                                                                                         "Location Code" = FIELD("Location Filter")));
            Caption = 'Qty. to Pick (Base)';
            Description = 'P0003';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50091; "Consumption (Qty.)"; Decimal)
        {
            CalcFormula = - Sum("Value Entry"."Invoiced Quantity" WHERE("Item Ledger Entry Type" = CONST(Consumption),
                                                                        "Item No." = FIELD("No."),
                                                                        "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                        "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                        "Location Code" = FIELD("Location Filter"),
                                                                        "Drop Shipment" = FIELD("Drop Shipment Filter"),
                                                                        "Variant Code" = FIELD("Variant Filter"),
                                                                        "Posting Date" = FIELD("Date Filter")));
            Caption = 'Negative Adjmt. (Qty.)';
            DecimalPlaces = 0 : 5;
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50109; "EP-pflichtig"; Boolean)
        {
            Caption = 'EP-pflichtig';
            Description = 'P0003';
            InitValue = true;
        }
        field(50112; Direktlieferung; Boolean)
        {
            Caption = 'Direktlieferung';
            Description = 'P0003';
        }
        field(50113; Sonderartikel; Boolean)
        {
            Description = 'P0003';
        }
        field(50116; "Einzelgebinde max.Liter"; Text[20])
        {
            Caption = 'Einzelgebinde max.Liter';
            Description = 'P0040';
        }
        field(50117; "Bodenbelastung max. kg"; Text[20])
        {
            Caption = 'Bodenbelastung max. kg';
            Description = 'P0040';
        }
        field(50200; Katalog; Boolean)
        {
            Description = '#AT';
        }
        field(50201; Katalogseite; Text[10])
        {
            Description = '#AT';
        }
        field(50202; Preisrelevant; Boolean)
        {
            Description = '#AT';
        }
        field(50301; Abmessung1; Text[10])
        {
            Caption = 'Dimension1';
            Description = 'P0001,P0003';
        }
        field(50302; Abmessung2; Text[10])
        {
            Caption = 'Dimension2';
            Description = 'P0001,P0003';
        }
        field(50303; Abmessung3; Text[10])
        {
            Caption = 'Dimension3';
            Description = 'P0001,P0003';
        }
        field(50304; Innenabmessung1; Text[10])
        {
            Caption = 'Innenabmessung(B)';
            Description = '#AT';
        }
        field(50305; Innenabmessung2; Text[10])
        {
            Caption = 'Innenabmessung(T)';
            Description = '#AT';
        }
        field(50306; Innenabmessung3; Text[10])
        {
            Caption = 'Innenabmessung(H)';
            Description = '#AT';
        }
        field(50307; Durchmesser1; Text[10])
        {
            Caption = 'Durchmesser(Innen)';
            Description = '#AT';
        }
        field(50308; Durchmesser2; Text[10])
        {
            Caption = 'Durchmesser(Aussen)';
            Description = '#AT';
        }
        field(50312; Katalogartikel; Boolean)
        {
            Caption = 'Katalogartikel';
            Description = 'P0003';
        }
        field(50313; "Lager RMD"; Boolean)
        {
            Caption = 'Lager RMD';
            Description = 'P0001,P0003';
        }
        field(50315; "Acceptance Protocol Code"; Code[20])
        {
            Caption = 'Acceptance Protocol Code';
            Description = 'P0036';
            TableRelation = "Acceptance Protocol Header";
        }
        field(50527; "automatic Blocking interval"; DateFormula)
        {
            Caption = 'Automatic Blocking Interval';
            Description = 'P0003';
        }
        field(50528; "next Blocking Date"; Date)
        {
            Caption = 'Next Blocking Date';
            Description = 'P0003';
            Editable = false;
        }
        field(50550; "Basis Zertifikat"; Text[30])
        {
        }
        field(50551; "Max Gebindegr. links"; Integer)
        {
            Caption = '<Max Gebindegröße, links>';
        }
        field(50552; "Max Gebindegr. rechts"; Integer)
        {
            Caption = '<Max Gebindegröße, rechts>';
        }
        field(50553; "Max Tragf. Stellf. links"; Code[3])
        {
            Caption = '<Max Tragfähigkeit Stellfläche, links>';
        }
        field(50554; "Max Tragf. Stellf. rechts"; Code[3])
        {
            Caption = '<Max Tragfähigkeit Stellfläche, rechts>';
        }
        field(50600; "Print on Slip"; Boolean)
        {
            Caption = 'Print on Slip';
            DataClassification = ToBeClassified;
            Description = 'CC01';
        }
        field(60068; BestellmengeAktuell; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Document Type" = FILTER("Purchase Receipt"),
                                                                  "Posting Date" = FILTER(20190101D .. 20191231D)));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(60069; Bestellmenge; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Document Type" = FILTER("Purchase Receipt"),
                                                                  "Posting Date" = FILTER(20180101D .. 20181231D)));
            Description = '#AT';
            FieldClass = FlowField;
        }
        field(60070; "Inventory 400"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                  "Location Code" = CONST('400'),
                                                                  "Drop Shipment" = FIELD("Drop Shipment Filter"),
                                                                  "Variant Code" = FIELD("Variant Filter"),
                                                                  "Lot No." = FIELD("Lot No. Filter"),
                                                                  "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Inventory 400';
            DecimalPlaces = 0 : 5;
            Description = 'P0009';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60071; "Inventory 420"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                  "Location Code" = CONST('420'),
                                                                  "Drop Shipment" = FIELD("Drop Shipment Filter"),
                                                                  "Variant Code" = FIELD("Variant Filter"),
                                                                  "Lot No." = FIELD("Lot No. Filter"),
                                                                  "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Inventory 420';
            DecimalPlaces = 0 : 5;
            Description = 'P0009';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60072; "Inventory 100"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                  "Location Code" = CONST('100'),
                                                                  "Drop Shipment" = FIELD("Drop Shipment Filter"),
                                                                  "Variant Code" = FIELD("Variant Filter"),
                                                                  "Lot No." = FIELD("Lot No. Filter"),
                                                                  "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Inventory 100';
            DecimalPlaces = 0 : 5;
            Description = 'P0031';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60073; "Inventory 401"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                  "Location Code" = CONST('401'),
                                                                  "Drop Shipment" = FIELD("Drop Shipment Filter"),
                                                                  "Variant Code" = FIELD("Variant Filter"),
                                                                  "Lot No." = FIELD("Lot No. Filter"),
                                                                  "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Inventory 420';
            DecimalPlaces = 0 : 5;
            Description = 'P0009';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60074; "Menge in RMD Umlagerung"; Decimal)
        {
            CalcFormula = Sum("Item Journal Line".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Source Code" = CONST('RMDUMLBUBL')));
            Description = '#AT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70000; "Variant Mandatory"; Boolean)
        {
            Caption = 'Variant Mandatory';
            DataClassification = ToBeClassified;
            Description = 'LM';
        }
        field(77850; "EAN-Code"; Code[13])
        {
            Caption = 'EAN-Code';
            Description = 'TEMP Datenübernahme 2016';
        }

    }

    var
        myInt: Integer;
}