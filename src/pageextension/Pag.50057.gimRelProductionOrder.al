/// <summary>
/// PageExtension gimRelProductionOrder (ID 50057) extends Record Released Production Order.
/// </summary>
pageextension 50057 gimRelProductionOrder extends "Released Production Order"
{
    layout
    {
        addafter(Posting)
        {
            group("Düperthal")
            {
                Caption = 'Düperthal';
                field("Shipping Agent Code"; "Shipping Agent Code")
                {
                    Description = 'P0027';
                    Editable = false;

                }
                field("Run Card Pinted Date"; "Run Card Pinted Date")
                {
                    Description = 'P0027';
                    Editable = false;

                }
                field("Run Card Pinted Time"; "Run Card Pinted Time")
                {
                    Description = 'P0027';
                    Editable = false;

                }
                field("Remaining Quantity"; "Remaining Quantity")
                {
                    Description = 'P0027';
                    Editable = false;

                }
                field("Auftr. Verk. an Deb.-Name"; "Auftr. Verk. an Deb.-Name")
                {
                    Description = 'P0027';
                    Editable = false;

                }
                field(Erstellungsdatum; Erstellungsdatum)
                {
                    Description = 'P0027';
                    Editable = false;

                }
                field(Erstellungsuhrzeit; Erstellungsuhrzeit)
                {
                    Description = 'P0027';
                    Editable = false;

                }
                field(Erstellungsuser; Erstellungsuser)
                {
                    Description = 'P0027';
                    Editable = false;

                }
                field("Änderungsdatum"; Änderungsdatum)
                {
                    Description = 'P0027';
                    Editable = false;

                }
                field("Änderungsuhrzeit"; Änderungsuhrzeit)
                {
                    Description = 'P0027';
                    Editable = false;

                }
                field("Änderungsuser"; Änderungsuser)
                {
                    Description = 'P0027';
                    Editable = false;

                }
                field("Evtl. Auftragsnr."; "Evtl. Auftragsnr.")
                {
                    Description = 'P0020,P0027';
                    Editable = false;

                }
                field("Evtl. Auftragszeilennr."; "Evtl. Auftragszeilennr.")
                {
                    Description = 'P0020,P0027';
                    Editable = false;

                }
            }
        }
    }

    actions
    {
        addafter(Warehouse)
        {
            group("&Print DP")
            {
                Caption = '&Print';
                Image = Print;
                // action("Job Card")
                // {
                //     Caption = 'Job Card';
                //     Ellipsis = true;

                //     Image = "Report";
                //     Promoted = true;
                //     PromotedCategory = Process;


                //     trigger OnAction()
                //     begin
                //         ManuPrintReport.PrintProductionOrder(Rec, 0);
                //     end;
                // }
                // action("Mat. &Requisition")
                // {
                //     Caption = 'Mat. &Requisition';
                //     Ellipsis = true;

                //     Image = "Report";
                //     Promoted = true;
                //     PromotedCategory = Process;


                //     trigger OnAction()
                //     begin
                //         ManuPrintReport.PrintProductionOrder(Rec, 1);
                //     end;
                // }
                // action("Shortage List")
                // {
                //     Caption = 'Shortage List';
                //     Ellipsis = true;

                //     Image = "Report";
                //     Promoted = true;
                //     PromotedCategory = Process;


                //     trigger OnAction()
                //     begin
                //         ManuPrintReport.PrintProductionOrder(Rec, 2);
                //     end;
                // }
                action(PrintQMLabels)
                {
                    Caption = 'Print QM-Labels';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        FunctionManagement: Codeunit "Function Management";
                    begin
                        // >> CC01
                        FunctionManagement.PrintTypShieldFromPO(Rec);
                        // << CC01
                    end;
                }
                action(PrintSlip)
                {
                    Caption = 'Production Slip';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ProductionOrder: Record "Production Order";
                    begin
                        // >> CC02
                        ProductionOrder.SetRange("No.", Rec."No.");
                        ProductionOrder.SetRange(Status, Rec.Status);
                        REPORT.Run(50079, true, true, ProductionOrder);
                        // << CC02
                    end;
                }
                // action(PrintPulverLabel)
                // {
                //     Caption = 'Drucke Pulver-Etiketten';
                //     Image = Print;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;

                //     trigger OnAction()
                //     begin
                //         PrintPulverLabel();
                //     end;
            }
        }
    }


    //TODO: Report einbauen
    /// <summary>
    /// PrintPulverLabel.
    /// </summary>
    // procedure PrintPulverLabel()
    // var
    //     ProdLine: Record "Prod. Order Line";
    //     ProdLabel: Report "Etikett Fertigung";
    //     RoutingTAN: Code[30];
    // begin
    //     ProdLine.SetRange(Status, 3);
    //     ProdLine.SetRange("Prod. Order No.", Rec."No.");

    //     ProdLabel.SetTableView(ProdLine);
    //     ProdLabel.UseRequestPage(true);
    //     //ProdLabel.
    //     ProdLabel.RunModal;
    // end;

}