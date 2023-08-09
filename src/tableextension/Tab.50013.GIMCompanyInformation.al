/// <summary>
/// TableExtension GIM Company Information (ID 50013) extends Record Company Information.
/// </summary>
tableextension 50013 "GIM Company Information" extends "Company Information"
{
    fields
    {
        // Add changes to table fields here
        field(50500; "Picture 2"; BLOB)
        {
            SubType = Bitmap;
        }
        field(50501; "Picture 3"; BLOB)
        {
            SubType = Bitmap;

        }
        field(50502; "Black Logo"; BLOB)
        {
            SubType = Bitmap;
        }
        field(50600; "Report Receipts"; Boolean)
        {
            Caption = 'Report Receipts';
        }
        field(50601; "Report Shipments"; Boolean)
        {
            Caption = 'Report Shipments';
        }
    }

    var
        myInt: Integer;
}