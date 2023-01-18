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
            TableRelation = "Internal Job"."No." WHERE("Win/Loss" = CONST(" "));
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
            CalcFormula = Lookup(Customer.Blocked WHERE("No." = FIELD("Sell-to Customer No.")));
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
            CalcFormula = Sum("Sales Line".Amount WHERE("Document Type" = FIELD("Document Type"),
                                                         "Document No." = FIELD("No."),
                                                         "Allow Invoice Disc." = CONST(true)));
            Caption = 'Amount for Invoice Discount';
            Description = 'P0008';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50310; "Amount Including VAT for InvD"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Amount Including VAT" WHERE("Document Type" = FIELD("Document Type"),
                                                                         "Document No." = FIELD("No."),
                                                                         "Allow Invoice Disc." = CONST(true)));
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
        field(70170; Zusatzstatus; Option)
        {
            Caption = 'Zusatzstatus';
            Description = 'P0023';
            OptionMembers = " ","Abruf gesperrt","Vorkasse vor Produktion gesperrt","Vorkasse vor Lieferung gesperrt",,,"in Zustellung",,,,Einlagerung,Feinabstimmung;

            trigger OnValidate()
            begin
                // >> P0023
                if Zusatzstatus <> xRec.Zusatzstatus then begin
                    // >> P0034
                    //TESTFIELD(Status,Status::Released);
                    // << P0034
                    SetWarehouseRequest;
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
                    "Check List created on" := WorkDate
                else begin
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
                    "Check List receive on" := WorkDate;
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
        myInt: Integer;
        Text053: Label 'You must cancel the approval process if you wish to change the %1.';


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
}