/// <summary>
/// Table Fracht2 (ID 50011).
/// </summary>
table 50011 "Fracht2"
{
    // P0006 16.02.16 CCBIE.ARE New object
    // 
    // c/wa/150900: - neues Feld "Lieferungsart" eingefügt
    //              - Primärschlüssel erweitert "Code,ab PLZ,Lieferungsart"
    //              - neue Felder "EP 1. Schrank" .... zur Ermittlung des Einstandspreises
    // c/gw/230806: - A15505 "Modifikation Frachtkosten"
    //              - neues Feld:6 "Debitornr." Code20 Tablerelation zum Tabelle 18 "Debitor"
    //              - Primary geändert  jetzt "Debitornr.,Gewicht" vorher nur "Gewicht"
    //              - TANGIERTE OBJEKTE...
    //                ...Tabelle    50010 Fracht1 (Frachtkosten)
    //                ...Tabelle    50011 Fracht2
    //                ...Page       21    Debitorenkarte
    //                ...Page       41    Verkaufsangebot
    //                ...Page       42    Verkaufsauftrag
    //                ...Page       50009 VK-Fracht Berechnung
    //                ...Page       50062 Fracht1 (Frachtkosten)
    //                ...Page       50064 Fracht2 - Tabelle
    //                ...Codeunit   80005 Verkaufsoperationen
    // c/wa/020511: - erweitert gemäß neue Anforderungen

    //TODO Drilldown

    // DrillDownPageID = 50064;
    // LookupPageID = 50064;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Description = 'z.B. Artikelgruppe';
            TableRelation = "Frachtcodes (Fracht2)";
        }
        field(2; "ab PLZ"; Code[10])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(3; "1. Schrank (MW)"; Decimal)
        {
            Description = 'Kosten Fracht';
        }
        field(4; "2. Schrank (MW)"; Decimal)
        {
            Description = 'Kosten Fracht';
        }
        field(5; "jeder weitere Schrank (MW)"; Decimal)
        {
            Description = 'Kosten Fracht';
        }
        field(6; "Debitornr."; Code[20])
        {
            Description = '-c-gw-230806: - A15505';
            TableRelation = Customer;
        }
        field(10; Lieferungsart; Option)
        {
            Description = ' ,bis Rampe';
            OptionMembers = " ","bis Rampe";
        }
        field(13; "EP 1. Schrank (MW)"; Decimal)
        {
        }
        field(14; "EP 2. Schrank (MW)"; Decimal)
        {
        }
        field(15; "EP weitere Schränke (MW)"; Decimal)
        {
        }
        field(100; Routingcode; Code[10])
        {
            Description = 'Tablerelation "Shipping Agent"';
            TableRelation = "Shipping Agent";
        }
        field(101; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(102; "Country Code"; Code[10])
        {
            Caption = 'Country Code';
            TableRelation = "Country/Region";
        }
        field(103; "Shipping Agent Code"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
        }
        field(104; "ab Entfernung (km)"; Decimal)
        {
        }
        field(105; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(106; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code WHERE("Shipping Agent Code" = FIELD("Shipping Agent Code"));
        }
        field(1000; "Stützpunkt"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; Routingcode, "Country Code", "Code", "Line No.", Lieferungsart, "Shipping Agent Code", "Shipping Agent Service Code", "ab Entfernung (km)", "Starting Date")
        {
        }
        key(Key2; "Debitornr.", "Code", "ab PLZ", Lieferungsart)
        {
            Clustered = true;
        }
        key(Key3; Lieferungsart, "1. Schrank (MW)")
        {
        }
        key(Key4; Lieferungsart, "2. Schrank (MW)")
        {
        }
        key(Key5; Lieferungsart, "jeder weitere Schrank (MW)")
        {
        }
    }

    fieldgroups
    {
    }
}

