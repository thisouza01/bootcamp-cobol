      ******************************************************************
      * Author:Thiago
      * Date: 15/05/2025
      * Purpose: Programa de pagamento de contas
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION          DIVISION.
       PROGRAM-ID. PAGAMENTO-CONTA.
      ******************************************************************
       ENVIRONMENT             DIVISION.
       CONFIGURATION           SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      ******************************************************************
       DATA                    DIVISION.
       WORKING-STORAGE         SECTION.
       77  WS-SALDO-INI            PIC 9(06)V99   VALUE ZEROS.
       77  WS-SALDO-INI-EDT        PIC ZZZ.ZZ9,99.
       77  WS-SALDO-FINAL          PIC 9(08)V99   VALUE ZEROS.
       77  WS-SALDO-FINAL-EDT      PIC ZZ.ZZZ.ZZ9,99.
       77  WS-PAGAMENTO            PIC 9(06)V99   VALUE ZEROS.
       77  WS-ACUM-PAG             PIC 9(06)V99   VALUE ZEROS.
       77  WS-ACUM-PAG-EDT         PIC ZZZ.ZZ9,99.

       77  WS-FIM-PAG              PIC A          VALUE "N".
      ******************************************************************
       PROCEDURE               DIVISION.
       0000-PRINCIPAL          SECTION.
       0001-PRINCIPAL.
           PERFORM 0110-INICIAR.
           PERFORM 0210-PAGAMENTO.
           PERFORM 0220-CALCULA-SALDO.
           PERFORM 0310-MOSTRA-SALDO.
           STOP RUN.
      *
       0100-INICIAR            SECTION.
       0110-INICIAR.
           DISPLAY "Saldo inicial: ".
           ACCEPT WS-SALDO-INI.

           MOVE ZEROS TO WS-ACUM-PAG.
      *
       0200-PROCESSAR          SECTION.
       0210-PAGAMENTO.
           PERFORM UNTIL WS-FIM-PAG EQUAL "S"
               DISPLAY "Informe o valor de pagamento: "
               ACCEPT WS-PAGAMENTO

               ADD WS-PAGAMENTO TO WS-ACUM-PAG

               IF WS-PAGAMENTO EQUAL 0
                   MOVE "S" TO WS-FIM-PAG
               END-IF
           END-PERFORM.
      *
       0220-CALCULA-SALDO.
           COMPUTE WS-SALDO-FINAL = WS-SALDO-INI - WS-ACUM-PAG.
      *
       0300-FINALIZAR          SECTION.
       0310-MOSTRA-SALDO.
           MOVE WS-SALDO-INI   TO WS-SALDO-INI-EDT.
           MOVE WS-ACUM-PAG    TO WS-ACUM-PAG-EDT.
           MOVE WS-SALDO-FINAL TO WS-SALDO-FINAL-EDT.
           DISPLAY "==================================================".
           DISPLAY "Saldo inicial: " WS-SALDO-INI-EDT.
           DISPLAY "Pagamentos: "    WS-ACUM-PAG-EDT.
           DISPLAY "Saldo final: "   WS-SALDO-FINAL-EDT.
           DISPLAY "==================================================".
