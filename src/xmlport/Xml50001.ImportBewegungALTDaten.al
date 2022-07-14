xmlport 50001 "Import Bewegung ALT Daten"
{
    Caption = 'Import Bewegung ALT-Daten';
    Direction = Import;
    FieldDelimiter = '<None>';
    FieldSeparator = ';';
    Format = VariableText;

    schema
    {
        textelement(root)
        {
            tableelement("Gen. Journal Line"; "Gen. Journal Line")
            {
                AutoReplace = false;
                AutoSave = false;
                AutoUpdate = false;
                XmlName = 'GenJournalLine';
                UseTemporary = true;
                textelement(f1)
                {
                }
                textelement(f2)
                {
                }
                textelement(f3)
                {
                }
                textelement(f4)
                {
                }
                textelement(f5)
                {
                }
                textelement(f6)
                {
                }
                textelement(f7)
                {
                }
                textelement(f8)
                {
                }
                textelement(f9)
                {
                }
                textelement(f10)
                {
                }
                textelement(f11)
                {
                }
                textelement(f12)
                {
                }
                textelement(f13)
                {
                }
                textelement(f14)
                {
                }
                textelement(f15)
                {
                }
                textelement(f16)
                {
                }
                textelement(f17)
                {
                }
                textelement(f18)
                {
                }
                textelement(f19)
                {
                }
                textelement(f20)
                {
                }
                textelement(f21)
                {
                }
                textelement(f22)
                {
                }
                textelement(f23)
                {
                }
                textelement(f24)
                {
                }
                textelement(f25)
                {
                }
                textelement(f26)
                {
                }
                textelement(f27)
                {
                }
                textelement(f28)
                {
                }
                textelement(f29)
                {
                }
                textelement(f30)
                {
                }
                textelement(f31)
                {
                }
                textelement(f32)
                {
                }
                textelement(f33)
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    anzstellen := StrLen(f15);
                    erstkz := CopyStr(f15, 2, 1);
                    Clear(xkto);
                    if erstkz = 'C' then begin   // Kreditor
                                                 // Alt xkto := COPYSTR(f15,3,anzstellen-3);
                        xkto := CopyStr(f15, 3, 5);

                        MappingSachDebKred.SetRange(Art, MappingSachDebKred.Art::Kreditor);
                        MappingSachDebKred.SetRange("Konto Alt", xkto);
                        if MappingSachDebKred.FindFirst then
                            xkto := MappingSachDebKred."Konto Neu"
                        else
                            xkto := '';
                    end;

                    if erstkz = 'D' then begin    // Debitor
                                                  // ALT xkto := COPYSTR(f15,3,anzstellen-3);
                        xkto := CopyStr(f15, 3, 5);

                        MappingSachDebKred.SetRange(Art, MappingSachDebKred.Art::Debitor);
                        MappingSachDebKred.SetRange("Konto Alt", xkto);
                        if MappingSachDebKred.FindFirst then
                            xkto := MappingSachDebKred."Konto Neu"
                        else
                            xkto := '';
                    end;

                    if erstkz = '' then begin    // Sachkonto
                        xkto := CopyStr(f15, 3, anzstellen - 3);
                        MappingSachDebKred.SetRange(Art, MappingSachDebKred.Art::Sachkonto);
                        MappingSachDebKred.SetRange("Konto Alt", xkto);
                        if MappingSachDebKred.FindFirst then
                            xkto := MappingSachDebKred."Konto Neu"
                        else
                            xkto := '';
                    end;

                    Evaluate(sollbetrag, f10);
                    Evaluate(habenbetrag, f11);

                    if sollbetrag = habenbetrag then
                        currXMLport.Skip;

                    fbb.Init;
                    fbb."Journal Template Name" := 'Allgemein';
                    fbb."Journal Batch Name" := 'Bewegung';
                    LineNo += 100;
                    fbb."Line No." := LineNo;
                    fbb."Account Type" := fbb."Account Type"::"G/L Account";
                    fbb.Validate("Account No.", xkto);

                    if sollbetrag <> 0 then
                        fbb.Validate("Debit Amount", sollbetrag);
                    if habenbetrag <> 0 then
                        fbb.Validate("Credit Amount", habenbetrag);

                    anzstellen := StrLen(f8);
                    bujournal := CopyStr(f8, 2, anzstellen - 2);


                    Evaluate(budat, f28);
                    if bujournal = 'BILANZEROEFFNUNGSKONTO' then
                        fbb.Validate("Posting Date", 20151231D)
                    else
                        fbb.Validate("Posting Date", budat);

                    Evaluate(docdate, f31);
                    if bujournal = 'BILANZEROEFFNUNGSKONTO' then
                        fbb.Validate("Document Date", 20151231D)
                    else
                        fbb.Validate("Document Date", docdate);

                    anzstellen := StrLen(f29);
                    butext := CopyStr(f29, 2, anzstellen - 2);
                    fbb.Description := butext;

                    fbb."Document No." := f30;

                    if f32 <> '0' then begin
                        fbb.Validate("Shortcut Dimension 1 Code", f32);
                    end;

                    fbb.Insert;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnPostXmlPort()
    begin
        Message('Einlesung beendet');
    end;

    trigger OnPreXmlPort()
    begin
        fbb.Reset;
        fbb.SetRange("Journal Template Name", 'Allgemein');
        fbb.SetRange("Journal Batch Name", 'Bewegung');

        if fbb.Count > 1 then
            Error('Mehr als 1 Datensatz in Fibubuchblatt enthalten');
        if fbb.FindFirst then begin
            if (fbb."Account No." = '') or (fbb.Amount = 0) then
                fbb.Delete(true);
        end;
    end;

    var
        LineNo: Integer;
        erstkz: Code[1];
        anzstellen: Integer;
        MappingSachDebKred: Record "Mapping Sach Deb Kred";
        xkto: Code[20];
        fbb: Record "Gen. Journal Line";
        sollbetrag: Decimal;
        habenbetrag: Decimal;
        budat: Date;
        docdate: Date;
        butext: Text[50];
        bujournal: Text[50];
}

