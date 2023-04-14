tableextension 50074 GIMTestOrderProperty extends "CCS QA Test Order Property"
{
    fields
    {
        field(50001; DetermValueTester1; Text[100])
        {
            Caption = 'Istwert Prüfer 1';
            DataClassification = ToBeClassified;
            Description = 'GIM0009';

            trigger OnValidate()
            begin
                //GIM0009
                DetermValueTester1OnValidate();
            end;
        }
        field(50002; DetermValueTester2; Text[100])
        {
            Caption = 'Istwert Prüfer 2';
            DataClassification = ToBeClassified;
            Description = 'GIM0009';

            trigger OnValidate()
            begin
                //GIM0009
                DetermValueTester2OnValidate();
            end;
        }
    }

    local procedure CountQuestions() ret: Integer
    var
        TestOrder: Record "CCS QA Test Order";
        TestOrderProperty: Record "CCS QA Test Order Property";
    begin
        //GIM0009
        TestOrder.Get("Test Order No.");

        TestOrderProperty.SetRange("Test Order No.", TestOrder."No.");
        TestOrderProperty.SetRange(TestOrderProperty."No Testing", false);
        ret := TestOrderProperty.Count;
    end;

    local procedure CountTester1Answers() ret: Integer
    var
        TestOrder: Record "CCS QA Test Order";
        TestOrderProperty: Record "CCS QA Test Order Property";
    begin
        //GIM0009
        TestOrder.Get("Test Order No.");

        TestOrderProperty.SetRange("Test Order No.", TestOrder."No.");
        TestOrderProperty.SetRange(TestOrderProperty."No Testing", false);
        TestOrderProperty.SetFilter(TestOrderProperty.DetermValueTester1, '<>%1', '');
        ret := TestOrderProperty.Count;
    end;

    local procedure CountTester2Answers() ret: Integer
    var
        TestOrder: Record "CCS QA Test Order";
        TestOrderProperty: Record "CCS QA Test Order Property";
    begin
        //GIM0009
        TestOrder.Get("Test Order No.");

        TestOrderProperty.SetRange("Test Order No.", TestOrder."No.");
        TestOrderProperty.SetRange(TestOrderProperty."No Testing", false);
        TestOrderProperty.SetFilter(TestOrderProperty.DetermValueTester2, '<>%1', '');
        ret := TestOrderProperty.Count;
    end;

    local procedure DetermValueTester1OnValidate()
    var
        TestOrder: Record "CCS QA Test Order";
    begin
        //GIM0009 ++++
        if DetermValueTester1 = DetermValueTester2 then
            Validate("Determined Value", DetermValueTester2)
        else
            Validate("Determined Value", 'NM');

        TestOrder.Get("Test Order No.");
        TestOrder.SetTester1Status();
        TestOrder.Modify(false);
        //----
    end;

    local procedure DetermValueTester2OnValidate()
    var
        TestOrder: Record "CCS QA Test Order";
    begin
        //GIM0009 ++++
        if DetermValueTester1 = DetermValueTester2 then
            Validate("Determined Value", DetermValueTester2)
        else
            Validate("Determined Value", 'NM');

        TestOrder.Get("Test Order No.");
        TestOrder.SetTester2Status();
        TestOrder.Modify(false);
        //----
    end;
}
