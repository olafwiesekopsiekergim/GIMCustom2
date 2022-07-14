codeunit 50011 "GLEntry_ModifyGIM"
{
    Permissions = TableData "G/L Entry" = rim;

    trigger OnRun()
    begin
    end;

    [Scope('OnPrem')]
    procedure SetGLEntryOpen(var GLEntry: Record "G/L Entry")
    begin

        //TODO Substitute Open 
        //GLEntry.Open := true;

        GLEntry.Modify(false);
    end;
}

