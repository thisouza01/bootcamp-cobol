      ******************************************************************
      * Author:Thiago Souza
      * Date:04/06/2025
      * Purpose:gravar arquivo
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. GRAVA-REG.
      ******************************************************************
       ENVIRONMENT        DIVISION.
       CONFIGURATION      SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT       SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO "C:\teste\clientes.txt"
              FILE STATUS IS FS-CLIENTES.
      ******************************************************************
       DATA DIVISION.
       FILE            SECTION.
       FD  CLIENTES.
       01  REG-CLIENTES.
           05 REG-ID           PIC  9(04).
           05 REG-NOME         PIC  A(20).
           05 REG-TELEFONE     PIC  X(11).
      ******************************************************************
       WORKING-STORAGE SECTION.
       01  FS-CLIENTES         PIC 9(02) VALUE ZEROS.
       01  WRK-MSG-ERRO        PIC X(30) VALUE SPACES.
      ******************************************************************
       PROCEDURE               DIVISION.
       0000-PRINCIPAL          SECTION.
             PERFORM 0100-INICIALIZAR.
             PERFORM 0200-PROCESSAR.
             PERFORM 0300-FINALIZAR.

             STOP RUN.
       0000-PRINCIPAL-FIM. EXIT.
      *
       0100-INICIALIZAR        SECTION.
              OPEN OUTPUT CLIENTES.
              IF FS-CLIENTES EQUAL 35
                  MOVE "ARQUIVO NAO FOI ABERTO " TO WRK-MSG-ERRO
                  PERFORM 0900-TRATA-ERRO
                  STOP RUN
              END-IF.
       0100-INICIAL-FIM. EXIT.
      *
       0200-PROCESSAR          SECTION.
               MOVE 0001                   TO REG-ID.
               MOVE "PAULA               " TO REG-NOME.
               MOVE "11212167573"          TO REG-TELEFONE.
               WRITE REG-CLIENTES.
               MOVE 0002                   TO REG-ID.
               MOVE "THIAGO              " TO REG-NOME.
               MOVE "11223167573"          TO REG-TELEFONE.
               WRITE REG-CLIENTES.
               MOVE 0003                   TO REG-ID.
               MOVE "SILVA               " TO REG-NOME.
               MOVE "17584167573"          TO REG-TELEFONE.
               WRITE REG-CLIENTES.
       0200-PROCESSAR-FIM. EXIT.
      *
       0300-FINALIZAR          SECTION.
              CLOSE CLIENTES.
              IF FS-CLIENTES NOT EQUAL 0
                  DISPLAY 'ERRO AO FECHAR ' FS-CLIENTES
              END-IF.
       0300-FINALIZAR-FIM. EXIT.
      *
       0900-TRATA-ERRO.
           DISPLAY WRK-MSG-ERRO.
           GOBACK.
