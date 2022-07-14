table 50053 "Acceptance Protocol Line"
{
    // P0036 06.04.16 CCBIE.ARE New object

    Caption = 'Acceptance Protocol Line';

    fields
    {
        field(1; "Test Certificate No."; Code[20])
        {
            Caption = 'Test Certificate Code';
            TableRelation = "Acceptance Protocol Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            NotBlank = true;
        }
        field(4; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Header,Line,Footer,Hint';
            OptionMembers = " ",Header,Line,Footer,Hint;
        }
        field(5; "Show Checkbox"; Boolean)
        {
            Caption = 'Show checkbox';
        }
        field(6; Hint; Text[80])
        {
            Caption = 'Hint';
        }
        field(7; "Show Underline"; Boolean)
        {
            Caption = 'Show underline';
        }
        field(8; "Yes/No Field"; Boolean)
        {
            Caption = 'Yes/No';
        }
        field(10; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Production Order';
            OptionMembers = " ","Production Order";
        }
        field(12; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(13; "Replaceable Line No."; Integer)
        {
            Caption = 'Ersetzbar durch Zeilennummer';
            Description = 'Mitgeben, durch welche Zeilennr. die Zeile ersetzt werden kann.';

            trigger OnValidate()
            begin
                if ("Replaceable Line No." = 0) then begin
                    //Löschen der entsprechenden Gegenzuordnung des xRec-DS
                    if TestCert.Get("Test Certificate No.", xRec."Replaceable Line No.") then begin
                        TestCert."Replaceable Line No." := 0;
                        TestCert.Modify(true);
                    end;
                end else begin
                    //Testen ob die Zielzeile existiert, der exist. DS eine Zeile ist und die Zielzeile nicht der aktuellen entspricht
                    if ((not TestCert.Get("Test Certificate No.", "Replaceable Line No.")) or
                        (Type <> Type::Line) or
                        ("Line No." = "Replaceable Line No.")
                       ) then
                        "Replaceable Line No." := 0
                    else begin
                        //Prüfen ob das Ziel eine Zeile ist
                        if TestCert.Type <> TestCert.Type::Line then
                            "Replaceable Line No." := 0
                        else begin
                            //Alte Zuordnungen löschen
                            TestCert.Reset;
                            TestCert.SetRange("Test Certificate No.", "Test Certificate No.");
                            TestCert.SetRange("Replaceable Line No.", "Line No.");
                            if TestCert.Find('-') then begin
                                TestCert."Replaceable Line No." := 0;
                                TestCert.Modify;
                            end;
                            TestCert.Reset;

                            TestCert.SetRange("Test Certificate No.", "Test Certificate No.");
                            TestCert.SetRange("Replaceable Line No.", "Replaceable Line No.");
                            if TestCert.Find('-') then begin
                                TestCert."Replaceable Line No." := 0;
                                TestCert.Modify;
                            end;
                            TestCert.Reset;

                            //Datensatz speichern
                            TestCert.Get("Test Certificate No.", "Replaceable Line No.");
                            TestCert."Replaceable Line No." := "Line No.";
                            TestCert.Modify(true);
                        end;
                    end;
                end;
            end;
        }
        field(14; "Place beside Head"; Integer)
        {
            Caption = 'Line beside header';
            Description = 'Soll die Zeile auf dem Report neben dem Kopf (Line No) erscheinen';

            trigger OnValidate()
            begin
                if "Place beside Head" = 0 then
                    exit;

                //Prüfen ob die Anforderung aus einer Zeile kommt
                if (Type <> Type::Header) then begin
                    Error(Text004);
                end;

                //Prüfen ob das Ziel auch eine untergeordnete Zeile ist
                TestCert.SetRange("Test Certificate No.", "Test Certificate No.");
                TestCert.SetRange("Line No.", "Line No.", "Place beside Head");
                if TestCert.Find('-') then
                    repeat
                        if (TestCert.Type = TestCert.Type::Header) and (TestCert."Line No." <> "Line No.") then
                            Error(Text001, "Place beside Head");
                    until TestCert.Next = 0;
                TestCert.Reset;

                TestCert.SetRange("Test Certificate No.", "Test Certificate No.");
                TestCert.SetRange("Line No.", "Place beside Head");
                if TestCert.Find('-') then begin
                    if TestCert.Type <> TestCert.Type::Line then
                        Error(Text002, "Place beside Head")
                    else begin
                        //Entfernen evtl. vorhandener Zuordnung
                        TestCert2.SetRange("Test Certificate No.", "Test Certificate No.");
                        TestCert2.SetRange("Place beside Head", "Place beside Head");
                        TestCert2.SetFilter("Line No.", '<>%1', "Line No.");
                        if TestCert2.Find('-') then begin
                            TestCert2."Place beside Head" := 0;
                            TestCert2.Modify;
                        end;
                    end;
                end else
                    Error(Text003, "Place beside Head");
            end;
        }
    }

    keys
    {
        key(Key1; "Test Certificate No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        TestCert: Record "Acceptance Protocol Line";
        TestCert2: Record "Acceptance Protocol Line";
        Text001: Label 'Die Zeilennummer %1 entspricht nicht einer untergeordneten Zeile!';
        Text002: Label 'Zeilennr. %1 ist nicht vom Typ "Zeile"';
        Text003: Label 'Die Zeilennummer %1 existiert nicht!';
        Text004: Label 'Diese Einstellung kann nur an einem Header vorgenommen werden!';
}

