report 50124 "Typ Label (Packaging)"
{
    // CC01 19.01.2022 CC.NR # Object created
    DefaultLayout = RDLC;
    RDLCLayout = './TypLabelPackaging.rdlc';

    Caption = 'Typ Label (inside)';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(DataItem1000000003; INteger)
        {
            DataItemTableView = SORTING(Number)
                                WHERE(Number = FILTER(> 0));
            // column(Barcode; TmpBlob.Blob)
            // {
            // }
            column(CheckedByCaption1; CheckedByCaption1)
            {
            }
            column(CheckedByCaption2; CheckedByCaption2)
            {
            }
            column(DescriptionCaption; DescriptionCaption)
            {
            }
            column(BaseCaption; BaseCaption)
            {
            }
            column(ItemNoCaption; ItemNoCaption)
            {
            }
            column(SerialNoCaption; SerialNoCaption)
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
            column(ProdDate; ProdDate[Number])
            {
            }
            column(ServiceCode; SerialNo[Number] + ' / ' + FORMAT(ProdDate[Number]))
            {
            }
            column(ServiceCodeBarcode; ServiceCodeBarcode)
            {
            }
            column(CompanyName; CompanyInformation.Name)
            {
            }
            column(BlackLogo; CompanyInformation.Picture)
            {
            }
            column(ItemBarcode; ItemBarcode)
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF (Number > Counter) THEN
                    CurrReport.BREAK;

                Item.GET(ItemNo[Number]);

                ServiceCodeBarcode := '*' + SerialNo[Number] /*+ FORMAT(ProdDate[Number])*/ + '*';

                ItemBarcode := '*' + ItemNo[Number] /*+ FORMAT(ProdDate[Number])*/ + '*';

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
    var
        outs: Outstream;
    begin
        //SetValues(1, '00006.9006G', '123456', WORKDATE);
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS("Black Logo");
        CompanyInformation.CALCFIELDS(Picture);
        //Barcode:=cuTmpBlob.CreateOutStream();
    end;

    var
        // BarcodeMgt: Codeunit 50013;
        // TmpBlob: Record 99008535 temporary;
        cuTmpBlob: Codeunit "Temp Blob";
        SerialNo: array[500] of Text;
        ItemNo: array[500] of Code[20];
        ProdDate: array[500] of Integer;
        Item: Record 27;
        ProductionOrder: Record 5405;
        Counter: Integer;
        ServiceCodeBarcode: Text;
        DescriptionCaption: Label 'Model:';
        BaseCaption: Label 'Base:';
        ItemNoCaption: Label 'R/N:';
        SerialNoCaption: Label 'S/N:';
        CheckedByCaption1: Label 'Qualität geprüft durch:';
        CheckedByCaption2: Label 'Quality inspected by:';
        CompanyInformation: Record 79;
        ItemBarcode: Text;

    // [Scope('Internal')]
    procedure SetValues(i: Integer; _ItemNo: Code[20]; _SerialNo: Text; _ProdDate: Date)
    begin
        Counter := i;

        ItemNo[i] := _ItemNo;
        SerialNo[i] := _SerialNo;
        ProdDate[i] := DATE2DMY(_ProdDate, 3);
    end;
}

