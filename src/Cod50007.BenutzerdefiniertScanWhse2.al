
//TODO  SCAN-Codeunits: ScanBuffer
// codeunit 50007 "Benutzerdefiniert Scan_Whse2"
// {
//     // P0019 11.03.16 DEBIE.ARE Object created

//     TableNo = "Scan Buffer";

//     trigger OnRun()
//     begin
//         WhseActivLine2.SetRange("Activity Type", WhseActivLine2."Activity Type"::"Put-away");
//         WhseActivLine2.SetRange("No.", "Source ID");
//         WhseActivLine2.SetRange("Action Type", WhseActivLine2."Action Type"::Place);
//         if WhseActivLine2.Find('-') then
//             repeat
//                 REPORT.RunModal(REPORT::"Lagerlabel Multiscan_Whse", true, true, WhseActivLine2);
//             until WhseActivLine2.Next = 0;
//     end;

//     var
//         WhseActivLine2: Record "Warehouse Activity Line";
// }

