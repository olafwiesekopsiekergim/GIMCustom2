page 50013 "Mobile Transaction Subform"
{
    // L-MOBILE LM2.00
    //   object defined
    // 
    // L-MOBILE LM2.00.05
    //   editable enabeled

    Caption = 'Mobile Transaction Subform';
    DelayedInsert = true;
    PageType = ListPart;
    PopulateAllFields = true;
    SourceTable = "Mobile Transaction Line";
    SourceTableView = SORTING("Transaction No.", "No.")
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Main Posting No."; Rec."Main Posting No.")
                {
                }
                field("Transaction No."; Rec."Transaction No.")
                {
                }
                field("Posting Type"; Rec."Posting Type")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Message Type"; Rec."Message Type")
                {
                }
                field("Message Text"; Rec."Message Text")
                {
                }
                field("Printer Name"; Rec."Printer Name")
                {
                }
                field("Printed Copies"; Rec."Printed Copies")
                {
                }
                field("Site Code"; Rec."Site Code")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Location Code Bin Code"; Rec."Location Code Bin Code")
                {
                }
                field("Location Key Location Code"; Rec."Location Key Location Code")
                {
                }
                field("Location Key Bin Code"; Rec."Location Key Bin Code")
                {
                }
                field("Zone Code"; Rec."Zone Code")
                {
                }
                field("Bin Code"; Rec."Bin Code")
                {
                }
                field("New Site Code"; Rec."New Site Code")
                {
                }
                field("New Location Code"; Rec."New Location Code")
                {
                }
                field("New Location Code Bin Code"; Rec."New Location Code Bin Code")
                {
                }
                field("New Location Key Location Code"; Rec."New Location Key Location Code")
                {
                }
                field("New Location Key Bin Code"; Rec."New Location Key Bin Code")
                {
                }
                field("New Zone Code"; Rec."New Zone Code")
                {
                }
                field("New Bin Code"; Rec."New Bin Code")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                }
                field("Lot No."; Rec."Lot No.")
                {
                }
                field("Serial No."; Rec."Serial No.")
                {
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                }
                field("Source Document Line No."; Rec."Source Document Line No.")
                {
                }
                field("Prod. Order Line No."; Rec."Prod. Order Line No.")
                {
                }
                field("Batch Name"; Rec."Batch Name")
                {
                }
                field("Template Name"; Rec."Template Name")
                {
                }
                field("Create Date"; Rec."Create Date")
                {
                }
                field("Create User Id"; Rec."Create User Id")
                {
                }
                field("Modify Date"; Rec."Modify Date")
                {
                }
                field("Modify User Id"; Rec."Modify User Id")
                {
                }
                field("NAV User ID"; Rec."NAV User ID")
                {
                }
                field("Stock Key Item No."; Rec."Stock Key Item No.")
                {
                }
                field("Stock Key Variant Code"; Rec."Stock Key Variant Code")
                {
                }
                field("Stock Key Location Code"; Rec."Stock Key Location Code")
                {
                }
                field("Stock Key Bin Code"; Rec."Stock Key Bin Code")
                {
                }
                field("Stock Key Lot No."; Rec."Stock Key Lot No.")
                {
                }
                field("Stock Key Serial No."; Rec."Stock Key Serial No.")
                {
                }
                field("Stock Key Unit of Measure Code"; Rec."Stock Key Unit of Measure Code")
                {
                }
                field("Inventory Position Key Line No"; Rec."Inventory Position Key Line No")
                {
                }
                field("Inventory No."; Rec."Inventory No.")
                {
                }
                field("Recording No."; Rec."Recording No.")
                {
                }
                field(Weight; Rec.Weight)
                {
                }
                field("Weight Unit of Measure Code"; Rec."Weight Unit of Measure Code")
                {
                }
                field(BooleanField_1; Rec.BooleanField_1)
                {
                }
                field(BooleanField_2; Rec.BooleanField_2)
                {
                }
                field(BooleanField_3; Rec.BooleanField_3)
                {
                }
                field(BooleanField_4; Rec.BooleanField_4)
                {
                }
                field(BooleanField_5; Rec.BooleanField_5)
                {
                }
                field(BooleanField_6; Rec.BooleanField_6)
                {
                }
                field(BooleanField_7; Rec.BooleanField_7)
                {
                }
                field(BooleanField_8; Rec.BooleanField_8)
                {
                }
                field(BooleanField_9; Rec.BooleanField_9)
                {
                }
                field(IntegerField_1; Rec.IntegerField_1)
                {
                }
                field(IntegerField_2; Rec.IntegerField_2)
                {
                }
                field(IntegerField_3; Rec.IntegerField_3)
                {
                }
                field(IntegerField_4; Rec.IntegerField_4)
                {
                }
                field(IntegerField_5; Rec.IntegerField_5)
                {
                }
                field(IntegerField_6; Rec.IntegerField_6)
                {
                }
                field(IntegerField_7; Rec.IntegerField_7)
                {
                }
                field(IntegerField_8; Rec.IntegerField_8)
                {
                }
                field(IntegerField_9; Rec.IntegerField_9)
                {
                }
                field(NumberField_1; Rec.NumberField_1)
                {
                }
                field(NumberField_2; Rec.NumberField_2)
                {
                }
                field(NumberField_3; Rec.NumberField_3)
                {
                }
                field(NumberField_4; Rec.NumberField_4)
                {
                }
                field(NumberField_5; Rec.NumberField_5)
                {
                }
                field(NumberField_6; Rec.NumberField_6)
                {
                }
                field(NumberField_7; Rec.NumberField_7)
                {
                }
                field(NumberField_8; Rec.NumberField_8)
                {
                }
                field(NumberField_9; Rec.NumberField_9)
                {
                }
                field(DateField_1; Rec.DateField_1)
                {
                }
                field(DateField_2; Rec.DateField_2)
                {
                }
                field(DateField_3; Rec.DateField_3)
                {
                }
                field(DateField_4; Rec.DateField_4)
                {
                }
                field(DateField_5; Rec.DateField_5)
                {
                }
                field(DateField_6; Rec.DateField_6)
                {
                }
                field(DateField_7; Rec.DateField_7)
                {
                }
                field(DateField_8; Rec.DateField_8)
                {
                }
                field(DateField_9; Rec.DateField_9)
                {
                }
                field(StringField_1; Rec.StringField_1)
                {
                }
                field(StringField_2; Rec.StringField_2)
                {
                }
                field(StringField_3; Rec.StringField_3)
                {
                }
                field(StringField_4; Rec.StringField_4)
                {
                }
                field(StringField_5; Rec.StringField_5)
                {
                }
                field(StringField_6; Rec.StringField_6)
                {
                }
                field(StringField_7; Rec.StringField_7)
                {
                }
                field(StringField_8; Rec.StringField_8)
                {
                }
                field(StringField_9; Rec.StringField_9)
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("Close Order"; Rec."Close Order")
                {
                }
                field("Move List Key"; Rec."Move List Key")
                {
                }
                field("Move Key List Key"; Rec."Move Key List Key")
                {
                }
                field("Move Key Move Key"; Rec."Move Key Move Key")
                {
                }
                field("Qa Pending Quantity"; Rec."Qa Pending Quantity")
                {
                }
                field("Scrap Quantity"; Rec."Scrap Quantity")
                {
                }
                field("To Qa Pending"; Rec."To Qa Pending")
                {
                }
                field("Grouped Operation Key"; Rec."Grouped Operation Key")
                {
                }
                field("Tool Key"; Rec."Tool Key")
                {
                }
                field("Workplace Key"; Rec."Workplace Key")
                {
                }
                field("Posting Code"; Rec."Posting Code")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("Document Key"; Rec."Document Key")
                {
                }
                field("Partner No."; Rec."Partner No.")
                {
                }
                field("Order Operation Key"; Rec."Order Operation Key")
                {
                }
            }
        }
    }

    actions
    {
    }
}

