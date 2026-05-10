# Regras — Banco de dados (src/db/, infra/migrations/, *.prisma)

- Nunca `UPDATE` em registros financeiros — apenas `INSERT` de estorno
- `tenant_id` obrigatório em toda query — projeto é multi-tenant
- Datas armazenadas em UTC — converter apenas na camada de apresentação
- Migrações criadas com `bun db:migrate:create` — nunca editar migrações já aplicadas
- Queries pesadas têm timeout de 5s no pool — não aumentar sem revisão de infra
