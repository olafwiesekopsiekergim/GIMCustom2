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
                    ApplicationArea = All;
                }
                field("Main Posting No."; Rec."Main Posting No.")
                {
                    ApplicationArea = All;
                }
                field("Transaction No."; Rec."Transaction No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Type"; Rec."Posting Type")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Message Type"; Rec."Message Type")
                {
                    ApplicationArea = All;
                }
                field("Message Text"; Rec."Message Text")
                {
                    ApplicationArea = All;
                }
                field("Printer Name"; Rec."Printer Name")
                {
                    ApplicationArea = All;
                }
                field("Printed Copies"; Rec."Printed Copies")
                {
                    ApplicationArea = All;
                }
                field("Site Code"; Rec."Site Code")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Location Code Bin Code"; Rec."Location Code Bin Code")
                {
                    ApplicationArea = All;
                }
                field("Location Key Location Code"; Rec."Location Key Location Code")
                {
                    ApplicationArea = All;
                }
                field("Location Key Bin Code"; Rec."Location Key Bin Code")
                {
                    ApplicationArea = All;
                }
                field("Zone Code"; Rec."Zone Code")
                {
                    ApplicationArea = All;
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ApplicationArea = All;
                }
                field("New Site Code"; Rec."New Site Code")
                {
                    ApplicationArea = All;
                }
                field("New Location Code"; Rec."New Location Code")
                {
                    ApplicationArea = All;
                }
                field("New Location Code Bin Code"; Rec."New Location Code Bin Code")
                {
                    ApplicationArea = All;
                }
                field("New Location Key Location Code"; Rec."New Location Key Location Code")
                {
                    ApplicationArea = All;
                }
                field("New Location Key Bin Code"; Rec."New Location Key Bin Code")
                {
                    ApplicationArea = All;
                }
                field("New Zone Code"; Rec."New Zone Code")
                {
                    ApplicationArea = All;
                }
                field("New Bin Code"; Rec."New Bin Code")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = All;
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ApplicationArea = All;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = All;
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                    ApplicationArea = All;
                }
                field("Source Document Line No."; Rec."Source Document Line No.")
                {
                    ApplicationArea = All;
                }
                field("Prod. Order Line No."; Rec."Prod. Order Line No.")
                {
                    ApplicationArea = All;
                }
                field("Batch Name"; Rec."Batch Name")
                {
                    ApplicationArea = All;
                }
                field("Template Name"; Rec."Template Name")
                {
                    ApplicationArea = All;
                }
                field("Create Date"; Rec."Create Date")
                {
                    ApplicationArea = All;
                }
                field("Create User Id"; Rec."Create User Id")
                {
                    ApplicationArea = All;
                }
                field("Modify Date"; Rec."Modify Date")
                {
                    ApplicationArea = All;
                }
                field("Modify User Id"; Rec."Modify User Id")
                {
                    ApplicationArea = All;
                }
                field("NAV User ID"; Rec."NAV User ID")
                {
                    ApplicationArea = All;
                }
                field("Stock Key Item No."; Rec."Stock Key Item No.")
                {
                    ApplicationArea = All;
                }
                field("Stock Key Variant Code"; Rec."Stock Key Variant Code")
                {
                    ApplicationArea = All;
                }
                field("Stock Key Location Code"; Rec."Stock Key Location Code")
                {
                    ApplicationArea = All;
                }
                field("Stock Key Bin Code"; Rec."Stock Key Bin Code")
                {
                    ApplicationArea = All;
                }
                field("Stock Key Lot No."; Rec."Stock Key Lot No.")
                {
                    ApplicationArea = All;
                }
                field("Stock Key Serial No."; Rec."Stock Key Serial No.")
                {
                    ApplicationArea = All;
                }
                field("Stock Key Unit of Measure Code"; Rec."Stock Key Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Inventory Position Key Line No"; Rec."Inventory Position Key Line No")
                {
                    ApplicationArea = All;
                }
                field("Inventory No."; Rec."Inventory No.")
                {
                    ApplicationArea = All;
                }
                field("Recording No."; Rec."Recording No.")
                {
                    ApplicationArea = All;
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = All;
                }
                field("Weight Unit of Measure Code"; Rec."Weight Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field(BooleanField_1; Rec.BooleanField_1)
                {
                    ApplicationArea = All;
                }
                field(BooleanField_2; Rec.BooleanField_2)
                {
                    ApplicationArea = All;
                }
                field(BooleanField_3; Rec.BooleanField_3)
                {
                    ApplicationArea = All;
                }
                field(BooleanField_4; Rec.BooleanField_4)
                {
                    ApplicationArea = All;
                }
                field(BooleanField_5; Rec.BooleanField_5)
                {
                    ApplicationArea = All;
                }
                field(BooleanField_6; Rec.BooleanField_6)
                {
                    ApplicationArea = All;
                }
                field(BooleanField_7; Rec.BooleanField_7)
                {
                    ApplicationArea = All;
                }
                field(BooleanField_8; Rec.BooleanField_8)
                {
                    ApplicationArea = All;
                }
                field(BooleanField_9; Rec.BooleanField_9)
                {
                    ApplicationArea = All;
                }
                field(IntegerField_1; Rec.IntegerField_1)
                {
                    ApplicationArea = All;
                }
                field(IntegerField_2; Rec.IntegerField_2)
                {
                    ApplicationArea = All;
                }
                field(IntegerField_3; Rec.IntegerField_3)
                {
                    ApplicationArea = All;
                }
                field(IntegerField_4; Rec.IntegerField_4)
                {
                    ApplicationArea = All;
                }
                field(IntegerField_5; Rec.IntegerField_5)
                {
                    ApplicationArea = All;
                }
                field(IntegerField_6; Rec.IntegerField_6)
                {
                    ApplicationArea = All;
                }
                field(IntegerField_7; Rec.IntegerField_7)
                {
                    ApplicationArea = All;
                }
                field(IntegerField_8; Rec.IntegerField_8)
                {
                    ApplicationArea = All;
                }
                field(IntegerField_9; Rec.IntegerField_9)
                {
                    ApplicationArea = All;
                }
                field(NumberField_1; Rec.NumberField_1)
                {
                    ApplicationArea = All;
                }
                field(NumberField_2; Rec.NumberField_2)
                {
                    ApplicationArea = All;
                }
                field(NumberField_3; Rec.NumberField_3)
                {
                    ApplicationArea = All;
                }
                field(NumberField_4; Rec.NumberField_4)
                {
                    ApplicationArea = All;
                }
                field(NumberField_5; Rec.NumberField_5)
                {
                    ApplicationArea = All;
                }
                field(NumberField_6; Rec.NumberField_6)
                {
                    ApplicationArea = All;
                }
                field(NumberField_7; Rec.NumberField_7)
                {
                    ApplicationArea = All;
                }
                field(NumberField_8; Rec.NumberField_8)
                {
                    ApplicationArea = All;
                }
                field(NumberField_9; Rec.NumberField_9)
                {
                    ApplicationArea = All;
                }
                field(DateField_1; Rec.DateField_1)
                {
                    ApplicationArea = All;
                }
                field(DateField_2; Rec.DateField_2)
                {
                    ApplicationArea = All;
                }
                field(DateField_3; Rec.DateField_3)
                {
                    ApplicationArea = All;
                }
                field(DateField_4; Rec.DateField_4)
                {
                    ApplicationArea = All;
                }
                field(DateField_5; Rec.DateField_5)
                {
                    ApplicationArea = All;
                }
                field(DateField_6; Rec.DateField_6)
                {
                    ApplicationArea = All;
                }
                field(DateField_7; Rec.DateField_7)
                {
                    ApplicationArea = All;
                }
                field(DateField_8; Rec.DateField_8)
                {
                    ApplicationArea = All;
                }
                field(DateField_9; Rec.DateField_9)
                {
                    ApplicationArea = All;
                }
                field(StringField_1; Rec.StringField_1)
                {
                    ApplicationArea = All;
                }
                field(StringField_2; Rec.StringField_2)
                {
                    ApplicationArea = All;
                }
                field(StringField_3; Rec.StringField_3)
                {
                    ApplicationArea = All;
                }
                field(StringField_4; Rec.StringField_4)
                {
                    ApplicationArea = All;
                }
                field(StringField_5; Rec.StringField_5)
                {
                    ApplicationArea = All;
                }
                field(StringField_6; Rec.StringField_6)
                {
                    ApplicationArea = All;
                }
                field(StringField_7; Rec.StringField_7)
                {
                    ApplicationArea = All;
                }
                field(StringField_8; Rec.StringField_8)
                {
                    ApplicationArea = All;
                }
                field(StringField_9; Rec.StringField_9)
                {
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
                field("Close Order"; Rec."Close Order")
                {
                    ApplicationArea = All;
                }
                field("Move List Key"; Rec."Move List Key")
                {
                    ApplicationArea = All;
                }
                field("Move Key List Key"; Rec."Move Key List Key")
                {
                    ApplicationArea = All;
                }
                field("Move Key Move Key"; Rec."Move Key Move Key")
                {
                    ApplicationArea = All;
                }
                field("Qa Pending Quantity"; Rec."Qa Pending Quantity")
                {
                    ApplicationArea = All;
                }
                field("Scrap Quantity"; Rec."Scrap Quantity")
                {
                    ApplicationArea = All;
                }
                field("To Qa Pending"; Rec."To Qa Pending")
                {
                    ApplicationArea = All;
                }
                field("Grouped Operation Key"; Rec."Grouped Operation Key")
                {
                    ApplicationArea = All;
                }
                field("Tool Key"; Rec."Tool Key")
                {
                    ApplicationArea = All;
                }
                field("Workplace Key"; Rec."Workplace Key")
                {
                    ApplicationArea = All;
                }
                field("Posting Code"; Rec."Posting Code")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Document Key"; Rec."Document Key")
                {
                    ApplicationArea = All;
                }
                field("Partner No."; Rec."Partner No.")
                {
                    ApplicationArea = All;
                }
                field("Order Operation Key"; Rec."Order Operation Key")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

