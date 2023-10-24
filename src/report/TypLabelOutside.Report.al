report 50043 "Typ Label (Outside)"
{
    // CC01 19.01.2022 CC.NR # Object created
    DefaultLayout = RDLC;
    RDLCLayout = 'TypLabelOutside.rdl';

    Caption = 'Typ Label (outside)';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1000000003; "Integer")
        {
            DataItemTableView = SORTING(Number)
                                WHERE(Number = FILTER(> 0));
            // column(Barcode; TmpBlob.Blob)
            // {
            // }
            column(ServiceCodeCaption; ServiceCodeCaption)
            {
            }
            column(ItemNo; Item."No.")
            {
            }
            column(ItemDescription; Item.Description)
            {
            }
            column(ItemBaseCertificate; Item."Basis Zertifikat")
            {
            }
            column(ItemMaxCapacity; '')
            {
            }
            column(ItemTradingUnitSizeLeft; FORMAT(Item."Max Gebindegr. links"))
            {
            }
            column(ItemTradingUnitSizeRight; FORMAT(Item."Max Gebindegr. rechts"))
            {
            }
            column(ItemMaxResilienceLeft; FORMAT(Item."Max Tragf. Stellf. links"))
            {
            }
            column(ItemMaxResilienceRight; FORMAT(Item."Max Tragf. Stellf. rechts"))
            {
            }
            column(SerialNo; SerialNo[Number])
            {
            }
            column(ProdDate; ProdDate[Number])
            {
            }
            column(ServiceCode; SerialNo[Number] + ' / ' + FORMAT(ProdDate[Number]))
            {
            }
            column(ServiceCodeBarcode; ServiceCodeBarcode)
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF (Number > Counter) THEN
                    CurrReport.BREAK;

                Item.GET(ItemNo[Number]);

                ServiceCodeBarcode := '*' + SerialNo[Number] /*+ FORMAT(ProdDate[Number])*/ + '*';

            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        //SetValues(1, '00006.9006G', 'TEST', WORKDATE);
        //SetValues(1, '00006.9006G', '123456', WORKDATE);
    end;

    var
        // BarcodeMgt: Codeunit "50013";
        // TmpBlob: Record "99008535" temporary;
        SerialNo: array[500] of Text;
        ItemNo: array[500] of Code[20];
        ProdDate: array[500] of Integer;
        Item: Record "item";
        ProductionOrder: Record "Production Order";
        Counter: Integer;
        ServiceCodeCaption: Label 'Service Code';
        ServiceCodeBarcode: Text;


    procedure SetValues(i: Integer; _ItemNo: Code[20]; _SerialNo: Text; _ProdDate: Date)
    begin
        Counter := i;

        ItemNo[i] := _ItemNo;
        SerialNo[i] := _SerialNo;
        ProdDate[i] := DATE2DMY(_ProdDate, 3);
    end;
}

