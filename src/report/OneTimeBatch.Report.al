/// <summary>
/// Report OneTimeBatch (ID 50115).
/// </summary>
report 50115 OneTimeBatch
{
    // CC01  17.02.2023  CCMUE.WH  new object, may be deleted

    ProcessingOnly = true;

    dataset
    {
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

    trigger OnPostReport()
    begin
        MESSAGE('DONE');
    end;

    trigger OnPreReport()
    var
        ReservationEntry: Record "Reservation Entry";
    begin
        ReservationEntry.GET(19342545, FALSE);
        ReservationEntry.Binding := ReservationEntry.Binding::" ";
        //ReservationEntry."Item Tracking" := ReservationEntry."Item Tracking"::"Serial No.";
        ReservationEntry.MODIFY;
        ReservationEntry.GET(19342545, TRUE);
        ReservationEntry.Binding := ReservationEntry.Binding::" ";
        //ReservationEntry."Item Tracking" := ReservationEntry."Item Tracking"::"Serial No.";
        ReservationEntry.MODIFY;
        // ReservationEntry.Positive := TRUE;
        // ReservationEntry.INSERT;
    end;
}

