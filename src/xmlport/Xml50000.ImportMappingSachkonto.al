xmlport 50000 "Import Mapping Sachkonto"
{
    Direction = Import;
    FieldDelimiter = '<None>';
    FieldSeparator = ';';
    Format = VariableText;

    schema
    {
        textelement(root)
        {
            tableelement("Mapping Sach Deb Kred"; "Mapping Sach Deb Kred")
            {
                AutoReplace = false;
                AutoSave = false;
                AutoUpdate = false;
                XmlName = 'Mapping';
                textelement(f1)
                {
                }
                textelement(f2)
                {
                }
                textelement(f3)
                {
                }

                trigger OnAfterInitRecord()
                begin
                    Clear(f1);
                    Clear(f2);
                    Clear(f3);
                end;

                trigger OnBeforeInsertRecord()
                begin
                    if f1 = 'Firma' then
                        currXMLport.Skip;
                    if f1 = '' then begin
                        anzskip += 1;
                        currXMLport.Skip;
                    end;

                    if f1 <> EinFirma then
                        currXMLport.Skip;

                    anzstellen := StrLen(f2);
                    ktoalt := f2;
                    if anzstellen < 8 then begin
                        for i := 1 to 8 - anzstellen do begin
                            ktoalt := '0' + ktoalt;
                        end;
                    end;

                    anzstellen := StrLen(f3);
                    if anzstellen > 4 then begin
                        ktoneu := '';
                    end else begin
                        ktoneu := f3;
                        if anzstellen < 4 then begin
                            for i := 1 to 4 - anzstellen do begin
                                ktoneu := '0' + ktoneu;
                            end;
                        end;
                    end;

                    MappingSachDebKred.Init;
                    MappingSachDebKred.Art := MappingSachDebKred.Art::Sachkonto;
                    MappingSachDebKred."Konto Alt" := ktoalt;
                    MappingSachDebKred."Konto Neu" := ktoneu;
                    if not MappingSachDebKred.Insert then
                        MappingSachDebKred.Modify;
                    anzanlage += 1;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control1106900001)
                {
                    ShowCaption = false;
                    field(Firma; EinFirma)
                    {
                        Caption = 'Firma';
                        ApplicationArea = All;
                    }
                    field("vorhandene Daten löschen"; EinLöschen)
                    {
                        Caption = 'vorhandene Daten löschen';
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
        }
    }

    trigger OnInitXmlPort()
    begin
        //IF EinLöschen THEN BEGIN
        //  MappingSachDebKred.SETRANGE(Art,MappingSachDebKred.Art::Sachkonto);
        //  MappingSachDebKred.DELETEALL;
        //END;
    end;

    trigger OnPostXmlPort()
    begin
        Message(Text50000, anzanlage, anzskip);
    end;

    trigger OnPreXmlPort()
    begin
        if EinLöschen then begin
            MappingSachDebKred.Reset;
            MappingSachDebKred.SetRange(Art, MappingSachDebKred.Art::Sachkonto);
            MappingSachDebKred.DeleteAll;
        end;
    end;

    var
        EinFirma: Code[10];
        "EinLöschen": Boolean;
        MappingSachDebKred: Record "Mapping Sach Deb Kred";
        anzstellen: Integer;
        i: Integer;
        anzskip: Integer;
        anzanlage: Integer;
        Text50000: Label 'Einlesung beendet.\%1 Datensätze NEU.\%2 Datensätze übersprungen.';
        ktoalt: Code[8];
        ktoneu: Code[4];
}

