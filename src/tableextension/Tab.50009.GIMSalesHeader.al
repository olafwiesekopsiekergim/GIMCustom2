/// <summary>
/// TableExtension GIM Sales Header (ID 50009).
/// </summary>
tableextension 50009 "GIM Sales Header" extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        field(50001; PackageType; Code[10])
        {
            Caption = 'Verpackungsart';
            Description = '#AT';
            TableRelation = "Unit of Measure";
        }
        field(50002; PackageAmount; Decimal)
        {
            Caption = 'Verpackungsmenge';
            Description = '#AT';
        }
        field(50003; Webrequest; Boolean)
        {
            Caption = 'Internetanfrage';
            Description = '#AT';
        }
        field(50004; "Internal Job No."; Code[20])
        {
            Caption = 'Internal Job No.';
            Description = 'P0005';
            TableRelation = "Internal Job"."No." where("Win/Loss" = const(" "));
        }
        field(50005; "Win/Loss"; Option)
        {
            Description = 'P0005';
            OptionCaption = ' ,Win,Loss';
            OptionMembers = " ",Win,Loss;
        }
        field(50006; "Win/Loss Reason"; Code[10])
        {
            Description = 'P0005';
            TableRelation = Reason;
        }
        field(50007; "Order No."; Text[30])
        {
            Caption = 'Auftragsnummer';
            Description = '#AT';
        }
        field(50008; "Invoice No."; Text[30])
        {
            Caption = 'Rechnungsnummer';
            Description = '#AT';
        }
        field(50009; "Real.wahrscheinlichkeit"; Decimal)
        {
            Description = 'CC';
        }
        field(50010; "Zeilenrabatt ausblenden"; Boolean)
        {
            Description = '#AT';
        }
        field(50011; "Servicecontractno."; Code[10])
        {
            Caption = 'Servicevertragsnummer';
            Description = '#AT';
            Editable = false;
        }
        field(50012; Wiedervorlage; Date)
        {
            Description = '#AT';
        }
        field(50013; Blocked; Enum "Customer Blocked")
        {
            CalcFormula = lookup(Customer.Blocked where("No." = field("Sell-to Customer No.")));
            Caption = 'Blocked';
            Editable = false;
            FieldClass = FlowField;

        }
        field(50047; "RMD Sammelsendung"; Boolean)
        {
            Description = 'P0001';
        }
        field(50100; Kundenliefertermin; Text[30])
        {
            Caption = 'Kundenliefertermin';
            Description = 'P0028';
        }
        field(50160; "Pos.-Zus.-Zähl-Summen drucken"; Boolean)
        {
            Caption = 'Pos.-Zus.-Zähl-Summen drucken';
            Description = 'P0008';
        }
        field(50300; "Amount for Invoice Discount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = sum("Sales Line".Amount where("Document Type" = field("Document Type"),
                                                         "Document No." = field("No."),
                                                         "Allow Invoice Disc." = const(true)));
            Caption = 'Amount for Invoice Discount';
            Description = 'P0008';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50310; "Amount Including VAT for InvD"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = sum("Sales Line"."Amount Including VAT" where("Document Type" = field("Document Type"),
                                                                         "Document No." = field("No."),
                                                                         "Allow Invoice Disc." = const(true)));
            Caption = 'Amount Including VAT for Invoice Discount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50400; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            Description = 'P0046';
            Editable = false;
        }
        field(50500; "Salesperson Code 2"; Code[10])
        {
            Caption = 'Salesperson Code 2';
            Description = ':DMW16.00.01:76:01';
            TableRelation = "Salesperson/Purchaser";

            trigger OnValidate()
            var
                ApprovalEntry: Record "Approval Entry";
            begin
                // >> :DMW16.00.01:76:01
                ApprovalEntry.SetRange("Table ID", DATABASE::"Sales Header");
                ApprovalEntry.SetRange("Document Type", "Document Type");
                ApprovalEntry.SetRange("Document No.", "No.");
                ApprovalEntry.SetFilter(Status, '<>%1&<>%2', ApprovalEntry.Status::Canceled, ApprovalEntry.Status::Rejected);
                if ApprovalEntry.Find('-') then
                    Error(Text053, FieldCaption("Salesperson Code"));
                // << :DMW16.00.01:76:01
            end;
        }
        field(50501; "Quote Expiration Date"; Date)
        {
            Caption = 'Quote Expiration Date';
        }
        field(70170; Zusatzstatus; Option)
        {
            Caption = 'Zusatzstatus';
            Description = 'P0023';
            OptionMembers = " ","Abruf gesperrt","Vorkasse vor Produktion gesperrt","Vorkasse vor Lieferung gesperrt",,,"in Zustellung",,,,Einlagerung,Feinabstimmung;

            trigger OnValidate()
            begin
                // >> P0023
                if Zusatzstatus <> xRec.Zusatzstatus then begin
                    SetWarehouseRequest();
                end;
                // << P0023
            end;
        }
        field(77000; Creationuser; Code[50])
        {
            Caption = 'Erstellungsnutzer';
            Description = 'P0001';
            TableRelation = User;
        }
        field(77947; "fix-Termin Lieferung"; Text[20])
        {
            Caption = 'fix-Termin Lieferung';
            Description = 'P0021';
        }
        field(77949; "Gen. Prod. Posting Grp. Filter"; Code[10])
        {
            Caption = 'Produktbuchungsgruppenfilter';
            Description = '#AT';
            FieldClass = FlowFilter;
            TableRelation = "Gen. Product Posting Group";
        }
        field(77960; "Check List created"; Boolean)
        {
            Caption = 'Checkliste erstellt';
            Description = 'P0008';

            trigger OnValidate()
            begin
                // >> P0008
                if "Check List created" then
                    "Check List created on" := WorkDate() else begin
                    TestField("Check List receive", false);
                    "Check List created on" := 0D;
                end;
                // << P0008
            end;
        }
        field(77961; "Check List created on"; Date)
        {
            Caption = 'Checkliste erstellt am';
            Description = 'P0008';
        }
        field(77962; "Check List receive"; Boolean)
        {
            Caption = 'Checkliste erhalten';
            Description = 'P0008';

            trigger OnValidate()
            begin
                // >> P0008
                if "Check List receive" then begin
                    TestField("Check List created");
                    "Check List receive on" := WorkDate();
                end else
                    "Check List receive on" := 0D;
                // << P0008
            end;
        }
        field(77963; "Check List receive on"; Date)
        {
            Caption = 'Checkliste erhalten am';
            Description = 'P0008';
        }
        field(77964; "No. Printed Work Order"; Integer)
        {
            Caption = 'No. Printed Work Order';
            Description = 'P0029';
            Editable = false;
        }

    }


    var
        Text053: Label 'You must cancel the approval process if you wish to change the %1.';
        LastEntryNo: integer;


    //[Scope('Internal')]
    /// <summary>
    /// SetWarehouseRequest.
    /// </summary>
    procedure SetWarehouseRequest()
    var
        WarehouseRequest: Record "Warehouse Request";
    begin
        // >> P0023
        WarehouseRequest.SetCurrentKey("Source Type", "Source Subtype", "Source No.");
        WarehouseRequest.SetRange("Source Type", 37);
        WarehouseRequest.SetRange("Source Subtype", "Document Type");
        WarehouseRequest.SetRange("Source No.", "No.");
        WarehouseRequest.ModifyAll("Zusatzstatus Auftrag", Zusatzstatus);
        // << P0023
    end;


    procedure CreateReservEntry()
    var
        ReleaseSalesDoc: Codeunit "Release Sales Document";
        EnterQuantityToCreate: Page "Enter Quantity to Create";
        QtyToCreate: Decimal;
        QtyToCreateInt: Integer;
        CreateLotNo: Boolean;
        ReservationEntry: Record "Reservation Entry";
        NoSeriesManagement: Codeunit "NoSeriesManagement";
        Item: Record Item;
        i: Integer;
        a: Integer;
        e: Integer;
    begin
        // >> CCMUE.BS
        SalesLine.SETRANGE("Document Type", Rec."Document Type");
        SalesLine.SETRANGE("Document No.", Rec."No.");
        SalesLine.SETRANGE(Type, SalesLine.Type::Item);
        IF SalesLine.FINDSET THEN BEGIN
            REPEAT
                IF Item.GET(SalesLine."No.") THEN BEGIN
                    IF (Item."Item Tracking Code" = 'SN ALLE') AND (Item."Serial Nos." <> '') THEN BEGIN
                        // << CC01
                        ReservationEntry.RESET;
                        ReservationEntry.SETRANGE("Source Type", 37);
                        ReservationEntry.SETRANGE("Source Subtype", SalesLine."Document Type");
                        ReservationEntry.SETRANGE("Source ID", SalesLine."Document No.");
                        ReservationEntry.SETRANGE("Source Ref. No.", SalesLine."Line No.");
                        ReservationEntry.SETFILTER("Serial No.", '<>%1', '');
                        IF ReservationEntry.ISEMPTY THEN BEGIN
                            ReservationEntry.RESET;
                            // << CC01
                            IF ReservationEntry.FINDLAST() THEN BEGIN
                                LastEntryNo := ReservationEntry."Entry No.";
                            END;
                            i := SalesLine."Quantity (Base)";
                            REPEAT
                                ReservationEntry.INIT;
                                ReservationEntry."Source Type" := DATABASE::"Sales Line";
                                ReservationEntry."Source ID" := SalesLine."Document No.";
                                ReservationEntry."Source Subtype" := SalesLine."Document Type";
                                ReservationEntry."Source Ref. No." := SalesLine."Line No.";
                                ReservationEntry."Item No." := SalesLine."No.";
                                ReservationEntry."Quantity (Base)" := -1;
                                ReservationEntry."Qty. per Unit of Measure" := SalesLine."Qty. per Unit of Measure";
                                ReservationEntry.Quantity := -1 / SalesLine."Qty. per Unit of Measure";
                                ReservationEntry."Qty. to Handle (Base)" := -1;
                                ReservationEntry."Qty. to Invoice (Base)" := -1;
                                ReservationEntry."Serial No." := NoSeriesManagement.GetNextNo(Item."Serial Nos.", WORKDATE, TRUE);
                                ReservationEntry."Creation Date" := TODAY;
                                ReservationEntry."Created By" := USERID;
                                ReservationEntry."Location Code" := SalesLine."Location Code";
                                ReservationEntry."Reservation Status" := ReservationEntry."Reservation Status"::Surplus;
                                ReservationEntry."Shipment Date" := SalesLine."Shipment Date";
                                ReservationEntry."Entry No." := 0;   //Autowert
                                ReservationEntry.INSERT;
                                i := i - 1;
                            UNTIL i = 0;
                            // >> CC01
                        END;
                        // << CC01
                    END;
                END;
            UNTIL SalesLine.NEXT = 0;
        END;
        // << CCMUE.BS
    end;

}