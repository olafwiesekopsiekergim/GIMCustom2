table 50055 "Mobile Transaction Head"
{
    // L-MOBILE LM2.00
    //   object defined
    // 
    // L-MOBILE LM2.00.05
    //   trigger
    //     OnDelete
    //   modified

    Caption = 'Mobile Transaction Head';

    fields
    {
        field(10; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(20; Status; Integer)
        {
            Caption = 'Status';
        }
        field(30; Priority; Integer)
        {
            Caption = 'Priority';
        }
        field(40; "Vendor Shipment No."; Code[20])
        {
            Caption = 'Vendor Shipment No.';
        }
        field(50; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
        }
        field(60; "Posting Date"; DateTime)
        {
            Caption = 'Posting Date';
        }
        field(70; "Posting User Id"; Code[20])
        {
            Caption = 'Posting User Id';
        }
        field(80; "Executed Date"; DateTime)
        {
            Caption = 'Executed Date';
        }
        field(90; "Retrying Date"; DateTime)
        {
            Caption = 'Retrying Date';
        }
        field(100; "Retry Counter"; Integer)
        {
            Caption = 'Retry Counter';
        }
        field(110; "Error Entry No."; Integer)
        {
            Caption = 'Error Entry No.';
        }
        field(120; "Message Type"; Option)
        {
            Caption = 'Message Type';
            OptionCaption = 'Info,Warning,Error';
            OptionMembers = Info,Warning,Error;
        }
        field(130; "Message Text"; Text[250])
        {
            Caption = 'Message Text';
        }
        field(1000; "Create Date"; DateTime)
        {
            Caption = 'Create Date';
        }
        field(1010; "Create User Id"; Code[50])
        {
            Caption = 'Create User Id';
        }
        field(1020; "Modify Date"; DateTime)
        {
            Caption = 'Modify Date';
        }
        field(1030; "Modify User Id"; Code[50])
        {
            Caption = 'Modify User Id';
        }
        field(1040; "Source Type"; Text[64])
        {
            Caption = 'Source Type';
        }
        field(1050; "Source Document No."; Code[50])
        {
            Caption = 'Source Document No.';
        }
        field(1060; "Document Date"; DateTime)
        {
            Caption = 'Document Date';
        }
        field(1070; "Move List Key"; Code[20])
        {
            Caption = 'Warehouse Document No';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        MobileTransactionLine: Record "Mobile Transaction Line";
    begin
        //+LM2.00.05
        MobileTransactionLine.SetRange("Transaction No.", "No.");
        MobileTransactionLine.DeleteAll(true);
        //-LM2.00.05
    end;

    [Scope('OnPrem')]
    procedure SetToUnprocessed(var MobileTransactionHead2: Record "Mobile Transaction Head")
    var
        MobileTransactionHead: Record "Mobile Transaction Head";
        MobileTransactionLine: Record "Mobile Transaction Line";
    begin
        MobileTransactionHead.Copy(MobileTransactionHead2);
        MobileTransactionHead.FindSet;
        repeat
            MobileTransactionLine.SetRange("Transaction No.", "No.");
            MobileTransactionLine.ModifyAll(Status, 10);
            MobileTransactionHead.Status := 10;
            MobileTransactionHead."Error Entry No." := 0;
            MobileTransactionHead."Message Type" := 0;
            MobileTransactionHead."Message Text" := '';
            MobileTransactionHead.Modify;
        until MobileTransactionHead.Next = 0;
    end;

    // [Scope('OnPrem')]
    // procedure Post(var MobileTransactionHead2: Record "Mobile Transaction Head")
    // var
    //     MobileTransactionHead: Record "Mobile Transaction Head";
    //     MobileTransProcTimer: Codeunit "Mobile Trans. Proc. Timer";
    // begin
    //     //+LM2.00.08
    //     // IF CODEUNIT.RUN(CODEUNIT::"Mobile Trans. Proc. Work",MobTransHdr) THEN BEGIN
    //     //  MobTransHdr.Status := 42;
    //     //  MobTransHdr."Message Type" := MobTransHdr."Message Type"::Info;
    //     //  MobTransHdr."Message Text" := '';
    //     // END ELSE BEGIN
    //     //  MobTransHdr.Status := 99;
    //     //  MobTransHdr."Message Type" := MobTransHdr."Message Type"::Error;
    //     //  MobTransHdr."Message Text" := COPYSTR(GETLASTERRORTEXT,1,MAXSTRLEN(MobTransHdr."Message Text"));
    //     // END;
    //     // MobTransHdr.MODIFY;
    //     // MobTransLine.SETRANGE("Transaction No.",MobTransHdr."No.");
    //     // IF MobTransLine.FINDSET THEN BEGIN
    //     //  REPEAT
    //     //    MobTransEff.SETRANGE("Posting No.",MobTransLine."No.");
    //     //    MobTransEff.DELETEALL;
    //     //  UNTIL MobTransLine.NEXT = 0;
    //     //  MobTransLine.MODIFYALL(Status,MobTransHdr.Status);
    //     // END;
    //     MobileTransactionHead.Copy(MobileTransactionHead2);
    //     MobileTransactionHead.SetRecFilter;
    //     MobileTransProcTimer.SetSingleRecordPost(MobileTransactionHead);
    //     MobileTransProcTimer.Code;
    //     //-LM2.00.08
    // end;

    [Scope('OnPrem')]
    procedure ShowSourceDocument()
    var
        PurchaseHeader: Record "Purchase Header";
        WarehouseActivityHeader: Record "Warehouse Activity Header";
    begin
        //+LM2.00.08
        case UpperCase("Source Type") of
            'PURCHASEORDER':
                begin
                    PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, "Source Document No.");
                    PAGE.RunModal(PAGE::"Purchase Order", PurchaseHeader);
                end;
            'MOVELIST':
                begin
                    if WarehouseActivityHeader.Get(WarehouseActivityHeader.Type::Pick, "Source Document No.") then
                        PAGE.RunModal(PAGE::"Warehouse Pick", WarehouseActivityHeader)
                    else begin
                        if WarehouseActivityHeader.Get(WarehouseActivityHeader.Type::"Invt. Pick", "Source Document No.") then
                            PAGE.RunModal(PAGE::"Inventory Pick", WarehouseActivityHeader)
                        else begin
                            if WarehouseActivityHeader.Get(WarehouseActivityHeader.Type::"Invt. Put-away", "Source Document No.") then
                                PAGE.RunModal(PAGE::"Inventory Put-away", WarehouseActivityHeader)
                            else begin
                                if WarehouseActivityHeader.Get(WarehouseActivityHeader.Type::"Put-away", "Source Document No.") then
                                    PAGE.RunModal(PAGE::"Warehouse Put-away", WarehouseActivityHeader);
                            end;
                        end;
                    end;
                end;
        end;
        //-LM2.00.08
    end;
}

