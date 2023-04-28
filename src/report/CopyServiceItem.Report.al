/// <summary>
/// Report Copy Service Item (ID 50112).
/// </summary>
report 50112 "Copy Service Item"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Service Item"; "Service Item")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            var
                i: Integer;
            begin
                FOR i := 1 TO CopyNo DO BEGIN
                    ServiceItem.INIT;
                    ServiceItem.TRANSFERFIELDS("Service Item");
                    ServiceItem.Copyfrom := "No.";
                    ServiceItem."No." := '';
                    ServiceItem.INSERT(TRUE);
                END;
            end;

            trigger OnPreDataItem()
            begin
                IF CopyNo < 1 THEN ERROR('Anzahl der Artikel muss größer 0 sein!');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(CopyNo; CopyNo)
                {
                    Caption = 'Anzahl neuer Artikel';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        ServiceItem: Record "Service Item";
        CopyNo: Integer;
}

