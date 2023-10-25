pageextension 50061 gimReqWkshNames extends "Req. Wksh. Names"
{
    layout
    {
        addlast(Control1)
        {
            field(Lagerortfilter; Lagerortfilter)
            {

                trigger OnLookup(var Text: Text): Boolean
                var
                    LocationList: Page "Location List";
                    Loc: Record Location;
                    Resultat: Boolean;
                begin
                    // >> P0016
                    Resultat := false;
                    Loc.SetFilter(Code, '%1', Text);
                    LocationList.LookupMode(True);
                    if Loc.FindLast then
                        LocationList.SetRecord(Loc);
                    if LocationList.RunModal = ACTION::LookupOK then begin
                        Text := Text + LocationList.GetSelectionFilter;
                        Resultat := true;
                    end;
                    exit(Resultat);
                    // << P0016
                end;
            }
            field(Produktbuchungsgruppenfilter; Produktbuchungsgruppenfilter)
            {

                trigger OnLookup(var Text: Text): Boolean
                var
                    GenProductPostingGroup: Record "Gen. Product Posting Group";
                    GenProductPostingGroups: Page "Gen. Product Posting Groups";
                    Resultat: Boolean;
                    sfm: codeunit SelectionFilterManagement;
                begin
                    // >> P0016
                    Resultat := false;
                    GenProductPostingGroup.SetFilter(Code, '%1', Text);
                    GenProductPostingGroups.lookupMode(True);
                    if GenProductPostingGroup.FindLast then
                        GenProductPostingGroups.SetRecord(GenProductPostingGroup);
                    if GenProductPostingGroups.RunModal = ACTION::LookupOK then begin
                        Text := Text + GenProductPostingGroups.GetSelectionFilter;
                        Resultat := true;
                    end;
                    exit(Resultat);

                    // << P0016
                end;
            }
            field(Kreditorenfilter; Kreditorenfilter)
            {

                trigger OnLookup(var Text: Text): Boolean
                var
                    VendList: Page "Vendor List";
                    Vend: Record Vendor;
                    Resultat: Boolean;
                begin
                    // >> P0016
                    Resultat := false;
                    Vend.SetFilter("No.", '%1', Text);
                    VendList.LookupMode(true);
                    if Vend.FindLast then
                        VendList.SetRecord(Vend);
                    if VendList.RunModal = ACTION::LookupOK then begin
                        Text := Text + VendList.GetSelectionFilter;
                        Resultat := true;
                    end;
                    exit(Resultat);
                    // << P0016
                end;
            }
            field("Enddatum Formel"; "Enddatum Formel")
            {
            }
            field(Direktlieferungen; Direktlieferungen)
            {
            }
            field(Lagerbuchungsgruppenfilter; Lagerbuchungsgruppenfilter)
            {

                trigger OnLookup(var Text: Text): Boolean
                var
                    InvtPostingGroup: Record "Inventory Posting Group";
                    InvtPostingGroups: Page "Inventory Posting Groups";
                    Resultat: Boolean;
                begin
                    // >> P0016
                    Resultat := false;
                    InvtPostingGroup.SetFilter(Code, '%1', Text);
                    InvtPostingGroups.Lookupmode(True);
                    if InvtPostingGroup.FindLast then
                        InvtPostingGroups.SetRecord(InvtPostingGroup);
                    if InvtPostingGroups.RunModal = ACTION::LookupOK then begin
                        Text := Text + InvtPostingGroups.GetSelectionFilter;
                        Resultat := true;
                    end;
                    exit(Resultat);
                    // << P0016
                end;
            }
            field(Automatisch; Automatisch)
            {
            }
            field(Direktlieferungsfilter; Direktlieferungsfilter)
            {
            }
            field(Artikelkategorienfilter; Artikelkategorienfilter)
            {
            }

        }
    }
}
