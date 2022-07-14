xmlport 50002 "Export Ext. Text"
{
    Direction = Export;
    FieldDelimiter = '<None>';
    FieldSeparator = ';';
    Format = VariableText;

    schema
    {
        textelement(root)
        {
            tableelement("Extended Text Line"; "Extended Text Line")
            {
                XmlName = 'TaBLine';
                SourceTableView = SORTING("Table Name", "No.", "Language Code", "Text No.", "Line No.") ORDER(Ascending);
                fieldelement(No; "Extended Text Line"."No.")
                {
                }
                fieldelement(LC; "Extended Text Line"."Language Code")
                {
                }
                textelement(txtg)
                {
                    XmlName = 'Txt';
                }

                trigger OnAfterGetRecord()
                var
                    ExtendedTextLine: Record "Extended Text Line";
                begin
                    if (ItemNoG <> "Extended Text Line"."No.")
                       or (LanguageCodeG <> "Extended Text Line"."Language Code")
                    then begin
                        TxtG := '';
                        ExtendedTextLine.SetRange("No.", "Extended Text Line"."No.");
                        ExtendedTextLine.SetRange("Language Code", "Extended Text Line"."Language Code");
                        if ExtendedTextLine.FindSet then
                            repeat
                                TxtG := TxtG + ExtendedTextLine.Text;
                            until ExtendedTextLine.Next = 0;

                        ItemNoG := "Extended Text Line"."No.";
                        LanguageCodeG := "Extended Text Line"."Language Code";

                        "Extended Text Line".SetRange("No.", "Extended Text Line"."No.");
                        "Extended Text Line".SetRange("Language Code", "Extended Text Line"."Language Code");
                        if "Extended Text Line".FindLast then;
                        "Extended Text Line".SetRange("No.");
                        "Extended Text Line".SetRange("Language Code");
                    end else begin
                        currXMLport.Skip;
                    end;
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

    trigger OnPreXmlPort()
    begin
        ItemNoG := '';
        LanguageCodeG := '';
    end;

    var
        ItemNoG: Code[20];
        LanguageCodeG: Code[10];
        Window: Dialog;
        Counter: Decimal;
        Factor: Decimal;
}

