table 50008 "Gen. Jnl Post Log2"
{
    // P0004 15.02.16 DEBIE.ARE NAV2015 Modus changes
    // 
    // PR01 PRODUKT.01 15.12.14 DENUE.SKOL Integration cc|project
    // PRCS01 PRODUKT.01 15.12.14 DENUE.SKOL Integration cc|construction works
    // :DMW14.03:1:01 #Neue Felder für Stücklistenbuchungen  BOM Document Type
    //                #                                      BOM Document No.
    //                #                                      BOM Document Line No.
    //                #                                      BOM lfd. Nr.
    // :DMW14.04:1:01 #corrected Table Relation in Field "Calcluation Group"
    // :DMW15.01.00.01:6:01 #Completed Captions
    // :DMW16.00.01.01:46:01 #Correction because Softwaretest
    // #DMW16.00.03.03:A007 27.07.12 DEMSR.SSZ
    //   #Corrected Table Relation at field 5013380 "BOM Entry No."
    // #DMW17.00.00.01:A0001 16.05.13 DEMSR.SSZ Code Review
    // 
    // APTW:DMW15.01:58:01 #Advance Payment Management
    // #APTW17.10.00.02:T100 31.07.14 DEMSR.IST - Rebranding
    // #APTW17.10.00.03:T500 07.08.2014  DEDRS.RKRA  Copy dimensions from application entry
    // 
    // ================================================================================
    // (c) akquinet dynamic solutions GmbH, All rights reserved
    // 
    // ID       Date        Case     Initials   Description
    // --------------------------------------------------------------------------------
    // dyn      21.10.2015  BASE     akq        Implementing dynamo Products
    // dyn.OGL  25.02.2015  OGL      akq        Implementing dynamo OGL
    // ================================================================================
    // 
    // +--------------------------------------------------------------+
    // |                  Copyright MODUS Consult AG                  |
    // |                          Customizing                         |
    // +--------------------------------------------------------------+
    // Modul     Date      User      Description
    // MC        04.11.15  DT        Fields 50000/50005/50010 Vertreter/Sachbearbeiter/Provision

    Caption = 'Gen. Jnl Post Log';
    Permissions = TableData "Data Exch. Field" = rimd;

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Gen. Journal Template";
        }
        field(51; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Journal Template Name"));
        }
        field(88800; Error; Text[250])
        {
        }
        field(88801; Posted; Boolean)
        {
        }
        field(88802; Period; Date)
        {
        }
        field(88803; Started; DateTime)
        {
        }
        field(88804; Finished; DateTime)
        {
        }
        field(88805; Duration; Duration)
        {
        }
        field(88806; NoOfRecs; Integer)
        {
        }
        field(88807; PostPerBatch2Name; Boolean)
        {
        }
        field(88808; CopiedtoBatch2Name; Boolean)
        {
        }
        field(88809; Batch2Name; Code[10])
        {
        }
        field(88810; CopiedtoErrorBatchName; Boolean)
        {
        }
        field(88811; ErrorBatchName; Code[10])
        {
        }
        field(88812; "With Cancellation"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", Period)
        {
            Clustered = true;
            MaintainSIFTIndex = false;
        }
    }

    fieldgroups
    {
    }

    var
        Text000: Label '%1 or %2 must be a G/L account or bank account.', Comment = '%1=Account Type,%2=Balance Account Type';
        Text001: Label 'You must not specify %1 when %2 is %3.';
        Text002: Label 'cannot be specified without %1';
        Text003: Label 'The %1 in the %2 will be changed from %3 to %4.\Do you want to continue?';
        Text005: Label 'The update has been interrupted to respect the warning.';
        Text006: Label 'The %1 option can only be used internally in the system.';
        Text007: Label '%1 or %2 must be a bank account.', Comment = '%1=Account Type,%2=Balance Account Type';
        Text008: Label ' must be 0 when %1 is %2.';
        Text009: Label 'LCY';
        Text010: Label '%1 must be %2 or %3.';
        Text011: Label '%1 must be negative.';
        Text012: Label '%1 must be positive.';
        Text013: Label 'The %1 must not be more than %2.';
        Text017: Label 'Credit card %1 has already been performed for this %2, but posting failed. You must complete posting of the document of type %2 with the number %3.';
        Text014: Label 'The %1 %2 has a %3 %4.\Do you still want to use %1 %2 in this journal line?';
        Text015: Label 'You are not allowed to apply and post an entry to an entry with an earlier posting date.\\Instead, post %1 %2 and then apply it to %3 %4.';
        Text016: Label '%1 must be G/L Account or Bank Account.';
        Text018: Label '%1 can only be set when %2 is set.';
        Text019: Label '%1 cannot be changed when %2 is set.';
        Text11500: Label 'This change may affect payment discounts. Please verify the payment discount amount.';
        ExportAgainQst: Label 'One or more of the selected lines have already been exported. Do you want to export them again?';
        NothingToExportErr: Label 'There is nothing to export.';
        NotExistErr: Label 'Document No. %1 does not exist or is already closed.';
        DocNoFilterErr: Label 'The document numbers cannot be renumbered while there is an active filter on the Document No. field.';
        DueDateMsg: Label 'This posting date will cause an overdue payment.';
        CalcPostDateMsg: Label 'Processing payment journal lines #1##########';
        AccTypeNotSupportedErr: Label 'You cannot specify a deferral code for this type of account.';
}

