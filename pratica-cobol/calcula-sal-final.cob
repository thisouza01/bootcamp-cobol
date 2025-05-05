      ******************************************************************
      * Author:Thiago
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULA-SAL-FINAL.
      ******************************************************************      
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-SALARIO-BRUTO             PIC 9(06)V99   VALUE ZEROS.  
       77  WS-IR                        PIC 9999V99    VALUE ZEROS.  
       77  WS-SALARIO-FINAL             PIC 9(06)V99   VALUE ZEROS.
      ******************************************************************       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "QUAL O VALOR DO SALARIO: ".
           ACCEPT WS-SALARIO-BRUTO.
           IF WS-SALARIO-BRUTO > 1000
               COMPUTE WS-IR = WS-SALARIO-BRUTO * 0.15
           ELSE
               COMPUTE WS-IR = WS-SALARIO-BRUTO * 0.10       
           END-IF.
           COMPUTE WS-SALARIO-FINAL = WS-SALARIO-BRUTO - WS-IR
           DISPLAY "SALARIO BRUTO   : " WS-SALARIO-BRUTO.
           DISPLAY "IR              : " WS-IR.
           DISPLAY "SALARIO FINAL EH: " WS-SALARIO-FINAL.
           STOP RUN.
       END PROGRAM CALCULA-SAL-FINAL.