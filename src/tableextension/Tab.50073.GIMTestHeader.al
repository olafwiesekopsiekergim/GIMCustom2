/// <summary>
/// TableExtension GIMTestHeader (ID 50073) extends Record CCS PM QC Test Header.
/// </summary>
tableextension 50073 GIMTestOrder extends "CCS QA Test Order"
{
    fields
    {
        field(50000; "Tester 1"; Code[20])
        {
            Caption = 'Tester 1';
            DataClassification = ToBeClassified;
            Description = 'dori';

            trigger OnValidate()
            begin

                "Tested Date 1" := WorkDate;
            end;
        }
        field(50001; "Tested Date 1"; Date)
        {
            Caption = 'Tested Date 1';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50002; "Tester 2"; Code[20])
        {
            Caption = 'Tester 2';
            DataClassification = ToBeClassified;
            Description = 'dori';

            trigger OnValidate()
            begin
                "Tested Date 2" := WorkDate;
            end;
        }
        field(50003; "Tested Date 2"; Date)
        {
            Caption = 'Tested Date 2';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50004; Testerstatus; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'GIM0009';
            OptionCaption = '  ,Prüfer 1 aktiv,Prüfer 2 aktiv';
            OptionMembers = " ","Tester 1 active","Tester 2 active";
        }
        field(50005; "Tester 1 Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'not started,in edit,finished';
            OptionMembers = "not started","in edit",finished;
        }
        field(50006; "Tester 2 Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'not started,in edit,finished';
            OptionMembers = "not started","in edit",finished;
        }
    }

    procedure SetTester1Status()
    var
        iCountAnswers: Integer;
        iCountQuestions: Integer;
    begin
        iCountQuestions := CountQuestions();
        iCountAnswers := CountTester1Answers();

        if iCountAnswers = 0 then
            Rec."Tester 1 Status" := Rec."Tester 1 Status"::"not started"
        else
            if iCountAnswers < iCountQuestions then
                Rec."Tester 1 Status" := Rec."Tester 1 Status"::"in edit"
            else
                if iCountAnswers = iCountQuestions then
                    Rec."Tester 1 Status" := Rec."Tester 1 Status"::finished;
    end;


    procedure SetTester2Status()
    var
        iCountAnswers: Integer;
        iCountQuestions: Integer;
    begin
        iCountQuestions := CountQuestions();
        iCountAnswers := CountTester2Answers();

        if iCountAnswers = 0 then
            Rec."Tester 2 Status" := Rec."Tester 2 Status"::"not started"
        else
            if iCountAnswers < iCountQuestions then
                Rec."Tester 2 Status" := Rec."Tester 2 Status"::"in edit"
            else
                if iCountAnswers = iCountQuestions then
                    Rec."Tester 2 Status" := Rec."Tester 2 Status"::finished;
    end;

    local procedure CountQuestions() ret: Integer
    var
        TestOrder: Record "CCS QA Test Order";
        TestOrderProperty: Record "CCS QA Test Order Property";
    begin
        //GIM0009
        TestOrderProperty.SetRange("Test Order No.", "No.");
        TestOrderProperty.SetRange("No Testing", false);
        ret := TestOrderProperty.Count;
    end;

    local procedure CountTester1Answers() ret: Integer
    var
        TestOrder: Record "CCS QA Test Order";
        TestOrderProperty: Record "CCS QA Test Order Property";
    begin
        //GIM0009
        TestOrderProperty.SetRange("Test Order No.", "No.");
        TestOrderProperty.SetRange("No Testing", false);
        TestOrderProperty.SetFilter(DetermValueTester1, '<>%1', '');
        ret := TestOrderProperty.Count;
    end;

    local procedure CountTester2Answers() ret: Integer
    var
        TestOrderProperty: Record "CCS QA Test Order Property";
    begin
        //GIM0009
        TestOrderProperty.SetRange("Test Order No.", "No.");
        TestOrderProperty.SetRange("No Testing", false);
        TestOrderProperty.SetFilter(DetermValueTester2, '<>%1', '');
        ret := TestOrderProperty.Count;
    end;


}
