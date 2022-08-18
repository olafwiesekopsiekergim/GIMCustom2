// page 50020 "General Journal TMP"
// {
//     // PR01 PRODUKT.01 15.12.14 DENUE.SKOL Integration cc|project
//     // ================================================================================
//     // (c) akquinet dynamic solutions GmbH, All rights reserved
//     // 
//     // ID       Date        Case     Initials   Description
//     // --------------------------------------------------------------------------------
//     // PMT9.18  21.10.2015  BASE     akq        Implementing PMT9.18
//     // ================================================================================

//     AutoSplitKey = true;
//     Caption = 'General Journal';
//     DataCaptionExpression = Rec.DataCaption;
//     DelayedInsert = true;
//     PageType = Worksheet;
//     PromotedActionCategories = 'New,Process,Report,Bank,Application,Payroll,Approve';
//     SaveValues = true;
//     SourceTable = "Gen. Journal Line";

//     layout
//     {
//         area(content)
//         {
//             field(CurrentJnlBatchName; CurrentJnlBatchName)
//             {
//                 Caption = 'Batch Name';
//                 Lookup = true;

//                 trigger OnLookup(var Text: Text): Boolean
//                 begin
//                     CurrPage.SaveRecord;
//                     GenJnlManagement.LookupName(CurrentJnlBatchName, Rec);
//                     CurrPage.Update(false);
//                 end;

//                 trigger OnValidate()
//                 begin
//                     GenJnlManagement.CheckName(CurrentJnlBatchName, Rec);
//                     CurrentJnlBatchNameOnAfterVali;
//                 end;
//             }
//             repeater(Control1)
//             {
//                 ShowCaption = false;
//                 field("Posting Date"; Rec."Posting Date")
//                 {
//                     StyleExpr = StyleTxt;
//                 }
//                 field("Document Date"; Rec."Document Date")
//                 {
//                     StyleExpr = StyleTxt;
//                     Visible = false;
//                 }
//                 field("Document Type"; Rec."Document Type")
//                 {
//                     StyleExpr = StyleTxt;
//                 }
//                 field("Document No."; Rec."Document No.")
//                 {
//                 }
//                 field("Incoming Document Entry No."; Rec."Incoming Document Entry No.")
//                 {
//                     Visible = false;

//                     trigger OnAssistEdit()
//                     begin
//                         if Rec."Incoming Document Entry No." > 0 then
//                             HyperLink(Rec.GetIncomingDocumentURL);
//                     end;
//                 }
//                 field("External Document No."; Rec."External Document No.")
//                 {
//                     Visible = false;
//                 }
//                 field("Applies-to Ext. Doc. No."; Rec."Applies-to Ext. Doc. No.")
//                 {
//                     Visible = false;
//                 }
//                 field("Account Type"; Rec."Account Type")
//                 {
//                     StyleExpr = StyleTxt;

//                     trigger OnValidate()
//                     begin
//                         GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
//                         SetUserInteractions;
//                         CurrPage.Update;
//                     end;
//                 }
//                 field("Account No."; Rec."Account No.")
//                 {
//                     StyleExpr = StyleTxt;

//                     trigger OnValidate()
//                     begin
//                         GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
//                         Rec.ShowShortcutDimCode(ShortcutDimCode);
//                         SetUserInteractions;
//                         CurrPage.Update;
//                     end;
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     StyleExpr = StyleTxt;
//                 }
//                 field("Payer Information"; Rec."Payer Information")
//                 {
//                     StyleExpr = StyleTxt;
//                     Visible = false;
//                 }
//                 field("Transaction Information"; Rec."Transaction Information")
//                 {
//                     StyleExpr = StyleTxt;
//                     Visible = false;
//                 }
//                 field("Business Unit Code"; Rec."Business Unit Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Campaign No."; Rec."Campaign No.")
//                 {
//                     Visible = false;
//                 }
//                 field("Currency Code"; Rec."Currency Code")
//                 {
//                     AssistEdit = true;
//                     Visible = false;

//                     trigger OnAssistEdit()
//                     begin
//                         ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date");
//                         if ChangeExchangeRate.RunModal = ACTION::OK then
//                             Rec.Validate("Currency Factor", ChangeExchangeRate.GetParameter);

