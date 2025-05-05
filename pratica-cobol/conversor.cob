      ******************************************************************
      * Author:Thiago
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONVERSOR.
      ******************************************************************      
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  VALOR-DOLAR               PIC 9V99       VALUE ZEROS.
       77  QNT-DOLAR                 PIC 999        VALUE ZEROS.  
       77  REAIS                     PIC 9(06)V99   VALUE ZEROS.
      ******************************************************************       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "QUAL O VALOR DO DOLAR: ".
           ACCEPT VALOR-DOLAR.
           DISPLAY "QUANTOS DOLARES: ".
           ACCEPT QNT-DOLAR.
           COMPUTE REAIS = QNT-DOLAR * VALOR-DOLAR.
           DISPLAY QNT-DOLAR " DOLARES EM REAL EH: " REAIS.
           STOP RUN.
       END PROGRAM CONVERSOR.

