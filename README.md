## Pré-requisitos

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Instalação

1. Clone o repositório:
```bash
    git clone https//github.com/beguel01/Oficina_app.git
    cd Oficina_app
```

2. Copie o arquivo de variáveis de ambiente:
```bash
    cp.env.example .env
```

3. Abra o `.env` e preencha os valores necessários (usuário, senha e nome do banco de dados).

## Como rodar

1. Suba os containers:
```bash
    docker compose up --build
```

2. Acesse o projeto em [http://localhost:8000](http://localhost:8000)

> Na primeira execução, o banco de dados é populado automaticamente a partir do `banco.sql`.

## Credenciais de teste

> Essas credenciais existem apenas para fins de desenvolvimento/teste local. Nunca utilize dados sensíveis reais neste banco.

- **E-mail:** [funcionario@teste.com]
- **Senha:** [senha123]
- **Cargo:** [funcionario]

- **E-mail:** [gerente@teste.com]
- **Senha:** [senha123]
- **Cargo:** [gerente]

- **E-mail:** [dono@teste.com]
- **Senha:** [senha123]
- **Cargo:** [dono]

## Estrutura do projeto

- `public/` — [arquivos acessíveis publicamente pelo navegador: login, cadastro, dashboards (dono, gerente, funcionário), logout e os assets de CSS]

- `config/` — [configuração da conexão com o banco de dados (PDO), compartilhada por todas as páginas]

- `scripts/` — [scripts auxiliares de desenvolvimento (não fazem parte do fluxo em produção)]

- `banco.sql` — [script de criação e populamento inicial do banco de dados, executado automaticamente na primeira subida do container do MariaDB]

- `docker-compose.yml` — [define e orquestra os serviços `app` (PHP/Apache) e `db` (MariaDB)]

- `Dockerfile` — [define como a imagem do serviço `app` é construída (PHP 8.3 + extensões necessárias)]

- `.env.example` — [modelo das variáveis de ambiente necessárias (copiar para `.env` antes de rodar)]