//                         Clear(ChangeExchangeRate);
//                     end;
//                 }
//                 field("Gen. Posting Type"; Rec."Gen. Posting Type")
//                 {
//                 }
//                 field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
//                 {
//                 }
//                 field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
//                 {
//                 }
//                 field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
//                 {
//                     Visible = false;
//                 }
//                 field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
//                 {
//                     Visible = false;
//                 }
//                 field(Quantity; Rec.Quantity)
//                 {
//                     Visible = false;
//                 }
//                 field(Amount; Rec.Amount)
//                 {
//                     StyleExpr = StyleTxt;
//                 }
//                 field("Debit Amount"; Rec."Debit Amount")
//                 {
//                     Visible = false;
//                 }
//                 field("Credit Amount"; Rec."Credit Amount")
//                 {
//                     Visible = false;
//                 }
//                 field("VAT Amount"; Rec."VAT Amount")
//                 {
//                     Visible = false;
//                 }
//                 field("VAT Difference"; Rec."VAT Difference")
//                 {
//                     Visible = false;
//                 }
//                 field("Bal. VAT Amount"; Rec."Bal. VAT Amount")
//                 {
//                     Visible = false;
//                 }
//                 field("Bal. VAT Difference"; Rec."Bal. VAT Difference")
//                 {
//                     Visible = false;
//                 }
//                 field("Bal. Account Type"; Rec."Bal. Account Type")
//                 {
//                     StyleExpr = StyleTxt;
//                 }
//                 field("Bal. Account No."; Rec."Bal. Account No.")
//                 {
//                     StyleExpr = StyleTxt;

//                     trigger OnValidate()
//                     begin
//                         GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
//                         Rec.ShowShortcutDimCode(ShortcutDimCode);
//                     end;
//                 }
//                 field("Bal. Gen. Posting Type"; Rec."Bal. Gen. Posting Type")
//                 {
//                 }
//                 field("Bal. Gen. Bus. Posting Group"; Rec."Bal. Gen. Bus. Posting Group")
//                 {
//                 }
//                 field("Bal. Gen. Prod. Posting Group"; Rec."Bal. Gen. Prod. Posting Group")
//                 {
//                 }
//                 field("Deferral Code"; Rec."Deferral Code")
//                 {
//                 }
//                 field("Bal. VAT Bus. Posting Group"; Rec."Bal. VAT Bus. Posting Group")
//                 {
//                     Visible = false;
//                 }
//                 field("Bal. VAT Prod. Posting Group"; Rec."Bal. VAT Prod. Posting Group")
//                 {
//                     Visible = false;
//                 }
//                 field("Bill-to/Pay-to No."; Rec."Bill-to/Pay-to No.")
//                 {
//                     Visible = false;
//                 }
//                 field("Ship-to/Order Address Code"; Rec."Ship-to/Order Address Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
//                 {
//                     Visible = false;
//                 }
//                 field("ShortcutDimCode[3]"; ShortcutDimCode[3])
//                 {
//                     CaptionClass = '1,2,3';
//                     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
//                                                                   "Dimension Value Type" = CONST(Standard),
//                                                                   Blocked = CONST(false));
//                     Visible = false;

//                     trigger OnValidate()
//                     begin
//                         Rec.ValidateShortcutDimCode(3, ShortcutDimCode[3]);
//                     end;
//                 }
//                 field("ShortcutDimCode[4]"; ShortcutDimCode[4])
//                 {
//                     CaptionClass = '1,2,4';
//                     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
//                                                                   "Dimension Value Type" = CONST(Standard),
//                                                                   Blocked = CONST(false));
//                     Visible = false;

//                     trigger OnValidate()
//                     begin
//                         Rec.ValidateShortcutDimCode(4, ShortcutDimCode[4]);
//                     end;
//                 }
//                 field("ShortcutDimCode[5]"; ShortcutDimCode[5])
//                 {
//                     CaptionClass = '1,2,5';
//                     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
//                                                                   "Dimension Value Type" = CONST(Standard),
//                                                                   Blocked = CONST(false));
//                     Visible = false;

//                     trigger OnValidate()
//                     begin
//                         Rec.ValidateShortcutDimCode(5, ShortcutDimCode[5]);
//                     end;
//                 }
//                 field("ShortcutDimCode[6]"; ShortcutDimCode[6])
//                 {
//                     CaptionClass = '1,2,6';
//                     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
//                                                                   "Dimension Value Type" = CONST(Standard),
//                                                                   Blocked = CONST(false));
//                     Visible = false;

//                     trigger OnValidate()
//                     begin
//                         Rec.ValidateShortcutDimCode(6, ShortcutDimCode[6]);
//                     end;
//                 }
//                 field("ShortcutDimCode[7]"; ShortcutDimCode[7])
//                 {
//                     CaptionClass = '1,2,7';
//                     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
//                                                                   "Dimension Value Type" = CONST(Standard),
//                                                                   Blocked = CONST(false));
//                     Visible = false;

