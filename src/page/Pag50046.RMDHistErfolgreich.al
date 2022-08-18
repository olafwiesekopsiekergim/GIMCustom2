// page 50046 "RMDHist Erfolgreich"
// {
//     // P0001 17.02.16 CCBIE.ARE New object

//     Caption = 'RMDHist Erfolgreich';
//     Editable = false;
//     SourceTable = "RMDHist Erfolgreich&Fehlerhaft";

//     layout
//     {
//         area(content)
//         {
//             field(PageCaption; PageCaption)
//             {
//             }
//             repeater(Group)
//             {
//                 field("Lfd.-Nr"; Rec."Lfd.-Nr")
//                 {
//                     Visible = EntryNoVisible;
//                 }
//                 field(Datum; Rec.Datum)
//                 {
//                     StyleExpr = DateStyle;
//                 }
//                 field(Zeit; Rec.Zeit)
//                 {
//                     StyleExpr = TimeStyle;
//                 }
//                 field(Relationcode; Rec.Relationcode)
//                 {
//                     StyleExpr = RelationcodeStyle;
//                 }
//                 field(Art; Rec.Art)
//                 {
//                     StyleExpr = TypeStyle;
//                 }
//                 field(Richtung; Rec.Richtung)
//                 {
//                 }
//                 field("Pfad (Export/Import)"; Rec."Pfad (Export/Import)")
//                 {
//                 }
//                 field(Matchcode; Rec.Matchcode)
//                 {
//                 }
//                 field("Pfad  (Archivierung)"; Rec."Pfad  (Archivierung)")
//                 {
//                 }
//                 field(Datei; Rec.Datei)
//                 {
//                 }
//                 field("Anzahl Datenzeilen"; Rec."Anzahl Datenzeilen")
//                 {
//                 }
//                 field(Control1106900013; Rec.Bemerkung)
//                 {
//                     StyleExpr = CommentStyle;
//                 }
//                 field("RMD Status Auftrag"; Rec."RMD Status Auftrag")
//                 {
//                 }
//                 field("RMD Rückinfo an Düperthal"; Rec."RMD Rückinfo an Düperthal")
//                 {
//                 }
//                 field("RMD Sammelsendung"; Rec."RMD Sammelsendung")
//                 {
//                 }
//                 field("RMD Deb.-KD-Nr. bei Spedition"; Rec."RMD Deb.-KD-Nr. bei Spedition")
//                 {
//                 }
//                 field("RM Gewicht (RMD)"; Rec."RM Gewicht (RMD)")
//                 {
//                 }
//                 field("RM Anzahl Colli (RMD)"; Rec."RM Anzahl Colli (RMD)")
//                 {
//                 }
//                 field("RM Paketnr. (RMD)"; Rec."RM Paketnr. (RMD)")
//                 {
//                 }
//                 field("RM Zusteller (RMD)"; Rec."RM Zusteller (RMD)")
//                 {
//                 }
//                 field("RM Lieferscheinnr. (RMD)"; Rec."RM Lieferscheinnr. (RMD)")
//                 {
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             group(Anzeigenwechsel)
//             {
//                 Caption = 'Anzeigenwechsel';
//                 action("Erfolgreiche Einträge")
//                 {
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     Visible = NOT SuccessfulData;

//                     trigger OnAction()
//                     begin
//                         ChangeTo(Rec."Record Type"::Erfolgreich);
//                     end;
//                 }
//                 action("Fehlerhafte Einträge")
//                 {
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     Visible = SuccessfulData;

//                     trigger OnAction()
//                     begin
//                         ChangeTo(Rec."Record Type"::Fehlerhaft);
//                     end;
//                 }
//             }
//         }
//         group(Bemerkung)
//         {
//             Caption = 'Bemerkung';
//             action("Bemerkung komplett anzeigen")
//             {
//                 Caption = 'Bemerkung komplett anzeigen';

//                 trigger OnAction()
//                 begin
//                     BemerkungAnzeigen;
//                 end;
//             }
//         }
//     }

