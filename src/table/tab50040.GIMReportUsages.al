/// <summary>
/// Table GIMReportUsages (ID 50040).
/// </summary>
table 50040 GIMReportUsages
{

    fields
    {
        field(1; ReportID; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Anzahl Drucke"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; ReportID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

