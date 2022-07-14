table 50006 "EAN-Nummern"
{
    // P0011 08.03.16 DEBIE.NNE New New functions SetItem, GetItem, GetCurrentItem.
    // P0011 26.02.16 DEBIE.NNE New object (transfer from 2009)
    // 
    // ...wo ist die Dokumentation Herr Held ?
    // c/rp/280698 Arbeit im Fremdmandant ermöglicht
    // c/rp/290698 EANSuchenFreie korrigiert (00001..99999)

    DrillDownPageID = "Error Log";
    LookupPageID = "Error Log";
    Permissions = TableData "EAN-Nummern" = rimd;

    fields
    {
        field(1; "Kundennr."; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(2; "Artikelnr."; Code[20])
        {
            TableRelation = Item;
        }
        field(10; Kundeninfo; Text[30])
        {
        }
        field(11; Bemerkung; Text[30])
        {
        }
        field(18; "EAN-Nr."; Code[5])
        {
            Numeric = true;

            trigger OnValidate()
            begin
                Validate("EAN-Code", "EAN-Nr.");
            end;
        }
        field(20; "EAN-Code"; Code[13])
        {
            Numeric = true;

            trigger OnValidate()
            begin
                "EAN-Code" := EANAufbau("EAN-Code", Rec, true);
                "EAN-Nr." := CopyStr("EAN-Code", 8, 5);

                if "Kundennr." = '' then begin    //Haupt-EAN in Artikel-Karte
                                                  // >> P00011
                                                  // IF ArtikelR.GET("Artikelnr.") THEN BEGIN
                                                  //   ArtikelR."EAN-Code" := "EAN-Code";
                                                  //   ArtikelR.MODIFY;
                    if GetCurrentItem then begin
                        if ArtikelR.GTIN <> "EAN-Code" then begin
                            ArtikelR.GTIN := "EAN-Code";
                            ArtikelR.Modify;
                        end;
                        // << P00011
                    end;
                end;
            end;
        }
        field(70000; Einlesestatus; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Kundennr.", "Artikelnr.")
        {
            Clustered = true;
        }
        key(Key2; "Kundennr.", "EAN-Nr.")
        {
        }
        key(Key3; "Kundennr.", "EAN-Code")
        {
        }
        key(Key4; "Artikelnr.", "EAN-Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        ArtikelR: Record Item;
        Dia: Dialog;
        Text000: Label 'EAN-Code %1 ist zu lang. Er darf maximal %2 Stellen haben.';

    //[Scope('OnPrem')]
    /// <summary>
    /// EANAufbau.
    /// </summary>
    /// <param name="EANCode">Code[13].</param>
    /// <param name="EANRec">Record "EAN-Nummern".</param>
    /// <param name="PrüfeEindeutig">Boolean.</param>
    /// <returns>Return variable EANist of type Code[13].</returns>
    procedure EANAufbau(EANCode: Code[13]; EANRec: Record "EAN-Nummern"; "PrüfeEindeutig": Boolean) EANist: Code[13]
    var
        FirmR: Record "Company Information";
        "EANLänge": Integer;
        EANNr: Code[5];
        "AltePrüfZiffer": Code[1];
    begin
        EANLänge := StrLen(EANCode);
        FirmR.Get;
        if EANLänge = 0 then exit('');                  //leer

        if EANLänge > 5 then begin
            if EANLänge < 12 then begin
                //MESSAGE('EAN-Nummer ist nicht 12- oder 13-stellig!');
                Error('EAN-Nummer ist nicht 12- oder 13-stellig!');
                exit(EANCode);
            end else
                if EANLänge = 13 then begin
                    AltePrüfZiffer := CopyStr(EANCode, 13, 1);
                    EANCode := CopyStr(EANCode, 1, 12);
                end;
        end else begin
            EANCode := PadStr(EANCode, 5, '0');     //zunächst EAN-Code auf 5 Stellen füllen
                                                    // >> P0011
                                                    // EANCode := COPYSTR(FirmR."ILN-Code", 1, 7) + EANCode;   //ILN zumischen
            EANCode := CopyStr(FirmR.GLN, 1, 7) + EANCode;   //ILN zumischen
                                                             // << P0011
        end;

        EANNr := CopyStr(EANCode, 8, 5);
        if PrüfeEindeutig then begin                          //eundeutigkeit prüfen und ersetzen
            EANNr := EANSuchenFreie(EANNr, EANRec);
            EANCode := CopyStr(EANCode, 1, 7) + EANNr;
        end;
        // >> P0011
        if StrLen(EANCode) < 12 then
            Error('EAN-Nummer ist nicht 12- oder 13-stellig!');
        // << P0011
        EANCode := EANCode + Format(StrCheckSum(EANCode, '131313131313', 10));
        exit(EANCode);
    end;

    //[Scope('OnPrem')]

    /// <summary>
    /// EANSuchenFreie.
    /// </summary>
    /// <param name="EANwunschNr">Code[6].</param>
    /// <param name="EANIstRec">Record "EAN-Nummern".</param>
    /// <returns>Return variable IstEANNr of type Code[5].</returns>
    procedure EANSuchenFreie(EANwunschNr: Code[6]; EANIstRec: Record "EAN-Nummern") IstEANNr: Code[5]
    var
        EANNummernR: Record "EAN-Nummern";
        EANMerker: Code[6];
    begin
        EANNummernR.SetCurrentKey("Kundennr.", "EAN-Nr.");
        EANNummernR.SetRange("Kundennr.", EANIstRec."Kundennr.");
        if EANwunschNr = '' then EANwunschNr := '00001';
        IstEANNr := '';

        EANNummernR.SetRange("EAN-Nr.", EANwunschNr);
        if EANNummernR.Find('-') and (EANNummernR."Artikelnr." <> EANIstRec."Artikelnr.") then begin
            IstEANNr := EANwunschNr;
            Dia.Open('Suche freie EAN-Nr. #1######', EANwunschNr);
            repeat
                EANwunschNr := IncStr(EANwunschNr);
                Dia.Update;
                if EANwunschNr = '100000' then begin
                    EANwunschNr := '00001';
                end;
                EANNummernR.SetRange("EAN-Nr.", EANwunschNr);
                if EANwunschNr = IstEANNr then
                    Error('Keine Lfd.-EAN-Nummer mehr verfügbar.');
            until not EANNummernR.Find('-');
            Dia.Close;
        end;

        exit(EANwunschNr);
    end;

    [Scope('OnPrem')]
    /// <summary>
    /// LöscheEANSatz.
    /// </summary>
    /// <param name="Debitornr">Code[10].</param>
    /// <param name="Artikelnr">Code[20].</param>
    /// <param name="EANCode">Code[13].</param>
    /// <param name="bestätigen">Boolean.</param>
    procedure "LöscheEANSatz"(Debitornr: Code[10]; Artikelnr: Code[20]; EANCode: Code[13]; "bestätigen": Boolean)
    var
        EANNummernR: Record "EAN-Nummern";
        Menge: Integer;
    begin
        EANNummernR.SetRange("Kundennr.", Debitornr);
        EANNummernR.SetRange("Artikelnr.", Artikelnr);
        EANNummernR.SetRange("EAN-Code", EANCode);

        if Debitornr <> '' then
            EANNummernR.SetCurrentKey(EANNummernR."Kundennr.");
        if Artikelnr <> '' then
            EANNummernR.SetCurrentKey(EANNummernR."Artikelnr.");

        if bestätigen then begin
            Menge := EANNummernR.Count;
            if not Confirm('Es werden auch %1 EAN-nummern von %2 %3 %4 gelöscht?', true,
                        Menge, Debitornr, Artikelnr, EANCode) then
                Error('Löschung abgebrochen...');
        end;

        EANNummernR.DeleteAll(true);
    end;

    [Scope('OnPrem')]
    /// <summary>
    /// ModifiziereEANSatz.
    /// </summary>
    /// <param name="Debitornr">Code[20].</param>
    /// <param name="Artikelnr">Code[20].</param>
    /// <param name="EANCode">Code[13].</param>
    /// <param name="Eindeutig">Boolean.</param>
    /// <param name="Überschreiben">Boolean.</param>
    /// <returns>Return variable EANIst of type Code[13].</returns>
    procedure ModifiziereEANSatz(Debitornr: Code[20]; Artikelnr: Code[20]; EANCode: Code[13]; Eindeutig: Boolean; "Überschreiben": Boolean) EANIst: Code[13]
    var
        EANnummernR: Record "EAN-Nummern";
    begin
        if not EANnummernR.Get(Debitornr, Artikelnr) then begin
            EANnummernR.Reset;
            EANnummernR.Init;

            EANnummernR."Kundennr." := Debitornr;
            EANnummernR."Artikelnr." := Artikelnr;
            EANnummernR.Insert;
        end else begin
            if not Überschreiben then
                exit(EANnummernR."EAN-Code");
        end;

        EANnummernR.Validate("EAN-Code", EANnummernR.EANAufbau(EANCode, EANnummernR, Eindeutig));
        EANnummernR.Modify;

        exit(EANnummernR."EAN-Code");
    end;

    local procedure "-- P0011 --"()
    begin
    end;

    [Scope('OnPrem')]
    /// <summary>
    /// SetItem.
    /// </summary>
    /// <param name="NewItem">Record Item.</param>
    procedure SetItem(NewItem: Record Item)
    begin
        // >> P0011
        ArtikelR := NewItem;
        // << P0011
    end;

    [Scope('OnPrem')]
    /// <summary>
    /// GetItem.
    /// </summary>
    /// <param name="NewItem">VAR Record Item.</param>
    procedure GetItem(var NewItem: Record Item)
    begin
        // >> P0011
        NewItem := ArtikelR;
        // << P0011
    end;

    /// <summary>
    /// GetCurrentItem.
    /// </summary>
    /// <returns>Return value of type Boolean.</returns>
    local procedure GetCurrentItem(): Boolean
    begin
        // >> P0011
        TestField("Artikelnr.");
        if "Artikelnr." = ArtikelR."No." then
            exit(true);
        if "Artikelnr." <> ArtikelR."No." then
            exit(ArtikelR.Get("Artikelnr."));
        // << P0011
    end;
}

