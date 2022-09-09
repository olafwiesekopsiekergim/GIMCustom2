page 50004 "VIPPS Interface Entries"
{
    // P0004 15.02.16 DEBIE.ARE NAV2015 Modus changes
    // 
    // +--------------------------------------------------------------+
    // |                  Copyright MODUS Consult AG                  |
    // |                          Customizing                         |
    // +--------------------------------------------------------------+
    // Modul     Date      User      Description
    // MC        11.09.15  OK        Object created

    Caption = 'VIPPS Interface Entries';
    Editable = false;
    PageType = List;
    SourceTable = "VIPPS Interface Entries";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field(Sourcetype; Rec.Sourcetype)
                {
                    ApplicationArea = All;
                }
                field("Processed at"; Rec."Processed at")
                {
                    ApplicationArea = All;
                }
                field("Processed by"; Rec."Processed by")
                {
                    ApplicationArea = All;
                }
                field(Zeitstempel; Rec.Zeitstempel)
                {
                    ApplicationArea = All;
                }
                field(Konto_Qual; Rec.Konto_Qual)
                {
                    ApplicationArea = All;
                }
                field(Konto_Nummer; Rec.Konto_Nummer)
                {
                    ApplicationArea = All;
                }
                field(Belegnummer; Rec.Belegnummer)
                {
                    ApplicationArea = All;
                }
                field(Positions_Nummer; Rec.Positions_Nummer)
                {
                    ApplicationArea = All;
                }
                field(Rech_Gut; Rec.Rech_Gut)
                {
                    ApplicationArea = All;
                }
                field(Betrag_incl_MWST; Rec.Betrag_incl_MWST)
                {
                    ApplicationArea = All;
                }
                field("MWST_Betrag_Prüfen"; Rec.MWST_Betrag_Prüfen)
                {
                    ApplicationArea = All;
                }
                field(Nettobetrag; Rec.Nettobetrag)
                {
                    ApplicationArea = All;
                }
                field("Währungkennzeichen"; Rec.Währungkennzeichen)
                {
                    ApplicationArea = All;
                }
                field(Belegdatum; Rec.Belegdatum)
                {
                    ApplicationArea = All;
                }
                field(Buchungsdatum; Rec.Buchungsdatum)
                {
                    ApplicationArea = All;
                }
                field(ZLG_Bed; Rec.ZLG_Bed)
                {
                    ApplicationArea = All;
                }
                field("Fälligkeitsdatum"; Rec.Fälligkeitsdatum)
                {
                    ApplicationArea = All;
                }
                field(Skontodatum; Rec.Skontodatum)
                {
                    ApplicationArea = All;
                }
                field(Skonto_Proz; Rec.Skonto_Proz)
                {
                    ApplicationArea = All;
                }
                field(Dim1_Kostst; Rec.Dim1_Kostst)
                {
                    ApplicationArea = All;
                }
                field(Dim2_Kosttr; Rec.Dim2_Kosttr)
                {
                    ApplicationArea = All;
                }
                field(Mwst_Proz; Rec.Mwst_Proz)
                {
                    ApplicationArea = All;
                }
                field(Mwst_Art; Rec.Mwst_Art)
                {
                    ApplicationArea = All;
                }
                field(Mwst_Bemessungsgrundlage; Rec.Mwst_Bemessungsgrundlage)
                {
                    ApplicationArea = All;
                }
                field(Mwst_Betrag; Rec.Mwst_Betrag)
                {
                    ApplicationArea = All;
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = All;
                }
                field(Buchungsgruppe; Rec.Buchungsgruppe)
                {
                    ApplicationArea = All;
                }
                field("Geschäftsbuchungsgruppe"; Rec.Geschäftsbuchungsgruppe)
                {
                    ApplicationArea = All;
                }
                field("Mwst_Geschäftsbuchungsgruppe"; Rec.Mwst_Geschäftsbuchungsgruppe)
                {
                    ApplicationArea = All;
                }
                field(Abwarten; Rec.Abwarten)
                {
                    ApplicationArea = All;
                }
                field(Externe_Belegnummer; Rec.Externe_Belegnummer)
                {
                    ApplicationArea = All;
                }
                field(Buchungsart; Rec.Buchungsart)
                {
                    ApplicationArea = All;
                }
                field(Produktbuchungsgruppe; Rec.Produktbuchungsgruppe)
                {
                    ApplicationArea = All;
                }
                field(Mwst_Produktbuchungsgruppe; Rec.Mwst_Produktbuchungsgruppe)
                {
                    ApplicationArea = All;
                }
                field(Barcode; Rec.Barcode)
                {
                    ApplicationArea = All;
                }
                field(Betriebsauftragsnummer; Rec.Betriebsauftragsnummer)
                {
                    ApplicationArea = All;
                }
                field(Arbeitsgang; Rec.Arbeitsgang)
                {
                    ApplicationArea = All;
                }
                field(Interner_Auftrag; Rec.Interner_Auftrag)
                {
                    ApplicationArea = All;
                }
                field(Kundenauftrag; Rec.Kundenauftrag)
                {
                    ApplicationArea = All;
                }
                field(Kundenauftragsposition; Rec.Kundenauftragsposition)
                {
                    ApplicationArea = All;
                }
                field(Bestellanforderung; Rec.Bestellanforderung)
                {
                    ApplicationArea = All;
                }
                field(Bestellanforderungsposition; Rec.Bestellanforderungsposition)
                {
                    ApplicationArea = All;
                }
                field(Buchungs_Text; Rec.Buchungs_Text)
                {
                    ApplicationArea = All;
                }
                field(Hanning_projekt; Rec.Hanning_projekt)
                {
                    ApplicationArea = All;
                }
                field(ST_Konto_qual; Rec.ST_Konto_qual)
                {
                    ApplicationArea = All;
                }
                field(ST_Konto_nummer; Rec.ST_Konto_nummer)
                {
                    ApplicationArea = All;
                }
                field(ST_Name; Rec.ST_Name)
                {
                    ApplicationArea = All;
                }
                field(ST_Suchbegriff; Rec.ST_Suchbegriff)
                {
                    ApplicationArea = All;
                }
                field(ST_Name2; Rec.ST_Name2)
                {
                    ApplicationArea = All;
                }
                field(ST_Adresse; Rec.ST_Adresse)
                {
                    ApplicationArea = All;
                }
                field(ST_Adresse2; Rec.ST_Adresse2)
                {
                    ApplicationArea = All;
                }
                field(ST_PLZ_Code; Rec.ST_PLZ_Code)
                {
                    ApplicationArea = All;
                }
                field(ST_Ort; Rec.ST_Ort)
                {
                    ApplicationArea = All;
                }
                field(ST_Land; Rec.ST_Land)
                {
                    ApplicationArea = All;
                }
                field(ST_Telefon; Rec.ST_Telefon)
                {
                    ApplicationArea = All;
                }
                field(ST_Fax; Rec.ST_Fax)
                {
                    ApplicationArea = All;
                }
                field(ST_e_Mail; Rec.ST_e_Mail)
                {
                    ApplicationArea = All;
                }
                field(ST_Homepage; Rec.ST_Homepage)
                {
                    ApplicationArea = All;
                }
                field(ST_Zlg_Bedingungscode; Rec.ST_Zlg_Bedingungscode)
                {
                    ApplicationArea = All;
                }
                field("ST_Verkäufer_Einkäufer"; Rec.ST_Verkäufer_Einkäufer)
                {
                    ApplicationArea = All;
                }
                field(ST_UST_ID; Rec.ST_UST_ID)
                {
                    ApplicationArea = All;
                }
                field("ST_Geschäftsbuchungsgruppe"; Rec.ST_Geschäftsbuchungsgruppe)
                {
                    ApplicationArea = All;
                }
                field("ST_MWST_Geschäftsbuchungsgrp"; Rec.ST_MWST_Geschäftsbuchungsgrp)
                {
                    ApplicationArea = All;
                }
                field(ST_DEB_KRED_Buchungsgruppe; Rec.ST_DEB_KRED_Buchungsgruppe)
                {
                    ApplicationArea = All;
                }
                field(ST_Bankname; Rec.ST_Bankname)
                {
                    ApplicationArea = All;
                }
                field(ST_BLZ; Rec.ST_BLZ)
                {
                    ApplicationArea = All;
                }
                field(ST_Bankkontonummer; Rec.ST_Bankkontonummer)
                {
                    ApplicationArea = All;
                }
                field(ST_IBAN; Rec.ST_IBAN)
                {
                    ApplicationArea = All;
                }
                field(ST_Swift; Rec.ST_Swift)
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
            action(Stammdatenkarte)
            {
                Ellipsis = true;
                Image = Customer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.TestField(Sourcetype, Rec.Sourcetype::"Master Data");
                    case Rec.ST_Konto_qual of
                        'D', 'C':
                            begin
                                Customer.Get(Rec.ST_Konto_nummer);
                                PAGE.Run(PAGE::"Customer Card", Customer);
                            end;
                        'K', 'V':
                            begin
                                Vendor.Get(Rec.ST_Konto_nummer);
                                PAGE.Run(PAGE::"Vendor Card", Vendor);
                            end;
                    end;
                end;
            }
            action("&Navigate")
            {
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Navigate.SetDoc(Rec.Buchungsdatum, Rec.Belegnummer);
                    Navigate.Run;
                end;
            }
        }
    }

    var
        Customer: Record Customer;
        Vendor: Record Vendor;
        Navigate: Page Navigate;
}

