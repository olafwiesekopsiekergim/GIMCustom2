table 50052 "Acceptance Protocol Header"
{
    // P0036 06.04.16 CCBIE.ARE New object

    Caption = 'Acceptance Protocol Header';
    DrillDownPageID = "Acceptance Protocol List";
    LookupPageID = "Acceptance Protocol List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; Type; Option)
        {
            Caption = 'Protocol Type';
            OptionCaption = 'Test certificate,Inspection certificate';
            OptionMembers = "Test Certificate","Inspection certificate";
        }
        field(100; "Report Cert Name"; Text[100])
        {
            Caption = 'offizieller Zertifkatsname';
            Description = 'Überschrift des Zert. im Report';
        }
        field(101; "Report Cert Name 2"; Text[50])
        {
            Caption = 'offizieller Zertifkatsname Zeile 2';
            Description = 'Überschrift des Zert. im Report Zeile 2';
        }
    }

    keys
    {
        key(Key1; "Code", Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TestCert.SetRange("Test Certificate No.", Code);
        TestCert.DeleteAll;
    end;

    trigger OnInsert()
    var
        AcceptanceProtocolHdr: Record "Acceptance Protocol Header";
    begin
        AcceptanceProtocolHdr.SetRange(Code, Code);
        if AcceptanceProtocolHdr.Count > 0 then
            Error(Text0001, Code);
    end;

    var
        TestCert: Record "Acceptance Protocol Line";
        Text0001: Label 'There is already a record with Code %1';
}