//                     trigger OnValidate()
//                     begin
//                         Rec.ValidateShortcutDimCode(7, ShortcutDimCode[7]);
//                     end;
//                 }
//                 field("ShortcutDimCode[8]"; ShortcutDimCode[8])
//                 {
//                     CaptionClass = '1,2,8';
//                     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
//                                                                   "Dimension Value Type" = CONST(Standard),
//                                                                   Blocked = CONST(false));
//                     Visible = false;

//                     trigger OnValidate()
//                     begin
//                         Rec.ValidateShortcutDimCode(8, ShortcutDimCode[8]);
//                     end;
//                 }
//                 field(Correction; Rec.Correction)
//                 {
//                 }
//                 field("Payment Terms Code"; Rec."Payment Terms Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Applied Automatically"; Rec."Applied Automatically")
//                 {
//                     Editable = false;
//                     Visible = false;
//                 }
//                 field(Applied; Rec.IsApplied)
//                 {
//                     Caption = 'Applied';
//                     Visible = false;
//                 }
//                 field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
//                 {
//                     Visible = false;
//                 }
//                 field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
//                 {
//                     Visible = false;
//                 }
//                 field("Applies-to ID"; Rec."Applies-to ID")
//                 {
//                     Visible = false;
//                 }
//                 field("On Hold"; Rec."On Hold")
//                 {
//                     Visible = false;
//                 }
//                 field("Bank Payment Type"; Rec."Bank Payment Type")
//                 {
//                     Visible = false;
//                 }
//                 field("Reason Code"; Rec."Reason Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Mandate No."; "Mandate No.")
//                 {
//                     Editable = false;
//                 }
//                 field("Mandate invalid"; "Mandate invalid")
//                 {
//                     Editable = false;
//                 }
//                 field("Creditor-ID Vendor"; "Creditor-ID Vendor")
//                 {
//                     Editable = false;
//                 }
//                 field(Control7; Rec.Comment)
//                 {
//                 }
//                 field("Direct Debit Mandate ID"; Rec."Direct Debit Mandate ID")
//                 {
//                     Visible = false;
//                 }
//                 field("Usage Job No."; "Usage Job No.")
//                 {
//                     Visible = false;
//                 }
//                 field("Usage WBS"; "Usage WBS")
//                 {
//                     Visible = false;
//                 }
//             }
//             group(Control30)
//             {
//                 ShowCaption = false;
//                 fixed(Control1901776101)
//                 {
//                     ShowCaption = false;
//                     group("Account Name")
//                     {
//                         Caption = 'Account Name';
//                         field(AccName; AccName)
//                         {
//                             Editable = false;
//                         }
//                     }
//                     group("Bal. Account Name")
//                     {
//                         Caption = 'Bal. Account Name';
//                         field(BalAccName; BalAccName)
//                         {
//                             Caption = 'Bal. Account Name';
//                             Editable = false;
//                         }
//                     }
//                     group(Control1902759701)
//                     {
//                         Caption = 'Balance';
//                         field(Balance; Balance + Rec."Balance (LCY)" - xRec."Balance (LCY)")
//                         {
//                             AutoFormatType = 1;
//                             Caption = 'Balance';
//                             Editable = false;
//                             Visible = BalanceVisible;
//                         }
//                     }
//                     group("Total Balance")
//                     {
//                         Caption = 'Total Balance';
//                         field(TotalBalance; TotalBalance + Rec."Balance (LCY)" - xRec."Balance (LCY)")
//                         {
//                             AutoFormatType = 1;
//                             Caption = 'Total Balance';
//                             Editable = false;
//                             Visible = TotalBalanceVisible;
//                         }
//                     }
//                 }
//             }
//         }
//         area(factboxes)
//         {
//             part(Control1900919607; "Dimension Set Entries FactBox")
//             {
//                 SubPageLink = "Dimension Set ID" = FIELD("Dimension Set ID");
//             }
//             part(IncomingDocAttachFactBox; "Incoming Doc. Attach. FactBox")
//             {
//                 ShowFilter = false;
//             }
//             part(WorkflowStatusBatch; "Workflow Status Factbox")
//             {
//                 Caption = 'Batch Workflows';
//                 Editable = false;
//                 Enabled = false;
//                 ShowFilter = false;
//                 Visible = ShowWorkflowStatusOnBatch;
//             }
//             part(WorkflowStatusLine; "Workflow Status Factbox")
//             {
//                 Caption = 'Line Workflows';
//                 Editable = false;
//                 Enabled = false;
//                 ShowFilter = false;
//                 Visible = ShowWorkflowStatusOnLine;
//             }
//             systempart(Control1900383207; Links)
//             {
//                 Visible = false;
//             }
//             systempart(Control1905767507; Notes)
//             {
//                 Visible = false;
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             group("&Line")
//             {
//                 Caption = '&Line';
//                 Image = Line;
//                 action(Dimensions)
//                 {
//                     AccessByPermission = TableData Dimension = R;
//                     Caption = 'Dimensions';
//                     Image = Dimensions;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     ShortCutKey = 'Shift+Ctrl+D';

