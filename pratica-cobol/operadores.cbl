      ******************************************************************
      * Author:Thiago Souza
      * Date:23/03/2025
      * Purpose:Uso de OPERADORES
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. OPERADORES.
      *
       DATA DIVISION.
      *
           WORKING-STORAGE SECTION.
               01 WS-SALARIO           PIC 9(05)V99 VALUE ZEROS.
               01 WS-FALTAS            PIC 9(02)    VALUE ZEROS.
               01 WS-SALARIO-NOVO      PIC 9(06)V99 VALUE ZEROS.
      *
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "SALARIO ".
               ACCEPT WS-SALARIO.

            DISPLAY "FALTAS NO MES ".
               ACCEPT WS-FALTAS.


            IF WS-SALARIO LESS THAN OR EQUAL 2000 AND
                WS-FALTAS EQUAL 0

               COMPUTE WS-SALARIO-NOVO = WS-SALARIO * 1.10

            ELSE

                COMPUTE WS-SALARIO-NOVO = WS-SALARIO

            END-IF.

            DISPLAY "SALARIO ATUALIZADO: "WS-SALARIO-NOVO.

            STOP RUN.
       END PROGRAM OPERADORES.
