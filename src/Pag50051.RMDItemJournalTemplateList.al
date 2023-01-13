// page 50051 "RMD Item Journal Template List"
// {
//     // P0001 17.02.16 CCBIE.ARE New object

//     Caption = 'Item Journal Templates';
//     Editable = false;
//     PageType = List;
//     SourceTable = "Item Journal Template";

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 ShowCaption = false;
//                 field(Name; Rec.Name)
//                 {
//                 }
//                 field(Description; Rec.Description)
//                 {
//                 }
//                 field(Type; Rec.Type)
//                 {
//                     Visible = false;
//                 }
//                 field(Recurring; Rec.Recurring)
//                 {
//                     Visible = false;
//                 }
//                 field("No. Series"; Rec."No. Series")
//                 {
//                     Visible = false;
//                 }
//                 field("Posting No. Series"; Rec."Posting No. Series")
//                 {
//                     Visible = false;
//                 }
//                 field("Source Code"; Rec."Source Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Reason Code"; Rec."Reason Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Page ID"; Rec."Page ID")
//                 {
//                     LookupPageID = Objects;
//                     Visible = false;
//                 }
//                 field("Page Caption"; Rec."Page Caption")
//                 {
//                     DrillDown = false;
//                     Visible = false;
//                 }
//                 field("Test Report ID"; Rec."Test Report ID")
//                 {
//                     LookupPageID = Objects;
//                     Visible = false;
//                 }
//                 field("Test Report Caption"; Rec."Test Report Caption")
//                 {
//                     DrillDown = false;
//                     Visible = false;
//                 }
//                 field("Posting Report ID"; Rec."Posting Report ID")
//                 {
//                     LookupPageID = Objects;
//                     Visible = false;
//                 }
//                 field("Posting Report Caption"; Rec."Posting Report Caption")
//                 {
//                     DrillDown = false;
//                     Visible = false;
//                 }
//                 field("Whse. Register Report ID"; Rec."Whse. Register Report ID")
//                 {
//                     Visible = false;
//                 }
//                 field("Whse. Register Report Caption"; Rec."Whse. Register Report Caption")
//                 {
//                     DrillDown = false;
//                     Visible = false;
//                 }
//                 field("Force Posting Report"; Rec."Force Posting Report")
//                 {
//                     Visible = false;
//                 }
//             }
//         }
//         area(factboxes)
//         {
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
//             group("Te&mplate")
//             {
//                 Caption = 'Te&mplate';
//                 Image = Template;
//                 action(Batches)
//                 {
//                     Caption = 'Batches';
//                     Image = Description;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     RunObject = Page "Item Journal Batches";
//                     RunPageLink = "Journal Template Name" = FIELD(Name);
//                     Visible = true;
//                 }
//                 action("RMD Umlagerungs Buch.-Blatt")
//                 {
//                     Caption = 'RMD Umlagerungs Buch.-Blatt';
//                     Image = openjournal;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     begin
//                         StartRMDUmlagerungsBuchBlatt := true;
//                         CurrPage.Close;
//                     end;
//                 }
//             }
//         }
//     }

//     trigger OnClosePage()
//     var
//         ItemJournalLine: Record "Item Journal Line";
//     begin
//         if StartRMDUmlagerungsBuchBlatt then begin
//             ItemJournalLine.FilterGroup(2);
//             ItemJournalLine.SetRange("Journal Template Name", Rec.Name);
//             ItemJournalLine.FilterGroup(0);
//             PAGE.RunModal(PAGE::"RMD Umlagerungs BuchBlatt", ItemJournalLine);
//         end;
//     end;

//     trigger OnOpenPage()
//     begin
//         Rec.FilterGroup(2);
//         Rec.SetRange(Type, Rec.Type::RMDUmlagerung);
//         Rec.FilterGroup(0);
//         StartRMDUmlagerungsBuchBlatt := false;
//     end;

//     var
//         StartRMDUmlagerungsBuchBlatt: Boolean;
// }

