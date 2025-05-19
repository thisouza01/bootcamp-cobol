      ******************************************************************
      * Author:Thiago
      * Date:19/05/2025
      * Purpose: Calcular capital final
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION          DIVISION.
      *
       PROGRAM-ID. CALC-CAPITAL-FINAL.
      ******************************************************************
       ENVIRONMENT             DIVISION.
      *
       CONFIGURATION           SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      ******************************************************************
       DATA                    DIVISION.
      *
       WORKING-STORAGE         SECTION.
       77  WS-CAPITAL-INI      PIC 9(05)V99        VALUE ZEROS.
       77  WS-CAPITAL-FIN      PIC 9(05)V99        VALUE ZEROS.
       77  WS-TX-JUROS         PIC 99V99           VALUE ZEROS.
       77  WS-MESES            PIC 99              VALUE ZEROS.
       77  WS-CONT             PIC 99              VALUE 1.
      ******************************************************************
       PROCEDURE               DIVISION.
       0000-PRINCIPAL          SECTION.
       0001-PRINCIPAL.
           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR WS-MESES TIMES.
           PERFORM 0400-FINALIZAR.
           STOP RUN.
      ******************************************************************
       0100-INICIAR            SECTION.
       0101-INICIAR.
           DISPLAY "CAPITAL INICIAL: ".
           ACCEPT WS-CAPITAL-INI.

           DISPLAY "TAXA DE JUROS (EX: 0,XX) ".
           ACCEPT WS-TX-JUROS.

           DISPLAY "QUANTIDADE DE MESES: ".
           ACCEPT WS-MESES.

           MOVE WS-CAPITAL-INI TO WS-CAPITAL-FIN.
       0100-INICIAR-FIM.       EXIT.
      ******************************************************************
       0200-PROCESSAR            SECTION.
       0210-PROCESSAR.
           COMPUTE WS-CAPITAL-FIN =
                   (WS-CAPITAL-FIN * WS-TX-JUROS) + WS-CAPITAL-FIN.

           ADD 1 TO WS-CONT.
       0200-PROCESSAR-FIM.       EXIT.
      ******************************************************************
       0400-FINALIZAR            SECTION.
       0410-FINALIZAR.
           DISPLAY " ".
           DISPLAY "CAPITAL INICIAL.........." WS-CAPITAL-INI.
           DISPLAY "CAPITAL FINAL............" WS-CAPITAL-FIN.
           DISPLAY "TAXA....................." WS-TX-JUROS.

       0400-FINALIZAR-FIM.       EXIT.
       END PROGRAM CALC-CAPITAL-FINAL.
