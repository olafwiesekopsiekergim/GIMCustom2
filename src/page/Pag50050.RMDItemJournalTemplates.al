page 50050 "RMD Item Journal Templates"
{
    // P0001 17.02.16 CCBIE.ARE New object

    Caption = 'RMD Item Journal Templates';
    PageType = List;
    SourceTable = "Item Journal Template";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
                {

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Location: Record Location;
                    begin
                        Rec.FilterGroup(2);
                        if Rec.GetFilter(Type) = 'RMDUmlagerung' then begin
                            if PAGE.RunModal(0, Location) = ACTION::LookupOK then
                                Rec.Name := Location.Code;
                        end;
                        Rec.FilterGroup(0);
                    end;

                    trigger OnValidate()
                    var
                        Location: Record Location;
                    begin
                        Rec.FilterGroup(2);
                        if not Location.Get(Rec.Name) then
                            Rec.Name := xRec.Name;
                        Rec.FilterGroup(0);
                    end;
                }
                field(Description; Rec.Description)
                {
                }
                field(Type; Rec.Type)
                {

                    trigger OnValidate()
                    var
                        SourceCode: Record "Source Code";
                    begin

                        Rec.FilterGroup(2);
                        if Rec.GetFilter(Type) = 'RMDUmlagerung' then
                            if Rec.Type <> Rec.Type::RMDUmlagerung then begin
                                Rec.Type := Rec.Type::RMDUmlagerung;
                                if not SourceCode.Get('RMDUMLBUBL') then begin
                                    SourceCode.Init;
                                    SourceCode.Code := 'RMDUMLBUBL';
                                    SourceCode.Description := 'RMD Umlagerungs Buch.-Blatt';
                                    SourceCode.Insert;
                                end;
                            end;
                        Rec."Source Code" := SourceCode.Code;
                        Rec.FilterGroup(0);
                    end;
                }
                field("Source Code"; Rec."Source Code")
                {
                }
                field("Reason Code"; Rec."Reason Code")
                {
                }
                field(Recurring; Rec.Recurring)
                {
                }
                field("Page ID"; Rec."Page ID")
                {
                    Visible = false;
                }
                field("Page Caption"; Rec."Page Caption")
                {
                    Visible = false;
                }
                field("Test Report ID"; Rec."Test Report ID")
                {
                    Visible = false;
                }
                field("Test Report Caption"; Rec."Test Report Caption")
                {
                    Visible = false;
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Posting No. Series"; Rec."Posting No. Series")
                {
                }
                field("Posting Report ID"; Rec."Posting Report ID")
                {
                    Visible = false;
                }
                field("Posting Report Caption"; Rec."Posting Report Caption")
                {
                    Visible = false;
                }
                field("Whse. Register Report ID"; Rec."Whse. Register Report ID")
                {
                    Visible = false;
                }
                field("Whse. Register Report Caption"; Rec."Whse. Register Report Caption")
                {
                    Visible = false;
                }
                field("Force Posting Report"; Rec."Force Posting Report")
                {
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1106900020; Outlook)
            {
            }
            systempart(Control1106900021; Notes)
            {
            }
            systempart(Control1106900022; MyNotes)
            {
            }
            systempart(Control1106900023; Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        SourceCode: Record "Source Code";
    begin
        Rec.FilterGroup(2);
        if Rec.GetFilter(Type) = 'RMDUmlagerung' then begin
            Rec.Type := Rec.Type::RMDUmlagerung;
            SourceCode.Get('RMDUMLBUBL');
            Rec."Source Code" := SourceCode.Code;
        end;
        Rec.FilterGroup(0);
    end;

    trigger OnOpenPage()
    begin
        Rec.FilterGroup(2);
        Rec.SetRange(Type, Rec.Type::RMDUmlagerung);
        Rec.FilterGroup(0);
    end;
}

