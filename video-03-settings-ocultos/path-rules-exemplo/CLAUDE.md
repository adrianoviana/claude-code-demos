# Meu Projeto

## Stack

- TypeScript 5.x, strict mode
- Next.js 15 + Prisma ORM + PostgreSQL

## Comandos

```bash
bun dev          # servidor local na porta 3000
bun test         # vitest
bun db:migrate   # aplica migrações pendentes
```

## Path-specific rules

Regras específicas por área ficam em `.claude/`:

| Arquivo              | Ativo quando o Claude toca em...         |
|----------------------|------------------------------------------|
| `.claude/frontend.md` | `src/components/`, `src/pages/`, `src/app/` |
| `.claude/db.md`       | `src/db/`, `infra/migrations/`, `*.prisma`  |

O CLAUDE.md permanece enxuto — as regras detalhadas só entram no contexto
quando o agente trabalha na área correspondente.
