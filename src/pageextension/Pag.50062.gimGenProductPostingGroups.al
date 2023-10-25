/// <summary>
/// PageExtension gimGenProductPostingGroups (ID 50062) extends Record Gen. Product Posting Groups.
/// </summary>
pageextension 50062 gimGenProductPostingGroups extends "Gen. Product Posting Groups"
{

    /// <summary>
    /// getSelectionFilter.
    /// </summary>
    /// <returns>Return variable ret of type text.</returns>
    procedure getSelectionFilter() ret: text
    var
        GenProdPostingGr: record "Gen. Product Posting Group";
        RecRef: RecordRef;
        SelectionFilterManagement: codeunit SelectionFilterManagement;
    begin
        CurrPage.SETSELECTIONFILTER(GenProdPostingGr);
        RecRef.GETTABLE(GenProdPostingGr);
        EXIT(SelectionFiltermanagement.GetSelectionFilter(RecRef, GenProdPostingGr.FIELDNO(Code)));
    end;
}