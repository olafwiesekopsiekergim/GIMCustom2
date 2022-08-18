/// <summary>
/// TableExtension GIM Purchase Line (ID 50012) extends Record Purchase Line.
/// </summary>
tableextension 50012 "GIM Purchase Line" extends "Purchase Line"
{
    fields
    {
        // Add changes to table fields here
        field(50012; Position; Text[5])
        {
            Description = 'P0012';
        }

    }

    var
        myInt: Integer;

    //[Scope('Internal')]
    // procedure CheckFixedAssetSerialNo()
    // var
    //     LicPermission: Record "License Permission";
    //     MachineFAManagement: Codeunit "Machine FA Management";
    // begin
    //     // >> #RENW17.00:T201
    //     LicPermission.Get(LicPermission."Object Type"::Codeunit, CODEUNIT::"Machine FA Management");
    //     if LicPermission."Execute Permission" = LicPermission."Execute Permission"::Yes then begin
    //         // << #RENW17.00:T201

    //         // >> #RENW16.00.02:R062
    //         MachineFAManagement.PurchL_CheckFixedAssetSerialNo(Rec);
    //         // << #RENW16.00.02:R062

    //         // >> #RENW17.00:T201
    //     end;
    //     // << #RENW17.00:T201
    // end;

    // //[Scope('Internal')]
    // procedure MachGetFAPostingGroup()
    // var
    //     LicPermission: Record "License Permission";
    // begin
    //     // >> #RENW17.00:T201
    //     LicPermission.Get(LicPermission."Object Type"::Codeunit, CODEUNIT::"Machine FA Management");
    //     if LicPermission."Execute Permission" = LicPermission."Execute Permission"::Yes then begin
    //         // << #RENW17.00:T201

    //         // >> #RENW16.00.02:R062
    //         MachineFAManagement.PurchLine_GetFAPostingGroup(Rec);
    //         // << #RENW16.00.02:R062

    //         // >> #RENW17.00:T201
    //     end;
    //     // << #RENW17.00:T201
    // end;

    // //[Scope('Internal')]
    // procedure FAOnValidate(CurrFieldNo: Integer)
    // var
    //     LicPermission: Record "License Permission";
    // begin
    //     // >> #RENW17.00:T201
    //     LicPermission.Get(LicPermission."Object Type"::Codeunit, CODEUNIT::"Machine FA Management");
    //     if LicPermission."Execute Permission" = LicPermission."Execute Permission"::Yes then begin
    //         // << #RENW17.00:T201

    //         // >> #RENW16.00.02:R062
    //         case CurrFieldNo of

    //             FieldNo("Item Fixed Asset Purchase"):
    //                 begin
    //                     MachineFAManagement.PurchL_ItemFAPurchOnVal(Rec, xRec);
    //                 end;

    //             FieldNo("Item Fixed Asset No."):
    //                 begin
    //                     MachineFAManagement.PurchLine_ItemFANoOnVal(Rec);
    //                 end;

    //         end;
    //         // << #RENW16.00.02:R062

    //         // >> #RENW17.00:T201
    //     end;
    //     // << #RENW17.00:T201
    // end;


    //[Scope('Internal')]
    //TODO Missing Module COMSOL TG Verwaltung
    procedure "automPosNrzählen"(var EKZeile: Record "Purchase Line")
    var
        EinkZeile2: Record "Purchase Line";
    // comTGcheck: Record "COMSOL TG Verwaltung";
    begin
        // >> P0012
        // if not comTGcheck.PosNrAutomatisch then exit;

        if CurrFieldNo = FieldNo(Position) then exit;

        /*c*//*autom. Pos. hochzählen*/
        if (EkZeile.Type <> EKZeile.Type::" ") and (EKZeile.Position = '') then begin
            EinkZeile2 := Rec;
            EinkZeile2.CopyFilters(EKZeile);
            /*---EinkZeile2.SETFILTER(Art, '<>0');---*/
            EinkZeile2.SetFilter(Position, '<>%1', '');
            if EinkZeile2.Find('<') then begin
                if (EinkZeile2."Document Type" = EKZeile."Document Type") and
                   (EinkZeile2."Document No." = EKZeile."Document No.") then
                    EKZeile.Position := IncStr(EinkZeile2.Position)
                else
                    EKZeile.Position := '';
                if EKZeile.Position = '' then
                    ; // EKZeile.Position := comTGcheck.PosNrDefault();
            end else
                ; // EKZeile.Position := comTGcheck.PosNrDefault();
        end;
        EKZeile.Validate(Position);
        if EKZeile.Modify then;
        /*c*//*autom. Pos. hochzählen-ENDE*/
        // << P0012

    end;
}