table 50019 "Webshop-DS"
{
    Caption = 'Webshop-DS';
    LookupPageID = "Item Vendor Catalog";

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            NotBlank = true;
            TableRelation = Item;
        }
        field(2; Ebene; Code[50])
        {
            TableRelation = "WebshopStammdaten- DS".Code WHERE(Ebene = CONST(true));
        }
        field(3; Produktkategorie; Code[50])
        {
            TableRelation = "WebshopStammdaten- DS".Code WHERE(Produktkategorie = CONST(true));
        }
        field(4; Zubehoer; Code[50])
        {
            TableRelation = "WebshopStammdaten- DS".Code WHERE(Zubehoer = CONST(true));
        }
        field(5; Linie; Code[50])
        {
            Caption = 'Modell';
            TableRelation = "WebshopStammdaten- DS".Code WHERE(Linie = CONST(true));
        }
        field(6; "Einsatz/Programmabschnitt"; Code[50])
        {
            TableRelation = "WebshopStammdaten- DS".Code WHERE("Einsatz/Produktabschnitt" = CONST(true));
        }
        field(7; Produktgruppe; Code[50])
        {
            TableRelation = "WebshopStammdaten- DS".Code WHERE(Produktgruppe = CONST(true));
        }
        field(8; "Bezeichnung-Zusatz"; Code[50])
        {
            Caption = 'Modelltyp';
            TableRelation = "WebshopStammdaten- DS".Code WHERE("Bezeichnung-Zusatz" = CONST(true));
        }
        field(9; Modellgroesse; Code[50])
        {
            TableRelation = "WebshopStammdaten- DS".Code WHERE(Modellgroesse = CONST(true));
        }
        field(10; "YouTubeID-DE"; Text[50])
        {
        }
        field(11; "YouTubeID2-DE"; Text[50])
        {
        }
        field(12; "YouTubeID-EN"; Text[50])
        {
        }
        field(13; "YouTubeID2-EN"; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

