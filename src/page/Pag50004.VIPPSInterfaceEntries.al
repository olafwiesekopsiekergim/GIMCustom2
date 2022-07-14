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
                }
                field(Sourcetype; Rec.Sourcetype)
                {
                }
                field("Processed at"; Rec."Processed at")
                {
                }
                field("Processed by"; Rec."Processed by")
                {
                }
                field(Zeitstempel; Rec.Zeitstempel)
                {
                }
                field(Konto_Qual; Rec.Konto_Qual)
                {
                }
                field(Konto_Nummer; Rec.Konto_Nummer)
                {
                }
                field(Belegnummer; Rec.Belegnummer)
                {
                }
                field(Positions_Nummer; Rec.Positions_Nummer)
                {
                }
                field(Rech_Gut; Rec.Rech_Gut)
                {
                }
                field(Betrag_incl_MWST; Rec.Betrag_incl_MWST)
                {
                }
                field("MWST_Betrag_Prüfen"; Rec.MWST_Betrag_Prüfen)
                {
                }
                field(Nettobetrag; Rec.Nettobetrag)
                {
                }
                field("Währungkennzeichen"; Rec.Währungkennzeichen)
                {
                }
                field(Belegdatum; Rec.Belegdatum)
                {
                }
                field(Buchungsdatum; Rec.Buchungsdatum)
                {
                }
                field(ZLG_Bed; Rec.ZLG_Bed)
                {
                }
                field("Fälligkeitsdatum"; Rec.Fälligkeitsdatum)
                {
                }
                field(Skontodatum; Rec.Skontodatum)
                {
                }
                field(Skonto_Proz; Rec.Skonto_Proz)
                {
                }
                field(Dim1_Kostst; Rec.Dim1_Kostst)
                {
                }
                field(Dim2_Kosttr; Rec.Dim2_Kosttr)
                {
                }
                field(Mwst_Proz; Rec.Mwst_Proz)
                {
                }
                field(Mwst_Art; Rec.Mwst_Art)
                {
                }
                field(Mwst_Bemessungsgrundlage; Rec.Mwst_Bemessungsgrundlage)
                {
                }
                field(Mwst_Betrag; Rec.Mwst_Betrag)
                {
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                }
                field(Buchungsgruppe; Rec.Buchungsgruppe)
                {
                }
                field("Geschäftsbuchungsgruppe"; Rec.Geschäftsbuchungsgruppe)
                {
                }
                field("Mwst_Geschäftsbuchungsgruppe"; Rec.Mwst_Geschäftsbuchungsgruppe)
                {
                }
                field(Abwarten; Rec.Abwarten)
                {
                }
                field(Externe_Belegnummer; Rec.Externe_Belegnummer)
                {
                }
                field(Buchungsart; Rec.Buchungsart)
                {
                }
                field(Produktbuchungsgruppe; Rec.Produktbuchungsgruppe)
                {
                }
                field(Mwst_Produktbuchungsgruppe; Rec.Mwst_Produktbuchungsgruppe)
                {
                }
                field(Barcode; Rec.Barcode)
                {
                }
                field(Betriebsauftragsnummer; Rec.Betriebsauftragsnummer)
                {
                }
                field(Arbeitsgang; Rec.Arbeitsgang)
                {
                }
                field(Interner_Auftrag; Rec.Interner_Auftrag)
                {
                }
                field(Kundenauftrag; Rec.Kundenauftrag)
                {
                }
                field(Kundenauftragsposition; Rec.Kundenauftragsposition)
                {
                }
                field(Bestellanforderung; Rec.Bestellanforderung)
                {
                }
                field(Bestellanforderungsposition; Rec.Bestellanforderungsposition)
                {
                }
                field(Buchungs_Text; Rec.Buchungs_Text)
                {
                }
                field(Hanning_projekt; Rec.Hanning_projekt)
                {
                }
                field(ST_Konto_qual; Rec.ST_Konto_qual)
                {
                }
                field(ST_Konto_nummer; Rec.ST_Konto_nummer)
                {
                }
                field(ST_Name; Rec.ST_Name)
                {
                }
                field(ST_Suchbegriff; Rec.ST_Suchbegriff)
                {
                }
                field(ST_Name2; Rec.ST_Name2)
                {
                }
                field(ST_Adresse; Rec.ST_Adresse)
                {
                }
                field(ST_Adresse2; Rec.ST_Adresse2)
                {
                }
                field(ST_PLZ_Code; Rec.ST_PLZ_Code)
                {
                }
                field(ST_Ort; Rec.ST_Ort)
                {
                }
                field(ST_Land; Rec.ST_Land)
                {
                }
                field(ST_Telefon; Rec.ST_Telefon)
                {
                }
                field(ST_Fax; Rec.ST_Fax)
                {
                }
                field(ST_e_Mail; Rec.ST_e_Mail)
                {
                }
                field(ST_Homepage; Rec.ST_Homepage)
                {
                }
                field(ST_Zlg_Bedingungscode; Rec.ST_Zlg_Bedingungscode)
                {
                }
                field("ST_Verkäufer_Einkäufer"; Rec.ST_Verkäufer_Einkäufer)
                {
                }
                field(ST_UST_ID; Rec.ST_UST_ID)
                {
                }
                field("ST_Geschäftsbuchungsgruppe"; Rec.ST_Geschäftsbuchungsgruppe)
                {
                }
                field("ST_MWST_Geschäftsbuchungsgrp"; Rec.ST_MWST_Geschäftsbuchungsgrp)
                {
                }
                field(ST_DEB_KRED_Buchungsgruppe; Rec.ST_DEB_KRED_Buchungsgruppe)
                {
                }
                field(ST_Bankname; Rec.ST_Bankname)
                {
                }
                field(ST_BLZ; Rec.ST_BLZ)
                {
                }
                field(ST_Bankkontonummer; Rec.ST_Bankkontonummer)
                {
                }
                field(ST_IBAN; Rec.ST_IBAN)
                {
                }
                field(ST_Swift; Rec.ST_Swift)
                {
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

