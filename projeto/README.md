
# Sistema de Gestão de Clientes (CRUD em COBOL)

## Descrição do Projeto

Este projeto é um sistema de **gestão de clientes** desenvolvido em **COBOL**, implementando operações básicas de CRUD (Create, Read, Update, Delete).  
O sistema utiliza um **arquivo indexado** como meio de armazenamento e oferece uma interface em **modo texto (SCREEN SECTION)** com menu interativo para manipulação dos registros.

> **Observação:** Este sistema foi desenvolvido para execução em ambiente **GNU COBOL (cobc)** e **não é compatível com ambientes Mainframe**.

---

## Funcionalidades Principais

### 1. Menu de Operações

O programa apresenta um menu com as seguintes opções:

| Opção | Ação                                  |
|-------|----------------------------------------|
| 1     | Incluir: Adiciona um novo cliente.     |
| 2     | Consultar: Busca cliente por telefone. |
| 3     | Alterar: Edita dados do cliente.       |
| 4     | Excluir: Remove cliente.               |
| 5     | Relatório em Tela: Lista clientes.     |
| 6     | Relatório em Disco: Gera .txt          |
| X     | Sair do programa.                      |

---

## Lógica de Armazenamento

### Arquivo de Dados: `clientes.dat`

- **Organização**: Indexada  
- **Chave Primária**: Telefone  
- **Estrutura COBOL**:

```cobol
01 REG-CLIENTES.
   05 CHAVE-CLIENTES.
      10 REG-TELEFONE     PIC 9(09).  *> Chave primária
   05 REG-NOME            PIC A(30).  *> Nome
   05 REG-EMAIL           PIC X(40).  *> E-mail
```

### Arquivo de Relatório: `relato.txt`

- Organização: Sequencial  
- Conteúdo: Lista de clientes formatada em linhas de texto

---

## Fluxo do Programa

### 1. Inicialização

- Verifica se o arquivo `clientes.dat` existe
- Caso não exista, cria um arquivo vazio
- Exibe o menu principal

### 2. Processamento das Opções

#### Inclusão (`WRITE`)
- Verifica se telefone já está cadastrado
- Grava novo cliente se válido

#### Consulta (`READ`)
- Busca cliente pelo telefone
- Exibe nome e e-mail

#### Alteração (`READ + REWRITE`)
- Localiza cliente pelo telefone
- Permite editar nome e e-mail
- Regrava após confirmação

#### Exclusão (`DELETE`)
- Remove registro após confirmação

#### Relatórios
- **Tela**: Lista paginada (5 registros por tela)
- **Disco**: Gera `relato.txt` com todos os registros

### 3. Finalização

- Fecha todos os arquivos abertos
- Encerra o programa com mensagem de saída

---

## Lógica do Programa (Procedural)

O programa segue uma lógica estruturada por módulos, utilizando nomes de parágrafos para dividir o controle e facilitar a manutenção. Abaixo está a descrição dos principais blocos da `MODULARIZAÇÂO`:

### 0100-INICIO
- Responsável pela abertura dos arquivos (`clientes.dat`, `relato.txt`)
- Se o arquivo de dados não existir, cria automaticamente
- Inicializa variáveis de controle e exibe a tela de boas-vindas

### 0200-MENU
- Exibe o menu principal utilizando a `SCREEN SECTION`
- Captura a escolha do usuário e redireciona para a rotina correspondente
- Verifica opções válidas e trata a opção de saída (`X`)

### INCLUIR
- Recebe os dados do cliente via tela
- Valida se o telefone já existe no arquivo
- Se não existir, grava o novo registro (`WRITE`)
- Caso contrário, exibe mensagem de erro

### CONSULTAR
- Solicita telefone e faz leitura direta (`READ`)
- Se encontrado, exibe os dados na tela
- Se não encontrado, exibe mensagem apropriada

### ALTERAR
- Localiza cliente pelo telefone
- Exibe os dados atuais e permite editar nome e e-mail
- Solicita confirmação antes de sobrescrever (`REWRITE`)

### EXCLUIR
- Busca cliente pelo telefone
- Mostra dados encontrados e solicita confirmação
- Executa comando de exclusão (`DELETE`)

### RELATORIO-TELA
- Percorre todo o arquivo usando `START` e `READ NEXT`
- Exibe 5 registros por página com pausa a cada grupo
- Mostra total de registros ao final

### RELATORIO-DISCO
- Similar ao relatório em tela, mas direciona a saída para `relato.txt`
- Escreve os registros em formato texto (`WRITE` no arquivo sequencial)

### 1000-FIM
- Fecha todos os arquivos abertos
- Exibe mensagem de término
- Executa comando `STOP RUN`

---

## Tratamento de Erros

| Código | Descrição                         | Ação                      |
|--------|-----------------------------------|---------------------------|
| 35     | Arquivo não existe                | Cria arquivo vazio        |
| 23     | Registro já existe na inclusão    | Exibe mensagem de erro    |
| 10     | Fim de arquivo nos relatórios     | Finaliza leitura          |
| Outros | Falha ao localizar registros      | Informa usuário           |

---

## Estrutura do Código

### Seções Relevantes no Programa COBOL

| Seção             | Função                                                   |
|-------------------|-----------------------------------------------------------|
| `FILE-CONTROL`    | Declara os arquivos `clientes.dat` e `relato.txt`         |
| `WORKING-STORAGE` | Declara variáveis, status dos arquivos, contadores, etc. |
| `SCREEN SECTION`  | Define as telas do menu, formulários e mensagens          |
| `PROCEDURE DIVISION` | Contém a lógica do programa (controle do menu e operações CRUD) |

---

## Como Executar

### Pré-requisitos

- Compilador [GNU COBOL (cobc)](https://gnucobol.sourceforge.io/)
- Ambiente Windows com terminal

### Passos

**Compilar:**
```sh
cobc -x MAIN.cbl -o MAIN.exe
```

**Executar:**
```sh
./PROJETO
```

**Caso utilize o CMD:**
*Entrar na pastar "bin"*
```sh
MAIN.exe
```

### Arquivos Gerados

- `clientes.dat` – Arquivo indexado com os dados dos clientes  
- `relato.txt` – Arquivo sequencial com o relatório de clientes

---

**Autor:** Thiago Souza  
**Data:** 09/06/2025   
