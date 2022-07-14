/// <summary>
/// Table Internal Job (ID 50022).
/// </summary>
table 50022 "Internal Job"
{
    // P0005 16.02.16 CCBIE.ARE New object
    // 
    // c/gw/290911: - A20611, Erweitertes internes Projektmodul
    //              > neue Felder ...
    //                ... siehe Field Description
    //              > TANGIERTE OBJEKTE
    //                 1 36    Sales Header
    //                 1 110   Sales Shipment Header
    //                 1 112   Sales Invoice Header
    //                 1 114   Sales Cr.Memo Header
    //                 1 5107  Sales Header
    //                 1 50022 Internal Job
    //                 1 50037 Internal Job Line
    //                 2 41    Sales Quote
    //                 2 42    Sales Order
    //                 2 43    Sales Invoice
    //                 2 44    Sales Credit Memo
    //                 2 130   Posted Sales Shipment
    //                 2 132   Posted Sales Invoice
    //                 2 134   Posted Sales Credit Memo
    //                 2 5159  Sales Order Archive
    //                 2 5162  Sales Quote Archive
    //                 2 50021 Internal Jobs
    //                 2 50022 Internal Jobs List
    //                 2 50037 Internal Job Subform
    //                 3 50071 Belegstatistik Düsi
    //                 5 391   Shipment Header - Edit
    //                 |
    //                 1... Tabelle
    //                 2... Form
    //                 3... Report
    //                 5... Codeunit

    Caption = 'Internal Job';
    DrillDownPageID = "Internal Jobs List";
    LookupPageID = "Internal Jobs List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Bauvorhaben Description"; Text[30])
        {
            Caption = 'Building Project  Description';
            Description = 'c/gw/290911: A20611, Erweitertes internes Projektmodul   + '' Bauvorhaben '' ¦ ERWEIERUNG FELDNAMR';
        }
        field(3; "Bauvorhaben Description 2"; Text[30])
        {
            Caption = 'Building Projekt Descrition 2';
            Description = 'c/gw/290911: A20611, Erweitertes internes Projektmodul   + '' Bauvorhaben '' ¦ ERWEIERUNG FELDNAMR';
        }
        field(4; Planner; Text[30])
        {
            Caption = 'Planner';
        }
        field(5; "Make Desription"; Text[30])
        {
            Caption = 'Make Desription';
            Description = 'c/gw/290911: A20611, Erweitertes internes Projektmodul   + '' Description'' ¦ ERWEIERUNG FELDNAMR';
        }
        field(6; "Win/Loss"; Option)
        {
            Caption = 'Win/Loss';
            OptionCaption = ' ,Win,Loss';
            OptionMembers = " ",Win,Loss;
        }
        field(5000; "Item Descitption"; Text[30])
        {
            Caption = 'Item Descitption';
            Description = 'c/gw/290911: A20611, Erweitertes internes Projektmodul   + '' Description'' ¦ ERWEIERUNG FELDNAMR';
        }
        field(50000; "General Contractor Code"; Code[20])
        {
            Caption = 'General Contractor Code';
            Description = 'c/gw/290911: A20611, Erweitertes internes Projektmodul ¦ NEUES FELD';

            trigger OnLookup()
            var
                lContactRec: Record Contact;
                lContactNo: Code[20];
            begin
                lContactRec.SetRange(Type, lContactRec.Type::Company);
                lContactNo := LookupContact(lContactRec);
                if lContactNo <> '' then begin
                    "General Contractor Code" := lContactNo;
                    "General Contractor" := GetContactDescription("General Contractor Code");
                end;
            end;
        }
        field(50010; "General Contractor"; Text[30])
        {
            Caption = 'General Contractor';
            Description = 'c/gw/290911: A20611, Erweitertes internes Projektmodul ¦ NEUES FELD  GW+';
        }
        field(50100; City; Text[30])
        {
            Caption = 'City';
            Description = 'c/gw/290911: A20611, Erweitertes internes Projektmodul ¦ NEUES FELD';
        }
        field(50200; "Planner Code"; Code[20])
        {
            Caption = 'Planner Code';
            Description = 'c/gw/290911: A20611, Erweitertes internes Projektmodul';

            trigger OnLookup()
            var
                lContactRec: Record Contact;
                lContactNo: Code[20];
            begin
                lContactNo := LookupContact(lContactRec);
                if lContactNo <> '' then begin
                    "Planner Code" := lContactNo;
                    Planner := GetContactDescription("Planner Code");
                end;
            end;
        }
        field(50300; "Supplement to"; Code[20])
        {
            Caption = 'Supplement to';
            Description = 'c/gw/290911: A20611 DEU=Zuschlag an;ENU=Supplement to ¦ NEUES FELD';
        }
        field(50400; "Cabinet Part Received"; DateTime)
        {
            Caption = 'cabinet part received';
            Description = 'c/gw/290911: A20611 DEU=Schrankteil erhalten;ENU=cabinet part received ¦ NEUES FELD';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Win/Loss")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        lInternalJobLineRec: Record "Internal Job Line";
    begin
        lInternalJobLineRec.SetRange("Internal Job No.", "No.");
        lInternalJobLineRec.DeleteAll;
    end;

    //[Scope('OnPrem')]
    procedure LookupContact(var vContactRec: Record Contact) rOutGoing: Code[20]
    var
        lContactListFrm: Page "Contact List";
    begin
        lContactListFrm.SetTableView(vContactRec);
        lContactListFrm.LookupMode(true);
        if lContactListFrm.RunModal = ACTION::LookupOK then begin
            lContactListFrm.GetRecord(vContactRec);
            rOutGoing := vContactRec."No.";
        end;
    end;

    //[Scope('OnPrem')]
    procedure GetContactDescription(pInComing: Code[20]) rOutGoing: Text[30]
    var
        lContactRec: Record Contact;
    begin
        lContactRec.Get(pInComing);
        rOutGoing := lContactRec.Name
    end;

    //[Scope('OnPrem')]
    procedure ShowSalesDoc(DocType: Integer)
    var
        SalesHeader: Record "Sales Header";
    begin
        //Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,,,,,,,,,,Reservation
        SalesHeader.SetCurrentKey("Internal Job No.");
        SalesHeader.SetRange("Internal Job No.", "No.");
        SalesHeader.SetRange("Document Type", DocType);
        PAGE.Run(0, SalesHeader);
    end;

    // [Scope('OnPrem')]
    procedure ShowArchSalesDoc(DocType: Integer)
    var
        SalesHeaderArchive: Record "Sales Header Archive";
    begin
        //Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order
        SalesHeaderArchive.SetCurrentKey("Internal Job No.");
        SalesHeaderArchive.SetRange("Internal Job No.", "No.");
        SalesHeaderArchive.SetRange("Document Type", DocType);
        PAGE.Run(0, SalesHeaderArchive);
    end;

    // [Scope('OnPrem')]
    procedure ShowSalesShipment()
    var
        SalesShipmentHeader: Record "Sales Shipment Header";
    begin
        SalesShipmentHeader.SetCurrentKey("Internal Job No.");
        SalesShipmentHeader.SetRange("Internal Job No.", "No.");
        PAGE.Run(0, SalesShipmentHeader);
    end;

    // [Scope('OnPrem')]
    procedure ShowSalesInvoice()
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
    begin
        SalesInvoiceHeader.SetCurrentKey("Internal Job No.");
        SalesInvoiceHeader.SetRange("Internal Job No.", "No.");
        PAGE.Run(0, SalesInvoiceHeader);
    end;

    // [Scope('OnPrem')]
    procedure ShowSalesCrMemo()
    var
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    begin
        SalesCrMemoHeader.SetCurrentKey("Internal Job No.");
        SalesCrMemoHeader.SetRange("Internal Job No.", "No.");
        PAGE.Run(0, SalesCrMemoHeader);
    end;
}

