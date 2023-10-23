#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 60023 "CCO Transfer Document"
{
    WordLayout = './Layouts/CCOTransferDocument.docx';
    DefaultLayout = Word;

    dataset
    {
        dataitem("Item Register"; "Item Register")
        {
            DataItemTableView = sorting("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1) { } // Autogenerated by ForNav - Do not delete
            column(ReportForNav_ItemRegister; ReportForNavWriteDataItem('ItemRegister', "Item Register")) { }
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemTableView = sorting("Entry Type", "Location Code") order(ascending) where("Entry Type" = const(Transfer), Quantity = filter(> 0));
                column(ReportForNavId_2; 2) { } // Autogenerated by ForNav - Do not delete
                column(ReportForNav_ItemLedgerEntry; ReportForNavWriteDataItem('ItemLedgerEntry', "Item Ledger Entry")) { }
                column("USERID"; UserId)
                {
                    IncludeCaption = false;
                }
                column(ReportForNavPageNo; Format(ReportForNav.PagePlaceHolder))
                {
                    IncludeCaption = false;
                }
                column(TODAY_0_4; Format(Today, 0, 4))
                {
                    IncludeCaption = false;
                }
                column(PostCode_Lagerort; Lagerort."Post Code")
                {
                    IncludeCaption = false;
                }
                column(City_Lagerort; Lagerort.City)
                {
                    IncludeCaption = false;
                }
                column(Address2_Lagerort; Lagerort."Address 2")
                {
                    IncludeCaption = false;
                }
                column(Address_Lagerort; Lagerort.Address)
                {
                    IncludeCaption = false;
                }
                column(Name2_Lagerort; Lagerort."Name 2")
                {
                    IncludeCaption = false;
                }
                column(Name_Lagerort; Lagerort.Name)
                {
                    IncludeCaption = false;
                }
                column(Code_Lagerort; Lagerort.Code)
                {
                    IncludeCaption = false;
                }
                column(DocumentNo_ItemLedgerEntry; "Item Ledger Entry"."Document No.")
                {
                    IncludeCaption = false;
                }
                column(Description_ItemLedgerEntry; "Item Ledger Entry".Description)
                {
                    IncludeCaption = false;
                }
                column(EntryNo_ItemLedgerEntry; "Item Ledger Entry"."Entry No.")
                {
                    IncludeCaption = false;
                }
                column(Quantity_ItemLedgerEntry; "Item Ledger Entry".Quantity)
                {
                    IncludeCaption = false;
                }
                column(LocationCode_ItemLedgerEntry; "Item Ledger Entry"."Location Code")
                {
                    IncludeCaption = false;
                }
                column(ItemNo_ItemLedgerEntry; "Item Ledger Entry"."Item No.")
                {
                    IncludeCaption = false;
                }
                column(EntryType_ItemLedgerEntry; "Item Ledger Entry"."Entry Type")
                {
                    IncludeCaption = false;
                }
                column(PostingDate_ItemLedgerEntry; "Item Ledger Entry"."Posting Date")
                {
                    IncludeCaption = false;
                }
                trigger OnPreDataItem();
                begin
                    SetRange("Entry No.", "Item Register"."From Entry No.", "Item Register"."To Entry No.");
                    ReportForNav.OnPreDataItem('ItemLedgerEntry', "Item Ledger Entry");
                end;

            }
            trigger OnPreDataItem();
            begin
                ReportForNav.OnPreDataItem('ItemRegister', "Item Register");
            end;
        }
    }
    requestpage
    {
        SaveValues = false;
        layout
        {
        }

    }

    trigger OnInitReport()
    begin
        ;
        ReportsForNavInit;

    end;

    trigger OnPostReport()
    begin
    end;

    trigger OnPreReport()
    begin
        ;
        ReportsForNavPre;
    end;

    var
        Artikel: Record Item;
        Lagerort: Record Location;
        LieferAdr: Record "Ship-to Address";
        ArtJournal: Record "Item Register";
        ArtikelJourFilter: Text[250];
        ArtBeschreibung: Text[50];
        PostenArtBeschreibung: array[5] of Text[30];
        AnzahlBuchungen: array[5] of Decimal;
        "TotalBeträge": array[5] of Decimal;
        TotalEinstandsBetrag: array[5] of Decimal;
        EinstandsBetrag: Decimal;
        i: Integer;

    local procedure OnPreSectionItemLedgerEntry_GroupHeader2(var "Item Ledger Entry": Record "Item Ledger Entry");
    begin
        with "Item Ledger Entry" do begin
            ReportForNavSetShowOutput(true);
            //LieferAdr.FINDFIRST;
            //Lagerort.GET("Location Code");
            //---
            // IF NOT LieferAdr.GET(Lagerort."Debitorennr.", Lagerort."Lief. an Code") THEN
            //  ERROR('Keine Lieferanschrift für Lagerort %1 gefunden', "Location Code");
            //---
        end;
    end;

    local procedure OnPreSectionItemLedgerEntry_Header1(var "Item Ledger Entry": Record "Item Ledger Entry");
    begin
        with "Item Ledger Entry" do begin
            Lagerort.Get("Location Code");
        end;// Autogenerated by ForNav;
    end;
    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        ReportForNav: Codeunit "ForNAV Report Management";
        ReportForNavTotalsCausedBy: Integer;
        ReportForNavInitialized: Boolean;
        ReportForNavShowOutput: Boolean;

    local procedure ReportsForNavInit()
    var
        id: Integer;
    begin
        Evaluate(id, CopyStr(CurrReport.ObjectId(false), StrPos(CurrReport.ObjectId(false), ' ') + 1));
        ReportForNav.OnInit(id);
    end;

    local procedure ReportsForNavPre()
    begin
    end;

    local procedure ReportForNavSetTotalsCausedBy(value: Integer)
    begin
        ReportForNavTotalsCausedBy := value;
    end;

    local procedure ReportForNavSetShowOutput(value: Boolean)
    begin
        ReportForNavShowOutput := value;
    end;

    local procedure ReportForNavInit(jsonObject: JsonObject)
    begin
        ReportForNav.Init(jsonObject, CurrReport.ObjectId);
    end;

    local procedure ReportForNavWriteDataItem(dataItemId: Text; rec: Variant): Text
    var
        values: Text;
        jsonObject: JsonObject;
        currLanguage: Integer;
    begin
        if not ReportForNavInitialized then begin
            ReportForNavInit(jsonObject);
            ReportForNavInitialized := true;
        end;

        case (dataItemId) of
            'ItemLedgerEntry':
                begin
                    ReportForNavShowOutput := true;
                    ReportForNavTotalsCausedBy := 8;
                    OnPreSectionItemLedgerEntry_GroupHeader2("Item Ledger Entry");
                    jsonObject.Add('$GroupHeader2$Pre$8$Boolean', ReportForNavShowOutput);
                    ReportForNavShowOutput := true;
                    OnPreSectionItemLedgerEntry_Header1("Item Ledger Entry");
                    jsonObject.Add('$Header1$Pre', ReportForNavShowOutput);
                end;
        end;
        ReportForNav.AddDataItemValues(jsonObject, dataItemId, rec);
        jsonObject.WriteTo(values);
        exit(values);
    end;
    // Reports ForNAV Autogenerated code - do not delete or modify -->
}