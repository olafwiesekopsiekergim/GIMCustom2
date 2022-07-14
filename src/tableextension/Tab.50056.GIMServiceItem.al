/// <summary>
/// TableExtension "GIMServiceItem" (ID 50056) extends Record Service item.
/// </summary>
tableextension 50056 GIMServiceItem extends "Service item"
{
    fields
    {
        // Add changes to table fields here
        field(50001; Servicebarcode; Code[10])
        {
            Description = '#AT';
        }
        field(50002; Copyfrom; Code[20])
        {
            Description = '#AT';
        }
        field(50010; "Gebäude"; Text[50])
        {
            Description = '#AT';
        }
        field(50011; Ebene; Text[30])
        {
            Description = '#AT';
        }
        field(50012; Raum; Text[30])
        {
            Description = '#AT';
        }
        field(50013; Model; Code[20])
        {
            Description = '#AT';
        }
        field(50014; Hersteller; Text[30])
        {
            Description = '#AT';
        }
        field(50015; "Key-No."; Code[10])
        {
            Description = '#AT';
        }
        field(50020; "Customer Service ID"; Code[20])
        {
            Description = '#AT';
        }
        field(50400; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            Description = '#AT';
            Editable = false;
        }
        field(50401; Creationuser; Code[50])
        {
            Caption = 'Erstellungsnutzer';
            Description = '#AT';
            TableRelation = User;
        }
    }

    var
        myInt: Integer;
}