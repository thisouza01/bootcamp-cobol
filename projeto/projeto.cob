      ******************************************************************
      * Author:Thiago Souza
      * Date:09/06/2025
      * Purpose:Projeto - Sistema de gestao de clientes(CRUD)
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION          DIVISION.
       PROGRAM-ID. PROJETO.
      ******************************************************************
       ENVIRONMENT             DIVISION.
      *
       CONFIGURATION           SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *
       INPUT-OUTPUT            SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO "C:\teste\clientes.txt"
              FILE STATUS IS FS-CLIENTES.
      ******************************************************************
       DATA                    DIVISION.
      *
       FILE                    SECTION.
       FD  CLIENTES.
       01  REG-CLIENTES.
           05 REG-ID           PIC  9(04).
           05 REG-NOME         PIC  A(20).
           05 REG-TELEFONE     PIC  X(11).
      ******************************************************************
       WORKING-STORAGE         SECTION.
       01  FS-CLIENTES         PIC 9(02) VALUE ZEROS.
       01  WRK-MSG-ERRO        PIC X(30) VALUE SPACES.

      *    ---> TELA
       77  WK-OPCAO            PIC X(01) VALUE SPACES.
       77  WK-TECLA            PIC X(01) VALUE SPACES.
       77  WK-MODULO           PIC X(25) VALUE SPACES.
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
               10 LINE 02 COLUMN 01 PIC X(25) ERASE EOL
                  BACKGROUND-COLOR 1 FROM WK-MODULO.
               10 LINE 05 COLUMN 15 PIC X(20)
                  BACKGROUND-COLOR 7.
               10 LINE 14 COLUMN 15 PIC X(20)
                  BACKGROUND-COLOR 7.

       01  MENU-PRINCIPAL.
           05 LINE 07 COLUMN 15 VALUE "1 - INCLUIR".
           05 LINE 08 COLUMN 15 VALUE "2 - CONSULTAR".
           05 LINE 09 COLUMN 15 VALUE "3 - ALTERAR".
           05 LINE 10 COLUMN 15 VALUE "4 - EXCLUIR".
           05 LINE 11 COLUMN 15 VALUE "5 - RELATORIO".
           05 LINE 12 COLUMN 15 VALUE "X - SAIDA".
           05 LINE 16 COLUMN 15 VALUE "OPCAO........: ".
           05 LINE 16 COLUMN 28 USING WK-OPCAO.
      ******************************************************************
       PROCEDURE               DIVISION.
       0000-PRINCIPAL          SECTION.
             PERFORM 0100-INICIALIZAR.
             PERFORM 0200-PROCESSAR.
             PERFORM 0300-FINALIZAR.

             STOP RUN.
       0000-PRINCIPAL-FIM.     EXIT.
      ******************************************************************
       0100-INICIALIZAR.
           DISPLAY TELA.
           ACCEPT  MENU-PRINCIPAL.
       0100-INICIALIZAR-FIM.   EXIT.
      ******************************************************************
       0200-PROCESSAR.
           EVALUATE WK-OPCAO
               WHEN 1
                   PERFORM 0210-INCLUIR
               WHEN 2
                   CONTINUE
               WHEN 3
                   CONTINUE
               WHEN 4
                   CONTINUE
               WHEN 5
                   CONTINUE
               WHEN OTHER
                   IF WK-OPCAO NOT EQUAL "X" OR "x"
                       DISPLAY "OPCAO INVALIDA!!" AT 1631
                   END-IF
           END-EVALUATE.
       0200-PROCESSAR-FIM.     EXIT.
      *
       0210-INCLUIR.
           MOVE "MODULO - INCLUSAO " TO WK-MODULO.
           DISPLAY TELA.
           ACCEPT WK-TECLA AT 1620.
      ******************************************************************
       0300-FINALIZAR.

       0300-FINALIZAR-FIM.     EXIT.
