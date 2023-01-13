pageextension 50010 "gimItemCardPageExt" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("Lager RMD"; "Lager RMD")
            {
                ApplicationArea = All;
            }
            field("RMD Labelanweisungscode"; "RMD Labelanweisungscode")
            {
                ApplicationArea = All;
            }
            field("Menge in RMD Umlagerung"; "Menge in RMD Umlagerung")
            {
                ApplicationArea = All;
            }
            field(Frachtkosten; Frachtkosten)
            {
                ApplicationArea = All;
            }
            field(Frachtkostencode; Frachtkostencode)
            {
                ApplicationArea = All;
            }
        }
        addlast("Posting Details")
        {
            field("EP-pflichtig"; "EP-pflichtig")
            {
                ApplicationArea = All;
            }

        }
        addlast(Item)
        {
            group(Abmessungen)
            {
                Caption = 'Abmessungen';
                field(Abmessung1; Abmessung1)
                {
                    ApplicationArea = All;
                }
                field(Abmessung2; Abmessung2)
                {
                    ApplicationArea = All;
                }
                field(Abmessung3; Abmessung3)
                {
                    ApplicationArea = All;
                }
                field(Innenabmessung1; Innenabmessung1)
                {
                    ApplicationArea = All;
                }
                field(Innenabmessung2; Innenabmessung2)
                {
                    ApplicationArea = All;
                }
                field(Innenabmessung3; Innenabmessung3)
                {
                    ApplicationArea = All;
                }
                field(Durchmesser2; Durchmesser2)
                {
                    ApplicationArea = All;
                }
                field(Durchmesser1; Durchmesser1)
                {
                    ApplicationArea = All;
                }
            }
            group(Pulverprogramm)
            {
                Caption = 'Pulverprogramm';
                field("Pulvernr.(einseitig)"; "Pulvernr.(einseitig)")
                {
                    ApplicationArea = All;
                }
                field("Pulvernr.(beidseitig)"; "Pulvernr.(beidseitig)")
                {
                    ApplicationArea = All;
                }
                field("Pulvernr.(doppelt)"; "Pulvernr.(doppelt)")
                {
                    ApplicationArea = All;
                }
            }
            group(Vertriebsportal)
            {
                Caption = 'Vertriebsportal';
                field(Partnerportal; Partnerportal)
                {
                    ApplicationArea = All;
                }
                field(Kategorie; Kategorie)
                {
                    ApplicationArea = All;
                }
                field("Vimeo-ID-DE"; "Vimeo-ID-DE")
                {
                    Caption = 'Vimeo-ID-DE';
                    ApplicationArea = All;
                }
                field("Vimeo-ID2-DE"; "Vimeo-ID2-DE")
                {
                    Caption = 'Vimeo-ID2-DE';
                    ApplicationArea = All;
                }
                field("Vimeo-ID3-DE"; "Vimeo-ID3-DE")
                {
                    Caption = 'Vimeo-ID3-DE';
                    ApplicationArea = All;
                }
                field("Vimeo-ID4-DE"; "Vimeo-ID4-DE")
                {
                    Caption = 'Vimeo-ID4-DE';
                    ApplicationArea = All;
                }
                field("Vimeo-ID-ENU"; "Vimeo-ID-ENU")
                {
                    Caption = 'Vimeo-ID-ENU';
                    ApplicationArea = All;
                }
                field("Vimeo-ID2-ENU"; "Vimeo-ID2-ENU")
                {
                    Caption = 'Vimeo-ID2-ENU';
                    ApplicationArea = All;
                }
                field("Vimeo-ID3-ENU"; "Vimeo-ID3-ENU")
                {
                    Caption = 'Vimeo-ID3-ENU';
                    ApplicationArea = All;
                }
                field("Vimeo-ID4-ENU"; "Vimeo-ID4-ENU")
                {
                    Caption = 'Vimeo-ID4-ENU';
                    ApplicationArea = All;
                }
            }
            group(Katalog)
            {
                Caption = 'Katalog';
                field(Control1000000018; Katalog)
                {
                    ApplicationArea = All;
                }
                field(Katalogseite; Katalogseite)
                {
                    ApplicationArea = All;
                }
                field(Preisrelevant; Preisrelevant)
                {
                    ApplicationArea = All;
                }
            }
            group("QM-Etikett")
            {
                Caption = 'QM-Etikett';
                field("Basis Zertifikat"; "Basis Zertifikat")
                {
                    ApplicationArea = All;
                }
                field("Max Gebindegr. links"; "Max Gebindegr. links")
                {
                    ApplicationArea = All;
                }
                field("Max Gebindegr. rechts"; "Max Gebindegr. rechts")
                {
                    ApplicationArea = All;
                }
                field("Max Tragf. Stellf. links"; "Max Tragf. Stellf. links")
                {
                    ApplicationArea = All;
                }
                field("Max Tragf. Stellf. rechts"; "Max Tragf. Stellf. rechts")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}