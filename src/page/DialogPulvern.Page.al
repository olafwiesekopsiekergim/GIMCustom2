page 50061 DialogPulvern
{
    Caption = 'Dialog Pulvern';
    PageType = StandardDialog;

    layout
    {
        area(content)
        {
            field(OutputQty; OutputQty)
            {
                Caption = 'Fertigestellte Menge';
            }
            field(ScrapQuantity; ScrapQuantity)
            {
                Caption = 'Auschussmenge';
                Visible = gIsLastOperation;
            }
            field(EtikettenQty; EtikettenQty)
            {
                Caption = 'Anzahl Etiketten';
                MaxValue = 50;
                MinValue = 0;
                Visible = gIsLastOperation;
            }
        }
    }

    actions
    {
    }

    var
        OutputQty: Decimal;
        ScrapQuantity: Decimal;
        EtikettenQty: Decimal;
        gIsLastOperation: Boolean;

    [Scope('Internal')]
    procedure GetOutputQty() ret: Decimal
    begin
        exit(OutputQty);
    end;

    [Scope('Internal')]
    procedure GetScrapQuantity() ret: Decimal
    begin
        exit(ScrapQuantity);
    end;

    [Scope('Internal')]
    procedure GetLableQty() ret: Decimal
    begin
        exit(EtikettenQty);
    end;

    [Scope('Internal')]
    procedure SetVisiblity(IsLastOperation: Boolean)
    begin
        gIsLastOperation := IsLastOperation;
    end;
}

