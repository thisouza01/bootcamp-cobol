      ******************************************************************
      * Author:Thiago  
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IMC.
      ******************************************************************       
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77  PESO         PIC 999V99      VALUE ZEROS.
       77  ALTURA       PIC 9V99        VALUE ZEROS.
       77  IMC          PIC 9(05)V99    VALUE ZEROS.
      ******************************************************************       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "QUAL SEU PESO: ".
           ACCEPT PESO.
           DISPLAY "QUAL SUA ALTURA: ".
           ACCEPT ALTURA.
           COMPUTE IMC = PESO / (ALTURA * ALTURA)
           DISPLAY "SEU IMC EH DE: " IMC
           STOP RUN.
       END PROGRAM IMC.

