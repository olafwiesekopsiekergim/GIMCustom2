report 50110 "Item Label"
{
    DefaultLayout = RDLC;
    RDLCLayout = './ItemLabel.rdlc';
    UseSystemPrinter = false;

    dataset
    {
        dataitem("Mobile Transaction Line"; "Mobile Transaction Line")
        {
            RequestFilterFields = "No.";
            column(ItemNo; "Mobile Transaction Line"."Stock Key Item No.")
            {
            }
            column(Barcode; strBlob)
            {
            }

            trigger OnAfterGetRecord()
            var
                outs: Outstream;
            begin

                EncodeCode128("Stock Key Item No.", 2, FALSE, TempBlob);
                tempblob.CreateOutStream(outs);
                outs.WriteText(strBlob);
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        txcErrorSize: Label 'Valid values for the barcode size are 1, 2, 3, 4 & 5';
        TempBlob: Codeunit "Temp Blob";
        strBlob: text;
        bxtBarcodeBinary: BigText;

    // [Scope('Internal')]
    /// <summary>
    /// EncodeCode128.
    /// </summary>
    /// <param name="pcodBarcode">Code[1024].</param>
    /// <param name="pintSize">Integer.</param>
    /// <param name="pblnVertical">Boolean.</param>
    /// <param name="precTmpTempBlob">VAR Codeunit "Temp Blob".</param>
    procedure EncodeCode128(pcodBarcode: Code[1024]; pintSize: Integer; pblnVertical: Boolean; var precTmpTempBlob: Codeunit "Temp Blob")
    var
        lrecTmpCode128: Record 50005 temporary;
        lintCount1: Integer;
        ltxtArray: array[2, 200] of Text[30];
        lcharCurrentCharSet: Char;
        lintWeightSum: Integer;
        lintCount2: Integer;
        lintConvInt: Integer;
        ltxtTerminationBar: Text[2];
        lintCheckDigit: Integer;
        lintConvInt1: Integer;
        lintConvInt2: Integer;
        lblnnumber: Boolean;
        lintLines: Integer;
        lintBars: Integer;
        loutBmpHeader: OutStream;
    begin
        CLEAR(bxtBarcodeBinary);
        CLEAR(precTmpTempBlob);
        CLEAR(lrecTmpCode128);
        lrecTmpCode128.DELETEALL;
        CLEAR(lcharCurrentCharSet);
        ltxtTerminationBar := '11';

        IF NOT (pintSize IN [1, 2, 3, 4, 5]) THEN
            ERROR(txcErrorSize);

        InitCode128(lrecTmpCode128);

        FOR lintCount1 := 1 TO STRLEN(pcodBarcode) DO BEGIN
            lintCount2 += 1;
            lblnnumber := FALSE;
            lrecTmpCode128.RESET;

            IF EVALUATE(lintConvInt1, FORMAT(pcodBarcode[lintCount1])) THEN
                lblnnumber := EVALUATE(lintConvInt2, FORMAT(pcodBarcode[lintCount1 + 1]));

            //A '.' IS EVALUATED AS A 0, EXTRA CHECK NEEDED
            IF FORMAT(pcodBarcode[lintCount1]) = '.' THEN
                lblnnumber := FALSE;

            IF FORMAT(pcodBarcode[lintCount1 + 1]) = '.' THEN
                lblnnumber := FALSE;

            IF lblnnumber AND (lintConvInt1 IN [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]) AND (lintConvInt2 IN [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]) THEN BEGIN
                IF (lcharCurrentCharSet <> 'C') THEN BEGIN
                    IF (lintCount1 = 1) THEN BEGIN
                        lrecTmpCode128.GET('STARTC');
                        EVALUATE(lintConvInt, lrecTmpCode128.Value);
                        lintWeightSum := lintConvInt;
                    END ELSE BEGIN
                        lrecTmpCode128.GET('CODEC');
                        EVALUATE(lintConvInt, lrecTmpCode128.Value);
                        lintWeightSum += lintConvInt * lintCount2;
                        lintCount2 += 1;
                    END;

                    bxtBarcodeBinary.ADDTEXT(FORMAT(lrecTmpCode128.Encoding));
                    lcharCurrentCharSet := 'C';
                END;
            END ELSE BEGIN
                IF lcharCurrentCharSet <> 'A' THEN BEGIN
                    IF (lintCount1 = 1) THEN BEGIN
                        lrecTmpCode128.GET('STARTA');
                        EVALUATE(lintConvInt, lrecTmpCode128.Value);
                        lintWeightSum := lintConvInt;
                    END ELSE BEGIN
                        //CODEA
                        lrecTmpCode128.GET('FNC4');
                        EVALUATE(lintConvInt, lrecTmpCode128.Value);
                        lintWeightSum += lintConvInt * lintCount2;
                        lintCount2 += 1;
                    END;

                    bxtBarcodeBinary.ADDTEXT(FORMAT(lrecTmpCode128.Encoding));
                    lcharCurrentCharSet := 'A';
                END;
            END;

            CASE lcharCurrentCharSet OF
                'A':
                    BEGIN
                        lrecTmpCode128.GET(FORMAT(pcodBarcode[lintCount1]));

                        EVALUATE(lintConvInt, lrecTmpCode128.Value);

                        lintWeightSum += lintConvInt * lintCount2;
                        bxtBarcodeBinary.ADDTEXT(FORMAT(lrecTmpCode128.Encoding));
                    END;
                'C':
                    BEGIN
                        lrecTmpCode128.RESET;
                        lrecTmpCode128.SETCURRENTKEY(Value);
                        lrecTmpCode128.SETRANGE(Value, (FORMAT(pcodBarcode[lintCount1]) + FORMAT(pcodBarcode[lintCount1 + 1])));
                        lrecTmpCode128.FINDFIRST;

                        EVALUATE(lintConvInt, lrecTmpCode128.Value);
                        lintWeightSum += lintConvInt * lintCount2;

                        bxtBarcodeBinary.ADDTEXT(FORMAT(lrecTmpCode128.Encoding));
                        lintCount1 += 1;
                    END;
            END;
        END;

        lintCheckDigit := lintWeightSum MOD 103;

        //ADD CHECK DIGIT
        lrecTmpCode128.RESET;
        lrecTmpCode128.SETCURRENTKEY(Value);

        IF lintCheckDigit <= 9 THEN
            lrecTmpCode128.SETRANGE(Value, '0' + FORMAT(lintCheckDigit))
        ELSE
            lrecTmpCode128.SETRANGE(Value, FORMAT(lintCheckDigit));

        lrecTmpCode128.FINDFIRST;
        bxtBarcodeBinary.ADDTEXT(FORMAT(lrecTmpCode128.Encoding));

        //ADD STOP CHARACTER
        lrecTmpCode128.GET('STOP');
        bxtBarcodeBinary.ADDTEXT(FORMAT(lrecTmpCode128.Encoding));

        //ADD TERMINATION BAR
        bxtBarcodeBinary.ADDTEXT(ltxtTerminationBar);

        lintBars := bxtBarcodeBinary.LENGTH;
        lintLines := ROUND(lintBars * 0.25, 1, '>');

        precTmpTempBlob.CREATEOUTSTREAM(loutBmpHeader);

        //WRITING HEADER
        CreateBMPHeader(loutBmpHeader, lintBars, lintLines, pintSize, pblnVertical);

        //WRITE BARCODE DETAIL
        CreateBarcodeDetail(lintLines, lintBars, pintSize, pblnVertical, loutBmpHeader);
    end;

    local procedure CreateBMPHeader(var poutBmpHeader: OutStream; pintCols: Integer; pintRows: Integer; pintSize: Integer; pblnVertical: Boolean)
    var
        charInf: Char;
        lintResolution: Integer;
        lintWidth: Integer;
        lintHeight: Integer;
    begin

        lintResolution := ROUND(2835 / pintSize, 1, '=');

        IF pblnVertical THEN BEGIN
            lintWidth := pintRows * pintSize;
            lintHeight := pintCols;
        END ELSE BEGIN
            lintWidth := pintCols * pintSize;
            lintHeight := pintRows * pintSize;
        END;

        charInf := 'B';
        poutBmpHeader.WRITE(charInf, 1);
        charInf := 'M';
        poutBmpHeader.WRITE(charInf, 1);
        poutBmpHeader.WRITE(54 + pintRows * pintCols * 3, 4); //SIZE BMP
        poutBmpHeader.WRITE(0, 4); //APPLICATION SPECIFIC
        poutBmpHeader.WRITE(54, 4); //OFFSET DATA PIXELS
        poutBmpHeader.WRITE(40, 4); //NUMBER OF BYTES IN HEADER FROM THIS POINT
        poutBmpHeader.WRITE(lintWidth, 4); //WIDTH PIXEL
        poutBmpHeader.WRITE(lintHeight, 4); //HEIGHT PIXEL
        poutBmpHeader.WRITE(65536 * 24 + 1, 4); //COLOR DEPTH
        poutBmpHeader.WRITE(0, 4); //NO. OF COLOR PANES & BITS PER PIXEL
        poutBmpHeader.WRITE(0, 4); //SIZE BMP DATA
        poutBmpHeader.WRITE(lintResolution, 4); //HORIZONTAL RESOLUTION
        poutBmpHeader.WRITE(lintResolution, 4); //VERTICAL RESOLUTION
        poutBmpHeader.WRITE(0, 4); //NO. OF COLORS IN PALETTE
        poutBmpHeader.WRITE(0, 4); //IMPORTANT COLORS
    end;

    local procedure CreateBarcodeDetail(pintLines: Integer; pintBars: Integer; pintSize: Integer; pblnVertical: Boolean; var poutBmpHeader: OutStream)
    var
        lintLineLoop: Integer;
        lintBarLoop: Integer;
        ltxtByte: Text[1];
        lchar: Char;
        lintChainFiller: Integer;
        lintSize: Integer;
        lintCount: Integer;
    begin
        IF pblnVertical THEN BEGIN
            FOR lintBarLoop := 1 TO (bxtBarcodeBinary.LENGTH) DO BEGIN

                FOR lintLineLoop := 1 TO (pintLines * pintSize) DO BEGIN
                    bxtBarcodeBinary.GETSUBTEXT(ltxtByte, lintBarLoop, 1);

                    IF ltxtByte = '1' THEN
                        lchar := 0
                    ELSE
                        lchar := 160;

                    poutBmpHeader.WRITE(lchar, 1);
                    poutBmpHeader.WRITE(lchar, 1);
                    poutBmpHeader.WRITE(lchar, 1);
                END;

                FOR lintChainFiller := 1 TO (lintLineLoop MOD 4) DO BEGIN
                    //Adding 0 bytes if needed - line end
                    lchar := 0;
                    poutBmpHeader.WRITE(lchar, 1);
                END;
            END;
        END ELSE BEGIN
            FOR lintLineLoop := 1 TO pintLines * pintSize DO BEGIN
                FOR lintBarLoop := 1 TO bxtBarcodeBinary.LENGTH DO BEGIN
                    bxtBarcodeBinary.GETSUBTEXT(ltxtByte, lintBarLoop, 1);

                    IF ltxtByte = '1' THEN
                        lchar := 0
                    ELSE
                        lchar := 160;

                    FOR lintSize := 1 TO pintSize DO BEGIN
                        //Putting Pixel: Black or White
                        poutBmpHeader.WRITE(lchar, 1);
                        poutBmpHeader.WRITE(lchar, 1);
                        poutBmpHeader.WRITE(lchar, 1);
                    END
                END;

                FOR lintChainFiller := 1 TO ((lintBarLoop * pintSize) MOD 4) DO BEGIN
                    //Adding 0 bytes if needed - line end
                    lchar := 0;
                    poutBmpHeader.WRITE(lchar, 1);
                END;
            END;
        END
    end;

    local procedure InitCode128(var precTmpCode128: Record 50005 temporary)
    begin
        precTmpCode128.INIT;
        precTmpCode128.CharA := ' ';
        precTmpCode128.CharB := ' ';
        precTmpCode128.CharC := ' ';
        precTmpCode128.Value := '00';
        precTmpCode128.Encoding := '11011001100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '!';
        precTmpCode128.CharB := '!';
        precTmpCode128.CharC := '01';
        precTmpCode128.Value := '01';
        precTmpCode128.Encoding := '11001101100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '"';
        precTmpCode128.CharB := '"';
        precTmpCode128.CharC := '02';
        precTmpCode128.Value := '02';
        precTmpCode128.Encoding := '11001100110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '#';
        precTmpCode128.CharB := '#';
        precTmpCode128.CharC := '03';
        precTmpCode128.Value := '03';
        precTmpCode128.Encoding := '10010011000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '$';
        precTmpCode128.CharB := '$';
        precTmpCode128.CharC := '04';
        precTmpCode128.Value := '04';
        precTmpCode128.Encoding := '10010001100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '%';
        precTmpCode128.CharB := '%';
        precTmpCode128.CharC := '05';
        precTmpCode128.Value := '05';
        precTmpCode128.Encoding := '10001001100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '&';
        precTmpCode128.CharB := '&';
        precTmpCode128.CharC := '06';
        precTmpCode128.Value := '06';
        precTmpCode128.Encoding := '10011001000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '''';
        precTmpCode128.CharB := '''';
        precTmpCode128.CharC := '07';
        precTmpCode128.Value := '07';
        precTmpCode128.Encoding := '10011000100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '(';
        precTmpCode128.CharB := '(';
        precTmpCode128.CharC := '08';
        precTmpCode128.Value := '08';
        precTmpCode128.Encoding := '10001100100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := ')';
        precTmpCode128.CharB := ')';
        precTmpCode128.CharC := '09';
        precTmpCode128.Value := '09';
        precTmpCode128.Encoding := '11001001000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '*';
        precTmpCode128.CharB := '*';
        precTmpCode128.CharC := '10';
        precTmpCode128.Value := '10';
        precTmpCode128.Encoding := '11001000100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '+';
        precTmpCode128.CharB := '+';
        precTmpCode128.CharC := '11';
        precTmpCode128.Value := '11';
        precTmpCode128.Encoding := '11000100100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := ',';
        precTmpCode128.CharB := ',';
        precTmpCode128.CharC := '12';
        precTmpCode128.Value := '12';
        precTmpCode128.Encoding := '10110011100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '-';
        precTmpCode128.CharB := '-';
        precTmpCode128.CharC := '13';
        precTmpCode128.Value := '13';
        precTmpCode128.Encoding := '10011011100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '.';
        precTmpCode128.CharB := '.';
        precTmpCode128.CharC := '14';
        precTmpCode128.Value := '14';
        precTmpCode128.Encoding := '10011001110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '/';
        precTmpCode128.CharB := '/';
        precTmpCode128.CharC := '15';
        precTmpCode128.Value := '15';
        precTmpCode128.Encoding := '10111001100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '0';
        precTmpCode128.CharB := '0';
        precTmpCode128.CharC := '16';
        precTmpCode128.Value := '16';
        precTmpCode128.Encoding := '10011101100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '1';
        precTmpCode128.CharB := '1';
        precTmpCode128.CharC := '17';
        precTmpCode128.Value := '17';
        precTmpCode128.Encoding := '10011100110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '2';
        precTmpCode128.CharB := '2';
        precTmpCode128.CharC := '18';
        precTmpCode128.Value := '18';
        precTmpCode128.Encoding := '11001110010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '3';
        precTmpCode128.CharB := '3';
        precTmpCode128.CharC := '19';
        precTmpCode128.Value := '19';
        precTmpCode128.Encoding := '11001011100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '4';
        precTmpCode128.CharB := '4';
        precTmpCode128.CharC := '20';
        precTmpCode128.Value := '20';
        precTmpCode128.Encoding := '11001001110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '5';
        precTmpCode128.CharB := '5';
        precTmpCode128.CharC := '21';
        precTmpCode128.Value := '21';
        precTmpCode128.Encoding := '11011100100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '6';
        precTmpCode128.CharB := '6';
        precTmpCode128.CharC := '22';
        precTmpCode128.Value := '22';
        precTmpCode128.Encoding := '11001110100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '7';
        precTmpCode128.CharB := '7';
        precTmpCode128.CharC := '23';
        precTmpCode128.Value := '23';
        precTmpCode128.Encoding := '11101101110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '8';
        precTmpCode128.CharB := '8';
        precTmpCode128.CharC := '24';
        precTmpCode128.Value := '24';
        precTmpCode128.Encoding := '11101001100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '9';
        precTmpCode128.CharB := '9';
        precTmpCode128.CharC := '25';
        precTmpCode128.Value := '25';
        precTmpCode128.Encoding := '11100101100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := ':';
        precTmpCode128.CharB := ':';
        precTmpCode128.CharC := '26';
        precTmpCode128.Value := '26';
        precTmpCode128.Encoding := '11100100110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := ';';
        precTmpCode128.CharB := ';';
        precTmpCode128.CharC := '27';
        precTmpCode128.Value := '27';
        precTmpCode128.Encoding := '11101100100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '<';
        precTmpCode128.CharB := '<';
        precTmpCode128.CharC := '28';
        precTmpCode128.Value := '28';
        precTmpCode128.Encoding := '11100110100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '=';
        precTmpCode128.CharB := '=';
        precTmpCode128.CharC := '29';
        precTmpCode128.Value := '29';
        precTmpCode128.Encoding := '11100110010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '>';
        precTmpCode128.CharB := '>';
        precTmpCode128.CharC := '30';
        precTmpCode128.Value := '30';
        precTmpCode128.Encoding := '11011011000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '?';
        precTmpCode128.CharB := '?';
        precTmpCode128.CharC := '31';
        precTmpCode128.Value := '31';
        precTmpCode128.Encoding := '11011000110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '@';
        precTmpCode128.CharB := '@';
        precTmpCode128.CharC := '32';
        precTmpCode128.Value := '32';
        precTmpCode128.Encoding := '11000110110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'A';
        precTmpCode128.CharB := 'A';
        precTmpCode128.CharC := '33';
        precTmpCode128.Value := '33';
        precTmpCode128.Encoding := '10100011000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'B';
        precTmpCode128.CharB := 'B';
        precTmpCode128.CharC := '34';
        precTmpCode128.Value := '34';
        precTmpCode128.Encoding := '10001011000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'C';
        precTmpCode128.CharB := 'C';
        precTmpCode128.CharC := '35';
        precTmpCode128.Value := '35';
        precTmpCode128.Encoding := '10001000110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'D';
        precTmpCode128.CharB := 'D';
        precTmpCode128.CharC := '36';
        precTmpCode128.Value := '36';
        precTmpCode128.Encoding := '10110001000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'E';
        precTmpCode128.CharB := 'E';
        precTmpCode128.CharC := '37';
        precTmpCode128.Value := '37';
        precTmpCode128.Encoding := '10001101000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'F';
        precTmpCode128.CharB := 'F';
        precTmpCode128.CharC := '38';
        precTmpCode128.Value := '38';
        precTmpCode128.Encoding := '10001100010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'G';
        precTmpCode128.CharB := 'G';
        precTmpCode128.CharC := '39';
        precTmpCode128.Value := '39';
        precTmpCode128.Encoding := '11010001000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'H';
        precTmpCode128.CharB := 'H';
        precTmpCode128.CharC := '40';
        precTmpCode128.Value := '40';
        precTmpCode128.Encoding := '11000101000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'I';
        precTmpCode128.CharB := 'I';
        precTmpCode128.CharC := '41';
        precTmpCode128.Value := '41';
        precTmpCode128.Encoding := '11000100010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'J';
        precTmpCode128.CharB := 'J';
        precTmpCode128.CharC := '42';
        precTmpCode128.Value := '42';
        precTmpCode128.Encoding := '10110111000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'K';
        precTmpCode128.CharB := 'K';
        precTmpCode128.CharC := '43';
        precTmpCode128.Value := '43';
        precTmpCode128.Encoding := '10110001110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'L';
        precTmpCode128.CharB := 'L';
        precTmpCode128.CharC := '44';
        precTmpCode128.Value := '44';
        precTmpCode128.Encoding := '10001101110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'M';
        precTmpCode128.CharB := 'M';
        precTmpCode128.CharC := '45';
        precTmpCode128.Value := '45';
        precTmpCode128.Encoding := '10111011000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'N';
        precTmpCode128.CharB := 'N';
        precTmpCode128.CharC := '46';
        precTmpCode128.Value := '46';
        precTmpCode128.Encoding := '10111000110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'O';
        precTmpCode128.CharB := 'O';
        precTmpCode128.CharC := '47';
        precTmpCode128.Value := '47';
        precTmpCode128.Encoding := '10001110110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'P';
        precTmpCode128.CharB := 'P';
        precTmpCode128.CharC := '48';
        precTmpCode128.Value := '48';
        precTmpCode128.Encoding := '11101110110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'Q';
        precTmpCode128.CharB := 'Q';
        precTmpCode128.CharC := '49';
        precTmpCode128.Value := '49';
        precTmpCode128.Encoding := '11010001110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'R';
        precTmpCode128.CharB := 'R';
        precTmpCode128.CharC := '50';
        precTmpCode128.Value := '50';
        precTmpCode128.Encoding := '11000101110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'S';
        precTmpCode128.CharB := 'S';
        precTmpCode128.CharC := '51';
        precTmpCode128.Value := '51';
        precTmpCode128.Encoding := '11011101000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'T';
        precTmpCode128.CharB := 'T';
        precTmpCode128.CharC := '52';
        precTmpCode128.Value := '52';
        precTmpCode128.Encoding := '11011100010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'U';
        precTmpCode128.CharB := 'U';
        precTmpCode128.CharC := '53';
        precTmpCode128.Value := '53';
        precTmpCode128.Encoding := '11011101110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'V';
        precTmpCode128.CharB := 'V';
        precTmpCode128.CharC := '54';
        precTmpCode128.Value := '54';
        precTmpCode128.Encoding := '11101011000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'W';
        precTmpCode128.CharB := 'W';
        precTmpCode128.CharC := '55';
        precTmpCode128.Value := '55';
        precTmpCode128.Encoding := '11101000110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'X';
        precTmpCode128.CharB := 'X';
        precTmpCode128.CharC := '56';
        precTmpCode128.Value := '56';
        precTmpCode128.Encoding := '11100010110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'Y';
        precTmpCode128.CharB := 'Y';
        precTmpCode128.CharC := '57';
        precTmpCode128.Value := '57';
        precTmpCode128.Encoding := '11101101000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'Z';
        precTmpCode128.CharB := 'Z';
        precTmpCode128.CharC := '58';
        precTmpCode128.Value := '58';
        precTmpCode128.Encoding := '11101100010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '[';
        precTmpCode128.CharB := '[';
        precTmpCode128.CharC := '59';
        precTmpCode128.Value := '59';
        precTmpCode128.Encoding := '11100011010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '\';
        precTmpCode128.CharB := '\';
        precTmpCode128.CharC := '60';
        precTmpCode128.Value := '60';
        precTmpCode128.Encoding := '11101111010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := ']';
        precTmpCode128.CharB := ']';
        precTmpCode128.CharC := '61';
        precTmpCode128.Value := '61';
        precTmpCode128.Encoding := '11001000010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '^';
        precTmpCode128.CharB := '^';
        precTmpCode128.CharC := '62';
        precTmpCode128.Value := '62';
        precTmpCode128.Encoding := '11110001010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := '_';
        precTmpCode128.CharB := '_';
        precTmpCode128.CharC := '63';
        precTmpCode128.Value := '63';
        precTmpCode128.Encoding := '10100110000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'NUL';
        precTmpCode128.CharB := '`';
        precTmpCode128.CharC := '64';
        precTmpCode128.Value := '64';
        precTmpCode128.Encoding := '10100001100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'SOH';
        precTmpCode128.CharB := 'a';
        precTmpCode128.CharC := '65';
        precTmpCode128.Value := '65';
        precTmpCode128.Encoding := '10010110000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'STX';
        precTmpCode128.CharB := 'b';
        precTmpCode128.CharC := '66';
        precTmpCode128.Value := '66';
        precTmpCode128.Encoding := '10010000110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'ETX';
        precTmpCode128.CharB := 'c';
        precTmpCode128.CharC := '67';
        precTmpCode128.Value := '67';
        precTmpCode128.Encoding := '10000101100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'EOT';
        precTmpCode128.CharB := 'd';
        precTmpCode128.CharC := '68';
        precTmpCode128.Value := '68';
        precTmpCode128.Encoding := '10000100110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'ENQ';
        precTmpCode128.CharB := 'e';
        precTmpCode128.CharC := '69';
        precTmpCode128.Value := '69';
        precTmpCode128.Encoding := '10110010000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'ACK';
        precTmpCode128.CharB := 'f';
        precTmpCode128.CharC := '70';
        precTmpCode128.Value := '70';
        precTmpCode128.Encoding := '10110000100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'BEL';
        precTmpCode128.CharB := 'g';
        precTmpCode128.CharC := '71';
        precTmpCode128.Value := '71';
        precTmpCode128.Encoding := '10011010000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'BS';
        precTmpCode128.CharB := 'h';
        precTmpCode128.CharC := '72';
        precTmpCode128.Value := '72';
        precTmpCode128.Encoding := '10011000010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'HT';
        precTmpCode128.CharB := 'i';
        precTmpCode128.CharC := '73';
        precTmpCode128.Value := '73';
        precTmpCode128.Encoding := '10000110100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'LF';
        precTmpCode128.CharB := 'j';
        precTmpCode128.CharC := '74';
        precTmpCode128.Value := '74';
        precTmpCode128.Encoding := '10000110010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'VT';
        precTmpCode128.CharB := 'k';
        precTmpCode128.CharC := '75';
        precTmpCode128.Value := '75';
        precTmpCode128.Encoding := '11000010010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'FF';
        precTmpCode128.CharB := 'l';
        precTmpCode128.CharC := '76';
        precTmpCode128.Value := '76';
        precTmpCode128.Encoding := '11001010000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'CR';
        precTmpCode128.CharB := 'm';
        precTmpCode128.CharC := '77';
        precTmpCode128.Value := '77';
        precTmpCode128.Encoding := '11110111010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'SO';
        precTmpCode128.CharB := 'n';
        precTmpCode128.CharC := '78';
        precTmpCode128.Value := '78';
        precTmpCode128.Encoding := '11000010100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'SI';
        precTmpCode128.CharB := 'o';
        precTmpCode128.CharC := '79';
        precTmpCode128.Value := '79';
        precTmpCode128.Encoding := '10001111010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'DLE';
        precTmpCode128.CharB := 'p';
        precTmpCode128.CharC := '80';
        precTmpCode128.Value := '80';
        precTmpCode128.Encoding := '10100111100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'DC1';
        precTmpCode128.CharB := 'q';
        precTmpCode128.CharC := '81';
        precTmpCode128.Value := '81';
        precTmpCode128.Encoding := '10010111100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'DC2';
        precTmpCode128.CharB := 'r';
        precTmpCode128.CharC := '82';
        precTmpCode128.Value := '82';
        precTmpCode128.Encoding := '10010011110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'DC3';
        precTmpCode128.CharB := 's';
        precTmpCode128.CharC := '83';
        precTmpCode128.Value := '83';
        precTmpCode128.Encoding := '10111100100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'DC4';
        precTmpCode128.CharB := 't';
        precTmpCode128.CharC := '84';
        precTmpCode128.Value := '84';
        precTmpCode128.Encoding := '10011110100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'NAK';
        precTmpCode128.CharB := 'u';
        precTmpCode128.CharC := '85';
        precTmpCode128.Value := '85';
        precTmpCode128.Encoding := '10011110010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'SYN';
        precTmpCode128.CharB := 'v';
        precTmpCode128.CharC := '86';
        precTmpCode128.Value := '86';
        precTmpCode128.Encoding := '11110100100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'ETB';
        precTmpCode128.CharB := 'w';
        precTmpCode128.CharC := '87';
        precTmpCode128.Value := '87';
        precTmpCode128.Encoding := '11110010100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'CAN';
        precTmpCode128.CharB := 'x';
        precTmpCode128.CharC := '88';
        precTmpCode128.Value := '88';
        precTmpCode128.Encoding := '11110010010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'EM';
        precTmpCode128.CharB := 'y';
        precTmpCode128.CharC := '89';
        precTmpCode128.Value := '89';
        precTmpCode128.Encoding := '11011011110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'SUB';
        precTmpCode128.CharB := 'z';
        precTmpCode128.CharC := '90';
        precTmpCode128.Value := '90';
        precTmpCode128.Encoding := '11011110110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'ESC';
        precTmpCode128.CharB := '{';
        precTmpCode128.CharC := '91';
        precTmpCode128.Value := '91';
        precTmpCode128.Encoding := '11110110110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'FS';
        precTmpCode128.CharB := '|';
        precTmpCode128.CharC := '92';
        precTmpCode128.Value := '92';
        precTmpCode128.Encoding := '10101111000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'GS';
        precTmpCode128.CharB := '}';
        precTmpCode128.CharC := '93';
        precTmpCode128.Value := '93';
        precTmpCode128.Encoding := '10100011110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'RS';
        precTmpCode128.CharB := '~';
        precTmpCode128.CharC := '94';
        precTmpCode128.Value := '94';
        precTmpCode128.Encoding := '10001011110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'US';
        precTmpCode128.CharB := 'DEL';
        precTmpCode128.CharC := '95';
        precTmpCode128.Value := '95';
        precTmpCode128.Encoding := '10111101000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'FNC3';
        precTmpCode128.CharB := 'FNC3';
        precTmpCode128.CharC := '96';
        precTmpCode128.Value := '96';
        precTmpCode128.Encoding := '10111100010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'FNC2';
        precTmpCode128.CharB := 'FNC2';
        precTmpCode128.CharC := '97';
        precTmpCode128.Value := '97';
        precTmpCode128.Encoding := '11110101000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'SHIFT';
        precTmpCode128.CharB := 'SHIFT';
        precTmpCode128.CharC := '98';
        precTmpCode128.Value := '98';
        precTmpCode128.Encoding := '11110100010';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'CODEC';
        precTmpCode128.CharB := 'CODEC';
        precTmpCode128.CharC := '99';
        precTmpCode128.Value := '99';
        precTmpCode128.Encoding := '10111011110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'CODEB';
        precTmpCode128.CharB := 'FNC4';
        precTmpCode128.CharC := 'CODEB';
        precTmpCode128.Value := '100';
        precTmpCode128.Encoding := '10111101110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'FNC4';
        precTmpCode128.CharB := 'CODEA';
        precTmpCode128.CharC := 'CODEA';
        precTmpCode128.Value := '101';
        precTmpCode128.Encoding := '11101011110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'FNC1';
        precTmpCode128.CharB := 'FNC1';
        precTmpCode128.CharC := 'FNC1';
        precTmpCode128.Value := '102';
        precTmpCode128.Encoding := '11110101110';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'STARTA';
        precTmpCode128.CharB := 'STARTA';
        precTmpCode128.CharC := 'STARTA';
        precTmpCode128.Value := '103';
        precTmpCode128.Encoding := '11010000100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'STARTB';
        precTmpCode128.CharB := 'STARTB';
        precTmpCode128.CharC := 'STARTB';
        precTmpCode128.Value := '104';
        precTmpCode128.Encoding := '11010010000';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'STARTC';
        precTmpCode128.CharB := 'STARTC';
        precTmpCode128.CharC := 'STARTC';
        precTmpCode128.Value := '105';
        precTmpCode128.Encoding := '11010011100';
        precTmpCode128.INSERT;

        precTmpCode128.INIT;
        precTmpCode128.CharA := 'STOP';
        precTmpCode128.CharB := 'STOP';
        precTmpCode128.CharC := 'STOP';
        precTmpCode128.Value := '';
        precTmpCode128.Encoding := '11000111010';
        precTmpCode128.INSERT;
    end;
}

