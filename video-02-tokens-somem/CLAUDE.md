# [NOME DO PROJETO]

<!--
  TEMPLATE — substitua tudo entre [ ] pelo seu projeto.
  Regra: só fica o que o Claude genuinamente não sabe por padrão.
  Meta: menos de 300 linhas. Quanto menor, menos tokens por mensagem.
-->

---

## Stack

- **Linguagem:** [TypeScript 5.x, strict mode]
- **Runtime:** [Node 22 / Bun 1.x]
- **Framework:** [Next.js 15 / NestJS 10 / Fastify 5]
- **Banco:** [PostgreSQL 16 via Prisma ORM]
- **Infra:** [AWS — ECS Fargate + RDS + S3]

<!-- NÃO liste: versões do React, sintaxe do framework, o que é um ORM. O Claude já sabe. -->

---

## Comandos

```bash
[bun dev]         # [servidor local na porta 3000]
[bun test]        # [vitest — watch mode por padrão]
[bun lint]        # [eslint + prettier check]
[bun build]       # [build de produção — gera dist/]
[bun db:migrate]  # [aplica migrações pendentes do Prisma]
[bun db:seed]     # [popula banco com dados de dev]
```

<!-- NÃO liste: npm install, comandos padrão do framework, docker pull. -->

---

## Estrutura (só o que foge do padrão)

```
[src/
  modules/]       # [cada módulo = feature isolada: controller + service + repo]
[  shared/]       # [guards, interceptors e tipos usados em mais de um módulo]
[  config/]       # [env vars tipadas com zod — única fonte de process.env]
[infra/
  terraform/]     # [IaC — não editar sem aprovação do time de infra]
```

<!-- NÃO liste: src/components, src/pages, src/utils. Estrutura óbvia não precisa de documentação. -->

---

## Convenções de código

### Nomenclatura
- Arquivos: [`kebab-case.ts`] — sem exceção
- Classes e tipos: [`PascalCase`]
- Funções e variáveis: [`camelCase`]
- Constantes globais: [`UPPER_SNAKE_CASE`]

### Exports
- [Sempre named exports — nunca `export default`]
- [Cada módulo expõe um `index.ts` com barrel export]

### Tratamento de erros
- [Sempre `throw new AppError('mensagem', ErrorCode.ENUM_VALUE)` — nunca strings soltas]
- [Nunca capturar erro silenciosamente — sempre logar ou relançar]

### Testes
- [Arquivo ao lado da implementação: `user.service.test.ts`]
- [Mocks externos via `vi.mock()` no topo — nunca mockar módulos internos]

---

## Regras de negócio críticas

<!--
  Esta é a seção mais importante. Coloque aqui invariantes que o Claude
  não pode inferir lendo o código. Se não tiver regras assim, deixe vazio
  ou remova a seção — não invente.
-->

- [Usuário só pode ter 1 assinatura ativa por vez — validar antes de criar nova]
- [Transações financeiras são imutáveis após confirmação — nunca UPDATE, só INSERT de estorno]
- [`tenant_id` obrigatório em toda query — projeto é multi-tenant]
- [Datas armazenadas em UTC — converter apenas na camada de apresentação]
- [CPF e telefone são criptografados em repouso — usar `EncryptedField` do shared]

---

## Restrições de arquitetura

<!--
  Decisões de design que o Claude quebraria sem querer se não soubesse.
  Se não houver restrições assim, remova a seção.
-->

- [Módulos não se importam diretamente — comunicação via EventBus ou shared]
- [Repositório não conhece controller — nunca importar tipos de rota no repo]
- [Env vars lidas apenas em `src/config/` — nunca `process.env` direto]
- [Queries pesadas têm timeout de 5s no pool — não aumentar sem revisão]

---

## Referências externas

<!--
  Para arquivos grandes (schema, OpenAPI, regras de domínio específico):
  não cole o conteúdo aqui — anote o caminho e peça ao Claude que leia
  quando necessário. Isso mantém o contexto base menor.
-->

- Schema do banco: [`infra/database/schema.prisma`]
- Contrato de API: [`docs/api/openapi.yaml`]
- Regras do módulo de pagamentos: [`src/modules/payments/RULES.md`]

---

<!--
  LEMBRETE FINAL antes de commitar este arquivo:

  ✅ Menos de 300 linhas?
  ✅ Cada linha responde "o Claude saberia isso sem ler?"
     → Se sim, delete a linha.
  ✅ Sem comandos óbvios (install, start, hello world)?
  ✅ Sem estrutura de pastas que qualquer dev conhece?
  ✅ Seções grandes de referência movidas para arquivos separados?
-->
