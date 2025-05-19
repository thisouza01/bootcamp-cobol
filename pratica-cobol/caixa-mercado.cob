      ******************************************************************
      * Author:Thiago
      * Date:19/05/2025
      * Purpose: Simular caixa de mercado
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION          DIVISION.
      *
       PROGRAM-ID. CAIXA-MERCADO.
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
       01  PRODUTO.
           05  WS-NOME         PIC A(20)           VALUE SPACES.
           05  WS-VALOR        PIC 9(04)V99        VALUE ZEROS.

       01  TABELA-NOME.
           05 WS-TBL-NOME      PIC A(15)           OCCURS 10 TIMES.

       77  WS-INDICE           PIC 99              VALUE 1.
       77  WS-EXIBIR-INDICE    PIC 99              VALUE 1.

       77  WS-COND             PIC 9               VALUE ZEROS.
       77  WS-ACUM             PIC 9(05)V99        VALUE ZEROS.
      ******************************************************************
       PROCEDURE               DIVISION.
       0000-PRINCIPAL          SECTION.
       0001-PRINCIPAL.
           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR UNTIL WS-COND EQUAL 1.
           PERFORM 0400-FINALIZAR.
           STOP RUN.
      ******************************************************************
       0100-INICIAR            SECTION.
       0101-INICIAR.
           INITIALIZE PRODUTO.
       0100-INICIAR-FIM.       EXIT.
      ******************************************************************
       0200-PROCESSAR          SECTION.
       0201-PROCESSAR.
           DISPLAY "QUAL PRODUTO... ".
           ACCEPT WS-NOME.

           DISPLAY "QUAL VALOR..... ".
           ACCEPT WS-VALOR.

           IF WS-VALOR GREATER THAN 0
               ADD WS-VALOR TO WS-ACUM

               MOVE WS-NOME TO WS-TBL-NOME(WS-INDICE)

               ADD 1 TO WS-INDICE
           END-IF.

           DISPLAY "CONTINUA COMPRANDO (0 - SIM / 1 - NÃO ) ".
           ACCEPT WS-COND.
      *
       0300-EXIBIR-TABELA      SECTION.
           PERFORM VARYING WS-EXIBIR-INDICE FROM 1 BY 1
                   UNTIL WS-EXIBIR-INDICE >= WS-INDICE

               DISPLAY WS-TBL-NOME(WS-EXIBIR-INDICE)

           END-PERFORM.
       0300-EXIBIR-TABELA-FIM. EXIT.
       0200-PROCESSAR-FIM.     EXIT.
      ******************************************************************
       0400-FINALIZAR          SECTION.
       0401-FINALIZAR.
           DISPLAY "---------------------------------------".
           DISPLAY "---------- R E S U L T A D O ----------".
           DISPLAY "---------------------------------------".
           DISPLAY "PRODUTOS COMPRADOS.....................".
           PERFORM 0300-EXIBIR-TABELA.
           DISPLAY "TOTAL DA COMPRA............... " WS-ACUM.
       0400-FINALIZAR-FIM.     EXIT.
      ******************************************************************
       END PROGRAM CAIXA-MERCADO.
