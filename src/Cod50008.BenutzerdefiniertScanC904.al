//TODO  SCAN-Codeunits: ScanBuffer
// codeunit 50008 "Benutzerdefiniert Scan-C904"
// {
//     // P0019 11.03.16 DEBIE.ARE Object created

//     TableNo = "Scan Buffer";

//     trigger OnRun()
//     begin
//         PurchHeader.SetRange("Document Type", "Source Subtype");
//         PurchHeader.SetRange("No.", "Source ID");
//         PurchHeader.Find('-');
//         PurchHeader.Receive := true;
//         PurchHeader.Invoice := false;
//         PurchHeader.Validate("Posting Date", Today);  //immer mit Tagesdatum buchen
//         PurchHeader."Vendor Shipment No." := SNHandlingCU.ShowInput('Kreditor Lieferscheinnummer', '', '', '', false, '');

//         Code();

//         PurchHeader."Vendor Shipment No." := '';
//         PurchHeader.Modify;
//     end;

//     var
//         PurchPost: Codeunit "Purch.-Post";
//         PurchHeader: Record "Purchase Header";
//         SNHandlingCU: Codeunit "Tracking Spe. Scan Tools";

//     [Scope('OnPrem')]
//     procedure "Code"()
//     begin
//         PurchPost.Run(PurchHeader);
//     end;
// }

