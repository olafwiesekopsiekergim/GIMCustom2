#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 60045 "CCO Production Report Total"
{
	Caption = 'Production Report Total';
	WordLayout = './Layouts/CCOProductionReportTotal.docx'; DefaultLayout = Word;

	dataset
	{
		dataitem("Production Group";"Production Group")
		{
			DataItemTableView = sorting(Code);
			RequestFilterFields = "Code";
			RequestFilterHeading = 'Filter Fertigungsgruppe';
			column(ReportForNavId_1; 1) {} // Autogenerated by ForNav - Do not delete
			column(ReportForNav_ProductionGroup; ReportForNavWriteDataItem('ProductionGroup',"Production Group")) {}
			trigger OnPreDataItem();
			begin
				CurrReport.Break;
				ReportForNav.OnPreDataItem('ProductionGroup',"Production Group");
			end;
			
		}
		dataitem(Montageposten;"Item Ledger Entry")
		{
			DataItemTableView = sorting("Entry Type", "Location Code", "Posting Date") where("Entry Type" = const(Output));
			RequestFilterFields = "Location Code", "Posting Date";
			column(ReportForNavId_2; 2) {} // Autogenerated by ForNav - Do not delete
			column(ReportForNav_Montageposten; ReportForNavWriteDataItem('Montageposten',Montageposten)) {}
			column(Filter2Txt; Filter2Txt)
			{
			}
			column(FilterTxt; FilterTxt)
			{
			}
			column("USERID"; UserId)
			{
			}
			column(ReportForNavPageNo; Format(ReportForNav.PagePlaceHolder))
			{
			}
			column(COMPANYNAME; COMPANYNAME)
			{
			}
			column(TODAY_0_4; Format(Today, 0, 4))
			{
			}
			column(MontagepostenFIELDCAPTION_Description; Montageposten.FieldCaption(Description))
			{
			}
			column(Arbeitsstunden; Arbeitsstunden)
			{
			}
			column(Verkaufsbetrag_Materialkosten; Verkaufsbetrag - Materialkosten)
			{
			}
			column(Materialkosten; Materialkosten)
			{
			}
			column(Verkaufsbetrag; Verkaufsbetrag)
			{
			}
			column(Description_Montageposten; Montageposten.Description)
			{
			}
			column(Quantity_Montageposten; Qty)
			{
			}
			column(ItemNo_Montageposten; Montageposten."Item No.")
			{
			}
			column(Auftragsnummer; Auftragsnummer)
			{
			}
			column(ProdOrderNo; Montageposten."Order No.")
			{
			}
			column(PostingDate_Montageposten; Montageposten."Posting Date")
			{
			}
			column(LocationCode_Montageposten; Montageposten."Location Code")
			{
			}
			column(Anzahl; Anzahl)
			{
				DecimalPlaces = 0 : 0;
			}
			column(STRSUBSTNO_Pct1Pct2_Pct3_TotalFor_FIELDCAPTION_PostingDate_P; StrSubstNo('%1%2: %3', TotalFor, FieldCaption("Posting Date"), "Posting Date"))
			{
			}
			column(STRSUBSTNO_Pct1Pct2_Pct3_TotalFor_FIELDCAPTION_LocationCode_; StrSubstNo('%1%2: %3', TotalFor, FieldCaption("Location Code"), "Location Code"))
			{
			}
			trigger OnPreDataItem();
			begin
				LastFieldNo := FieldNo("Posting Date");
				Anzahl := 0;
				ReportForNav.OnPreDataItem('Montageposten',Montageposten);
			end;
			
			trigger OnAfterGetRecord();
			begin
				Arbeitsstunden := 0; // Inserted by ForNAV
				Materialkosten := 0; // Inserted by ForNAV
				MonAuftragHolen(Arbeitsstunden, Materialkosten, Qty);
				if (Montageauftrag."Prod. Order No." = '') then begin
					Arbeitsstunden := 0;
					Materialkosten := 0;
					Qty := 0;
					CurrReport.Skip;
				end;
			
				if (Filter2Txt <> '') and (IsNotInFilter) then begin
					Arbeitsstunden := 0;
					Materialkosten := 0;
					Qty := 0;
					CurrReport.Skip;
				end;
			
				Auftragsnummer := '';
				Auftragszeilennr := 0;
				if ProdOrder."Evtl. Auftragsnr." <> '' then begin
					Auftragsnummer := ProdOrder."Evtl. Auftragsnr.";
					Auftragszeilennr := ProdOrder."Evtl. Auftragszeilennr.";
				end;
				Verkaufsbetrag := AuftragHolen;
				Anzahl := Anzahl + 1;
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
					field(Detailansicht; Detailansicht)
					{
						ApplicationArea = Basic;
						Caption = 'Details';
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
	end;

	trigger OnPreReport()
	begin

		FilterTxt := Montageposten.GetFilters;
		Filter2Txt := "Production Group".GetFilters;

		;ReportsForNavPre;
	end;
	var
		LastFieldNo: Integer;
		FooterPrinted: Boolean;
		TotalFor: label 'Total für ';
		FilterTxt: Text[250];
		Filter2Txt: Text[250];
		ProdOrder: Record "Production Order";
		Montageauftrag: Record "Prod. Order Line";
		Auftragsnummer: Code[20];
		Auftragszeilennr: Integer;
		Verkaufsbetrag: Decimal;
		Materialkosten: Decimal;
		Arbeitsstunden: Decimal;
		Anzahl: Decimal;
		Detailansicht: Boolean;
		Qty: Decimal;

	procedure ErgebnisseHolen()
	begin
	end;

	procedure MonAuftragHolen(var Stunden: Decimal; var Kosten: Decimal; var QtyL: Decimal)
	var
		CostCalcMgt: Codeunit "Cost Calculation Management";
		ShareOfTotalCapCost: Decimal;
		ExpCost: array[5] of Decimal;
		ActTimeUsed: Decimal;
	begin
		QtyL := Montageposten.Quantity;
		Clear(Montageauftrag);
		if not Montageauftrag.Get(Montageauftrag.Status::Released,
								  Montageposten."Order No.",
								  Montageposten."Order Line No.") then
			if not Montageauftrag.Get(Montageauftrag.Status::Finished,
									  Montageposten."Order No.",
									  Montageposten."Order Line No.") then
				exit;
		ProdOrder.Get(Montageauftrag.Status, Montageauftrag."Prod. Order No.");
		ProdOrder.CalcFields("Expected Capacity Need", "Actual Time Used");
		CostCalcMgt.CalcProdOrderLineExpCost(
			  Montageauftrag, ShareOfTotalCapCost,
			  ExpCost[1], ExpCost[2], ExpCost[3], ExpCost[4], ExpCost[5]);
		//ActTimeUsed := CostCalcMgt.CalcProdOrderActTimeUsed(ProdOrder,FALSE);
		Stunden := ROUND(ProdOrder."Actual Time Used" / Montageauftrag.Quantity * Montageposten.Quantity);
		if Montageposten.Quantity <> 0 then
			Kosten := ROUND((ExpCost[1] + ExpCost[2]) / Montageauftrag.Quantity * Montageposten.Quantity)
		else
			Kosten := 0;
	end;

	procedure AuftragHolen(): Decimal
	var
		AuftragKopf: Record "Sales Header";
		AuftragZeile: Record "Sales Line";
		RechnKopf: Record "Sales Invoice Header";
		RechnZeile: Record "Sales Invoice Line";
	begin
		if (Auftragszeilennr = 0) or (Auftragsnummer = '') then
			exit(0);
		if AuftragKopf.Get(AuftragKopf."document type"::Order, Auftragsnummer) then begin
			AuftragZeile.SetRange("Document Type", AuftragKopf."Document Type");
			AuftragZeile.SetRange("Document No.", Auftragsnummer);
			AuftragZeile.SetRange("Line No.", Auftragszeilennr);
			if not AuftragZeile.Find('-') then
				exit(0)
			else begin
				exit(ROUND(AuftragZeile."Line Amount" * (Montageposten.Quantity) / AuftragZeile.Quantity));  //Währung?
			end;
		end else begin
			RechnZeile.SetCurrentkey("Order No.", "Order Line No.", "Posting Date");
			RechnZeile.SetRange("Order No.", Auftragsnummer);
			RechnZeile.SetRange("Order Line No.", Auftragszeilennr);
			RechnZeile.SetFilter(Quantity, '<>0');
			if not RechnZeile.Find('-') then
				exit(0)
			else begin
				exit(ROUND(RechnZeile.Amount * (Montageposten.Quantity) / RechnZeile.Quantity));  //Währung?
			end;
		end;
	end;

	procedure IsNotInFilter() OK: Boolean
	var
		Item: Record Item;
		InvPostingGroup: Record "Inventory Posting Group";
		ItemCatRec: Record "Item Category";
	begin
		if not Item.Get(Montageposten."Item No.") then
			Item.Init;
		"Production Group".Code := Item."Production Group Code";
		OK := "Production Group".Find('=');
		exit(not OK);
	end;

	local procedure OnPreSectionMontageposten_Header2(var Montageposten : Record "Item Ledger Entry");
	begin
		with Montageposten do begin
			ReportForNavSetShowOutput(not Detailansicht);
		end;
	end;
	local procedure OnPreSectionMontageposten_Header3(var Montageposten : Record "Item Ledger Entry");
	begin
		with Montageposten do begin
			ReportForNavSetShowOutput(Detailansicht);
		end;
	end;
	local procedure OnPreSectionMontageposten_GroupHeader4(var Montageposten : Record "Item Ledger Entry");
	begin
		with Montageposten do begin
			ReportForNavShowOutput :=
			  ReportForNavTotalsCausedBy = LastFieldNo;
		end;
	end;
	local procedure OnPreSectionMontageposten_Body5(var Montageposten : Record "Item Ledger Entry");
	begin
		with Montageposten do begin
			ReportForNavSetShowOutput(Detailansicht);
		end;
	end;
	local procedure OnPreSectionMontageposten_GroupFooter6(var Montageposten : Record "Item Ledger Entry");
	begin
		with Montageposten do begin
			if not FooterPrinted then
				LastFieldNo := ReportForNavTotalsCausedBy;
			ReportForNavShowOutput := not FooterPrinted;
			FooterPrinted := true;
		end;
	end;
	local procedure OnPreSectionMontageposten_GroupFooter7(var Montageposten : Record "Item Ledger Entry");
	begin
		with Montageposten do begin
			ReportForNavShowOutput :=
			  ReportForNavTotalsCausedBy = Montageposten.FieldNo("Posting Date");
		end;
	end;
	local procedure OnPreSectionMontageposten_GroupFooter8(var Montageposten : Record "Item Ledger Entry");
	begin
		with Montageposten do begin
			ReportForNavShowOutput :=
			  ReportForNavTotalsCausedBy = Montageposten.FieldNo("Location Code");
		end;
	end;
	// --> Reports ForNAV Autogenerated code - do not delete or modify
	var
		ReportForNav: Codeunit "ForNAV Report Management";
		ReportForNavTotalsCausedBy: Integer;
		ReportForNavInitialized: Boolean;
		ReportForNavShowOutput: Boolean;

		ReportForNavMontagepostenBuffer : Array [5] of Decimal;
		ReportForNavMontagepostenTotals : Array [5] of Decimal;
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
			'Montageposten':
				begin
					ReportForNavShowOutput := true; OnPreSectionMontageposten_Body5(Montageposten); jsonObject.Add('$Body5$Pre',ReportForNavShowOutput);
					with Montageposten do begin
						ReportForNavMontagepostenTotals[1] += Verkaufsbetrag; ReportForNavMontagepostenBuffer[1] := Verkaufsbetrag; Verkaufsbetrag := ReportForNavMontagepostenTotals[1];
						ReportForNavMontagepostenTotals[2] += Materialkosten; ReportForNavMontagepostenBuffer[2] := Materialkosten; Materialkosten := ReportForNavMontagepostenTotals[2];
						ReportForNavMontagepostenTotals[3] += Arbeitsstunden; ReportForNavMontagepostenBuffer[3] := Arbeitsstunden; Arbeitsstunden := ReportForNavMontagepostenTotals[3];
						ReportForNavMontagepostenTotals[4] += Anzahl; ReportForNavMontagepostenBuffer[4] := Anzahl; Anzahl := ReportForNavMontagepostenTotals[4];
						ReportForNavMontagepostenTotals[5] += Quantity; ReportForNavMontagepostenBuffer[5] := Quantity; Quantity := ReportForNavMontagepostenTotals[5];
						ReportForNavShowOutput := true; OnPreSectionMontageposten_Header2(Montageposten); jsonObject.Add('$Header2$Pre',ReportForNavShowOutput);
						ReportForNavShowOutput := true; OnPreSectionMontageposten_Header3(Montageposten); jsonObject.Add('$Header3$Pre',ReportForNavShowOutput);
						ReportForNavShowOutput := true; ReportForNavTotalsCausedBy := 3; OnPreSectionMontageposten_GroupHeader4(Montageposten); jsonObject.Add('$GroupHeader4$Pre$3$Boolean',ReportForNavShowOutput);
						ReportForNavShowOutput := true; ReportForNavTotalsCausedBy := 8; OnPreSectionMontageposten_GroupHeader4(Montageposten); jsonObject.Add('$GroupHeader4$Pre$8$Boolean',ReportForNavShowOutput);
						ReportForNavShowOutput := true; ReportForNavTotalsCausedBy := 3; OnPreSectionMontageposten_GroupFooter6(Montageposten); jsonObject.Add('$GroupFooter6$Pre$3$Boolean',ReportForNavShowOutput);
						ReportForNavShowOutput := true; ReportForNavTotalsCausedBy := 8; OnPreSectionMontageposten_GroupFooter6(Montageposten); jsonObject.Add('$GroupFooter6$Pre$8$Boolean',ReportForNavShowOutput);
						ReportForNavShowOutput := true; ReportForNavTotalsCausedBy := 3; OnPreSectionMontageposten_GroupFooter7(Montageposten); jsonObject.Add('$GroupFooter7$Pre$3$Boolean',ReportForNavShowOutput);
						ReportForNavShowOutput := true; ReportForNavTotalsCausedBy := 8; OnPreSectionMontageposten_GroupFooter7(Montageposten); jsonObject.Add('$GroupFooter7$Pre$8$Boolean',ReportForNavShowOutput);
						ReportForNavShowOutput := true; ReportForNavTotalsCausedBy := 3; OnPreSectionMontageposten_GroupFooter8(Montageposten); jsonObject.Add('$GroupFooter8$Pre$3$Boolean',ReportForNavShowOutput);
						ReportForNavShowOutput := true; ReportForNavTotalsCausedBy := 8; OnPreSectionMontageposten_GroupFooter8(Montageposten); jsonObject.Add('$GroupFooter8$Pre$8$Boolean',ReportForNavShowOutput);
						Verkaufsbetrag := ReportForNavMontagepostenBuffer[1]; 
						Materialkosten := ReportForNavMontagepostenBuffer[2]; 
						Arbeitsstunden := ReportForNavMontagepostenBuffer[3]; 
						Anzahl := ReportForNavMontagepostenBuffer[4]; 
						Quantity := ReportForNavMontagepostenBuffer[5]; 
					end;
				end;
		end;
		ReportForNav.AddDataItemValues(jsonObject,dataItemId,rec);
		jsonObject.WriteTo(values);
		exit(values);
	end;
	// Reports ForNAV Autogenerated code - do not delete or modify -->
}