//                     trigger OnAction()
//                     begin
//                         Rec.ShowDimensions;
//                         CurrPage.SaveRecord;
//                     end;
//                 }
//             }
//             group("A&ccount")
//             {
//                 Caption = 'A&ccount';
//                 Image = ChartOfAccounts;
//                 action(Card)
//                 {
//                     Caption = 'Card';
//                     Image = EditLines;
//                     RunObject = Codeunit "Gen. Jnl.-Show Card";
//                     ShortCutKey = 'Shift+F7';
//                 }
//                 action("Ledger E&ntries")
//                 {
//                     Caption = 'Ledger E&ntries';
//                     Image = GLRegisters;
//                     Promoted = false;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Process;
//                     RunObject = Codeunit "Gen. Jnl.-Show Entries";
//                     ShortCutKey = 'Ctrl+F7';
//                 }
//             }
//             action(Approvals)
//             {
//                 Caption = 'Approvals';
//                 Image = Approvals;

//                 trigger OnAction()
//                 var
//                     GenJournalLine: Record "Gen. Journal Line";
//                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                 begin
//                     GetCurrentlySelectedLines(GenJournalLine);
//                     ApprovalsMgmt.ShowJournalApprovalEntries(GenJournalLine);
//                 end;
//             }
//             action(Mandate)
//             {
//                 Caption = 'Mandate';
//                 Image = Worksheet;
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = Process;
//                 ShortCutKey = 'Ctrl+M';

//                 trigger OnAction()
//                 var
//                     MandateMgt: Codeunit "Mandate Mangement";
//                 begin
//                     MandateMgt.ShowMandate(Rec);
//                 end;
//             }
//         }
//         area(processing)
//         {
//             group("F&unctions")
//             {
//                 Caption = 'F&unctions';
//                 Image = "Action";
//                 action("Renumber Document Numbers")
//                 {
//                     Caption = 'Renumber Document Numbers';
//                     Image = EditLines;

//                     trigger OnAction()
//                     begin
//                         Rec.RenumberDocumentNo
//                     end;
//                 }
//                 action("Insert Conv. LCY Rndg. Lines")
//                 {
//                     Caption = 'Insert Conv. LCY Rndg. Lines';
//                     Image = InsertCurrency;
//                     RunObject = Codeunit "Adjust Gen. Journal Balance";
//                 }
//                 separator("-")
//                 {
//                     Caption = '-';
//                 }
//                 action(GetStandardJournals)
//                 {
//                     Caption = '&Get Standard Journals';
//                     Ellipsis = true;
//                     Image = GetStandardJournal;
//                     Promoted = true;
//                     PromotedCategory = Process;

//                     trigger OnAction()
//                     var
//                         StdGenJnl: Record "Standard General Journal";
//                     begin
//                         StdGenJnl.FilterGroup := 2;
//                         StdGenJnl.SetRange("Journal Template Name", Rec."Journal Template Name");
//                         StdGenJnl.FilterGroup := 0;

//                         if PAGE.RunModal(PAGE::"Standard General Journals", StdGenJnl) = ACTION::LookupOK then begin
//                             StdGenJnl.CreateGenJnlFromStdJnl(StdGenJnl, CurrentJnlBatchName);
//                             Message(Text000, StdGenJnl.Code);
//                         end;

//                         CurrPage.Update(true);
//                     end;
//                 }
//                 action(SaveAsStandardJournal)
//                 {
//                     Caption = '&Save as Standard Journal';
//                     Ellipsis = true;
//                     Image = SaveasStandardJournal;
//                     Promoted = true;
//                     PromotedCategory = Process;

