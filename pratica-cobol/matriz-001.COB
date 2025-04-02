      ******************************************************************
      * Author:Thiago Souza
      * Date:02/04/2025
      * Purpose:Uso de Matriz
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MATRIZ-001.
      *
       DATA DIVISION.
      *
           WORKING-STORAGE SECTION.
           01 WS-MATRIZ.
               05 WS-ALUNO             OCCURS 2        TIMES.
                   10 WS-NOTA          OCCURS 3        TIMES.
                       15 WS-DADOS     PIC X(15)       VALUE SPACES.

           01 WS-IN1                   PIC 9           VALUE ZEROS.
           01 WS-IN2                   PIC 9           VALUE ZEROS.

           01 WS-MEDIA                 PIC 9(02)V99    VALUE ZEROS.

           01 WS-BIMESTRE              PIC 9(02)V99    VALUE ZEROS.
      *
       PROCEDURE DIVISION.
      *
       MAIN-PROCEDURE.
            PERFORM VARYING WS-IN1 FROM 1 BY 1 UNTIL WS-IN1 > 2
               DISPLAY "NOME DO ALUNO: "
               ACCEPT WS-DADOS(WS-IN1,1)

               PERFORM VARYING WS-IN2 FROM 2 BY 1 UNTIL WS-IN2 > 3
                   DISPLAY "NOTA DO ALUNO: "
                   ACCEPT WS-DADOS(WS-IN1,WS-IN2)
               END-PERFORM

               DISPLAY"=-=-=-=-=-=-=-=-=-=-=-="
            END-PERFORM.

            PERFORM VARYING WS-IN1 FROM 1 BY 1 UNTIL WS-IN1 > 2
               DISPLAY "NOME DO ALUNO: ", WS-DADOS(WS-IN1,1)
               MOVE 0 TO WS-MEDIA

               PERFORM VARYING WS-IN2 FROM 2 BY 1 UNTIL WS-IN2 > 3
                   DISPLAY "NOTA DO ALUNO: ",WS-DADOS(WS-IN1,WS-IN2)
                   MOVE WS-DADOS(WS-IN1,WS-IN2) TO WS-BIMESTRE
                   COMPUTE WS-MEDIA = WS-MEDIA + WS-BIMESTRE
               END-PERFORM

               DISPLAY"=-=-=-=-=-=-=-=-=-=-=-="

               COMPUTE WS-MEDIA = WS-MEDIA / 2
               DISPLAY "SUA MEDIA: "WS-MEDIA
               DISPLAY"=-=-=-=-=-=-=-=-=-=-=-="
            END-PERFORM.
            STOP RUN.
       END PROGRAM MATRIZ-001.