//     trigger OnAfterGetRecord()
//     var
//         RMDHistFehlerhaftTest: Record "RMDHist Erfolgreich&Fehlerhaft";
//     begin
//         if Art = Art::Bestandskontrolle then begin
//           DateStyle := 'Strong';
//           if StrPos(Bemerkung, '!!! Differenzen !!!') > 0 then
//             DateStyle := 'Unfavorable';
//         end else begin
//           if StrPos(Bemerkung, '!!! Differenzen !!!') > 0 then begin
//             DateStyle := 'Attention';
//           end else begin
//             if Art = Art::Bestellung then
//               DateStyle := 'StandardAccent'
//             else
//               DateStyle := 'Standard';
//           end;
//         end;

//         if StrPos(Bemerkung, '!!! Differenzen !!!') > 0 then begin
//           TimeStyle := 'Attention';
//         end else begin
//           if Art = Art::Bestellung then
//             TimeStyle := 'StandardAccent'
//           else
//             TimeStyle := 'Standard';
//         end;

//         if Art = Art::Bestellung then begin
//           Clear(PurchaseHeader);
//           if GETPurchaseHeader(PurchaseHeader) then begin
//             RelationcodeStyle := 'StrongAccent';
//             TypeStyle := 'StrongAccent';
//           end else begin
//             RelationcodeStyle := 'StandardAccent';
//             TypeStyle := 'StandardAccent';
//           end;
//         end else begin
//           RelationcodeStyle := 'Standard';
//           TypeStyle := 'Standard';
//         end;

//         if Richtung = Richtung::Export then begin
//            RMDHistFehlerhaftTest.SetCurrentKey(Relationcode,Richtung,Datum,Zeit);
//            RMDHistFehlerhaftTest.SetRange(Relationcode, Relationcode);
//            RMDHistFehlerhaftTest.SetRange(Richtung, Richtung::Import);
//            RMDHistFehlerhaftTest.SetRange("Record Type", "Record Type"::Fehlerhaft);
//            if RMDHistFehlerhaftTest.Find('-') then
//              if Art = Art::Bestellung then
//                RelationcodeStyle := 'Unfavorable'
//              else
//                RelationcodeStyle := 'Attention';
//         end;

//         if StrPos(Bemerkung, '!!!') > 0 then
//           CommentStyle := 'Attention'
//         else
//           if Art = Art::Bestellung then
//             CommentStyle := 'StandardAccent'
//           else
//             CommentStyle := 'Standard';
//     end;

//     trigger OnOpenPage()
//     begin
//         ChangeTo("Record Type"::Fehlerhaft);
//         PageCaption := 'RMD Historie FEHLERHAFTER AKTIONEN';
//         CurrPage.Update;
//     end;

//     var
//         PurchaseHeader: Record "Purchase Header";
//         SuccessfulData: Boolean;
//         EntryNoVisible: Boolean;
//         DateStyle: Text;
//         TimeStyle: Text;
//         RelationcodeStyle: Text;
//         TypeStyle: Text;
//         CommentStyle: Text;
//         PageCaption: Text;

//     local procedure ChangeTo(RecType: Option " ",Erfolgreich,Fehlerhaft)
//     begin
//         FilterGroup(2);
//         SetRange("Record Type", RecType);
//         FilterGroup(0);

//         if RecType = RecType::Erfolgreich then begin
//           PageCaption := 'RMD Historie ERFOLGREICHER AKTIONEN';
//           SuccessfulData := true;
//           EntryNoVisible := false;
//         end else begin
//           PageCaption := 'RMD Historie FEHLERHAFTER AKTIONEN';
//           SuccessfulData := false;
//           EntryNoVisible := true;
//         end;
//     end;

//     local procedure GETPurchaseHeader(var PurchaseHeader: Record "Purchase Header"): Boolean
//     begin
//         exit(PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, Relationcode))
//     end;

//     local procedure BemerkungAnzeigen()
//     begin
//         Message('%1', Bemerkung);
//     end;
// }