//                     trigger OnAction()
//                     var
//                         GenJnlBatch: Record "Gen. Journal Batch";
//                         GeneralJnlLines: Record "Gen. Journal Line";
//                         StdGenJnl: Record "Standard General Journal";
//                         SaveAsStdGenJnl: Report "Save as Standard Gen. Journal";
//                     begin
//                         GeneralJnlLines.SetFilter("Journal Template Name", Rec."Journal Template Name");
//                         GeneralJnlLines.SetFilter("Journal Batch Name", CurrentJnlBatchName);
//                         CurrPage.SetSelectionFilter(GeneralJnlLines);
//                         GeneralJnlLines.CopyFilters(Rec);

//                         GenJnlBatch.Get(Rec."Journal Template Name", CurrentJnlBatchName);
//                         SaveAsStdGenJnl.Initialise(GeneralJnlLines, GenJnlBatch);
//                         SaveAsStdGenJnl.RunModal;
//                         if not SaveAsStdGenJnl.GetStdGeneralJournal(StdGenJnl) then
//                             exit;

//                         Message(Text001, StdGenJnl.Code);
//                     end;
//                 }
//                 action("Test Report")
//                 {
//                     Caption = 'Test Report';
//                     Ellipsis = true;
//                     Image = TestReport;

//                     trigger OnAction()
//                     begin
//                         ReportPrint.PrintGenJnlLine(Rec);
//                     end;
//                 }
//                 action(Post)
//                 {
//                     Caption = 'P&ost';
//                     Image = PostOrder;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'F9';

//                     trigger OnAction()
//                     begin
//                         CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post", Rec);
//                         CurrentJnlBatchName := Rec.GetRangeMax("Journal Batch Name");
//                         CurrPage.Update(false);
//                     end;
//                 }
//                 action(Preview)
//                 {
//                     Caption = 'Preview Posting';
//                     Image = ViewPostedOrder;
//                     Promoted = false;

//                     trigger OnAction()
//                     var
//                         GenJnlPost: Codeunit "Gen. Jnl.-Post";
//                     begin
//                         GenJnlPost.Preview(Rec);
//                     end;
//                 }
//                 action(PostAndPrint)
//                 {
//                     Caption = 'Post and &Print';
//                     Image = PostPrint;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'Shift+F9';

//                     trigger OnAction()
//                     begin
//                         CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post+Print", Rec);
//                         CurrentJnlBatchName := Rec.GetRangeMax("Journal Batch Name");
//                         CurrPage.Update(false);
//                     end;
//                 }
//                 action(DeferralSchedule)
//                 {
//                     Caption = 'Deferral Schedule';
//                     Image = PaymentPeriod;

//                     trigger OnAction()
//                     begin
//                         if Rec."Account Type" = Rec."Account Type"::"Fixed Asset" then
//                             Error(AccTypeNotSupportedErr);

//                         ShowDeferrals(Rec."Posting Date", Rec."Currency Code");
//                     end;
//                 }
//                 group(IncomingDocument)
//                 {
//                     Caption = 'Incoming Document';
//                     Image = Documents;
//                     action(IncomingDocCard)
//                     {
//                         Caption = 'View Incoming Document';
//                         Enabled = HasIncomingDocument;
//                         Image = ViewOrder;
//                         //The property 'ToolTip' cannot be empty.
//                         //ToolTip = '';

//                         trigger OnAction()
//                         var
//                             IncomingDocument: Record "Incoming Document";
//                         begin
//                             IncomingDocument.ShowCardFromEntryNo(Rec."Incoming Document Entry No.");
//                         end;
//                     }
//                     action(SelectIncomingDoc)
//                     {
//                         AccessByPermission = TableData "Incoming Document" = R;
//                         Caption = 'Select Incoming Document';
//                         Image = SelectLineToApply;
//                         //The property 'ToolTip' cannot be empty.
//                         //ToolTip = '';

//                         trigger OnAction()
//                         var
//                             IncomingDocument: Record "Incoming Document";
//                         begin
//                             Rec.Validate("Incoming Document Entry No.", IncomingDocument.SelectIncomingDocument(Rec."Incoming Document Entry No.",rec.RecordId   ));
//                         end;
//                     }
//                     action(IncomingDocAttachFile)
//                     {
//                         Caption = 'Create Incoming Document from File';
//                         Ellipsis = true;
//                         Enabled = NOT HasIncomingDocument;
//                         Image = Attach;
//                         //The property 'ToolTip' cannot be empty.
//                         //ToolTip = '';

