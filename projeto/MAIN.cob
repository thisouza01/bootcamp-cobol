      ******************************************************************
      * Author:Thiago Souza
      * Date:09/06/2025
      * Purpose:Projeto - Sistema de gestao de clientes(CRUD)
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION          DIVISION.
       PROGRAM-ID. MAIN.
      ******************************************************************
       ENVIRONMENT             DIVISION.
      *
       CONFIGURATION           SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *
       INPUT-OUTPUT            SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO "C:\projeto-bootcamp\clientes.dat"
               ORGANIZATION    IS INDEXED
               ACCESS MODE     IS DYNAMIC
               RECORD KEY      IS CHAVE-CLIENTES
               FILE STATUS     IS FS-CLIENTES.
      *
           SELECT RELATO ASSIGN TO "C:/projeto-bootcamp/relato.txt"
               ORGANIZATION    IS LINE SEQUENTIAL
               FILE STATUS     IS FS-RELATO.
      ******************************************************************
       DATA                    DIVISION.
      *
       FILE                    SECTION.
       FD  CLIENTES.
       01  REG-CLIENTES.
           05 CHAVE-CLIENTES.
               10 REG-TELEFONE     PIC 9(09).
           05 REG-NOME             PIC A(30).
           05 REG-EMAIL            PIC X(40).

       FD  RELATO.
       01  REG-RELATO.
           05 RELATO-DADOS         PIC X(79).
      ******************************************************************
       WORKING-STORAGE         SECTION.
      *---> STATUS ARQUIVO
       01  FS-CLIENTES             PIC X(02) VALUE SPACES.
       01  FS-RELATO               PIC X(02) VALUE SPACES.

      *---> ABENDS
       77  WK-ABEND-MESSAGE        PIC X(40) VALUE SPACES.

      *---> TELA
       77  WK-OPCAO                PIC X     VALUE SPACES.
       77  WK-TECLA                PIC X     VALUE SPACES.


      *---> DATA
       01  DATA-ATUAL.
           05 DIA                  PIC 99    VALUE ZEROS.
           05 FILLER               PIC X     VALUE "/".
           05 MES                  PIC 99    VALUE ZEROS.
           05 FILLER               PIC X     VALUE "/".
           05 ANO                  PIC 9999  VALUE ZEROS.
      *
       SCREEN                  SECTION.
       01  TELA.
           05 LIMPA-TELA.
               10 BLANK SCREEN.
               10 LINE 01 COLUMN 01 PIC X(20) ERASE EOL
                  BACKGROUND-COLOR 5.
               10 LINE 01 COLUMN 15 PIC X(20)
                  BACKGROUND-COLOR 5
                  FROM "SISTEMA DE CLIENTES".
               10 LINE 03 COLUMN 02           VALUE "DATA: "
                   FOREGROUND-COLOR 7.
               10 LINE 03 COLUMN 08 PIC X(10) USING DATA-ATUAL
                   FOREGROUND-COLOR 7.
      *
       01  MENU-PRINCIPAL.
           05 LINE 07 COLUMN 15 VALUE "1 - INCLUIR".
           05 LINE 08 COLUMN 15 VALUE "2 - CONSULTAR".
           05 LINE 09 COLUMN 15 VALUE "3 - ALTERAR".
           05 LINE 10 COLUMN 15 VALUE "4 - EXCLUIR".
           05 LINE 11 COLUMN 15 VALUE "5 - RELATORIO EM TELA".
           05 LINE 12 COLUMN 15 VALUE "6 - RELATORIO EM DISCO".
           05 LINE 13 COLUMN 15 VALUE "X - SAIDA".
           05 LINE 16 COLUMN 15 VALUE "OPCAO........: ".
           05 LINE 16 COLUMN 28 USING WK-OPCAO.
      *
       01  MOSTRA-ERRO.
           05 MSG-ERRO.
               10 LINE 16 COLUMN 10 FROM WK-ABEND-MESSAGE
               FOREGROUND-COLOR 4.
               10 COLUMN PLUS 2 PIC X(01) USING WK-TECLA.

      ******************************************************************
       PROCEDURE               DIVISION.
       0000-PRINCIPAL          SECTION.
             PERFORM 0100-INICIALIZAR.
             PERFORM 0200-PROCESSAR THRU 0200-PROCESSAR-FIM.
             PERFORM 1000-FINALIZAR.

             STOP RUN.
       0000-PRINCIPAL-FIM.     EXIT.
      ******************************************************************
       0100-INICIALIZAR        SECTION.
           OPEN I-O CLIENTES.
           IF FS-CLIENTES EQUAL "35"
               OPEN OUTPUT CLIENTES
               CLOSE CLIENTES
               OPEN I-O CLIENTES
           END-IF.
       0100-INICIALIZAR-FIM.   EXIT.
      *
       0110-MOSTRA-TELA-INICIAL.
           MOVE FUNCTION CURRENT-DATE(1:4) TO ANO
           MOVE FUNCTION CURRENT-DATE(5:2) TO MES
           MOVE FUNCTION CURRENT-DATE(7:2) TO DIA
           DISPLAY TELA.
           ACCEPT  MENU-PRINCIPAL.
      ******************************************************************
       0200-PROCESSAR          SECTION.
           PERFORM UNTIL FUNCTION UPPER-CASE(WK-OPCAO) EQUAL "X"
               EVALUATE WK-OPCAO
                   WHEN 1
                       CALL "INCLUIR"
                       PERFORM 0110-MOSTRA-TELA-INICIAL
                   WHEN 2
                       CALL "CONSULTA"
                       PERFORM 0110-MOSTRA-TELA-INICIAL
                   WHEN 3
                       CALL "ALTERAR"
                       PERFORM 0110-MOSTRA-TELA-INICIAL
                   WHEN 4
                       CALL "EXCLUIR"
                       PERFORM 0110-MOSTRA-TELA-INICIAL
                   WHEN 5
                       CALL "RELTELA"
                       PERFORM 0110-MOSTRA-TELA-INICIAL
                   WHEN 6
                       CALL "RELDISK"
                       PERFORM 0110-MOSTRA-TELA-INICIAL
                   WHEN OTHER
                       IF FUNCTION UPPER-CASE(WK-OPCAO) NOT EQUAL "X"
                           DISPLAY "OPCAO INVALIDA!!" AT 1631
                           FOREGROUND-COLOR 4
                           ACCEPT WK-TECLA
                           PERFORM 0110-MOSTRA-TELA-INICIAL
                       END-IF
               END-EVALUATE
           END-PERFORM.
       0200-PROCESSAR-FIM.     EXIT.
      *
       0300-VOLTA-TELA.
           IF FUNCTION UPPER-CASE(WK-TECLA) EQUAL "X"
               PERFORM 0110-MOSTRA-TELA-INICIAL
           END-IF.
      ******************************************************************
       1000-FINALIZAR          SECTION.
           CLOSE CLIENTES.
           CLOSE RELATO.
       1000-FINALIZAR-FIM.     EXIT.
