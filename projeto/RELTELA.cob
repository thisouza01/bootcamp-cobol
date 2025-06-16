      ******************************************************************
      * Author:Thiago Souza
      * Date:09/06/2025
      * Purpose:Projeto - Sistema de gestao de clientes(CRUD)
      *  -  MODULO DE RELATORIO EM TELA
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION          DIVISION.
       PROGRAM-ID. RELTELA.
      ******************************************************************
       ENVIRONMENT             DIVISION.
      *
       CONFIGURATION           SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *
       INPUT-OUTPUT            SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO "C:/projeto-bootcamp/clientes.dat"
               ORGANIZATION    IS INDEXED
               ACCESS MODE     IS SEQUENTIAL
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
       77  WK-MODULO               PIC X(25) VALUE SPACES.
       77  WK-CONTALINHA           PIC 99    VALUE ZEROS.
       77  WK-QTREGISTROS          PIC 99    VALUE ZEROS.
       77  WK-LINHA                PIC 99    VALUE ZEROS.

      *---> DATA
       01  DATA-ATUAL.
           05 DIA                  PIC 99    VALUE ZEROS.
           05 FILLER               PIC X     VALUE "/".
           05 MES                  PIC 99    VALUE ZEROS.
           05 FILLER               PIC X     VALUE "/".
           05 ANO                  PIC 9999  VALUE ZEROS.
      ******************************************************************
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
       01  TELA-RELATORIO.
           05 BLANK SCREEN.
           05 LINE 02 COLUMN 01 PIC X(25) ERASE EOL
               BACKGROUND-COLOR 5 FROM WK-MODULO.
           05 LINE 04 COLUMN 10 VALUE "TELEFONE   NOME                "&
               "            EMAIL" FOREGROUND-COLOR 3.
           05 LINE 05 COLUMN 10 VALUE "---------  --------------------"&
            "----------  ------------------------".
           05 LINE 11 COLUMN 10 VALUE "---------  --------------------"&
            "----------  ------------------------".
      *
       01  LINHA-RELATORIO.
           05 FILLER LINE WK-LINHA COLUMN 10  PIC 9(09)
                                                   FROM REG-TELEFONE.
           05 FILLER LINE WK-LINHA COLUMN 21  PIC X(30)
                                                   FROM REG-NOME.
           05 FILLER LINE WK-LINHA COLUMN 53  PIC X(40)
                                                   FROM REG-EMAIL.
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
             PERFORM 0200-RELATORIO-TELA.
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
      ******************************************************************
       0200-RELATORIO-TELA.
           MOVE "MODULO - RELATORIO TELA" TO WK-MODULO.
           DISPLAY TELA.
           MOVE 000000001 TO REG-TELEFONE.
           MOVE ZEROS TO WK-QTREGISTROS, WK-CONTALINHA
      *---> POSICIONA CHAVE
           START CLIENTES KEY EQUAL REG-TELEFONE.
      *---> LE REGISTRO
           READ CLIENTES
               INVALID KEY
                   MOVE "NAO ENCONTRADO!" TO WK-ABEND-MESSAGE
                   ACCEPT MOSTRA-ERRO
               NOT INVALID KEY
                   DISPLAY TELA-RELATORIO
                   MOVE 06 TO WK-LINHA
                   PERFORM UNTIL FS-CLIENTES EQUAL "10"
                       ADD 1 TO WK-QTREGISTROS
                       DISPLAY LINHA-RELATORIO
      *---> LE PROXIMO REGISTRO
                       READ CLIENTES NEXT
                       ADD 1 TO WK-LINHA
                       ADD 1 TO WK-CONTALINHA
                       IF WK-CONTALINHA GREATER THAN 5
                           MOVE "PRESSIONE ALGUMA TECLA PARA CONTINUAR"
                                               TO WK-ABEND-MESSAGE
                           ACCEPT MOSTRA-ERRO
                           MOVE ZEROS TO WK-CONTALINHA
                           MOVE 6 TO WK-LINHA
                           MOVE "MODULO - RELATORIO " TO WK-MODULO
                           DISPLAY TELA
                           DISPLAY TELA-RELATORIO
                       END-IF
                   END-PERFORM
           END-READ.
           MOVE "REGISTROS LIDOS" TO WK-ABEND-MESSAGE.
           MOVE WK-QTREGISTROS TO WK-ABEND-MESSAGE(17:05)
           ACCEPT MOSTRA-ERRO.
           GOBACK.
      ******************************************************************
       1000-FINALIZAR          SECTION.
           CLOSE CLIENTES.
       1000-FINALIZAR-FIM.     EXIT.
