# Vídeo 04: /goal — o Claude Code que trabalha enquanto você dorme

**Canal**: [Adriano Viana](https://www.youtube.com/@adriano_viana/videos)
**Assista**: [youtube.com/@adriano_viana/videos](https://www.youtube.com/@adriano_viana/videos)

---

## Recursos desta pasta

| Arquivo | O que é |
|---|---|
| `template-condicoes-goal.md` | Template com 3 condições prontas para /goal — cobertura de testes, migração de módulo e limpeza de backlog |

---

## Como usar

Abra `template-condicoes-goal.md` e copie a condição que se encaixa no seu caso:

- **Caso 1** — Elevar cobertura de testes de um módulo
- **Caso 2** — Migrar arquivos de uma pasta para outra
- **Caso 3** — Limpar TODOs marcados com uma tag específica

Cada condição já tem os três elementos recomendados pela documentação:

```
/goal [check declarado],
[end state mensurável],
[constraint opcional],
ou parar após [N] turnos
```

Substitua os valores entre `[colchetes]` pelo seu contexto.

---

## A regra de ouro

> **Se a máquina não consegue medir, a máquina não consegue fazer.**

O avaliador (Haiku por padrão) só lê o que aparece no transcript da conversa. Ele não roda comandos por conta própria. A condição precisa apontar para algo que o Claude execute e mostre no transcript — output de comando, resultado de grep, existência/ausência de arquivo.

---

## Referências

- [Documentação oficial — /goal](https://docs.anthropic.com/en/docs/claude-code/goal)
- [Documentação oficial — Modo não-interativo](https://docs.anthropic.com/en/docs/claude-code/headless)
- [Documentação oficial — /loop e scheduled tasks](https://docs.anthropic.com/en/docs/claude-code/scheduled-tasks)
- [Documentação oficial — Stop hooks](https://docs.anthropic.com/en/docs/claude-code/hooks)
