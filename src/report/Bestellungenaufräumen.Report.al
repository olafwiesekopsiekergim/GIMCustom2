report 50093 "Bestellungen aufräumen"
{
    // CCBIE.ARE 20161114 Object created

    ProcessingOnly = true;

    dataset
    {
        dataitem(DataItem1106900000; Table38)
        {
            DataItemTableView = SORTING (Document Type, No.)
                                ORDER(Ascending)
                                WHERE (Document Type=FILTER(Order));

            trigger OnAfterGetRecord()
            var
                DeleteHeader: Boolean;
            begin
                DeleteHeader := TRUE;
                PurchaseLine.SETRANGE("Document Type","Document Type");
                PurchaseLine.SETRANGE("Document No.","No.");
                IF PurchaseLine.FINDSET THEN BEGIN
                  REPEAT
                    DeleteHeader := (PurchaseLine.Quantity = PurchaseLine."Quantity Received")
                                    AND (PurchaseLine.Quantity = PurchaseLine."Quantity Invoiced");
                  UNTIL (PurchaseLine.NEXT = 0) OR (NOT DeleteHeader);
                END;

                IF DeleteHeader THEN BEGIN
                  PurchaseHeader.GET("Document Type","No.");
                  IF PurchaseHeader.DELETE(TRUE) THEN;
                END;
            end;

            trigger OnPreDataItem()
            begin
                IF CompanyInfo.Name <> 'GIM GmbH' THEN
                "Purchase Header".SETFILTER("Expected Receipt Date",'<%1',CALCDATE('-6W',TODAY));
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

    trigger OnPreReport()
    begin

        CompanyInfo.GET;
        PurchasesPayablesSetup.GET;
        PurchasesPayablesSetup.TESTFIELD("Arch. Orders and Ret. Orders");
    end;

    var
        PurchaseHeader: Record "38";
        PurchaseLine: Record "39";
        PurchasesPayablesSetup: Record "312";
        CompanyInfo: Record "79";
}

