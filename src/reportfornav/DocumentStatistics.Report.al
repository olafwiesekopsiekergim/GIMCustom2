#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 60009 "CCO Document Statistics"
{
	Caption = 'Document Statistics';
	WordLayout = './Layouts/CCODocumentStatistics.docx'; DefaultLayout = Word;

	dataset
	{
		dataitem("Sales Header";"Sales Header")
		{
			DataItemTableView = sorting("Document Type", "No.");
			RequestFilterFields = "Document Type", "Sell-to Customer No.", "Bill-to Customer No.", "Salesperson Code", "Creation Date", "Internal Job No.";
			column(ReportForNavId_1; 1) {} // Autogenerated by ForNav - Do not delete
			column(ReportForNav_SalesHeader; ReportForNavWriteDataItem('SalesHeader',"Sales Header")) {}
			trigger OnPreDataItem();
			begin
				//c/wa/080808: - Zuständigkeitseinheiten
				if UserMgt.GetSalesFilter() <> '' then begin
					FilterGroup(2);
					SetRange("Responsibility Center", UserMgt.GetSalesFilter());
					FilterGroup(0);
				end;
				ReportForNav.OnPreDataItem('SalesHeader',"Sales Header");
			end;
			
			trigger OnAfterGetRecord();
			var
				lSalesLine: Record "Sales Line";
				lTempSalesLine: Record "Sales Line" temporary;
				lTempVATAmountLine1: Record "VAT Amount Line" temporary;
				lTotalSalesLine: Record "Sales Line";
				lTotalSalesLineLCY: Record "Sales Line";
				VATAmount: Decimal;
				ProfitLCY: Decimal;
				ProfitPct: Decimal;
				AdjProfitLCY: Decimal;
				AdjProfitPct: Decimal;
				TotalAdjCostLCY: Decimal;
				VATAmountText: Text[30];
				QtyType: Option General,Invoicing,Shipping;
			begin
				//c/mt/26.11.13 START
				AdjProfitLCY := 0;
				QtyType := Qtytype::General;
				lTempSalesLine.DeleteAll;
				Clear(lTempSalesLine);
				Clear(SalesPost);
				SalesPost.GetSalesLines("Sales Header", lTempSalesLine, QtyType);
				Clear(SalesPost);
				lSalesLine.CalcVATAmountLines(0, "Sales Header", lTempSalesLine, lTempVATAmountLine1);
				SalesPost.SumSalesLinesTemp(
				  "Sales Header", lTempSalesLine, QtyType, lTotalSalesLine, lTotalSalesLineLCY,
				  VATAmount, VATAmountText, ProfitLCY, ProfitPct, TotalAdjCostLCY);
				AdjProfitLCY := lTotalSalesLineLCY.Amount - TotalAdjCostLCY;
				//c/mt/26.11.13 STOP
				"Sales Header".CalcFields(Amount);
				tempVK := "Sales Header";
				tempVK."Real.wahrscheinlichkeit" := Amount; //- "Invoice Discount Value";
															//tempVK.EkMwKarlstein := AdjProfitLCY; //c/mt/26.11.13
				if SortierungOption = Sortierungoption::Verkäufercode then begin
					tempVK.Creationuser := "Salesperson Code";
					tempVK."Salesperson Code" := Creationuser;
				end;
				if not tempVK.Insert then
					Error('Beleg %1 %2 existiert schon', "Sales Header"."Document Type", "Sales Header"."No.");
			end;
			
		}
		dataitem("Sales Header Archive";"Sales Header Archive")
		{
			DataItemTableView = sorting("Document Type");
			column(ReportForNavId_2; 2) {} // Autogenerated by ForNav - Do not delete
			column(ReportForNav_SalesHeaderArchive; ReportForNavWriteDataItem('SalesHeaderArchive',"Sales Header Archive")) {}
			trigger OnPreDataItem();
			begin
				//c/wa/080808: - Zuständigkeitseinheiten
				if UserMgt.GetSalesFilter() <> '' then begin
					FilterGroup(2);
					SetRange("Responsibility Center", UserMgt.GetSalesFilter());
					FilterGroup(0);
				end;
				SetFilter("Document Type", FilterBelegart);
				SetFilter("Creation Date", FilterDatum);
				SetFilter(Sachbearbeiter, FilterUser);
				SetFilter("Sell-to Customer No.", FilterKunde);
				SetFilter("Bill-to Customer No.", FilterDebitor);
				SetFilter("Salesperson Code", FilterVerkäufer);
				//SETFILTER("Gen. Prod. Posting Grp. Filter", FilterProdukt);
				//c/gw/01091: - A20611
				SetFilter("Internal Job No.", FilterInternalJobNo);
				ReportForNav.OnPreDataItem('SalesHeaderArchive',"Sales Header Archive");
			end;
			
			trigger OnAfterGetRecord();
			var
				lSalesHeaderTemp: Record "Sales Header" temporary;
				lSalesLine: Record "Sales Line";
				lTempSalesLine: Record "Sales Line" temporary;
				lTempVATAmountLine1: Record "VAT Amount Line" temporary;
				lTotalSalesLine: Record "Sales Line";
				lTotalSalesLineLCY: Record "Sales Line";
				VATAmount: Decimal;
				ProfitLCY: Decimal;
				ProfitPct: Decimal;
				AdjProfitLCY: Decimal;
				TotalAdjCostLCY: Decimal;
				VATAmountText: Text[30];
				QtyType: Option General,Invoicing,Shipping;
			begin
				//c/mt/26.11.13 START
				lSalesHeaderTemp.DeleteAll;
				lSalesHeaderTemp."Document Type" := "Sales Header Archive"."Document Type";
				lSalesHeaderTemp."No." := "Sales Header Archive"."No.";
				AdjProfitLCY := 0;
				QtyType := Qtytype::General;
				lTempSalesLine.DeleteAll;
				Clear(lTempSalesLine);
				Clear(SalesPost);
				SalesPost.GetSalesLines(lSalesHeaderTemp, lTempSalesLine, QtyType);
				Clear(SalesPost);
				lSalesLine.CalcVATAmountLines(0, lSalesHeaderTemp, lTempSalesLine, lTempVATAmountLine1);
				SalesPost.SumSalesLinesTemp(
				  lSalesHeaderTemp, lTempSalesLine, QtyType, lTotalSalesLine, lTotalSalesLineLCY,
				  VATAmount, VATAmountText, ProfitLCY, ProfitPct, TotalAdjCostLCY);
				AdjProfitLCY := lTotalSalesLineLCY.Amount - TotalAdjCostLCY;
				//c/mt/26.11.13 STOP
				tempVK.TransferFields("Sales Header Archive");
				CalcFields(Amount);
				tempVK."Real.wahrscheinlichkeit" := Amount;//- "Invoice Discount Value";
														   //tempVK.EkMwKarlstein := AdjProfitLCY; //c/mt/26.11.13
				if SortierungOption = Sortierungoption::Verkäufercode then begin
					tempVK.Creationuser := "Salesperson Code";
					tempVK."Salesperson Code" := Sachbearbeiter;
				end;
				if not tempVK.Insert then;
			end;
			
		}
		dataitem(Druck;Integer)
		{
			DataItemTableView = sorting(Number) where(Number = filter(1 ..));
			column(ReportForNavId_3; 3) {} // Autogenerated by ForNav - Do not delete
			column(ReportForNav_Druck; ReportForNavWriteDataItem('Druck',Druck)) {}
			column(FilterText; FilterText)
			{
				IncludeCaption = false;
			}
			column("USERID"; UserId)
			{
				IncludeCaption = false;
			}
			column(ReportForNavPageNo; Format(ReportForNav.PagePlaceHolder))
			{
				IncludeCaption = false;
			}
			column(COMPANYNAME; COMPANYNAME)
			{
				IncludeCaption = false;
			}
			column(TODAY_0_4; Format(Today, 0, 4))
			{
				IncludeCaption = false;
			}
			column(OrderDate_tempVK; tempVK."Order Date")
			{
				IncludeCaption = false;
			}
			column(tempVKDocumentType; Format(tempVK."Document Type"))
			{
				IncludeCaption = false;
			}
			column(Position; Position)
			{
				IncludeCaption = false;
			}
			column(Betrag_MW_; "Betrag (MW)")
			{
				IncludeCaption = false;
			}
			column(SalespersonCode_tempVK; tempVK."Salesperson Code")
			{
				IncludeCaption = false;
			}
			column(Sell_toCustomerName_tempVK; tempVK."Sell-to Customer Name")
			{
				IncludeCaption = false;
			}
			column(Sell_toCustomerNo_tempVK; tempVK."Sell-to Customer No.")
			{
				IncludeCaption = false;
			}
			column(tempVKErstellungsDatum; tempVK."Creation Date")
			{
				IncludeCaption = false;
			}
			column(No_tempVK; tempVK."No.")
			{
				IncludeCaption = false;
			}
			column(Total_; 'Total:')
			{
				IncludeCaption = false;
			}
			column(tempVKErstellungsUser; tempVK.Creationuser)
			{
				IncludeCaption = false;
			}
			trigger OnPreDataItem();
			begin
				tempVK.SetCurrentkey("Document Type");
				Position := 0;
				ReportForNav.OnPreDataItem('Druck',Druck);
			end;
			
			trigger OnAfterGetRecord();
			begin
				"Betrag (MW)" := 0; // Inserted by ForNAV
				if Number = 1 then
					OK := tempVK.Find('-')
				else
					OK := tempVK.Next <> 0;
				if not OK then
					CurrReport.Break;
				//Betrag umrechnen
				if tempVK."Order Date" = 0D then
					tempVK."Order Date" := Today;
				if tempVK."Currency Code" <> '' then //umrechnen
					"Betrag (MW)" := Währungswechselkurs.ExchangeAmtFCYToLCY(
									   tempVK."Order Date",
									   tempVK."Currency Code",
									   tempVK."Real.wahrscheinlichkeit",
									   tempVK."Currency Factor")
				else
					"Betrag (MW)" := tempVK."Real.wahrscheinlichkeit";
				Position := Position + 1;
			end;
			
		}
	}
	requestpage
	{
		SaveValues = false;
		layout
		{
			area(Content)
			{
				group(Options)
				{
					Caption = 'Options';
					field(SortierungOption; SortierungOption)
					{
						ApplicationArea = Basic;
						Caption = 'Sortierung';
						OptionCaption = 'Verkäufercode';
					}
				}
			}
		}

	}

	trigger OnInitReport()
	begin
		;ReportsForNavInit;

	end;

	trigger OnPostReport()
	begin
		//c/mt/26.11.13 START
	end;

	trigger OnPreReport()
	begin
		FilterText := "Sales Header".GetFilters;
		FilterBelegart := "Sales Header".GetFilter("Document Type");
		FilterDatum := "Sales Header".GetFilter("Creation Date");
		FilterUser := "Sales Header".GetFilter(Creationuser);
		FilterKunde := "Sales Header".GetFilter("Sell-to Customer No.");
		FilterDebitor := "Sales Header".GetFilter("Bill-to Customer No.");
		FilterVerkäufer := "Sales Header".GetFilter("Salesperson Code");
		//FilterProdukt := "Sales Header".GETFILTER("Gen. Prod. Posting Grp. Filter");
		//c/gw/01.09.11: - A20611
		FilterInternalJobNo := "Sales Header".GetFilter("Internal Job No.");
		tempVK.DeleteAll;
		//c/mt/26.11.13 START

		//c/mt/26.11.13 STOP
		;ReportsForNavPre;
	end;
	var
		SalesLine: Record "Sales Line";
		tempVK: Record "Sales Header" temporary;
		"Währungswechselkurs": Record "Currency Exchange Rate";
		LastFieldNo: Integer;
		FooterPrinted: Boolean;
		FilterText: Text[250];
		FilterBelegart: Text[250];
		FilterDatum: Text[250];
		FilterUser: Text[250];
		FilterKunde: Text[250];
		FilterDebitor: Text[250];
		"FilterVerkäufer": Text[250];
		FilterProdukt: Text[250];
		FilterInternalJobNo: Text[350];
		Position: Integer;
		"Betrag (MW)": Decimal;
		OK: Boolean;
		SortierungOption: Option Erstellungsuser,"Verkäufercode";
		UserMgt: Codeunit "User Setup Management";
		SalesPost: Codeunit "Sales-Post";
		Text001: label 'Data';
		Text002: label 'Belegstatistik DüSi';
		Text003: label 'Company Name';
		Text004: label 'Report No.';
		Text005: label 'Report Name';
		Text006: label 'User ID';
		Text007: label 'Date';
		Text008: label 'Sales Header Filter';
		Text009: label 'Sorting';
		Text010: label 'Erstellungsuser,Verkäufercode';
		Text020: label 'Position';
		Text021: label 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order';
		Text022: label 'Document No.';
		Text023: label 'Amount (LCY)';
		Text024: label 'Profit (LCY)';
		PrintProfit: Boolean;

	local procedure OnPreSectionDruck_Body3(var Druck : Record Integer);
	begin
		with Druck do begin
			ReportForNavSetShowOutput(SortierungOption = Sortierungoption::Erstellungsuser);
			//  //c/mt/25.11.13 START
			if (SortierungOption = Sortierungoption::Erstellungsuser) then begin
			end;
		end;
	end;
	local procedure OnPreSectionDruck_Body4(var Druck : Record Integer);
	begin
		with Druck do begin
			ReportForNavSetShowOutput(SortierungOption = Sortierungoption::Verkäufercode);
			//c/mt/25.11.13 START
			if (SortierungOption = Sortierungoption::Verkäufercode) then;
		end;
	end;
	// --> Reports ForNAV Autogenerated code - do not delete or modify
	var
		ReportForNav: Codeunit "ForNAV Report Management";
		ReportForNavTotalsCausedBy: Integer;
		ReportForNavInitialized: Boolean;
		ReportForNavShowOutput: Boolean;

	local procedure ReportsForNavInit() var id: Integer; begin Evaluate(id, CopyStr(CurrReport.ObjectId(false), StrPos(CurrReport.ObjectId(false), ' ') + 1)); ReportForNav.OnInit(id); end;
	local procedure ReportsForNavPre() begin end;
	local procedure ReportForNavSetTotalsCausedBy(value : Integer) begin ReportForNavTotalsCausedBy := value; end;
	local procedure ReportForNavSetShowOutput(value : Boolean) begin ReportForNavShowOutput := value; end;
	local procedure ReportForNavInit(jsonObject : JsonObject) begin ReportForNav.Init(jsonObject, CurrReport.ObjectId); end;
	local procedure ReportForNavWriteDataItem(dataItemId: Text; rec : Variant) : Text
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
			'Druck':
				begin
					ReportForNavShowOutput := true; OnPreSectionDruck_Body3(Druck); jsonObject.Add('$Body3$Pre',ReportForNavShowOutput);
					ReportForNavShowOutput := true; OnPreSectionDruck_Body4(Druck); jsonObject.Add('$Body4$Pre',ReportForNavShowOutput);
				end;
		end;
		ReportForNav.AddDataItemValues(jsonObject,dataItemId,rec);
		jsonObject.WriteTo(values);
		exit(values);
	end;
	// Reports ForNAV Autogenerated code - do not delete or modify -->
}
