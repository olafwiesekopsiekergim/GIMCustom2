// query 50001 "GIMServiceAnswers"
// {

//     elements
//     {
//         dataitem(Servotion_Arch_Serv_Header; "Servotion Arch Serv. Header")
//         {
//             dataitem(Servotion_Arch_Serv_Item_Line; "Servotion Arch Serv. Item Line")
//             {
//                 DataItemLink = "Document No." = Servotion_Arch_Serv_Header."No.", "Document Type" = Servotion_Arch_Serv_Header."Document Type";
//                 SqlJoinType = InnerJoin;
//                 column(Document_Type; "Document Type")
//                 {
//                 }
//                 column(Document_No; "Document No.")
//                 {
//                 }
//                 column(Line_No; "Line No.")
//                 {
//                 }
//                 column(Service_Item_No; "Service Item No.")
//                 {
//                 }
//                 dataitem(Servotion_Answer_Group; "Servotion Answer Group")
//                 {
//                     DataItemLink = "Source ID" = Servotion_Arch_Serv_Item_Line."Document No.", "Source Ref. No." = Servotion_Arch_Serv_Item_Line."Line No.";
//                     SqlJoinType = InnerJoin;
//                     DataItemTableFilter = "Source Type" = CONST(42014830), "Source Subtype" = CONST("1");
//                     dataitem(Servotion_Answer; "Servotion Answer")
//                     {
//                         DataItemLink = "Answer Group No." = Servotion_Answer_Group."Answer Group No.";
//                         SqlJoinType = InnerJoin;
//                         DataItemTableFilter = Answer = FILTER(<> '');
//                         column(Mandatory; Mandatory)
//                         {
//                         }
//                         column(Answer; Answer)
//                         {
//                         }
//                         dataitem(Servotion_Question; "Servotion Question")
//                         {
//                             DataItemLink = "No." = Servotion_Answer."Question No.";
//                             SqlJoinType = InnerJoin;
//                             column(Description; Description)
//                             {
//                             }
//                         }
//                     }
//                 }
//             }
//         }
//     }
// }

