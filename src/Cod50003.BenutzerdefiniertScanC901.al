//TODO  SCAN-Codeunits: ScanBuffer

// codeunit 50003 "Benutzerdefiniert Scan-C901"
// {
//     // P0019 11.03.16 DEBIE.ARE Object created

//     TableNo = "Scan Buffer";

//     trigger OnRun()
//     var
//         ScanBuffer: Record "Scan Buffer";
//     begin
//         if Evaluate("Universal Integer", SNHandling.ShowInput('Anzahl der zu', 'druckenden Labels eingeben', '', '', false, '')) then;
//         if Evaluate("Universal Decimal", SNHandling.ShowInput('Menge je zu', 'druckenden Labels eingeben', '', '', false, '')) then;
//         if Evaluate("Universal Text", SNHandling.ShowInput('Einheit je zu', 'druckenden Labels eingeben', '', '', false, '')) then;

//         ScanBuffer.SetCurrentKey("Source ID", "Source Type", "Source Subtype");
//         ScanBuffer.SetRange("Source ID", "Source ID");
//         ScanBuffer.SetRange("Source Type", "Source Type");
//         ScanBuffer.SetRange("Source Subtype", "Source Subtype");
//         ScanBuffer.SetRange("Source Ref. No.", "Source Ref. No.");
//         ScanBuffer.FindSet;
//         ScanBuffer."Universal Integer" := "Universal Integer";
//         ScanBuffer."Universal Decimal" := "Universal Decimal";
//         ScanBuffer."Universal Text" := "Universal Text";
//         ScanBuffer.Modify;
//     end;

//     var
//         SNHandling: Codeunit "Tracking Spe. Scan Tools";
// }

