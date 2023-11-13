tableextension 50101 "CCO Plan. Ext. Setup Ext" extends "CCS PX Plan. Ext. Setup"
{
    fields
    {
        field(50100; "CCO Only Approved PO"; Boolean)
        {
            Caption = 'Only Approved PO';
            DataClassification = CustomerContent;
        }
    }
}