//                         trigger OnAction()
//                         var
//                             IncomingDocumentAttachment: Record "Incoming Document Attachment";
//                         begin
//                             IncomingDocumentAttachment.NewAttachmentFromGenJnlLine(Rec);
//                         end;
//                     }
//                     action(RemoveIncomingDoc)
//                     {
//                         Caption = 'Remove Incoming Document';
//                         Enabled = HasIncomingDocument;
//                         Image = RemoveLine;
//                         //The property 'ToolTip' cannot be empty.
//                         //ToolTip = '';

//                         trigger OnAction()
//                         begin
//                             Rec."Incoming Document Entry No." := 0;
//                         end;
//                     }
//                 }
//             }
//             group("B&ank")
//             {
//                 Caption = 'B&ank';
//                 action(ImportBankStatement)
//                 {
//                     Caption = 'Import Bank Statement';
//                     Image = Import;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;
//                     Visible = false;

//                     trigger OnAction()
//                     begin
//                         if Rec.FindLast then;
//                         Rec.ImportBankStatement;
//                     end;
//                 }
//                 action(ShowStatementLineDetails)
//                 {
//                     Caption = 'Bank Statement Details';
//                     Image = ExternalDocument;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;
//                     RunObject = Page "Bank Statement Line Details";
//                     RunPageLink = "Data Exch. No." = FIELD("Data Exch. Entry No."),
//                                   "Line No." = FIELD("Data Exch. Line No.");
//                     Visible = false;
//                 }
//                 action(Reconcile)
//                 {
//                     Caption = 'Reconcile';
//                     Image = Reconcile;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     ShortCutKey = 'Ctrl+F11';

//                     trigger OnAction()
//                     begin
//                         GLReconcile.SetGenJnlLine(Rec);
//                         GLReconcile.Run;
//                     end;
//                 }
//             }
//             group(Application)
//             {
//                 Caption = 'Application';
//                 action("Apply Entries")
//                 {
//                     Caption = 'Apply Entries';
//                     Ellipsis = true;
//                     Image = ApplyEntries;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     RunObject = Codeunit "Gen. Jnl.-Apply";
//                     ShortCutKey = 'Shift+F11';
//                 }
//                 action(Match)
//                 {
//                     Caption = 'Apply Automatically';
//                     Image = MapAccounts;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;
//                     RunObject = Codeunit "Match General Journal Lines";
//                     Visible = false;
//                 }
//                 action(AddMappingRule)
//                 {
//                     Caption = 'Map Text to Account';
//                     Image = CheckRulesSyntax;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;
//                     Visible = false;

//                     trigger OnAction()
//                     var
//                         TextToAccMapping: Record "Text-to-Account Mapping";
//                     begin
//                         TextToAccMapping.InsertRec(Rec);
//                     end;
//                 }
//             }
//             group("Payro&ll")
//             {
//                 Caption = 'Payro&ll';
//                 action(ImportPayrollTransaction)
//                 {
//                     Caption = 'Import Payroll Transactions';
//                     Image = Import;
//                     Promoted = true;
//                     PromotedCategory = Category6;
//                     PromotedIsBig = true;
//                     Visible = false;

//                     trigger OnAction()
//                     var
//                         GeneralLedgerSetup: Record "General Ledger Setup";
//                         ImportPayrollTransaction: Codeunit "Import Payroll Transaction";
//                     begin
//                         GeneralLedgerSetup.Get;
//                         GeneralLedgerSetup.TestField("Payroll Trans. Import Format");
//                         if Rec.FindLast then;
//                         ImportPayrollTransaction.SelectAndImportPayrollDataToGL(Rec, GeneralLedgerSetup."Payroll Trans. Import Format");
//                     end;
//                 }
//             }
//             group("Request Approval")
//             {
//                 Caption = 'Request Approval';
//                 group(SendApprovalRequest)
//                 {
//                     Caption = 'Send Approval Request';
//                     Image = SendApprovalRequest;
//                     action(SendApprovalRequestJournalBatch)
//                     {
//                         Caption = 'Journal Batch';
//                         Enabled = NOT OpenApprovalEntriesOnBatchOrAnyJnlLineExist;
//                         Image = SendApprovalRequest;

//                         trigger OnAction()
//                         var
//                             ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                         begin
//                             ApprovalsMgmt.TrySendJournalBatchApprovalRequest(Rec);
//                             SetControlAppearance;
//                         end;
//                     }
//                     action(SendApprovalRequestJournalLine)
//                     {
//                         Caption = 'Selected Journal Lines';
//                         Enabled = NOT OpenApprovalEntriesOnBatchOrCurrJnlLineExist;
//                         Image = SendApprovalRequest;

