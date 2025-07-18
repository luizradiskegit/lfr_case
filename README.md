# Case: Processo Seletivo para Engenheiro de Dados
Este projeto tem como objetivo resolver o case proposto no processo seletivo para Engenheiro de Dados. A solução demonstra a construção de um pipeline de dados utilizando Apache Spark e PostgreSQL, com todo o ambiente provisionado de forma automatizada via Docker.
## Requisitos
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- Docker Compose (já incluso no Docker Desktop)
___

## Execução do Projeto

1. **Clone o repositorio**:

```bash
git clone https://github.com/luizradiskegit/lfr_case.git
cd case_luiz_radiske
```

2. **Suba os containers**:
```bash
docker compose up --build
```

> Esse comando irá:
> - Subir o banco PostgreSQL e executar os scripts `.sql`
> - Subir o container do Spark
> - Rodar automaticamente o script ETL com `spark-submit`
> - Gerar um CSV com o resultado final em `data/output/movimento_flat/`

___
## Design
- Optei por estruturar o projeto com separação clara entre `notebooks`, `scripts/sql` e
`data/output` para facilitar manutenção e escalabilidade.
- Usei Docker para garantir portabilidade e facilidade de execucao, independente do
ambiente local que a pessoa irá rodar.


## Dificuldades Encontradas
- Tive problemas ao configurar corretamente o path do driver JDBC no container do
Spark, o que impediu inicialmente a leitura dos dados.
- O processo com `docker-compose` exigiu alguns testes até que os servios se comunicassem corretamente.


## Melhorias / Próximos passos
- Embora não tenha sido solicitado no desafio, em um cenário real seria essencial anonimizar ou mascarar dados pessoais (ex: Nome) antes de qualquer processamento ou exposição, especialmente em outputs exportados. Isso garante conformidade com a LGPD e boas práticas de governança de dados.
- Implementaria testes automatizados nas transformaçõe com `assert` sobre os DataFrames.
- Ao invés de armazenar o resultado apenas localmente, o pipeline poderia incluir uma etapa de exportação para um bucket em nuvem (ex: S3), garantindo maior disponibilidade, escalabilidade e integração com outros sistemas analíticos ou de visualização de dados.
- Dividiria o script ETL em múltiplas etapas (raw,bronze, silver, gold) para refletir uma arquitetura de dados lakehouse.


## Scripts
- `scripts/sql/create_tables.sql`: Criação das tabelas utilizadas no desafio.
- `scripts/sql/insert_data.sql`: Insert de dados ficticios.
- `notebooks/etl_case.py`: Script principal responsável por ler, transformar e exportar
os dados.

## Observações Finais
- O campo data_criacao_cartao não estava presente na tabela cartao do diagrama fornecido. Por isso, optei por manter a consistência com o modelo original e não incluí essa informação no csv da movimento_flat.
- Todos os comandos devem ser executados **a partir da raiz do projeto**, onde está localizado o `docker-compose.yml`.
- O projeto está 100% no Docker, não é necessário instalar Spark nem PostgreSQL localmente.
- O output ser gerado automaticamente após o processo no diretrio
`data/output/movimento_flat`.
