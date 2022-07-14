table 50047 "RMD Labelanweisung"
{
    // P0001 15.02.16 DEBIE.ARE New object
    // //DUE400
    // > Logistikanbindung RMD
    // 
    //       WAS RMD BETRIFFT siehe auch in Documentation der Tabelle RMD Einrichtung    !!!      ALLE RMD-TANGIERTEN ENTHALTEN
    //     - dort stehen u.a. die irgendwie von der Logistikanbindung RMD tangierten Objekte -    'RMD' IN DER VERSIONSLISTE!!!
    // ------------------------------------------------------------------------------------------------------------------------

    LookupPageID = "RMD Labelanweisung";

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Beschreibung; Text[80])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