//                         trigger OnAction()
//                         var
//                             GenJournalLine: Record "Gen. Journal Line";
//                             ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                         begin
//                             GetCurrentlySelectedLines(GenJournalLine);
//                             ApprovalsMgmt.TrySendJournalLineApprovalRequests(GenJournalLine);
//                         end;
//                     }
//                 }
//                 group(CancelApprovalRequest)
//                 {
//                     Caption = 'Cancel Approval Request';
//                     Image = Cancel;
//                     action(CancelApprovalRequestJournalBatch)
//                     {
//                         Caption = 'Journal Batch';
//                         Enabled = OpenApprovalEntriesOnJnlBatchExist;
//                         Image = Cancel;

//                         trigger OnAction()
//                         var
//                             ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                         begin
//                             ApprovalsMgmt.TryCancelJournalBatchApprovalRequest(Rec);
//                             SetControlAppearance;
//                         end;
//                     }
//                     action(CancelApprovalRequestJournalLine)
//                     {
//                         Caption = 'Selected Journal Lines';
//                         Enabled = OpenApprovalEntriesOnJnlLineExist;
//                         Image = Cancel;

//                         trigger OnAction()
//                         var
//                             GenJournalLine: Record "Gen. Journal Line";
//                             ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                         begin
//                             GetCurrentlySelectedLines(GenJournalLine);
//                             ApprovalsMgmt.TryCancelJournalLineApprovalRequests(GenJournalLine);
//                         end;
//                     }
//                 }
//             }
//             group(Approval)
//             {
//                 Caption = 'Approval';
//                 action(Approve)
//                 {
//                     Caption = 'Approve';
//                     Image = Approve;
//                     Promoted = true;
//                     PromotedCategory = Category7;
//                     PromotedIsBig = true;
//                     Visible = OpenApprovalEntriesExistForCurrUser;

//                     trigger OnAction()
//                     var
//                         GenJournalBatch: Record "Gen. Journal Batch";
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         GenJournalBatch.Get(Rec."Journal Template Name", Rec."Journal Batch Name");
//                         //if not ApprovalsMgmt.ApproveRecordApprovalRequest(GenJournalBatch.RecordId) then
//                             ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
//                     end;
//                 }
//                 action(Reject)
//                 {
//                     Caption = 'Reject';
//                     Image = Reject;
//                     Promoted = true;
//                     PromotedCategory = Category7;
//                     PromotedIsBig = true;
//                     Visible = OpenApprovalEntriesExistForCurrUser;

//                     trigger OnAction()
//                     var
//                         GenJournalBatch: Record "Gen. Journal Batch";
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         GenJournalBatch.Get(Rec."Journal Template Name", Rec."Journal Batch Name");
//                        // if not ApprovalsMgmt.RejectRecordApprovalRequest(GenJournalBatch.RecordId) then
//                             ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
//                     end;
//                 }
//                 action(Delegate)
//                 {
//                     Caption = 'Delegate';
//                     Image = Delegate;
//                     Promoted = true;
//                     PromotedCategory = Category7;
//                     Visible = OpenApprovalEntriesExistForCurrUser;

//                     trigger OnAction()
//                     var
//                         GenJournalBatch: Record "Gen. Journal Batch";
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         GenJournalBatch.Get(Rec."Journal Template Name", Rec."Journal Batch Name");
//                       //  if not ApprovalsMgmt.DelegateRecordApprovalRequest(GenJournalBatch.RecordId) then
//                             ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
//                     end;
//                 }
//                 action(Comment)
//                 {
//                     Caption = 'Comments';
//                     Image = ViewComments;
//                     Promoted = true;
//                     PromotedCategory = Category7;
//                     RunObject = Page "Approval Comments";
//                     RunPageLink = "Table ID" = CONST(81),
//                                   "Document Type" = FIELD("Document Type"),
//                                   "Document No." = FIELD("Document No.");
//                     Visible = OpenApprovalEntriesExistForCurrUser;
//                 }
//             }
//         }
//     }

//     trigger OnInit()
//     begin
//         TotalBalanceVisible := true;
//         BalanceVisible := true;
//     end;

//     trigger OnModifyRecord(): Boolean
//     begin
//         SetUserInteractions;
//     end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     begin
//         UpdateBalance;
//         Rec.SetUpNewLine(xRec, Balance, BelowxRec);
//         Clear(ShortcutDimCode);
//         Clear(AccName);
//         SetUserInteractions;
//     end;

