page 50099 "FieldsTable"
{
    PageType = List;
    SourceTable = "Field";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(TableNo; Rec.TableNo)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(TableName; Rec.TableName)
                {
                }
                field(FieldName; Rec.FieldName)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Len; Rec.Len)
                {
                }
                field(Class; Rec.Class)
                {
                }
                field(Enabled; Rec.Enabled)
                {
                }
                field("Type Name"; Rec."Type Name")
                {
                }
                field("Field Caption"; Rec."Field Caption")
                {
                }
                field(RelationTableNo; Rec.RelationTableNo)
                {
                }
                field(RelationFieldNo; Rec.RelationFieldNo)
                {
                }
                field(SQLDataType; Rec.SQLDataType)
                {
                }
                field(OptionString; Rec.OptionString)
                {
                }
            }
        }
    }

    actions
    {
    }
}

