      ******************************************************************
      * Author:Thiago Souza
      * Date:23/03/2025
      * Purpose:Uso de repetições PARA
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. REPETICOES-PARA.
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES.
               DECIMAL-POINT IS COMMA.
      *
       DATA DIVISION.
      *
           WORKING-STORAGE SECTION.
               01 WS-CAPITAL           PIC 9(04)V99 VALUE ZEROS.
               01 WS-TAXA              PIC 9(02)V99 VALUE ZEROS.
               01 WS-MESES             PIC 9(03)    VALUE ZEROS.
               01 WS-CONTADOR          PIC 9(03)    VALUE 1.
      *
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "CAPITAL DE ENTRADA ".
               ACCEPT WS-CAPITAL.

            DISPLAY "TAXA DE RENTABILIDADE AO MES ".
               ACCEPT WS-TAXA.

            DISPLAY "PERIODO EM MESES ".
               ACCEPT WS-MESES.

            PERFORM VARYING WS-CONTADOR FROM 1 BY 1 UNTIL WS-CONTADOR
                   GREATER THAN WS-MESES

               COMPUTE WS-CAPITAL = WS-CAPITAL + (WS-CAPITAL * WS-TAXA)

            END-PERFORM.

            DISPLAY WS-CAPITAL.

            STOP RUN.
       END PROGRAM REPETICOES-PARA.
