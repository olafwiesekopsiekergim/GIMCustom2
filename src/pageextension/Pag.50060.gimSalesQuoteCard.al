pageextension 50060 gimSalesQuoteCard extends "sales quote"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Sell-to Customer Name 2"; "Sell-to Customer Name 2")
            {
                ApplicationArea = All;
            }
        }
        addafter("Assigned User ID")
        {
            field("Pos.-Zus.-Zähl-Summen drucken"; "Pos.-Zus.-Zähl-Summen drucken")
            {
                
                ApplicationArea = All;
            }
            field("Zeilenrabatt ausblenden"; "Zeilenrabatt ausblenden")
            {
                ApplicationArea = All;
            }

            field(Zusatzstatus; Zusatzstatus)
            {
                ApplicationArea = All;
            }
            field("Language Code 2"; "Language Code")
            {
      
                ApplicationArea = All;
            }


            field("Quote Expiration Date"; "Quote Expiration Date")
            {
                QuickEntry = false;
                ApplicationArea = All;
            }
            field(Wiedervorlage; Wiedervorlage)
            {
                ApplicationArea = All;
            }
            field("No. Printed"; "No. Printed")
            {
                Description = 'P0008';
                ApplicationArea = All;
            }
            field("VAT Registration No."; "VAT Registration No.")
            {
                Description = 'P0040';
                ApplicationArea = All;
            }
            //TODO: Funktion GetTotalGrossWeight implementieren
            // field(GetTotalGrossWeight; GetTotalGrossWeight)
            // {
            //     Caption = 'Total Gross Weight Trading Goods';
            //     Editable = false;
            //     ApplicationArea = All;
            // }
            field(Webrequest; Webrequest)
            {
                ApplicationArea = All;
            }
            field("Creation Date"; "Creation Date")
            {

                Editable = false;
                ApplicationArea = All;
            }
            field("Servicecontractno."; "Servicecontractno.")
            {
                Editable = true;
                ApplicationArea = All;
            }
        }
    }
}
