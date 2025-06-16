      *---------------------------------------------------------------*
      * COPYBOOK: ERROR.cpy                                           *
      * Descrição: Tela padrão para exibição de mensagens de erro     *
      * Variáveis requeridas:                                         *
      *    WK-ABEND-MESSAGE PIC X(40) - Mensagem de erro              *
      *    WK-TECLA         PIC X     - Tecla pressionada pelo usuário*
      *---------------------------------------------------------------*
       01  MOSTRA-ERRO.
           05 MSG-ERRO.
               10 LINE 16 COLUMN 10 FROM WK-ABEND-MESSAGE
                  FOREGROUND-COLOR 4.
               10 COLUMN PLUS 2 PIC X(01) USING WK-TECLA.
      *---------------------------------------------------------------*
