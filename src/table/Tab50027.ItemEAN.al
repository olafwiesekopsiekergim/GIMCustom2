///
table 50027 "Item EAN"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;

            trigger OnValidate()
            begin
                GetItem;
            end;
        }
        field(3; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Item No."));

            trigger OnValidate()
            var
                ItemVariant: Record "Item Variant";
            begin
                if "Variant Code" <> '' then
                    ItemVariant.Get("Item No.", "Variant Code");
            end;
        }
        field(4; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Item No."));

            trigger OnValidate()
            begin
                if "Item No." <> '' then
                    GetItemUnitOfMeasure;
            end;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Item No.", "Variant Code", "Unit of Measure Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Text000: Label 'For Item %1 Identifier exists.';
        Item: Record Item;
        ItemUnitOfMeasure: Record "Item Unit of Measure";

    local procedure GetItem()
    begin
        if Item."No." <> "Item No." then begin
            Item.Get("Item No.");
        end;
    end;

    //[Scope('OnPrem')]
    /// <summary>
    /// GetItemUnitOfMeasure.
    /// </summary>
    procedure GetItemUnitOfMeasure()
    begin
        GetItem;
        Item.TestField("No.");
        if (Item."No." <> ItemUnitOfMeasure."Item No.") or
           ("Unit of Measure Code" <> ItemUnitOfMeasure.Code)
        then
            if not ItemUnitOfMeasure.Get(Item."No.", "Unit of Measure Code") then
                ItemUnitOfMeasure.Get(Item."No.", Item."Base Unit of Measure");
    end;

    /// <summary>
    /// VerifyItem.
    /// </summary>
    /// <returns>Return value of type Boolean.</returns>
    [Scope('OnPrem')]
    procedure VerifyItem(): Boolean
    var
        ItemIdent: Record "Item Identifier";
    begin
        ItemIdent.SetCurrentKey("Item No.");
        ItemIdent.SetRange("Item No.", "Item No.");
        ItemIdent.SetRange("Variant Code", "Variant Code");
        ItemIdent.SetRange("Unit of Measure Code", "Unit of Measure Code");
        if ItemIdent.Find('-') then
            exit(false)
        else
            exit(true);
    end;
}

