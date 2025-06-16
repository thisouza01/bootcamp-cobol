      ******************************************************************
      * Author:Thiago Souza
      * Date:09/06/2025
      * Purpose:Projeto - Sistema de gestao de clientes(CRUD)
      *  -  MODULO DE RELATORIO EM DISCO
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION          DIVISION.
       PROGRAM-ID. RELDISK.
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
      *
           COPY "ERROR.cpy".
      ******************************************************************
       PROCEDURE               DIVISION.
       0000-PRINCIPAL          SECTION.
             PERFORM 0100-INICIALIZAR.
             PERFORM 0200-RELATORIO-DISCO.
             PERFORM 1000-FINALIZAR.

             GOBACK.
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
       0200-RELATORIO-DISCO.
           MOVE "MODULO - RELATORIO DISCO" TO WK-MODULO.
           DISPLAY TELA.
           MOVE 000000001 TO REG-TELEFONE.
           MOVE ZEROS TO WK-QTREGISTROS, WK-CONTALINHA.

      *---> POSICIONA CHAVE
           START CLIENTES KEY EQUAL REG-TELEFONE.

      *---> LE REGISTRO
           READ CLIENTES
               INVALID KEY
                   MOVE "NAO ENCONTRADO!" TO WK-ABEND-MESSAGE
                   ACCEPT MOSTRA-ERRO
               NOT INVALID KEY
                   OPEN OUTPUT RELATO
                   IF FS-RELATO NOT = "00"
                       MOVE "ERRO AO ABRIR ARQUIVO RELATO"
                                                     TO WK-ABEND-MESSAGE
                       ACCEPT MOSTRA-ERRO
                   ELSE
                       PERFORM UNTIL FS-CLIENTES EQUAL "10"
                           ADD 1 TO WK-QTREGISTROS
                           MOVE REG-CLIENTES TO REG-RELATO
                           WRITE REG-RELATO
                           IF FS-RELATO NOT EQUAL "00"
                               MOVE "ERRO AO GRAVAR RELATORIO"
                                                     TO WK-ABEND-MESSAGE
                               ACCEPT MOSTRA-ERRO
                               EXIT PERFORM
                           END-IF
                           READ CLIENTES NEXT
                       END-PERFORM

                       IF FS-RELATO = "00" AND FS-CLIENTES = "10"
                           DISPLAY "GRAVADO COM SUCESSO!"
                                   AT 1020 FOREGROUND-COLOR 2
                           MOVE "REGISTROS LIDOS" TO WK-ABEND-MESSAGE
                           MOVE WK-QTREGISTROS TO
                                               WK-ABEND-MESSAGE(17:05)
                           ACCEPT MOSTRA-ERRO
                       END-IF
                   END-IF
           END-READ.

           PERFORM 1000-FINALIZAR.
      ******************************************************************
       1000-FINALIZAR          SECTION.
           CLOSE CLIENTES.
           CLOSE RELATO.
       1000-FINALIZAR-FIM.     EXIT.
