page 50060 "Temp Item Tracking"
{
    Caption = 'Item Tracking';
    Editable = false;
    PageType = List;
    SourceTable = "Reservation Entry";
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater(Control1000000001)
            {
                ShowCaption = false;
                field("Entry No."; "Entry No.")
                {
                }
                field("Item No."; "Item No.")
                {
                }
                field("Quantity (Base)"; "Quantity (Base)")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Serial No."; "Serial No.")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction in [ACTION::OK, ACTION::LookupOK] then begin
            AddTrackingToTanJournal;
        end;
    end;

    var
        TargetRowId: Text;

    [Scope('Internal')]
    procedure SetRecords(ReservationEntry: Record "Reservation Entry" temporary; _TargetRowId: Text)
    begin
        Rec := ReservationEntry;
        Rec.Insert;
        TargetRowId := _TargetRowId;
    end;

    [Scope('Internal')]
    procedure GetRecords(): Code[20]
    begin
        exit("Serial No.");
    end;

    local procedure AddTrackingToTanJournal()
    var
        ReservationEntry: Record "Reservation Entry";
        ItemTrackingManagement: Codeunit "Item Tracking Management";
        ItemJournalLine: Record "Item Journal Line";
    begin
        CurrPage.SetSelectionFilter(Rec);
        ReservationEntry.SetRange("Entry No.", Rec."Entry No.");
        //ItemTrackingManagement.CopyItemTracking3(ReservationEntry, TargetRowId, FALSE, FALSE);
        //dori
        //ItemJournalLine.RowID1
    end;
}

