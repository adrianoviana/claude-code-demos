# Vídeo 03: 10 configs do settings.json que o Claude Code esconde

**Canal**: [Adriano Viana](https://www.youtube.com/@adriano_viana/videos)
**Assista**: [youtube.com/@adriano_viana/videos](https://www.youtube.com/@adriano_viana/videos)

---

## Recursos desta pasta

| Arquivo / Pasta | O que é |
|---|---|
| `settings.json` | settings.json comentado com as 10 configs e explicação de cada uma |
| `settings.clean.json` | Versão limpa para colar direto — sem comentários |
| `agent-exemplo.md` | Frontmatter completo de sub-agente (config 5) |
| `hook-exit-code-exemplo.sh` | Hook com exit code 2 que bloqueia `pip install` (config 10) |
| `path-rules-exemplo/` | Estrutura de path-specific rules com CLAUDE.md enxuto (config 9) |

---

## Como usar

### settings.json (configs 1–4, 6, 7)

Copie `settings.clean.json` para um destes locais:

```bash
# Global — vale para todos os projetos
~/.claude/settings.json

# Projeto — vale só para este repositório
.claude/settings.json
```

Ajuste os valores conforme seu contexto:

| Campo | Default | Valor no arquivo | Quando mudar |
|---|---|---|---|
| `BASH_MAX_OUTPUT_LENGTH` | `30000` | `150000` | Sempre — aumentar não tem custo com janela de 1M |
| `CLAUDE_CODE_FILE_READ_MAX_OUTPUT_TOKENS` | `25000` | `100000` | Sempre — arquivos grandes entram completos |
| `CLAUDE_AUTOCOMPACT_PCT_OVERRIDE` | `95` | `75` | Sessões longas com muita geração de código |
| `DISABLE_TELEMETRY` | habilitado | `"1"` | Se não quiser enviar dados de uso para o Statsig |
| `DISABLE_ERROR_REPORTING` | habilitado | `"1"` | Se não quiser enviar logs de erro para o Sentry |
| `DISABLE_FEEDBACK_COMMAND` | habilitado | `"1"` | Acompanha as duas acima |
| `cleanupPeriodDays` | `30` | `365` | Se quiser histórico longo para `/insights` |
| `attribution.commit` | co-autoria ativa | `""` | Se não quiser o Claude no histórico do repositório |
| `attribution.pr` | co-autoria ativa | `""` | Idem para pull requests |

### Sub-agentes — frontmatter (config 5)

Copie `agent-exemplo.md` para `.claude/agents/` no seu projeto e ajuste:

- `name`: identificador do agente
- `model`: modelo a usar (`claude-opus-4-7`, `claude-sonnet-4-6`, `claude-haiku-4-5`)
- `effort`: `low` / `medium` / `high` / `max`
- `isolation`: `worktree` para agentes que modificam arquivos
- `skills`: lista de skills que o agente pode usar
- `tools`: inclua `Task(NomeDoAgente)` para controlar quais agentes este pode spawnar

### Hook exit code 2 (config 10)

Copie `hook-exit-code-exemplo.sh` para `.claude/hooks/pre-tool-use/` no seu projeto:

```bash
mkdir -p .claude/hooks/pre-tool-use
cp hook-exit-code-exemplo.sh .claude/hooks/pre-tool-use/enforce-uv.sh
chmod +x .claude/hooks/pre-tool-use/enforce-uv.sh
```

Adapte a condição (`pip install`) e a mensagem para a regra que você quer impor.

### Path-specific rules (config 9)

Veja a estrutura em `path-rules-exemplo/`:

```
.claude/
  frontend.md   ← carregado quando o agente toca em src/components/, src/pages/, src/app/
  db.md         ← carregado quando o agente toca em src/db/, infra/migrations/, *.prisma
CLAUDE.md       ← enxuto — sem as regras detalhadas de cada área
```

Crie arquivos `.md` em `.claude/` com o padrão de caminho no nome ou via configuração de memória.

### Prompt stashing (config 8)

Não é uma config — é um atalho nativo:

- **`Ctrl+S`** durante a digitação → guarda o prompt atual
- Envie outra mensagem → o prompt guardado volta ao input automaticamente

---

## Referências

- [Documentação oficial — Settings](https://code.claude.com/docs/en/settings)
- [Documentação oficial — Sub-agents](https://code.claude.com/docs/en/sub-agents)
- [Documentação oficial — Hooks](https://code.claude.com/docs/en/hooks)
- [Documentação oficial — Memory / Path-specific rules](https://code.claude.com/docs/en/memory)
- [JSON Schema oficial do Claude Code](https://json.schemastore.org/claude-code-settings.json)
