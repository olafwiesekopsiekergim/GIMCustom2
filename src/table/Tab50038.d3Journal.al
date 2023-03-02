table 50038 "d3 Journal"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
            Description = 'AutoIncrement=Yes';
        }
        field(3; "Export Status"; Option)
        {
            Caption = 'Export Status';
            Description = 'd3 verarbeitung';
            Editable = false;
            OptionCaption = 'Open,Processed';
            OptionMembers = Open,Processed;
        }
        field(4; "Import Status"; Option)
        {
            Caption = 'Import Status';
            Description = 'NAV verarbeitung';
            Editable = false;
            OptionCaption = 'Open,Processed';
            OptionMembers = Open,Processed;
        }
        field(5; RegistrierNr; Code[20])
        {
            Caption = 'Registrier Nr.';
            Description = 'Anbindung an D3';
            Numeric = true;
        }
        field(6; d3_doc_id; Code[20])
        {
            Caption = 'd3 Dokument ID';
            Description = 'Anbindung an D3';
        }
        field(10; "Source Type"; Integer)
        {
            Caption = 'Source Type';
        }
        field(11; "Source Subtype"; Option)
        {
            Caption = 'Source Subtype';
            OptionCaption = '0,1,2,3,4,5,6,7,8,9,10';
            OptionMembers = "0","1","2","3","4","5","6","7","8","9","10";
        }
        field(12; "Source ID"; Code[20])
        {
            Caption = 'Source ID';
        }
        field(13; "Source Batch Name"; Code[10])
        {
            Caption = 'Source Batch Name';
        }
        field(14; "Source Prod. Order Line"; Integer)
        {
            Caption = 'Source Prod. Order Line';
        }
        field(15; "Source Ref. No."; Integer)
        {
            Caption = 'Source Ref. No.';
        }
        field(30; "Source No."; Code[20])
        {
            Caption = 'Source No.';
        }
        field(31; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            TableRelation = Contact;

            trigger OnLookup()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
            begin
            end;

            trigger OnValidate()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
            begin
            end;
        }
        field(32; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(34; "Our Account No."; Text[20])
        {
            Caption = 'Our Account No.';
        }
        field(35; "Country Code"; Code[10])
        {
            Caption = 'Country Code';
            TableRelation = "Country/Region";
        }
        field(37; City; Text[30])
        {
            Caption = 'City';
        }
        field(41; "Source Reference"; Text[30])
        {
            Caption = 'Source Reference';
        }
        field(42; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = false;
            TableRelation = Currency;
        }
        field(43; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(44; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(49; "Order Date"; Date)
        {
            Caption = 'Order Date';
        }
        field(50; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(60; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount';
            Editable = false;
        }
        field(61; "Amount Including VAT"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount Including VAT';
            Editable = false;
        }
        field(66; "Source Order No."; Code[20])
        {
            Caption = 'Source Order No.';
        }
        field(68; "Source Invoice No."; Code[35])
        {
            Caption = 'Source Invoice No.';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Source Type", "Source ID")
        {
        }
    }

    fieldgroups
    {
    }

    var
        d3Journal: Record "d3 Journal";
        Text000: Label 'file://%1';

    // [Scope('Internal')]
    procedure CreateLineFromPurch(PurchHeader: Record "Purchase Header"; PostingNo: Code[20])
    var
        lPurchInvHeader: Record "Purch. Inv. Header";
        lPurchCMHeader: Record "Purch. Cr. Memo Hdr.";
    begin
        if not DocExists(PurchHeader.RegistrierNr) then begin
            case PurchHeader."Document Type" of
                PurchHeader."Document Type"::Order, PurchHeader."Document Type"::Invoice:
                    begin
                        if lPurchInvHeader.Get(PostingNo) then  //???prüfen ob letzte Nummer OK???
                            PostPurchInv(lPurchInvHeader);
                    end;
                PurchHeader."Document Type"::"Credit Memo", PurchHeader."Document Type"::"Return Order":
                    begin
                        if lPurchCMHeader.Get(PostingNo) then
                            PostPurchCMemo(lPurchCMHeader);
                    end;
            end;
        end;
    end;

    // [Scope('Internal')]
    procedure CreateLineFromPurchUnposted(PurchHeader: Record "Purchase Header"; PostingNo: Code[20])
    begin
        if not DocExists(PurchHeader.RegistrierNr) then begin
            case PurchHeader."Document Type" of
                PurchHeader."Document Type"::Order, PurchHeader."Document Type"::Invoice:
                    begin
                        PostPurchInvUnposted(PurchHeader);
                    end;
                PurchHeader."Document Type"::"Credit Memo", PurchHeader."Document Type"::"Return Order":
                    begin
                        PostPurchCMemoUnposted(PurchHeader);
                    end;
            end;
        end;
    end;

    // [Scope('Internal')]
    procedure PostPurchInv(PurchInvHeader: Record "Purch. Inv. Header")
    var
        lVendor: Record Vendor;
        lCont: Record Contact;
    begin
        if not lVendor.Get(PurchInvHeader."Buy-from Vendor No.") then
            lVendor.Init;
        PurchInvHeader.CalcFields(Amount, "Amount Including VAT");
        Clear(d3Journal);
        d3Journal.Init;
        d3Journal.RegistrierNr := PurchInvHeader.RegistrierNr;
        d3Journal."Source Type" := 122;
        d3Journal."Source ID" := PurchInvHeader."No.";
        d3Journal."Source No." := PurchInvHeader."Buy-from Vendor No.";
        d3Journal."Contact No." := GetContact(2, d3Journal."Source No.");
        d3Journal.Name := PurchInvHeader."Buy-from Vendor Name";
        d3Journal."Our Account No." := lVendor."Our Account No.";
        d3Journal."Country Code" := lVendor."Country/Region Code";
        d3Journal.City := lVendor.City;
        d3Journal."Source Reference" := PurchInvHeader."Your Reference";
        d3Journal."Currency Code" := PurchInvHeader."Currency Code";
        d3Journal."Order No." := PurchInvHeader."Order No.";
        d3Journal."Document Date" := PurchInvHeader."Document Date";
        d3Journal."Order Date" := PurchInvHeader."Order Date";
        d3Journal."Posting Date" := PurchInvHeader."Posting Date";
        d3Journal.Amount := PurchInvHeader.Amount;
        d3Journal."Amount Including VAT" := PurchInvHeader."Amount Including VAT";
        d3Journal."Source Order No." := PurchInvHeader."Vendor Order No.";
        d3Journal."Source Invoice No." := PurchInvHeader."Vendor Invoice No.";
        d3Journal.Insert(true);
    end;

    // [Scope('Internal')]
    procedure PostPurchInvUnposted(PurchHeader: Record "Purchase Header")
    var
        lVendor: Record Vendor;
        lCont: Record Contact;
    begin
        if not lVendor.Get(PurchHeader."Buy-from Vendor No.") then
            lVendor.Init;
        PurchHeader.CalcFields(Amount, "Amount Including VAT");
        Clear(d3Journal);
        d3Journal.Init;
        d3Journal.RegistrierNr := PurchHeader.RegistrierNr;
        d3Journal."Source Type" := 122;
        d3Journal."Source ID" := PurchHeader."No.";
        d3Journal."Source No." := PurchHeader."Buy-from Vendor No.";
        d3Journal."Contact No." := GetContact(2, d3Journal."Source No.");
        d3Journal.Name := PurchHeader."Buy-from Vendor Name";
        d3Journal."Our Account No." := lVendor."Our Account No.";
        d3Journal."Country Code" := lVendor."Country/Region Code";
        d3Journal.City := lVendor.City;
        d3Journal."Source Reference" := PurchHeader."Your Reference";
        d3Journal."Currency Code" := PurchHeader."Currency Code";
        d3Journal."Order No." := PurchHeader."No.";
        d3Journal."Document Date" := PurchHeader."Document Date";
        d3Journal."Order Date" := PurchHeader."Order Date";
        d3Journal."Posting Date" := PurchHeader."Posting Date";
        d3Journal.Amount := PurchHeader.Amount;
        d3Journal."Amount Including VAT" := PurchHeader."Amount Including VAT";
        d3Journal."Source Order No." := PurchHeader."Vendor Order No.";
        d3Journal."Source Invoice No." := PurchHeader."Vendor Invoice No.";
        d3Journal.Insert(true);
    end;

    // [Scope('Internal')]
    procedure PostPurchCMemo(PurchCMHeader: Record "Purch. Cr. Memo Hdr.")
    var
        lVendor: Record Vendor;
        lCont: Record Contact;
    begin
        if not lVendor.Get(PurchCMHeader."Buy-from Vendor No.") then
            lVendor.Init;
        PurchCMHeader.CalcFields(Amount, "Amount Including VAT");
        Clear(d3Journal);
        d3Journal.Init;
        d3Journal.RegistrierNr := PurchCMHeader.RegistrierNr;
        d3Journal."Source Type" := 124;
        d3Journal."Source ID" := PurchCMHeader."No.";
        d3Journal."Source No." := PurchCMHeader."Buy-from Vendor No.";
        d3Journal."Contact No." := GetContact(2, d3Journal."Source No.");
        d3Journal.Name := PurchCMHeader."Buy-from Vendor Name";
        d3Journal."Our Account No." := lVendor."Our Account No.";
        d3Journal."Country Code" := lVendor."Country/Region Code";
        d3Journal.City := lVendor.City;
        d3Journal."Source Reference" := PurchCMHeader."Your Reference";
        d3Journal."Currency Code" := PurchCMHeader."Currency Code";
        d3Journal."Document Date" := PurchCMHeader."Document Date";
        d3Journal."Order No." := PurchCMHeader."Return Order No.";
        d3Journal."Posting Date" := PurchCMHeader."Posting Date";
        d3Journal.Amount := PurchCMHeader.Amount;
        d3Journal."Amount Including VAT" := PurchCMHeader."Amount Including VAT";
        d3Journal."Source Invoice No." := PurchCMHeader."Vendor Cr. Memo No.";
        d3Journal.Insert(true);
    end;

    // [Scope('Internal')]
    procedure PostPurchCMemoUnposted(PurchHeader: Record "Purchase Header")
    var
        lVendor: Record Vendor;
        lCont: Record Contact;
    begin
        if not lVendor.Get(PurchHeader."Buy-from Vendor No.") then
            lVendor.Init;
        PurchHeader.CalcFields(Amount, "Amount Including VAT");
        Clear(d3Journal);
        d3Journal.Init;
        d3Journal.RegistrierNr := PurchHeader.RegistrierNr;
        d3Journal."Source Type" := 124;
        d3Journal."Source ID" := PurchHeader."No.";
        d3Journal."Source No." := PurchHeader."Buy-from Vendor No.";
        d3Journal."Contact No." := GetContact(2, d3Journal."Source No.");
        d3Journal.Name := PurchHeader."Buy-from Vendor Name";
        d3Journal."Our Account No." := lVendor."Our Account No.";
        d3Journal."Country Code" := lVendor."Country/Region Code";
        d3Journal.City := lVendor.City;
        d3Journal."Source Reference" := PurchHeader."Your Reference";
        d3Journal."Currency Code" := PurchHeader."Currency Code";
        d3Journal."Document Date" := PurchHeader."Document Date";
        d3Journal."Order No." := PurchHeader."No.";
        d3Journal."Posting Date" := PurchHeader."Posting Date";
        d3Journal.Amount := PurchHeader.Amount;
        d3Journal."Amount Including VAT" := PurchHeader."Amount Including VAT";
        d3Journal."Source Invoice No." := PurchHeader."Vendor Cr. Memo No.";
        d3Journal.Insert(true);
    end;

    // [Scope('Internal')]
    procedure GetContact(Type: Integer; No: Code[20]): Code[20]
    var
        ContBusRelation: Record "Contact Business Relation";
    begin
        ContBusRelation.SetCurrentKey("Link to Table", "No.");
        ContBusRelation.SetRange("Link to Table", Type);
        ContBusRelation.SetRange("No.", No);
        if not ContBusRelation.FindFirst then
            ContBusRelation.Init;

        exit(ContBusRelation."Contact No.");
    end;

    // [Scope('Internal')]
    procedure OpenDocument(d3ID: Code[20])
    var
        LinkCode: Text[250];
        LinkCode2: Text[250];
        Par: Text[250];
        PurchaseSetup: Record "Purchases & Payables Setup";
    begin
        if not PurchaseSetup.Get then
            Error('Es fehlt die Einkaufs Einrchtung');
        PurchaseSetup.TestField(BaseURLForD3Documents);

        LinkCode := StrSubstNo(PurchaseSetup.BaseURLForD3Documents, d3ID);
        HyperLink(LinkCode);

        //LinkCode := STRSUBSTNO('d3://d3explorer/idlist=%1', d3ID);


        //HYPERLINK('vwerner.de');
        //HYPERLINK(STRSUBSTNO('d3:\\\\d3explorer\idlist=%1', d3ID))
        /*
        LinkCode2 := STRSUBSTNO('d3://');
        Par := STRSUBSTNO('d3explorer/idlist=%1', d3ID);
        
        LinkCode2 := STRSUBSTNO('command');
        Par := STRSUBSTNO('d3://d3explorer/idlist=%1', d3ID);
        */
        //HYPERLINK(STRSUBSTNO(Text000,LinkCode));
        //SHELL(STRSUBSTNO(Text000,LinkCode));
        //HYPERLINK(LinkCode);
        //SHELL(LinkCode2,Par);
        //SHELL('"C:\Program Files (x86)\Internet Explorer\iexplore.exe"',STRSUBSTNO('d3://d3explorer\idlist=%1', d3ID))

    end;

    local procedure DocExists(RegistrierNr: Code[50]) ret: Boolean
    var
        D3Journal: Record "d3 Journal";
    begin
        D3Journal.SetRange(RegistrierNr, RegistrierNr);
        exit(D3Journal.FindFirst());
    end;
}

