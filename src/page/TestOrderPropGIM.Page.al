page 50042 TestOrderPropGIM
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    ShowFilter = false;
    SourceTable = "Test Order Property";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(DetermValueTester1; DetermValueTester1)
                {
                    Visible = DetermValueTester1Vis;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }
                field(DetermValueTester2; DetermValueTester2)
                {
                    Visible = DetermValueTester2Vis;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }
                field(Description; Description)
                {
                    Enabled = false;
                    QuickEntry = false;
                }
                field("No Testing"; "No Testing")
                {
                    Enabled = false;
                    QuickEntry = false;
                }
                field("Result Type Code"; "Result Type Code")
                {
                    Editable = false;
                    Enabled = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnClosePage()
    var
        TestOrder: Record "Test Order";
    begin
    end;

    var
        DetermValueTester1Vis: Boolean;
        DetermValueTester2Vis: Boolean;

    [Scope('Internal')]
    procedure SetColumnsVisibleForTester(Testorder: Record "Test Order")
    begin
        DetermValueTester1Vis := false;
        DetermValueTester2Vis := false;

        if Testorder.Testerstatus = Testorder.Testerstatus::"Tester 1 active" then begin
            DetermValueTester1Vis := true;
            DetermValueTester2Vis := false;
        end;

        if Testorder.Testerstatus = Testorder.Testerstatus::"Tester 2 active" then begin
            DetermValueTester1Vis := false;
            DetermValueTester2Vis := true;
        end;
    end;
}

