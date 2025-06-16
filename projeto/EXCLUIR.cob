       IDENTIFICATION          DIVISION.
       PROGRAM-ID. EXCLUIR.
      ******************************************************************
       ENVIRONMENT             DIVISION.
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
       FILE                    SECTION.
       FD  CLIENTES.
       01  REG-CLIENTES.
           05 CHAVE-CLIENTES.
               10 REG-TELEFONE     PIC 9(09).
           05 REG-NOME             PIC A(30).
           05 REG-EMAIL            PIC X(40).
      ******************************************************************
       WORKING-STORAGE         SECTION.
      *---> STATUS
       01  FS-CLIENTES             PIC X(02) VALUE SPACES.

      *---> TELA
       77  WK-ABEND-MESSAGE        PIC X(40) VALUE SPACES.
       77  WK-OPCAO                PIC X     VALUE SPACES.
       77  WK-TECLA                PIC X     VALUE SPACES.
       77  WK-MODULO               PIC X(25) VALUE SPACES.
       77  WK-CONTINUAR            PIC X     VALUE "S".
      ******************************************************************
       SCREEN                  SECTION.
       01  TELA-EXCLUI.
           05 BLANK SCREEN.
           05 LINE 02 COLUMN 01 PIC X(25) ERASE EOL
               BACKGROUND-COLOR 5 FROM WK-MODULO.
           05 LINE 08 COLUMN 10 VALUE "INSIRA CHAVE PARA EXCLUIR".
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
           COPY "ERROR.cpy".
      ******************************************************************
       PROCEDURE               DIVISION.
       0000-PRINCIPAL          SECTION.
           PERFORM 0100-INICIALIZAR.
           PERFORM 0200-PROCESSAR UNTIL WK-CONTINUAR = "N".
           PERFORM 1000-FINALIZAR.
           GOBACK.
       0000-PRINCIPAL-FIM.     EXIT.
      ******************************************************************
       0100-INICIALIZAR        SECTION.
           OPEN I-O CLIENTES.
           IF FS-CLIENTES = "35"
               OPEN OUTPUT CLIENTES
               CLOSE CLIENTES
               OPEN I-O CLIENTES
           END-IF.
           MOVE "MODULO - EXCLUSAO" TO WK-MODULO.
       0100-INICIALIZAR-FIM.   EXIT.
      ******************************************************************
       0200-PROCESSAR          SECTION.
           DISPLAY TELA-EXCLUI.
           ACCEPT CHAVE.

           IF REG-TELEFONE = ZEROS
               MOVE "N" TO WK-CONTINUAR
               EXIT SECTION
           END-IF.

           PERFORM 0300-LER-REGISTRO.
           IF FS-CLIENTES = "00"
               PERFORM 0400-CONFIRMAR-EXCLUSAO
           END-IF.

      *---> LIMPA CAMPOS
           MOVE ZEROS TO CHAVE-CLIENTES.
           MOVE SPACES TO REG-NOME, REG-EMAIL.
       0200-PROCESSAR-FIM.     EXIT.
      ******************************************************************
       0300-LER-REGISTRO       SECTION.
           READ CLIENTES.
           EVALUATE TRUE
               WHEN FS-CLIENTES = "00"
                   DISPLAY SS-DADOS
               WHEN FS-CLIENTES = "23"
                   MOVE "CLIENTE NAO ENCONTRADO!" TO WK-ABEND-MESSAGE
               WHEN OTHER
                   MOVE "ERRO AO LER ARQUIVO" TO WK-ABEND-MESSAGE
           END-EVALUATE.

           IF FS-CLIENTES NOT = "00"
               DISPLAY MOSTRA-ERRO
               ACCEPT WK-TECLA
           END-IF.
       0300-LER-REGISTRO-FIM.  EXIT.
      ******************************************************************
       0400-CONFIRMAR-EXCLUSAO SECTION.
           DISPLAY "PARA EXCLUIR APERTE 'ENTER': "
                   FOREGROUND-COLOR 2 AT 1420.
           ACCEPT WK-TECLA AT 1462.

           IF WK-TECLA = SPACE
               DISPLAY "TEM CERTEZA? (S/N): "
                       FOREGROUND-COLOR 2 AT 1520
               ACCEPT WK-OPCAO AT 1543

               IF FUNCTION UPPER-CASE(WK-OPCAO) = "S"
                   PERFORM 0500-EXECUTAR-EXCLUSAO
               ELSE
                   MOVE "EXCLUSAO CANCELADA" TO WK-ABEND-MESSAGE
                   DISPLAY MOSTRA-ERRO
                   ACCEPT WK-TECLA
               END-IF
           ELSE
               MOVE "OPERACAO CANCELADA" TO WK-ABEND-MESSAGE
               DISPLAY MOSTRA-ERRO
               ACCEPT WK-TECLA
           END-IF.
       0400-CONFIRMAR-EXCLUSAO-FIM. EXIT.
      ******************************************************************
       0500-EXECUTAR-EXCLUSAO SECTION.
           DELETE CLIENTES.
           EVALUATE TRUE
               WHEN FS-CLIENTES = "00"
                   DISPLAY "REGISTRO EXCLUIDO!"
                           FOREGROUND-COLOR 2 AT 1045
               WHEN OTHER
                   MOVE "ERRO AO EXCLUIR REGISTRO" TO WK-ABEND-MESSAGE
           END-EVALUATE.

           ACCEPT WK-TECLA AT 1055.
       0500-EXECUTAR-EXCLUSAO-FIM. EXIT.
      ******************************************************************
       1000-FINALIZAR          SECTION.
           CLOSE CLIENTES.
       1000-FINALIZAR-FIM.     EXIT.
