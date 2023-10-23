#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 60030 "CCO Sales Return Shipment"
{
	Caption = 'Sales Return Shipment';
	Permissions = TableData "User Setup" = r;
	WordLayout = './Layouts/CCOSalesReturnShipment.docx'; DefaultLayout = Word;

	dataset
	{
		dataitem("Sales Header";"Sales Header")
		{
			DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const("Return Order"));
			RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
			RequestFilterHeading = 'Verkaufsbeleg';
			column(ReportForNavId_1; 1) {} // Autogenerated by ForNav - Do not delete
			column(ReportForNav_SalesHeader; ReportForNavWriteDataItem('SalesHeader',"Sales Header")) {}
			dataitem(KopieSchleife;Integer)
			{
				DataItemTableView = sorting(Number);
				column(ReportForNavId_2; 2) {} // Autogenerated by ForNav - Do not delete
				column(ReportForNav_KopieSchleife; ReportForNavWriteDataItem('KopieSchleife',KopieSchleife)) {}
				dataitem(SeiteSchleife;Integer)
				{
					DataItemTableView = sorting(Number) where(Number = const(1));
					column(ReportForNavId_3; 3) {} // Autogenerated by ForNav - Do not delete
					column(ReportForNav_SeiteSchleife; ReportForNavWriteDataItem('SeiteSchleife',SeiteSchleife)) {}
					column(FirmenAnschr1; FirmenAnschr1)
					{
						IncludeCaption = false;
					}
					column(CompanyInfoPicture2; CompanyInfo."Picture 2")
					{
						IncludeCaption = false;
					}
					column(CustAddr8; CustAddr[8])
					{
						IncludeCaption = false;
					}
					column(CustAddr7; CustAddr[7])
					{
						IncludeCaption = false;
					}
					column(CustAddr6; CustAddr[6])
					{
						IncludeCaption = false;
					}
					column(CustAddr5; CustAddr[5])
					{
						IncludeCaption = false;
					}
					column(CustAddr4; CustAddr[4])
					{
						IncludeCaption = false;
					}
					column(CustAddr3; CustAddr[3])
					{
						IncludeCaption = false;
					}
					column(CustAddr2; CustAddr[2])
					{
						IncludeCaption = false;
					}
					column(CustAddr1; CustAddr[1])
					{
						IncludeCaption = false;
					}
					column(Empfanger_; 'Empfänger:')
					{
						IncludeCaption = false;
					}
					column(ShippingAgentCode_SalesHeader; "Sales Header"."Shipping Agent Code")
					{
						IncludeCaption = false;
					}
					column(LieferTerminK; LieferTerminK)
					{
						IncludeCaption = false;
					}
					column(OurAccountNo_DebitorR; DebitorR."Our Account No.")
					{
						IncludeCaption = false;
					}
					column(SalesHeaderOrderDate_0_7; Format("Sales Header"."Order Date", 0, 7))
					{
						IncludeCaption = false;
					}
					column(wwwTxt; wwwTxt)
					{
						IncludeCaption = false;
					}
					column(EMailTxt; EMailTxt)
					{
						IncludeCaption = false;
					}
					column(Absender_; 'Absender:')
					{
						IncludeCaption = false;
					}
					column(YourReference_SalesHeader; "Sales Header"."Your Reference")
					{
						IncludeCaption = false;
					}
					column(WebTxt; WebTxt)
					{
						IncludeCaption = false;
					}
					column(MailTxt; MailTxt)
					{
						IncludeCaption = false;
					}
					column(ExternalDocumentNo_SalesHeader; "Sales Header"."External Document No.")
					{
						IncludeCaption = false;
					}
					column(Name_VerkEinkPerson; Kundendienst."E-Mail")
					{
						IncludeCaption = false;
					}
					column(TODAY_0_7; Format(Today, 0, 7))
					{
						IncludeCaption = false;
					}
					column(Sell_toCustomerNo_SalesHeader; "Sales Header"."Sell-to Customer No.")
					{
						IncludeCaption = false;
					}
					column(PhoneNo_VerkEinkPerson; Kundendienst."Phone No.")
					{
						IncludeCaption = false;
					}
					column(LieferAnAdr7; LieferAnAdr[7])
					{
						IncludeCaption = false;
					}
					column(LieferAnAdr6; LieferAnAdr[6])
					{
						IncludeCaption = false;
					}
					column(LieferAnAdr5; LieferAnAdr[5])
					{
						IncludeCaption = false;
					}
					column(LieferAnAdr4; LieferAnAdr[4])
					{
						IncludeCaption = false;
					}
					column(LieferAnAdr3; LieferAnAdr[3])
					{
						IncludeCaption = false;
					}
					column(LieferAnAdr2; LieferAnAdr[2])
					{
						IncludeCaption = false;
					}
					column(LieferAnAdr1; LieferAnAdr[1])
					{
						IncludeCaption = false;
					}
					column(BittebeiRuckfragenangeben; DUE010)
					{
						IncludeCaption = false;
					}
					column(RucksendeauftragNr_SalesHeaderNo; DUE009 + ' ' + "Sales Header"."No.")
					{
					}
					column(LegenSiediesenScheinbittegutsichtbarderWarebei; DUE011)
					{
						IncludeCaption = false;
					}
					column(BittebeachtenSie_WarenabholungoderRucksendungistnurmitdiesem; DUE012)
					{
						IncludeCaption = false;
					}
					column(STRSUBSTNO_SeitePct1_FORMAT_ReportForNavPageNo_; StrSubstNo('Seite %1', Format(ReportForNav.PagePlaceHolder)))
					{
						IncludeCaption = false;
					}
					column(CompanyInfoPicture; CompanyInfo.Picture)
					{
						IncludeCaption = false;
					}
					dataitem(TMHeader;Integer)
					{
						DataItemLinkReference = KopieSchleife;
						DataItemTableView = sorting(Number);
						column(ReportForNavId_75; 75) {} // Autogenerated by ForNav - Do not delete
						column(ReportForNav_TMHeader; ReportForNavWriteDataItem('TMHeader',TMHeader)) {}
						column(TMHeader_Number; TMHeader.Number)
						{
							IncludeCaption = false;
						}
						column(TMHeader_Text; TempTMLine.Text)
						{
							IncludeCaption = false;
						}
						column(TMHeader_Italic; TempTMLine.Italic)
						{
							IncludeCaption = false;
						}
						column(TMHeader_Bold; TempTMLine.Bold)
						{
							IncludeCaption = false;
						}
						column(TMHeader_Underline; TempTMLine.Underline)
						{
							IncludeCaption = false;
						}
						column(TMHeader_Color; TempTMLine.Color)
						{
							IncludeCaption = false;
						}
						trigger OnPreDataItem();
						begin
							// >> #TMW17.00:A001
							if TestLicPermissionTM then begin
								// >> #TMW17.10.01:T100
								// TMFunctions.GetTMReportLinesHeader(TempTMLine, DATABASE::"Purchase Header",
								//									"Purchase Header", CurrReport.OBJECTID(FALSE));
								TMEngine.GetTextSetForReport(TempTMLine, "Sales Header"."CCS TM Text Set ID Header", CurrReport.ObjectId(false));
								// << #TMW17.10.01:T100
								SetRange(Number, 1, TempTMLine.Count);
							end else begin
								CurrReport.Break;
							end;
							// >> #TMW17.00:A001
							ReportForNav.OnPreDataItem('TMHeader',TMHeader);
						end;
						
						trigger OnAfterGetRecord();
						begin
							// >> #TMW17.00:A001
							if Number = 1 then
								TempTMLine.FindFirst
							else
								TempTMLine.Next;
							// << #TMW17.00:A001
						end;
						
					}
					dataitem("Sales Line";"Sales Line")
					{
						DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
						DataItemLinkReference = "Sales Header";
						DataItemTableView = sorting("Document Type", "Document No.", "Line No.") order(ascending);
						column(ReportForNavId_77; 77) {} // Autogenerated by ForNav - Do not delete
						column(ReportForNav_SalesLine; ReportForNavWriteDataItem('SalesLine',"Sales Line")) {}
						column(Position_SalesLine; "Sales Line".Position)
						{
							IncludeCaption = false;
						}
						column(Description_SalesLine; "Sales Line".Description)
						{
							IncludeCaption = false;
						}
						column(No_SalesLine; "Sales Line"."No.")
						{
							IncludeCaption = false;
						}
						column(LieferTerminZ; LieferTerminZ)
						{
							IncludeCaption = false;
						}
						column(Quantity_SalesLine; "Sales Line".Quantity)
						{
							IncludeCaption = false;
						}
						column(UnitofMeasure_SalesLine; "Sales Line"."Unit of Measure")
						{
							IncludeCaption = false;
						}
						column(Description2_SalesLine; "Sales Line"."Description 2")
						{
							IncludeCaption = false;
						}
						dataitem(GesSu;Integer)
						{
							DataItemTableView = sorting(Number) where(Number = const(1));
							column(ReportForNavId_86; 86) {} // Autogenerated by ForNav - Do not delete
							column(ReportForNav_GesSu; ReportForNavWriteDataItem('GesSu',GesSu)) {}
							trigger OnPreDataItem();
							begin
								ReportForNav.OnPreDataItem('GesSu',GesSu);
							end;
							trigger OnAfterGetRecord();
							begin
								/*IF "Sales Line".Zwischensumme THEN
															  BelegZwNetto := 0;*/
							
							end;
							
						}
						trigger OnPreDataItem();
						begin
							MWSTBetragZeile.DeleteAll;
							MehrZeilen := Find('+');
							while MehrZeilen and (Description = '') and ("No." = '') and (Quantity = 0) and (Amount = 0) do
								MehrZeilen := Next(-1) <> 0;
							if not MehrZeilen then
								CurrReport.Break;
							SetRange("Line No.", 0, "Line No.");
							VerpackKost := 0;
							FrachtKost := 0;
							ReportForNav.OnPreDataItem('SalesLine',"Sales Line");
						end;
						
						trigger OnAfterGetRecord();
						begin
							GesKorrSumme := 0; // Inserted by ForNAV
							MWSTBetragZeile.Init;
							MWSTBetragZeile."VAT %" := "VAT %";
							MWSTBetragZeile."VAT Base" := Amount;
							MWSTBetragZeile."Amount Including VAT" := "Amount Including VAT";
							MWSTBetragZeile.InsertLine;
							BetragSumme := BetragSumme + "Sales Line".Amount + "Sales Line"."Inv. Discount Amount";
							FrachtJN := false;
							if "No." <> '' then
								case "No." of
									VKEinrR."Artikel Fracht1":
										begin
											FrachtKost := FrachtKost + Amount;
											FrachtJN := true;
											GesKorrSumme := GesKorrSumme + "Sales Line".Amount + "Sales Line"."Inv. Discount Amount";
											BetragSumme := BetragSumme - "Sales Line".Amount - "Sales Line"."Inv. Discount Amount";
										end;
									VKEinrR."Artikel Fracht2":
										begin
											FrachtKost := FrachtKost + Amount;
											FrachtJN := true;
											GesKorrSumme := GesKorrSumme + "Sales Line".Amount + "Sales Line"."Inv. Discount Amount";
											BetragSumme := BetragSumme - "Sales Line".Amount - "Sales Line"."Inv. Discount Amount";
										end;
									VKEinrR."Artikel Verpackung":
										begin
											VerpackKost := VerpackKost + Amount;
											FrachtJN := true;
											GesKorrSumme := GesKorrSumme + "Sales Line".Amount + "Sales Line"."Inv. Discount Amount";
											BetragSumme := BetragSumme - "Sales Line".Amount - "Sales Line"."Inv. Discount Amount";
										end;
								end;
							BelegZwNetto := BelegZwNetto + "Sales Line".Amount + "Sales Line"."Inv. Discount Amount";
							LieferTerminZeile("Sales Line");
						end;
						
					}
					dataitem(Total;Integer)
					{
						DataItemTableView = sorting(Number) where(Number = const(1));
						column(ReportForNavId_87; 87) {} // Autogenerated by ForNav - Do not delete
						column(ReportForNav_Total; ReportForNavWriteDataItem('Total',Total)) {}
						column(Description_LieferBed; LieferBed.Description)
						{
							IncludeCaption = false;
						}
						column(MitfreundlichenGrusen; 'Mit freundlichen Grüßen')
						{
							IncludeCaption = false;
						}
						trigger OnPreDataItem();
						begin
							ReportForNav.OnPreDataItem('Total',Total);
						end;
					}
					dataitem(TMFooter;Integer)
					{
						DataItemLinkReference = KopieSchleife;
						DataItemTableView = sorting(Number);
						column(ReportForNavId_90; 90) {} // Autogenerated by ForNav - Do not delete
						column(ReportForNav_TMFooter; ReportForNavWriteDataItem('TMFooter',TMFooter)) {}
						column(TMFooter_Number; TMFooter.Number)
						{
							IncludeCaption = false;
						}
						column(TMFooter_Text; TempTMLine.Text)
						{
							IncludeCaption = false;
						}
						column(TMFooter_Italic; TempTMLine.Italic)
						{
							IncludeCaption = false;
						}
						column(TMFooter_Bold; TempTMLine.Bold)
						{
							IncludeCaption = false;
						}
						column(TMFooter_Underline; TempTMLine.Underline)
						{
							IncludeCaption = false;
						}
						column(TMFooter_Color; TempTMLine.Color)
						{
							IncludeCaption = false;
						}
						trigger OnPreDataItem();
						begin
							// >> #TMW17.00:A001
							if TestLicPermissionTM then begin
								// >> #TMW17.10.01:T100
								// TMFunctions.GetTMReportLinesFooter(TempTMLine, DATABASE::"Purchase Header",
								//									"Purchase Header", CurrReport.OBJECTID(FALSE));
								TMEngine.GetTextSetForReport(TempTMLine, "Sales Header"."CCS TM Text Set ID Footer", CurrReport.ObjectId(false));
								// << #TMW17.10.01:T100
								SetRange(Number, 1, TempTMLine.Count);
							end else begin
								CurrReport.Break;
							end;
							// << #TMW17.00:A001
							ReportForNav.OnPreDataItem('TMFooter',TMFooter);
						end;
						
						trigger OnAfterGetRecord();
						begin
							// >> #TMW17.00:A001
							if Number = 1 then
								TempTMLine.FindFirst
							else
								TempTMLine.Next;
							// << #TMW17.00:A001
						end;
						
					}
					trigger OnPreDataItem();
					begin
						ReportForNav.OnPreDataItem('SeiteSchleife',SeiteSchleife);
					end;
					trigger OnAfterGetRecord();
					begin
						CompanyInfo.CalcFields("Picture 2");
						if MitLogo then
							CompanyInfo.CalcFields(Picture);
					end;
					
				}
				trigger OnPreDataItem();
				begin
					AnzSchleifen := Abs(AnzKopien) + 1;
					KopieText := '';
					SetRange(Number, 1, AnzSchleifen);
					ReportForNav.OnPreDataItem('KopieSchleife',KopieSchleife);
				end;
				
				trigger OnAfterGetRecord();
				begin
					if Number > 1 then
						KopieText := 'KOPIE';
				
					GesKorrSumme := 0;
					BelegZwNetto := 0;
				end;
				
				trigger OnPostDataItem();
				begin
					if not CurrReport.Preview then
						VerkDruckZähler.Run("Sales Header");
				end;
				
			}
			trigger OnPreDataItem();
			begin
				//Firmendaten.GET;
				CompanyInfo.Get;
				FibuEinrR.Get;
				VKEinrR.Get;
				EMailTxt := '';
				wwwTxt := '';
				FormatAdr.Company(FirmaAdr, CompanyInfo);
				CompanyInfo.CalcFields("Picture 2");
				if MitLogo then
					CompanyInfo.CalcFields(Picture);
				//----
				//IF InteressentR."Nr." <> '' THEN BEGIN
				//  InteressentR.GET(InteressentR."Nr.");
				// FirmenAnschr2 := InteressentR.Name + ' ' + InteressentR."Name 2" +' - ' + InteressentR."Adresse 2" + ' - ' +
				//				   InteressentR."PLZ Code" + ' ' + InteressentR.Ort;
				//  FirmenAnschr1 := InteressentR.Name + ' ' + InteressentR."Name 2" + ' - ' +
				//				   InteressentR."PLZ Code" + ' ' + InteressentR.Ort;
				//  MailTxt := InteressentR."E-Mail";
				//  IF MailTxt<>'' THEN
				//	EMailTxt := 'E-mail:';
				//  WebTxt  := InteressentR.Homepage;
				//  IF WebTxt<>'' THEN
				//	wwwTxt := 'Web:';
				//  FonTxt  := InteressentR."Telefonnr.";
				//  faxTxt  := InteressentR."Faxnr.";
				//END ELSE BEGIN
				FirmenAnschr2 := Firmendaten.Name + ' ' + Firmendaten."Name 2";
				FirmenAnschr1 := Firmendaten.Name + ' ' + Firmendaten."Name 2";
				MailTxt := Firmendaten."E-Mail";
				if MailTxt <> '' then
					EMailTxt := 'E-mail:';
				WebTxt := Firmendaten."Home Page";
				if WebTxt <> '' then
					wwwTxt := 'Web:';
				FonTxt := Firmendaten."Phone No.";
				faxTxt := Firmendaten."Fax No.";
				//END;
				//----
				ReportForNav.OnPreDataItem('SalesHeader',"Sales Header");
			end;
			
			trigger OnAfterGetRecord();
			begin
				CurrReport.Language := Language2.GetLanguageIdOrDefault("Language Code");
			
				Clear(FrachtKost);
				Clear(VerpackKost);
				LocationT.Get("Location Code");
			
				//DUE
				if RespCenter.Get("Responsibility Center") then begin
					//FormatAdr.RespCenter(CustAddr,RespCenter);
					CompanyInfo."Phone No." := RespCenter."Phone No.";
					CompanyInfo."Fax No." := RespCenter."Fax No.";
					FirmenAnschr1 := RespCenter.Name + ' ' + RespCenter."Name 2";
					FirmenAnschr2 := RespCenter.Name + ' ' + RespCenter."Name 2";
					MailTxt := RespCenter."E-Mail";
					if MailTxt <> '' then
						EMailTxt := DUE002;
					WebTxt := RespCenter."Home Page";
					if WebTxt <> '' then
						wwwTxt := DUE003;
					FonTxt := RespCenter."Phone No.";
					faxTxt := RespCenter."Fax No.";
				end else begin
					//FormatAdr.Company(CustAddr,Firmendaten);
					FirmenAnschr1 := CompanyInfo.Name + ' ' + CompanyInfo."Name 2";
					FirmenAnschr2 := CompanyInfo.Name + ' ' + CompanyInfo."Name 2";
					MailTxt := CompanyInfo."E-Mail";
					if MailTxt <> '' then
						EMailTxt := DUE002;
					WebTxt := CompanyInfo."Home Page";
					if WebTxt <> '' then
						wwwTxt := DUE003;
					FonTxt := CompanyInfo."Phone No.";
					faxTxt := CompanyInfo."Fax No.";
				end;
				if not VerkEinkPerson.Get("Salesperson Code") then
					Clear(VerkEinkPerson)
				else begin
					/*IF VerkEinkPerson.Kundendienstverantwortlicher<>'' THEN
					   IF Kundendienst.GET(VerkEinkPerson.Kundendienstverantwortlicher) THEN BEGIN
						  VerkEinkPerson.Name := Kundendienst.Name;
						  VerkEinkPerson."Phone No." :=
												 Kundendienst."Phone No.";*/
					if "Sales Header"."Salesperson Code 2" <> '' then
						if not Kundendienst.Get("Sales Header"."Salesperson Code 2") then Kundendienst.Init;
				end;
				if not BenutzerER.Get(Creationuser) then
					Clear(BenutzerER);
				FormatAdr.SalesHeaderSellTo(DebAdr, "Sales Header");
				if not ZlgBed.Get("Payment Terms Code") then
					Clear(ZlgBed);
				if not LieferBed.Get("Shipment Method Code") then
					Clear(LieferBed);
				FormatAdr.SalesHeaderSellTo(CustAddr, "Sales Header");
				FormatAdr.SalesHeaderShipTo(LieferAnAdr, CustAddr, "Sales Header");
				DebitorR.Get("Sales Header"."Sell-to Customer No.");
				LiefAdrAnzeigen := "Sell-to Customer No." <> "Bill-to Customer No.";
				for i := 1 to ArrayLen(LieferAnAdr) do
					if LieferAnAdr[i] <> DebAdr[i] then
						LiefAdrAnzeigen := true;
				if "Sales Header"."Currency Code" = '' then begin
					FibuEinrR.Get;
					FibuEinrR.TestField(FibuEinrR."LCY Code");
					WährTxt := FibuEinrR."LCY Code";
				end else begin
					WährTxt := "Sales Header"."Currency Code";
				end;
				LieferTerminK := "Sales Header".Kundenliefertermin;
				//gemäß Aufbau : "30.KW 01"
				LieferTerminK := CopyStr("Sales Header".Kundenliefertermin, 3, 2) + '.KW ' +
								 CopyStr("Sales Header".Kundenliefertermin, 1, 2);
				LieferTerminKopf();
			
			end;
			
			trigger OnPostDataItem();
			begin
				CurrReport.Language := GlobalLanguage;
			end;
			
		}
	}
	requestpage
	{
		SaveValues = true;
		layout
		{
			area(Content)
			{
				group(Options)
				{
					Caption = 'Options';
					field(AnzKopien; AnzKopien)
					{
						ApplicationArea = Basic;
						Caption = 'Anzahl Kopien';
					}
					field(MitLogo; MitLogo)
					{
						ApplicationArea = Basic;
						Caption = 'Print Logo';
					}
				}
			}
		}

		trigger OnOpenPage()
		begin
			///c/AW/110705: - wegen Druck ohne Requestform
			FormOpened := true;
			///AW End
			MitLogo := true;
		end;

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
		///c/AW/110705: - wegen Druck ohne Requestform
		if not FormOpened then
			MitLogo := true;
		///AW End
		;ReportsForNavPre;
	end;
	var
		GesKorrSumme: Decimal;
		BelegZwNetto: Decimal;
		BenutzerER: Record "User Setup";
		RespCenter: Record "Responsibility Center";
		DebitorR: Record Customer;
		LieferBed: Record "Shipment Method";
		ZlgBed: Record "Payment Terms";
		VerkEinkPerson: Record "Salesperson/Purchaser";
		Kundendienst: Record "Salesperson/Purchaser";
		CompanyInfo: Record "Company Information";
		Firmendaten: Record "Company Information";
		MWSTBetragZeile: Record "VAT Amount Line" temporary;
		LocationT: Record Location;
		"VerkDruckZähler": Codeunit "Sales-Printed";
		FormatAdr: Codeunit "Format Address";
		DebAdr: array[8] of Text[50];
		CustAddr: array[8] of Text[50];
		LieferAnAdr: array[8] of Text[50];
		FirmaAdr: array[8] of Text[50];
		"VerkäuferText": Text[30];
		ReferenzText: Text[30];
		MehrZeilen: Boolean;
		AnzKopien: Integer;
		AnzSchleifen: Integer;
		KopieText: Text[30];
		LiefAdrAnzeigen: Boolean;
		i: Integer;
		FirmenAnschr1: Text[120];
		FirmenAnschr2: Text[120];
		MailTxt: Text[30];
		WebTxt: Text[30];
		FonTxt: Text[30];
		faxTxt: Text[30];
		"WährTxt": Text[10];
		FibuEinrR: Record "General Ledger Setup";
		FrachtKost: Decimal;
		VerpackKost: Decimal;
		VKEinrR: Record "Sales & Receivables Setup";
		FrachtJN: Boolean;
		EMailTxt: Text[30];
		wwwTxt: Text[30];
		LieferTerminK: Text[20];
		LieferTerminZ: Text[30];
		verwenden: Boolean;
		BetragSumme: Decimal;
		MitLogo: Boolean;
		FormOpened: Boolean;
		DUE002: label 'E-mail:';
		DUE003: label 'Web:';
		"--- TM glob. Vars. ---": Integer;
		LicPermission: Record "License Permission";
		TMEngine: Codeunit "CCS TM Engine";
		TempTMLine: Record "CCS TM Line Document" temporary;
		DUE011: label 'Please attach this return delivery note clearly visible to the goods.';
		DUE012: label 'Note: Goods may only be returned with this return delivery note.';
		DUE010: label 'Always mention.';
		DUE009: label 'Return Order';
		Language2: Codeunit Language;

	procedure LieferTerminKopf()
	var
		VZ: Record "Sales Line";
		Int1: Integer;
		Int2: Integer;
		Jahr: Code[10];
		Woche: Code[10];
	begin
		//Liefertermin TEXT[20] zuweisen
		verwenden := true;
		VZ.SetCurrentkey("Document Type", "Document No.", "Line No.");
		VZ.SetRange("Document Type", "Sales Header"."Document Type");
		VZ.SetRange("Document No.", "Sales Header"."No.");
		VZ.SetRange(Type, VZ.Type::Item);
		VZ.SetFilter("No.", '<>%1', '');
		if VZ.Find('-') then
			repeat
				if ((VZ."Shipment Date" <> "Sales Header"."Shipment Date") or
				   VZ."Drop Shipment") then
					verwenden := false;
			until (VZ.Next = 0) or (verwenden = false);
		if not verwenden then
			LieferTerminK := 'siehe unten';
		if "Sales Header"."fix-Termin Lieferung" <> '' then begin
			LieferTerminK := "Sales Header"."fix-Termin Lieferung";
			verwenden := true;
		end;
	end;

	procedure LieferTerminZeile(VerkZeile: Record "Sales Line")
	var
		Int1: Integer;
		Int2: Integer;
		Jahr: Code[10];
		Woche: Code[10];
	begin
		//Liefertermin TEXT[20] zuweisen
		LieferTerminZ := '';
		if not verwenden then  //im Kopf steht "siehe unten" im Feld Liefertermin
			if VerkZeile."Shipment Date" <> 0D then begin
				if VerkZeile."Drop Shipment" then
					VerkZeile."Shipment Date" := CalcDate('+1W', VerkZeile."Shipment Date");
				//c/jk/211098 beginn
				Int1 := Date2dwy(VerkZeile."Shipment Date", 3);
				Int2 := Date2dwy(VerkZeile."Shipment Date", 2);
				Jahr := Format(Int1);
				Jahr := CopyStr(Jahr, 3, 2);
				Woche := Format(Int2);
				if StrLen(Woche) < 2 then
					Woche := '0' + Woche;
				//LieferJahrKW := Jahr + Woche;
				//c/jk/211098 ende
				//Formatieren nach Muster "30.KW 01"
				//LieferTerminZ := 'Lief. '+ Jahr + Woche;
				LieferTerminZ := 'Lief. ' + Woche + '.KW ' + Jahr;
			end;
	end;

	procedure "--- Text Module ---"()
	begin
	end;

	procedure TestLicPermissionTM(): Boolean
	begin
		// >> #TMW17.00:A001
		if (LicPermission."Object Type" <> LicPermission."object type"::Codeunit) or
		   (LicPermission."Object Number" <> Codeunit::"CCS TM Engine")  // #TMW17.10.01:T100
		then begin
			LicPermission.Get(LicPermission."object type"::Codeunit, Codeunit::"CCS TM Engine");  // #TMW17.10.01:T100
		end;
		if LicPermission."Execute Permission" = LicPermission."execute permission"::Yes then begin
			exit(true);
		end else begin
			exit(false);
		end;
		// << #TMW17.00:A001
	end;

	local procedure OnPreSectionSeiteSchleife_Header2(var SeiteSchleife : Record Integer);
	begin
		with SeiteSchleife do begin
			ReportForNavSetShowOutput(CurrReport.PageNo <= 1);
		end;
	end;
	local procedure OnPreSectionSeiteSchleife_Header3(var SeiteSchleife : Record Integer);
	begin
		with SeiteSchleife do begin
			ReportForNavSetShowOutput(CurrReport.PageNo > 1);
		end;
	end;
	local procedure OnPreSectionSeiteSchleife_Header5(var SeiteSchleife : Record Integer);
	begin
		with SeiteSchleife do begin
			ReportForNavSetShowOutput(CurrReport.PageNo <= 1);
		end;
	end;
	local procedure OnPreSectionSalesLine_TransHeader11(var "Sales Line" : Record "Sales Line");
	begin
		with "Sales Line" do begin
			ReportForNavSetShowOutput(not "Sales Header"."Pos.-Zus.-Zähl-Summen drucken");
		end;
	end;
	local procedure OnPreSectionSalesLine_Body12(var "Sales Line" : Record "Sales Line");
	begin
		with "Sales Line" do begin
			/*-----------
			ReportForNavSetShowOutput((Art = 0) AND
								  (Schriftattribut <> Schriftattribut::fett ));
			-----*/
			ReportForNavSetShowOutput(Type.AsInteger() = 0);// AND
														  //(Schriftattribut <> Schriftattribut::fett ) AND
														  //NOT "Sales Line".Zwischensumme);
		end;

	end;
	local procedure OnPreSectionSalesLine_Body13(var "Sales Line" : Record "Sales Line");
	begin
		with "Sales Line" do begin
			/*--------------
			ReportForNavSetShowOutput((Art = 0) AND
								  (Schriftattribut = Schriftattribut::fett ));
			-------------*/
			ReportForNavSetShowOutput(Type.AsInteger() = 0);// AND
														  //(Schriftattribut = Schriftattribut::fett) AND
														  //NOT "Sales Line".Zwischensumme);
		end;

	end;
	local procedure OnPreSectionSalesLine_Body14(var "Sales Line" : Record "Sales Line");
	begin
		with "Sales Line" do begin
			ReportForNavSetShowOutput((Type.AsInteger() = 0) and
								  //"Sales Line".Zwischensumme AND
								  (not "Sales Header"."Pos.-Zus.-Zähl-Summen drucken")
								  );
		end;
	end;
	local procedure OnPreSectionSalesLine_Body15(var "Sales Line" : Record "Sales Line");
	begin
		with "Sales Line" do begin
			ReportForNavSetShowOutput((Type.AsInteger() <> 0) and
								  not FrachtJN and
								  "Sales Header"."Pos.-Zus.-Zähl-Summen drucken");
		end;
	end;
	local procedure OnPreSectionSalesLine_Body16(var "Sales Line" : Record "Sales Line");
	begin
		with "Sales Line" do begin
			/*------------------
			ReportForNavSetShowOutput(Art = Art::Sachkonto);
			------------------*/
			ReportForNavSetShowOutput((Type = Type::"G/L Account") and
								  not "Sales Header"."Pos.-Zus.-Zähl-Summen drucken");
		end;

	end;
	local procedure OnPreSectionSalesLine_Body17(var "Sales Line" : Record "Sales Line");
	begin
		with "Sales Line" do begin
			/*-------------
			ReportForNavSetShowOutput((Art = Art::Artikel) AND
								  NOT FrachtJN);
			-------------*/
			ReportForNavSetShowOutput((Type = Type::Item) and
								  not FrachtJN and
								  not "Sales Header"."Pos.-Zus.-Zähl-Summen drucken");// AND
																					  //("Sales Line"."Deb. Artikelnr." <> ''));		   //c/gw180800 Deb.Art.. hier noch dazu
		end;

	end;
	local procedure OnPreSectionSalesLine_Body18(var "Sales Line" : Record "Sales Line");
	begin
		with "Sales Line" do begin
			ReportForNavSetShowOutput((Type = Type::Item) and
								  not FrachtJN and
								  not "Sales Header"."Pos.-Zus.-Zähl-Summen drucken");// AND
																					  //("Sales Line"."Deb. Artikelnr." = ''));			  //c/gw180800 Deb.Art.. hier noch dazu
		end;
	end;
	local procedure OnPreSectionSalesLine_Body19(var "Sales Line" : Record "Sales Line");
	begin
		with "Sales Line" do begin
			/*---------------
			ReportForNavSetShowOutput((Art = Art::Ressource) AND
								  NOT FrachtJN);
			---------------*/
			ReportForNavSetShowOutput((Type = Type::Resource) and
								  not FrachtJN and
								  not "Sales Header"."Pos.-Zus.-Zähl-Summen drucken");
		end;

	end;
	local procedure OnPreSectionSalesLine_Body20(var "Sales Line" : Record "Sales Line");
	begin
		with "Sales Line" do begin
			ReportForNavSetShowOutput("Sales Line"."Description 2" <> '');
		end;
	end;
	local procedure OnPreSectionSalesLine_Body21(var "Sales Line" : Record "Sales Line");
	begin
		with "Sales Line" do begin
			ReportForNavSetShowOutput(("Sales Line"."Line Discount %" <> 0) and not FrachtJN);
		end;
	end;
	local procedure OnPreSectionSalesLine_TransFooter22(var "Sales Line" : Record "Sales Line");
	begin
		with "Sales Line" do begin
			ReportForNavSetShowOutput(not "Sales Header"."Pos.-Zus.-Zähl-Summen drucken");
		end;
	end;
	local procedure OnPreSectionSalesLine_Footer24(var "Sales Line" : Record "Sales Line");
	begin
		with "Sales Line" do begin
			ReportForNavSetShowOutput("Inv. Discount Amount" <> 0);
		end;
	end;
	local procedure OnPreSectionSalesLine_Footer25(var "Sales Line" : Record "Sales Line");
	begin
		with "Sales Line" do begin
			ReportForNavSetShowOutput((FrachtKost + VerpackKost) <> 0);
		end;
	end;
	// --> Reports ForNAV Autogenerated code - do not delete or modify
	var
		ReportForNav: Codeunit "ForNAV Report Management";
		ReportForNavTotalsCausedBy: Integer;
		ReportForNavInitialized: Boolean;
		ReportForNavShowOutput: Boolean;

		ReportForNavSalesLineBuffer : Array [6] of Decimal;
		ReportForNavSalesLineTotals : Array [6] of Decimal;
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
			'SalesHeader':
				begin
					jsonObject.Add('CurrReport$Language$Integer',CurrReport.Language);
				end;
			'SeiteSchleife':
				begin
					ReportForNavSalesLineTotals[1] := 0; ReportForNavSalesLineTotals[2] := 0; ReportForNavSalesLineTotals[3] := 0; ReportForNavSalesLineTotals[4] := 0; ReportForNavSalesLineTotals[5] := 0; ReportForNavSalesLineTotals[6] := 0; 
						ReportForNavShowOutput := true; OnPreSectionSeiteSchleife_Header2(SeiteSchleife); jsonObject.Add('$Header2$Pre',ReportForNavShowOutput);
						ReportForNavShowOutput := true; OnPreSectionSeiteSchleife_Header3(SeiteSchleife); jsonObject.Add('$Header3$Pre',ReportForNavShowOutput);
						ReportForNavShowOutput := true; OnPreSectionSeiteSchleife_Header5(SeiteSchleife); jsonObject.Add('$Header5$Pre',ReportForNavShowOutput);
				end;
			'SalesLine':
				begin
					ReportForNavShowOutput := true; OnPreSectionSalesLine_Body12("Sales Line"); jsonObject.Add('$Body12$Pre',ReportForNavShowOutput);
					ReportForNavShowOutput := true; OnPreSectionSalesLine_Body13("Sales Line"); jsonObject.Add('$Body13$Pre',ReportForNavShowOutput);
					ReportForNavShowOutput := true; OnPreSectionSalesLine_Body14("Sales Line"); jsonObject.Add('$Body14$Pre',ReportForNavShowOutput);
					ReportForNavShowOutput := true; OnPreSectionSalesLine_Body15("Sales Line"); jsonObject.Add('$Body15$Pre',ReportForNavShowOutput);
					ReportForNavShowOutput := true; OnPreSectionSalesLine_Body16("Sales Line"); jsonObject.Add('$Body16$Pre',ReportForNavShowOutput);
					ReportForNavShowOutput := true; OnPreSectionSalesLine_Body17("Sales Line"); jsonObject.Add('$Body17$Pre',ReportForNavShowOutput);
					ReportForNavShowOutput := true; OnPreSectionSalesLine_Body18("Sales Line"); jsonObject.Add('$Body18$Pre',ReportForNavShowOutput);
					ReportForNavShowOutput := true; OnPreSectionSalesLine_Body19("Sales Line"); jsonObject.Add('$Body19$Pre',ReportForNavShowOutput);
					ReportForNavShowOutput := true; OnPreSectionSalesLine_Body20("Sales Line"); jsonObject.Add('$Body20$Pre',ReportForNavShowOutput);
					ReportForNavShowOutput := true; OnPreSectionSalesLine_Body21("Sales Line"); jsonObject.Add('$Body21$Pre',ReportForNavShowOutput);
					with "Sales Line" do begin
						ReportForNavSalesLineTotals[1] += Amount; ReportForNavSalesLineBuffer[1] := Amount; Amount := ReportForNavSalesLineTotals[1];
						ReportForNavSalesLineTotals[2] += "Amount Including VAT"; ReportForNavSalesLineBuffer[2] := "Amount Including VAT"; "Amount Including VAT" := ReportForNavSalesLineTotals[2];
						ReportForNavSalesLineTotals[3] += "Inv. Discount Amount"; ReportForNavSalesLineBuffer[3] := "Inv. Discount Amount"; "Inv. Discount Amount" := ReportForNavSalesLineTotals[3];
						ReportForNavSalesLineTotals[4] += "Line Discount Amount"; ReportForNavSalesLineBuffer[4] := "Line Discount Amount"; "Line Discount Amount" := ReportForNavSalesLineTotals[4];
						ReportForNavSalesLineTotals[5] += BetragSumme; ReportForNavSalesLineBuffer[5] := BetragSumme; BetragSumme := ReportForNavSalesLineTotals[5];
						ReportForNavSalesLineTotals[6] += GesKorrSumme; ReportForNavSalesLineBuffer[6] := GesKorrSumme; GesKorrSumme := ReportForNavSalesLineTotals[6];
						ReportForNavShowOutput := true; OnPreSectionSalesLine_TransHeader11("Sales Line"); jsonObject.Add('$TransHeader11$Pre',ReportForNavShowOutput);
						ReportForNavShowOutput := true; OnPreSectionSalesLine_TransFooter22("Sales Line"); jsonObject.Add('$TransFooter22$Pre',ReportForNavShowOutput);
						ReportForNavShowOutput := true; OnPreSectionSalesLine_Footer24("Sales Line"); jsonObject.Add('$Footer24$Pre',ReportForNavShowOutput);
						ReportForNavShowOutput := true; OnPreSectionSalesLine_Footer25("Sales Line"); jsonObject.Add('$Footer25$Pre',ReportForNavShowOutput);
						Amount := ReportForNavSalesLineBuffer[1]; 
						"Amount Including VAT" := ReportForNavSalesLineBuffer[2]; 
						"Inv. Discount Amount" := ReportForNavSalesLineBuffer[3]; 
						"Line Discount Amount" := ReportForNavSalesLineBuffer[4]; 
						BetragSumme := ReportForNavSalesLineBuffer[5]; 
						GesKorrSumme := ReportForNavSalesLineBuffer[6]; 
					end;
				end;
		end;
		ReportForNav.AddDataItemValues(jsonObject,dataItemId,rec);
		jsonObject.WriteTo(values);
		exit(values);
	end;
	// Reports ForNAV Autogenerated code - do not delete or modify -->
}
