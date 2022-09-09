/// <summary>
/// Page GIMPrüfzertifikatszeilen (ID 50059).
/// </summary>
page 50059 "GIMPrüfzertifikatszeilen"
{
    Editable = false;
    PageType = List;
    SourceTable = "GIMPrüfzertifikatszeilen";
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            field("Filter Dokumentart"; fltDocumentType)
            {
                ApplicationArea = All;
            }
            field("Filter Document No."; fltDocumentNo)
            {
                ApplicationArea = All;
            }
            repeater(Group)
            {
                field(PK; Rec.PK)
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Service Item No."; Rec."Service Item No.")
                {
                    ApplicationArea = All;
                }
                field(Question; Rec.Question)
                {
                    ApplicationArea = All;
                }
                field(Answer; Rec.Answer)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(RefreshQuery)
            {
                Caption = 'Aktualisiere Abfrage';
                // Image = "Query";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    // FillTempTable;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        // FillTempTable;
    end;

    var
        fltDocumentNo: Code[20];
        fltDocumentType: Option Quote,"Order";

    // local procedure FillTempTable()
    // var
    //     GIMServiceAnswer: Query GIMServiceAnswers;
    //     i: Integer;
    // begin

    //     GIMServiceAnswer.SetRange(GIMServiceAnswer.Document_Type, fltDocumentType);
    //     GIMServiceAnswer.SetRange(GIMServiceAnswer.Document_No, fltDocumentNo);
    //     GIMServiceAnswer.Open;

    //     Rec.DeleteAll;
    //     while GIMServiceAnswer.Read do begin
    //         Rec.Init;
    //         i := i + 1;
    //         Rec.PK := i;
    //         Rec."Document Type" := GIMServiceAnswer.Document_Type;
    //         Rec."Document No." := GIMServiceAnswer.Document_No;
    //         Rec."Service Item No." := GIMServiceAnswer.Service_Item_No;
    //         Rec.Question := GIMServiceAnswer.Description;
    //         Rec.Answer := GIMServiceAnswer.Answer;
    //         Rec.Insert;
    //     end;
    // end;

    // [Scope('OnPrem')]
    // procedure SetDocument(ServotionArchServHeader: Record "Servotion Arch Serv. Header")
    // begin
    //     fltDocumentType := ServotionArchServHeader."Document Type";
    //     fltDocumentNo := ServotionArchServHeader."No.";
    // end;
}

