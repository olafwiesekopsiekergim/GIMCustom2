/// <summary>
/// TableExtension "GIMSalesHeaderArchive" (ID 50041) extends Record Sales Header Archive.
/// </summary>
tableextension 50041 GIMSalesHeaderArchive extends "Sales Header Archive"
{
    fields
    {
        // Add changes to table fields here
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
        field(50011; "Servicecontractno."; Code[10])
        {
            Caption = 'Servicevertragsnr.';
            Description = '#AT';
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
        field(50400; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            Description = 'P0046';
            Editable = false;
        }
        field(70170; Zusatzstatus; Option)
        {
            Caption = 'Zusatzstatus';
            Description = 'P0023';
            OptionMembers = " ","Abruf gesperrt",,,,,"in Zustellung",,,,Einlagerung,Feinabstimmung;
        }
        field(77000; Sachbearbeiter; Code[50])
        {
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
            FieldClass = FlowFilter;
            TableRelation = "Gen. Product Posting Group";
        }
        field(77960; "Check List created"; Boolean)
        {
            Caption = 'Checkliste erstellt';
            Description = 'P0008';
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
}