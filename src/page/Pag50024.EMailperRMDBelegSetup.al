page 50024 "EMail per RMD-Beleg Setup"
{
    // P0001 17.02.16 CCBIE.ARE New object

    PageType = List;
    SourceTable = "EMail per RMD-Beleg Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Zuordnung; Rec.Zuordnung)
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(Beschreibung; Rec.Beschreibung)
                {
                    StyleExpr = DescriptionStyleText;
                }
                field("EMail An"; Rec."EMail An")
                {
                }
                field("EMail Kopie"; Rec."EMail Kopie")
                {
                }
                field("EMail Blind Kopie"; Rec."EMail Blind Kopie")
                {
                }
                field("EMail Betreff"; Rec."EMail Betreff")
                {
                    StyleExpr = EmailSubjectStyleText;
                }
                field("EMail Text"; Rec."EMail Text")
                {
                }
                field("EMail Dateiname"; Rec."EMail Dateiname")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        DescriptionStyleText := 'Strong';
        EmailSubjectStyleText := 'Standard';
        if Rec.Zuordnung = 0 then begin
            DescriptionStyleText := 'Subordinate';
            EmailSubjectStyleText := 'Subordinate';
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Beschreibung := StrSubstNo('Zuordnung: ' + CurrPage.Caption);
        Rec."EMail Betreff" := StrSubstNo('Fehler: ' + CurrPage.Caption);
    end;

    var
        DescriptionStyleText: Text;
        EmailSubjectStyleText: Text;
}