//     trigger OnOpenPage()
//     var
//         JnlSelected: Boolean;
//     begin
//         BalAccName := '';
//         if Rec.IsOpenedFromBatch then begin
//             CurrentJnlBatchName := Rec."Journal Batch Name";
//             GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
//             SetControlAppearance;
//             exit;
//         end;
//         GenJnlManagement.TemplateSelection(PAGE::"General Journal", 0, false, Rec, JnlSelected);
//         if not JnlSelected then
//             Error('');
//         GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
//         SetControlAppearance;
//     end;

//     var
//         ChangeExchangeRate: Page "Change Exchange Rate";
//         GLReconcile: Page Reconciliation;
//         GenJnlManagement: Codeunit GenJnlManagement;
//         ReportPrint: Codeunit "Test Report-Print";
//         CurrentJnlBatchName: Code[10];
//         AccName: Text[50];
//         BalAccName: Text[50];
//         Balance: Decimal;
//         TotalBalance: Decimal;
//         ShowBalance: Boolean;
//         ShowTotalBalance: Boolean;
//         ShortcutDimCode: array[8] of Code[20];
//         Text000: Label 'General Journal lines have been successfully inserted from Standard General Journal %1.';
//         Text001: Label 'Standard General Journal %1 has been successfully created.';
//         HasIncomingDocument: Boolean;
//         [InDataSet]
//         BalanceVisible: Boolean;
//         [InDataSet]
//         TotalBalanceVisible: Boolean;
//         StyleTxt: Text;
//         OpenApprovalEntriesExistForCurrUser: Boolean;
//         AccTypeNotSupportedErr: Label 'You cannot specify a deferral code for this type of account.';
//         OpenApprovalEntriesOnJnlBatchExist: Boolean;
//         OpenApprovalEntriesOnJnlLineExist: Boolean;
//         OpenApprovalEntriesOnBatchOrCurrJnlLineExist: Boolean;
//         OpenApprovalEntriesOnBatchOrAnyJnlLineExist: Boolean;
//         ShowWorkflowStatusOnBatch: Boolean;
//         ShowWorkflowStatusOnLine: Boolean;

//     local procedure UpdateBalance()
//     begin
//         GenJnlManagement.CalcBalance(Rec, xRec, Balance, TotalBalance, ShowBalance, ShowTotalBalance);
//         BalanceVisible := ShowBalance;
//         TotalBalanceVisible := ShowTotalBalance;
//     end;

//     local procedure CurrentJnlBatchNameOnAfterVali()
//     begin
//         CurrPage.SaveRecord;
//         GenJnlManagement.SetName(CurrentJnlBatchName, Rec);
//         CurrPage.Update(false);
//     end;

//     // [Scope('OnPrem')]
//     procedure SetUserInteractions()
//     begin
//         StyleTxt := Rec.GetStyle;
//     end;

//     local procedure GetCurrentlySelectedLines(var GenJournalLine: Record "Gen. Journal Line"): Boolean
//     begin
//         CurrPage.SetSelectionFilter(GenJournalLine);
//         exit(GenJournalLine.FindSet);
//     end;

//     local procedure SetControlAppearance()
//     var
//         GenJournalBatch: Record "Gen. Journal Batch";
//         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//     begin
//         if GenJournalBatch.Get(Rec."Journal Template Name", Rec."Journal Batch Name") then begin
//             ShowWorkflowStatusOnBatch := CurrPage.WorkflowStatusBatch.PAGE.SetFilterOnWorkflowRecord(GenJournalBatch.RecordId);
//             OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(GenJournalBatch.RecordId);
//             OpenApprovalEntriesOnJnlBatchExist := ApprovalsMgmt.HasOpenApprovalEntries(GenJournalBatch.RecordId);
//         end;
//         OpenApprovalEntriesExistForCurrUser :=
//           OpenApprovalEntriesExistForCurrUser or
//           ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);

//         OpenApprovalEntriesOnJnlLineExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
//         OpenApprovalEntriesOnBatchOrCurrJnlLineExist := OpenApprovalEntriesOnJnlBatchExist or OpenApprovalEntriesOnJnlLineExist;

//         OpenApprovalEntriesOnBatchOrAnyJnlLineExist :=
//           OpenApprovalEntriesOnJnlBatchExist or
//           ApprovalsMgmt.HasAnyOpenJournalLineApprovalEntries(Rec."Journal Template Name", Rec."Journal Batch Name");

//         ShowWorkflowStatusOnLine := CurrPage.WorkflowStatusLine.PAGE.SetFilterOnWorkflowRecord(Rec.RecordId);
//     end;
// }

