      ******************************************************************
      * Author:Thiago
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULA-VALOR-VIAGEM.
      ******************************************************************      
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-NOME             PIC X(10)    VALUE SPACES.
       77  WS-CIDADE           PIC 9        VALUE ZEROS.
       77  WS-VALOR-GAS        PIC 9V99     VALUE ZEROS.
       77  WS-VALOR-VIAGEM     PIC 9(05)V99 VALUE ZEROS.
      ******************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "NOME: ".
           ACCEPT WS-NOME.
           DISPLAY "CIDADE 1-PIRACICABA, 2-CAMPINAS, 3-JUNDIAI: ".
           ACCEPT WS-CIDADE.
           DISPLAY "VALOR GASOLINA: ".
           ACCEPT WS-VALOR-GAS.
           
           EVALUATE WS-CIDADE
               WHEN 1
                   COMPUTE WS-VALOR-VIAGEM = 
                            ((220 / 10) * WS-VALOR-GAS) * 1.30
               WHEN 2
                   COMPUTE WS-VALOR-VIAGEM = 
                            ((180 / 10) * WS-VALOR-GAS) * 1.30
               WHEN 3
                   COMPUTE WS-VALOR-VIAGEM = 
                            ((120 / 10) * WS-VALOR-GAS) * 1.30
           END-EVALUATE.
           DISPLAY "VALOR VIAGEM: "WS-VALOR-VIAGEM.
            STOP RUN.
       END PROGRAM CALCULA-VALOR-VIAGEM.

