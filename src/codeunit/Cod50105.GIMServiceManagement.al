/// <summary>
/// Codeunit GIMServiceManagement (ID 50105).
/// </summary>
codeunit 50105 "GIMServiceManagement"
{
    // Bibliothek für das Service Modul
    // GIM0003 3.3.2022 Modified Function CopyServItemsFromServItemLineToServAlloc, Source is now Service Item Line


    trigger OnRun()
    begin
    end;

    [Scope('OnPrem')]
    procedure ServiceContractCopyFromCurrToBeyond(FromServiceContractLine: Record "Service Contract Line")
    var
        ToServiceContractLine: Record "Service Contract Line";
        txtNoServiceContractLineFound: Label 'No Service Contract Lines found. You can''t copy anything.';
    begin
        //Copy Fields from first Line to the others

        //get Define Which Lines to Modify
        ToServiceContractLine.SetRange(ToServiceContractLine."Contract Type", FromServiceContractLine."Contract Type");
        ToServiceContractLine.SetRange(ToServiceContractLine."Contract No.", FromServiceContractLine."Contract No.");
        ToServiceContractLine.SetFilter("Line No.", '>%1', FromServiceContractLine."Line No.");

        //  IF TOServiceContractline.FINDSET then
        //    iOffset:=ToServiceContractLine.COUNT
        //  ELSE
        //    iOffset:=0,

        if ToServiceContractLine.FindSet(true, false) then begin
            repeat
                ToServiceContractLine.Validate("Service Item No.");
                //ToServiceContractLine.VALIDATE(Type,FromServiceContractLine.Type);
                ToServiceContractLine.Validate(ToServiceContractLine."Service Period", FromServiceContractLine."Service Period");
                ToServiceContractLine.Validate(ToServiceContractLine."Next Planned Service Date", FromServiceContractLine."Next Planned Service Date");
                ToServiceContractLine.Validate(ToServiceContractLine."Contract Expiration Date", FromServiceContractLine."Contract Expiration Date");
                ToServiceContractLine.Validate(ToServiceContractLine.Menge, FromServiceContractLine.Menge);
                ToServiceContractLine.Validate(ToServiceContractLine."Line Value", FromServiceContractLine."Line Value");
                ToServiceContractLine.Validate(ToServiceContractLine."Line Discount %", FromServiceContractLine."Line Discount %");
                ToServiceContractLine.Modify(true);

            until ToServiceContractLine.Next = 0;

        end else
            Error(txtNoServiceContractLineFound);
    end;

    [Scope('OnPrem')]
    procedure ServiceLineCopyFromCurrToBeyond(FromServiceLine: Record "Service Line")
    var
        ToServiceLine: Record "Service Line";
        i: Integer;
        iOffset: Integer;
    begin
        //Copy Fields From first Service Line to the others
        ToServiceLine.SetRange("Document Type", FromServiceLine."Document Type");
        ToServiceLine.SetRange("Document No.", FromServiceLine."Document No.");
        ToServiceLine.SetFilter("Line No.", '<=%1', FromServiceLine."Line No.");
        if ToServiceLine.FindSet then
            iOffset := ToServiceLine.Count
        else
            iOffset := 0;

        ToServiceLine.SetRange("Document Type", FromServiceLine."Document Type");
        ToServiceLine.SetRange("Document No.", FromServiceLine."Document No.");
        ToServiceLine.SetFilter("Line No.", '>%1', FromServiceLine."Line No.");
        i := iOffset;
        if ToServiceLine.FindSet(true, false) then
            repeat

                i += 1;
                //ToServiceLine.VALIDATE(RepairStatusCode,FromServiceLine.RepairStatusCode);
                ToServiceLine.Validate(Type, FromServiceLine.Type);
                ToServiceLine.Validate("No.", FromServiceLine."No.");
                ToServiceLine.Validate(Quantity, FromServiceLine.Quantity);
                ToServiceLine.Validate("Unit of Measure Code", FromServiceLine."Unit of Measure Code");
                //ToServiceLine.VALIDATE(ToServiceLine.Description, FromServiceLine.Description);
                //ToServiceLine.VALIDATE(ToServiceLine."Description 2");
                ToServiceLine.Validate(ToServiceLine."Shortcut Dimension 1 Code", FromServiceLine."Shortcut Dimension 1 Code");
                ToServiceLine.Validate(ToServiceLine."Shortcut Dimension 2 Code", FromServiceLine."Shortcut Dimension 2 Code");
                ToServiceLine.Validate(ToServiceLine."Location Code", FromServiceLine."Location Code");
                ToServiceLine.Validate(ToServiceLine."Unit Price", FromServiceLine."Unit Price");
                ToServiceLine.Validate(ToServiceLine."Line Discount %", FromServiceLine."Line Discount %");
                // ToServiceLine.VALIDATE(ToServiceLine."Line Amount",FromServiceLine."Line Amount");
                ToServiceLine.Validate(ToServiceLine."Qty. to Ship", FromServiceLine."Qty. to Ship");
                ToServiceLine.Validate(ToServiceLine."Inv. Discount Amount", FromServiceLine."Inv. Discount Amount");
                ToServiceLine.Validate(ToServiceLine."Gen. Prod. Posting Group", FromServiceLine."Gen. Prod. Posting Group");
                ToServiceLine.Validate(ToServiceLine."Gen. Bus. Posting Group", FromServiceLine."Gen. Bus. Posting Group");
                ToServiceLine.Validate(ToServiceLine."VAT Prod. Posting Group", FromServiceLine."VAT Prod. Posting Group");
                //TODO Positionnsnr.?
                ToServiceLine.Position := Format(i) + '.';
                ToServiceLine.Modify(true);

            until ToServiceLine.Next = 0;
    end;

    [Scope('OnPrem')]
    procedure ServiceItemLineCopyFrom1ToAll()
    var
        FromServItemLine: Record "Service Item Line";
        ToServItemLine: Record "Service Item Line";
    begin
        ToServItemLine.SetRange("Document Type", FromServItemLine."Document Type");
        ToServItemLine.SetRange("Document No.", FromServItemLine."Document No.");
        if ToServItemLine.FindSet(true, false) then
            repeat
            //
            //  ToServItemLine."Shortcut Dimension 1 Code"
            //  ToServItemLine."Shortcut Dimension 2 Code"
            //  ToServItemLine."Location of Service Item"


            until ToServItemLine.Next = 0;
    end;

    [Scope('OnPrem')]
    procedure CopyServItemsFromServItemLineToServAlloc(ServHeader: Record "Service Header")
    var
        ServItemLine: Record "Service Item Line";
        ServAlloc: Record "Service Order Allocation";
        txtServAllocExist: Label 'Service Allocation exists. You can only copy service Items to a empty Service Allocation.';
    begin
        //Copy All Service Items from Service Line to Service Allocation

        //Test IF Service Allocation is empty
        ServAlloc.SetRange("Document Type", ServHeader."Document Type");
        ServAlloc.SetRange("Document No.", ServHeader."No.");
        if ServAlloc.FindSet then
            Error(txtServAllocExist);

        //Copy Routine
        ServItemLine.SetRange("Document Type", ServHeader."Document Type");
        ServItemLine.SetRange("Document No.", ServHeader."No.");
        if ServItemLine.FindSet then
            repeat

                ServAlloc.Init;
                ServAlloc.Validate("Document Type", ServHeader."Document Type");
                ServAlloc.Validate("Document No.", ServHeader."No.");
                ServAlloc.Validate("Service Item No.", ServItemLine."Service Item No.");

                ServAlloc.Insert(true);

            until ServItemLine.Next = 0;
    end;

    [Scope('OnPrem')]
    procedure CopyServItemsFromServItemLineToServLine(ServHeader: Record "Service Header")
    var
        ServLine: Record "Service Line";
        ServItemLine: Record "Service Item Line";
        txtServLineExist: Label 'Service Line exists. You can only copy service Items to a empty Service Line.';
        lineNo: Integer;
    begin
        //Copy All Service Items from Service Item Line to Service Line
        //Test IF Service Allocation is empty
        ServLine.SetRange("Document Type", ServHeader."Document Type");
        ServLine.SetRange("Document No.", ServHeader."No.");
        if ServLine.FindSet then
            Error(txtServLineExist);

        //Copy Routine
        ServItemLine.SetRange("Document Type", ServHeader."Document Type");
        ServItemLine.SetRange("Document No.", ServHeader."No.");
        if ServItemLine.FindSet then
            repeat

                lineNo += 10000;
                ServLine.Init;
                ServLine.Validate("Document Type", ServHeader."Document Type");
                ServLine.Validate("Document No.", ServHeader."No.");
                ServLine.Validate(ServLine."Line No.", lineNo);
                ServLine.Validate("Service Item No.", ServItemLine."Service Item No.");


                ServLine.Insert(true);

            until ServItemLine.Next = 0;
    end;
}

