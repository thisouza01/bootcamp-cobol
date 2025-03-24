      ******************************************************************
      * Author:Thiago Souza
      * Date:24/03/2025
      * Purpose:Uso de VETORES
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. VETORES.
      *
       DATA DIVISION.
      *
           WORKING-STORAGE SECTION.
           01 WS-NOTAS.
               03 WS-NOTA          PIC 9(02)V99 OCCURS 4 TIMES.

           01 WS-MEDIA             PIC 9(02)V99 VALUE ZEROS.

           01 WS-INDICE          PIC 9        VALUE ZEROS.
      *
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM VARYING WS-INDICE FROM 1 BY 1 UNTIL WS-INDICE
                                                   GREATER THAN 4
               DISPLAY "DIGITE NOTA "WS-INDICE
                   ACCEPT WS-NOTA(WS-INDICE)

           END-PERFORM.

           PERFORM VARYING WS-INDICE FROM 1 BY 1 UNTIL WS-INDICE
                                                   GREATER THAN 4

               DISPLAY "NOTA "WS-INDICE ": " WS-NOTA(WS-INDICE)

               COMPUTE WS-MEDIA = WS-MEDIA + WS-NOTA(WS-INDICE)

           END-PERFORM.

           COMPUTE WS-MEDIA = WS-MEDIA / 4.

            DISPLAY "MEDIA FINAL: "WS-MEDIA.

           IF WS-MEDIA GREATER THAN OR EQUAL 7

               DISPLAY "APROVADO"

           ELSE

               DISPLAY "NOVA PROVA"

           END-IF.
            STOP RUN.
       END PROGRAM VETORES.
