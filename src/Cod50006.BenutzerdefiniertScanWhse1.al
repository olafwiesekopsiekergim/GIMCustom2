//TODO  SCAN-Codeunits: ScanBuffer
// codeunit 50006 "Benutzerdefiniert Scan_Whse1"
// {
//     // P0019 11.03.16 DEBIE.ARE Object created

//     TableNo = "Scan Buffer";

//     trigger OnRun()
//     begin
//         WhseActivLine2.SetRange("Activity Type", WhseActivLine2."Activity Type"::"Put-away");
//         WhseActivLine2.SetRange("No.", "Source ID");
//         WhseActivLine2.SetRange("Action Type", WhseActivLine2."Action Type"::Place);
//         WhseActivLine2.Find('-');
//         RegisterPutAway(WhseActivLine2);
//     end;

//     var
//         WhseActivLine2: Record "Warehouse Activity Line";

//     [Scope('OnPrem')]
//     procedure RegisterPutAway(WhsActLine: Record "Warehouse Activity Line")
//     var
//         WhseActivLine: Record "Warehouse Activity Line";
//         WhseRegisterPutAway: Codeunit "Whse.-Act.-Register (Yes/No)";
//         WhseActivityRegister: Codeunit "Whse.-Activity-Register";
//         WMSMgt: Codeunit "WMS Management";
//     begin
//         WhseActivLine.Copy(WhsActLine);
//         WhseActivLine.FilterGroup(3);
//         WhseActivLine.SetRange(Breakbulk);
//         WhseActivLine.FilterGroup(0);

//         WMSMgt.CheckBalanceQtyToHandle(WhseActivLine);
//         WhseActivityRegister.Run(WhseActivLine);
//         Clear(WhseActivityRegister);
//     end;
// }

