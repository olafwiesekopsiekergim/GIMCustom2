//TODO  SCAN-Codeunits: ScanBuffer

// codeunit 50009 "Benutzerdefiniert Scan_C903"
// {
//     // P0019 15.03.16 DEBIE.ARE Object created

//     TableNo = "Scan Buffer";

//     trigger OnRun()
//     begin
//         PurchLine.SetRange("Document Type", "Source Subtype");
//         PurchLine.SetRange("Document No.", "Source ID");
//         PurchLine.SetRange(Type, PurchLine.Type::Item);
//         PurchLine.SetFilter("Qty. to Receive", '<>0');
//         if PurchLine.Find('-') then
//             repeat
//                 Item.Get(PurchLine."No.");
//                 if Item."Lagerlabel drucken" then;
//                 REPORT.RunModal(REPORT::"Lagerlabel Multiscan_Purch", false, true, PurchLine);
//             until PurchLine.Next = 0;
//     end;

//     var
//         PurchLine: Record "Purchase Line";
//         Item: Record Item;
// }

