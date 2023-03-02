/// <summary>
/// TableExtension "RequisitionWrkshName" (ID 50030) extends Record Requisition Wksh. Name.
/// </summary>
tableextension 50030 GIMRequisitionWrkshName extends "Requisition Wksh. Name"
{
    fields
    {
        // Add changes to table fields here
        field(50000; Lagerortfilter; Code[100])
        {
            Description = 'P0016';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(50001; Produktbuchungsgruppenfilter; Code[100])
        {
            Description = 'P0016';
        }
        field(50002; Kreditorenfilter; Code[100])
        {
            Description = 'P0016';
        }
        field(50003; "Enddatum Formel"; DateFormula)
        {
            Description = 'P0016';
        }
        field(50004; Direktlieferungen; Boolean)
        {
            Description = 'P0016 holt Direktlieferungen';
        }
        field(50005; Lagerbuchungsgruppenfilter; Code[100])
        {
            Description = 'P0016';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(50010; Automatisch; Boolean)
        {
            Description = 'P0016 steuert ob über Nachtlauf gestartet';
        }
        field(50011; Direktlieferungsfilter; Code[100])
        {
            Description = 'P0016';
            FieldClass = FlowFilter;
        }
        field(50012; Artikelkategorienfilter; Code[100])
        {
            Description = 'P0016';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(50013; Gesperrtfilter; Code[10])
        {
            Description = 'P0016';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
    }

    var
        myInt: Integer;
}