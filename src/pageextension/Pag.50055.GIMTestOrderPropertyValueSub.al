pageextension 50055 GIMTestOrderPropertyValueSub extends "CCS QA Test Order PropVal Sub"
{
    Layout
    {
        addafter("Valid Determined Value")
        {
            field(DetermValueTester1; rec.DetermValueTester1)
            {
                ApplicationArea = all;
            }
            field(DetermValueTester2; rec.DetermValueTester2)
            {
                ApplicationArea = all;
            }
        }
    }
}
