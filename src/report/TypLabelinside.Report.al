report 50046 "Typ Label (inside)"
{
    // CC01 19.01.2022 CC.NR # Object created
    DefaultLayout = RDLC;
    RDLCLayout = './TypLabelinside.rdlc';

    Caption = 'Typ Label (inside)';
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
        //SetValues(1, '00006.9006G', '123456', WORKDATE);
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS("Black Logo");
        CompanyInformation.CALCFIELDS(Picture);

    end;

    var
        // BarcodeMgt: Codeunit "50013";
        // TmpBlob: Record "99008535" temporary;
        SerialNo: array[500] of Text;
        ItemNo: array[500] of Code[20];
        ProdDate: array[500] of Integer;
        Item: Record "item";
        ProductionOrder: Record "Production order";
        Counter: Integer;
        ServiceCodeBarcode: Text;
        DescriptionCaption: Label 'Model:';
        BaseCaption: Label 'Base:';
        ItemNoCaption: Label 'R/N:';
        SerialNoCaption: Label 'S/N:';
        CheckedByCaption1: Label 'Qualität geprüft durch:';
        CheckedByCaption2: Label 'Quality inspected by:';
        CompanyInformation: Record "Company Information";


    procedure SetValues(i: Integer; _ItemNo: Code[20]; _SerialNo: Text; _ProdDate: Date)
    begin
        Counter := i;

        ItemNo[i] := _ItemNo;
        SerialNo[i] := _SerialNo;
        ProdDate[i] := DATE2DMY(_ProdDate, 3);
    end;
}

