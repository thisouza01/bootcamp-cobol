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
           SELECT CLIENTES ASSIGN TO "C:/projeto-bootcamp/clientes.dat"
               ORGANIZATION    IS INDEXED
               ACCESS MODE     IS DYNAMIC
               RECORD KEY      IS CHAVE-CLIENTES
               FILE STATUS     IS FS-CLIENTES.
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
      ******************************************************************
       WORKING-STORAGE         SECTION.
      *---> STATUS ARQUIVO
       01  FS-CLIENTES             PIC X(02) VALUE SPACES.

      *---> ABENDS
       77  WK-ABEND-MESSAGE        PIC X(30) VALUE SPACES.

      *---> TELA
       77  WK-OPCAO                PIC X     VALUE SPACES.
       77  WK-TECLA                PIC X     VALUE SPACES.
       77  WK-MODULO               PIC X(25) VALUE SPACES.
       77  WK-CONTALINHA           PIC 99    VALUE ZEROS.
       77  WK-QTREGISTROS          PIC 99    VALUE ZEROS.
       77  WK-LINHA                PIC 99    VALUE ZEROS.
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
      *
       01  MENU-PRINCIPAL.
           05 LINE 07 COLUMN 15 VALUE "1 - INCLUIR".
           05 LINE 08 COLUMN 15 VALUE "2 - CONSULTAR".
           05 LINE 09 COLUMN 15 VALUE "3 - ALTERAR".
           05 LINE 10 COLUMN 15 VALUE "4 - EXCLUIR".
           05 LINE 11 COLUMN 15 VALUE "5 - RELATORIO".
           05 LINE 12 COLUMN 15 VALUE "X - SAIDA".
           05 LINE 16 COLUMN 15 VALUE "OPCAO........: ".
           05 LINE 16 COLUMN 28 USING WK-OPCAO.
      *
       01  TELA-INCLUSAO.
           05 BLANK SCREEN.
           05 LINE 02 COLUMN 01 PIC X(25) ERASE EOL
               BACKGROUND-COLOR 5 FROM WK-MODULO.
      *
           05 CHAVE FOREGROUND-COLOR 3.
               10 LINE 10 COLUMN 10 VALUE "TELEFONE ".
               10 COLUMN PLUS 2 PIC 9(09) USING REG-TELEFONE
                   BLANK WHEN ZEROS.
           05 SS-DADOS.
               10 LINE 11 COLUMN 10 VALUE "NOME.... ".
               10 COLUMN PLUS 2 PIC X(30) USING REG-NOME.
               10 LINE 12 COLUMN 10 VALUE "EMAIL... ".
               10 COLUMN PLUS 2 PIC X(40) USING REG-EMAIL.
      *
       01  TELA-CONSULTA.
           05 BLANK SCREEN.
           05 LINE 02 COLUMN 01 PIC X(25) ERASE EOL
               BACKGROUND-COLOR 5 FROM WK-MODULO.
           05 LINE 08 COLUMN 10 VALUE "INSIRA CHAVE PARA A CONSULTA".
      *
       01  TELA-ALTERA.
           05 BLANK SCREEN.
           05 LINE 02 COLUMN 01 PIC X(25) ERASE EOL
               BACKGROUND-COLOR 5 FROM WK-MODULO.
      *
       01  TELA-EXCLUI.
           05 BLANK SCREEN.
           05 LINE 02 COLUMN 01 PIC X(25) ERASE EOL
               BACKGROUND-COLOR 5 FROM WK-MODULO.
      *
       01  TELA-RELATORIO.
           05 BLANK SCREEN.
           05 LINE 02 COLUMN 01 PIC X(25) ERASE EOL
               BACKGROUND-COLOR 5 FROM WK-MODULO.
           05 LINE 04 COLUMN 10 VALUE "TELEFONE   NOME                "&
               "            EMAIL" FOREGROUND-COLOR 3.
           05 LINE 05 COLUMN 10 VALUE "---------  --------------------"&
            "----------  ------------------------".
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
           DISPLAY TELA.
           ACCEPT  MENU-PRINCIPAL.
      ******************************************************************
       0200-PROCESSAR          SECTION.
           PERFORM UNTIL FUNCTION UPPER-CASE(WK-OPCAO) EQUAL "X"
      *---> ZERA CHAVE DE ACESSO
               MOVE ZEROS TO CHAVE-CLIENTES
               MOVE SPACES TO REG-NOME, REG-EMAIL

               EVALUATE WK-OPCAO
                   WHEN 1
                       PERFORM 0210-INCLUIR
                   WHEN 2
                       PERFORM 0220-CONSULTAR
                   WHEN 3
                       PERFORM 0230-ALTERAR
                   WHEN 4
                       PERFORM 0240-EXCLUIR
                   WHEN 5
                       PERFORM 0250-RELATORIO
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
       0210-INCLUIR.
           MOVE "MODULO - INCLUSAO " TO WK-MODULO.
           ACCEPT TELA-INCLUSAO.
      *---> GRAVA REGISTRO
           WRITE REG-CLIENTES
               INVALID KEY
                   MOVE "CLIENTE JA EXISTE!" TO WK-ABEND-MESSAGE
                   ACCEPT MOSTRA-ERRO
                   PERFORM 0110-MOSTRA-TELA-INICIAL
               NOT INVALID KEY
                   DISPLAY "CADASTRADO!" AT 1032
                   FOREGROUND-COLOR 2
                   ACCEPT WK-TECLA
                   PERFORM 0110-MOSTRA-TELA-INICIAL
           END-WRITE.
      *
       0220-CONSULTAR.
           MOVE "MODULO - CONSULTA " TO WK-MODULO.
           DISPLAY TELA-CONSULTA.
           ACCEPT CHAVE.
      *---> LE REGISTRO
           READ CLIENTES
               INVALID KEY
                   MOVE "CLIENTE NAO ENCONTRADO!" TO WK-ABEND-MESSAGE
                   ACCEPT MOSTRA-ERRO
                   PERFORM 0300-VOLTA-TELA
               NOT INVALID KEY
                   DISPLAY SS-DADOS
                   DISPLAY "PARA CONTINUAR APERTE 'ENTER' SENAO 'X'): "
                   FOREGROUND-COLOR 2 AT 1420
                   ACCEPT WK-TECLA AT 1462
                   PERFORM 0300-VOLTA-TELA
           END-READ.
      *
       0230-ALTERAR.
           MOVE "MODULO - ALTERACAO " TO WK-MODULO.
           ACCEPT TELA-ALTERA.
           ACCEPT CHAVE.
      *---> LE REGISTRO
           READ CLIENTES
           IF FS-CLIENTES EQUAL "00"
               ACCEPT SS-DADOS
      *---> REGRAVA REGISTRO
               REWRITE REG-CLIENTES
               IF FS-CLIENTES EQUAL "00"
                   DISPLAY "REGISTRO ALTERADO!"
                   FOREGROUND-COLOR 2 AT 1032
                   ACCEPT WK-TECLA AT 1051
                   PERFORM 0110-MOSTRA-TELA-INICIAL
               ELSE
                   MOVE "REGISTRO NAO ALTERADO" TO WK-ABEND-MESSAGE
                   ACCEPT MOSTRA-ERRO
               END-IF
           ELSE
               MOVE "CLIENTE NAO ENCONTRADO!" TO WK-ABEND-MESSAGE
               ACCEPT MOSTRA-ERRO
           END-IF.
      *
       0240-EXCLUIR.
           MOVE "MODULO - EXCLUSAO " TO WK-MODULO.
           ACCEPT TELA-EXCLUI.
           ACCEPT CHAVE.
      *---> LE REGISTRO
           READ CLIENTES
               INVALID KEY
                   MOVE "CLIENTE NAO ENCONTRADO!" TO WK-ABEND-MESSAGE
                   ACCEPT MOSTRA-ERRO
                   PERFORM 0300-VOLTA-TELA
               NOT INVALID KEY
                   DISPLAY SS-DADOS
                   DISPLAY "PARA EXCLUIR APERTE 'ENTER' SENAO 'X'): "
                       FOREGROUND-COLOR 2 AT 1420
                   ACCEPT WK-TECLA AT 1462
                   IF FUNCTION UPPER-CASE(WK-TECLA) EQUAL " "
                       DISPLAY "TEM CERTEZA? (S / N): "
                           FOREGROUND-COLOR 2 AT 1520
                       ACCEPT WK-TECLA AT 1543
                       IF FUNCTION UPPER-CASE(WK-TECLA) EQUAL "S"
      *---> APAGA REGISTRO
                           DELETE CLIENTES
                               INVALID KEY
                                   MOVE "NAO EXCLUIDO!"
                                                   TO WK-ABEND-MESSAGE
                                   ACCEPT MOSTRA-ERRO
                               NOT INVALID KEY
                                   DISPLAY "APAGADO!"
                                       FOREGROUND-COLOR 2 AT 1045
                                   ACCEPT WK-TECLA AT 1055
                                   PERFORM 0110-MOSTRA-TELA-INICIAL
                           END-DELETE
                       END-IF
                       ACCEPT WK-TECLA
                   ELSE
                       PERFORM 0300-VOLTA-TELA
                   END-IF
           END-READ.
      *
       0250-RELATORIO.
           MOVE "MODULO - RELATORIO " TO WK-MODULO.
           DISPLAY TELA.
           MOVE 000000001 TO REG-TELEFONE.
      *---> POSICIONA CHAVE
           START CLIENTES KEY EQUAL REG-TELEFONE.
      *---> LE REGISTRO
           READ CLIENTES
               INVALID KEY
                   MOVE "NAO ENCONTRADO!" TO WK-ABEND-MESSAGE
                   ACCEPT MOSTRA-ERRO
               NOT INVALID KEY
                   DISPLAY TELA-RELATORIO
                   PERFORM UNTIL FS-CLIENTES EQUAL "10"
                       ADD 1 TO WK-QTREGISTROS
                       DISPLAY REG-CLIENTES AT LINE WK-LINHA COLUMN 10
      *---> LE PROXIMO REGISTRO
                       READ CLIENTES NEXT
                       ADD 1 TO WK-CONTALINHA
                       IF WK-CONTALINHA EQUAL 5
                           MOVE "PRESSIONE ALGUMA TECLA"
                                               TO WK-ABEND-MESSAGE
                           ACCEPT WK-TECLA
                           MOVE ZEROS TO WK-CONTALINHA
                           MOVE "MODULO - RELATORIO " TO WK-MODULO
                           DISPLAY TELA
                           DISPLAY TELA-RELATORIO
                       END-IF
                   END-PERFORM
           END-READ.
           MOVE "REGISTROS LIDOS" TO WK-ABEND-MESSAGE.
           MOVE WK-QTREGISTROS TO WK-ABEND-MESSAGE(17:05)
           ACCEPT MOSTRA-ERRO.
           PERFORM 0110-MOSTRA-TELA-INICIAL.
      *
       0300-VOLTA-TELA.
           IF FUNCTION UPPER-CASE(WK-TECLA) EQUAL "X"
               PERFORM 0110-MOSTRA-TELA-INICIAL
           END-IF.
      ******************************************************************
       1000-FINALIZAR          SECTION.
           CLOSE CLIENTES.
       1000-FINALIZAR-FIM.     EXIT.
