pageextension 50029 "gimServiceCommentSheet" extends "Service Comment Sheet"
{
    layout
    {
        addlast(Control1)
        {
            field(ServiceItemNo; ServiceItemNo)
            {
                Editable = false;
            }
        }
    }
}
