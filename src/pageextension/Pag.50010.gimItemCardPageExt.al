#pragma implicitwith disable
pageextension 50010 "gimItemCardPageExt" extends "Item Card"
{
    layout
    {
        modify("Routing No.")
        {
            trigger OnAssistEdit()
            var
                RoutingL: record "Routing Header";
            begin
                //GIM0002 ow 18.02.2022 ++++
                if Rec."Routing No." = '' then begin
                    RoutingL.INIT();
                    RoutingL."No." := Rec."No.";
                    RoutingL.Description := Rec.Description;
                    RoutingL."Description 2" := Rec."Description 2";
                    RoutingL."Search Description" := Rec."Search Description";
                    RoutingL.INSERT(true);
                    Rec."Routing No." := Rec."No."
                end else
                    RoutingL.GET(Rec."Routing No.");

                PAGE.RUN(PAGE::Routing, RoutingL);
                //GIM0002 ----
            end;
        }
        modify("Production BOM No.")
        {
            trigger OnAssistEdit()
            var
                ProdBomL: record "production BOM Header";
            begin
                //GIM0002 ow 18.02.2022 ++++
                if Rec."Production BOM No." = '' then begin
                    ProdBomL.INIT();
                    ProdBomL."No." := Rec."No.";
                    ProdBomL.Description := Rec.Description;
                    ProdBomL."Description 2" := Rec."Description 2";
                    ProdBomL."Search Name" := Rec."Search Description";
                    ProdBomL."Unit of Measure Code" := Rec."Base Unit of Measure";
                    ProdBomL.INSERT(true);
                    Rec."Production BOM No." := Rec."No."
                end else
                    ProdBomL.GET(Rec."Production BOM No.");

                if rec."CCS PM Production BOM Type" = rec."ccs pm Production BOM Type"::" " then
                    PAGE.RUN(PAGE::"Production BOM", ProdBomL);
                //GIM0002 ----
            end;
        }

        addlast(Warehouse)
        {
            field("Stand.Lagerort"; Rec."Stand.Lagerort")
            {
                ApplicationArea = all;
            }
        }


        addlast("CCS DM Config. to Order")
        {
            field("Product Group Code"; rec."Production Group Code")
            {
                ApplicationArea = All;
                Caption = 'Fertigungsgruppencode';
            }
        }
        addlast(Item)
        {
            field("Lager RMD"; Rec."Lager RMD")
            {
                ApplicationArea = All;
            }
            field("RMD Labelanweisungscode"; Rec."RMD Labelanweisungscode")
            {
                ApplicationArea = All;
            }
            field("Menge in RMD Umlagerung"; Rec."Menge in RMD Umlagerung")
            {
                ApplicationArea = All;
            }
            field(Frachtkosten; Rec.Frachtkosten)
            {
                ApplicationArea = All;
            }
            field(Frachtkostencode; Rec.Frachtkostencode)
            {
                ApplicationArea = All;
            }
            field("CCO Print on Slip"; Rec."Print on Slip")
            {
                ApplicationArea = All;
            }
        }
        addlast("Posting Details")
        {
            field("EP-pflichtig"; Rec."EP-pflichtig")
            {
                ApplicationArea = All;
            }

        }
        addlast(Item)
        {
            group(Abmessungen)
            {
                Caption = 'Abmessungen';
                field(Abmessung1; Rec.Abmessung1)
                {
                    ApplicationArea = All;
                }
                field(Abmessung2; Rec.Abmessung2)
                {
                    ApplicationArea = All;
                }
                field(Abmessung3; Rec.Abmessung3)
                {
                    ApplicationArea = All;
                }
                field(Innenabmessung1; Rec.Innenabmessung1)
                {
                    ApplicationArea = All;
                }
                field(Innenabmessung2; Rec.Innenabmessung2)
                {
                    ApplicationArea = All;
                }
                field(Innenabmessung3; Rec.Innenabmessung3)
                {
                    ApplicationArea = All;
                }
                field(Durchmesser2; Rec.Durchmesser2)
                {
                    ApplicationArea = All;
                }
                field(Durchmesser1; Rec.Durchmesser1)
                {
                    ApplicationArea = All;
                }
            }
            group(Pulverprogramm)
            {
                Caption = 'Pulverprogramm';
                field("Pulvernr.(einseitig)"; Rec."Pulvernr.(einseitig)")
                {
                    ApplicationArea = All;
                }
                field("Pulvernr.(beidseitig)"; Rec."Pulvernr.(beidseitig)")
                {
                    ApplicationArea = All;
                }
                field("Pulvernr.(doppelt)"; Rec."Pulvernr.(doppelt)")
                {
                    ApplicationArea = All;
                }
            }
            group(Vertriebsportal)
            {
                Caption = 'Vertriebsportal';
                field(Partnerportal; Rec.Partnerportal)
                {
                    ApplicationArea = All;
                }
                field(Kategorie; Rec.Kategorie)
                {
                    ApplicationArea = All;
                }
                field("Vimeo-ID-DE"; Rec."Vimeo-ID-DE")
                {
                    Caption = 'Vimeo-ID-DE';
                    ApplicationArea = All;
                }
                field("Vimeo-ID2-DE"; Rec."Vimeo-ID2-DE")
                {
                    Caption = 'Vimeo-ID2-DE';
                    ApplicationArea = All;
                }
                field("Vimeo-ID3-DE"; Rec."Vimeo-ID3-DE")
                {
                    Caption = 'Vimeo-ID3-DE';
                    ApplicationArea = All;
                }
                field("Vimeo-ID4-DE"; Rec."Vimeo-ID4-DE")
                {
                    Caption = 'Vimeo-ID4-DE';
                    ApplicationArea = All;
                }
                field("Vimeo-ID-ENU"; Rec."Vimeo-ID-ENU")
                {
                    Caption = 'Vimeo-ID-ENU';
                    ApplicationArea = All;
                }
                field("Vimeo-ID2-ENU"; Rec."Vimeo-ID2-ENU")
                {
                    Caption = 'Vimeo-ID2-ENU';
                    ApplicationArea = All;
                }
                field("Vimeo-ID3-ENU"; Rec."Vimeo-ID3-ENU")
                {
                    Caption = 'Vimeo-ID3-ENU';
                    ApplicationArea = All;
                }
                field("Vimeo-ID4-ENU"; Rec."Vimeo-ID4-ENU")
                {
                    Caption = 'Vimeo-ID4-ENU';
                    ApplicationArea = All;
                }
            }
            group(Katalog)
            {
                Caption = 'Katalog';
                field(Control1000000018; Rec.Katalog)
                {
                    ApplicationArea = All;
                }
                field(Katalogseite; Rec.Katalogseite)
                {
                    ApplicationArea = All;
                }
                field(Preisrelevant; Rec.Preisrelevant)
                {
                    ApplicationArea = All;
                }
            }
            group("QM-Etikett")
            {
                Caption = 'QM-Etikett';
                field("Basis Zertifikat"; Rec."Basis Zertifikat")
                {
                    ApplicationArea = All;
                }
                field("Max Gebindegr. links"; Rec."Max Gebindegr. links")
                {
                    ApplicationArea = All;
                }
                field("Max Gebindegr. rechts"; Rec."Max Gebindegr. rechts")
                {
                    ApplicationArea = All;
                }
                field("Max Tragf. Stellf. links"; Rec."Max Tragf. Stellf. links")
                {
                    ApplicationArea = All;
                }
                field("Max Tragf. Stellf. rechts"; Rec."Max Tragf. Stellf. rechts")
                {
                    ApplicationArea = All;
                }


            }
        }
    }
}
#pragma implicitwith restore
