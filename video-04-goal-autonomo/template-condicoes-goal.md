# Template de Condições para /goal

Três casos de uso prontos com os três elementos que a documentação recomenda
e cláusula de parada já incluída.

---

## Caso 1 — Cobertura de testes

```
/goal todos os testes em test/[módulo] passam, cobertura de linhas ≥ [X]%
conforme output de "npm test -- --coverage", nenhum arquivo fora de
test/[módulo] modificado, ou parar após 15 turnos
```

**Os três elementos:**
- **End state mensurável:** cobertura ≥ X% (número verificável no output)
- **Check declarado:** todos os testes passam
- **Constraint:** nenhum arquivo fora do escopo tocado

---

## Caso 2 — Migração de módulo

```
/goal todos os arquivos em src/[módulo-antigo] foram migrados para
src/[módulo-novo], a pasta src/[módulo-antigo] não existe mais,
"npm run build" conclui sem erros, ou parar após 20 turnos
```

**Os três elementos:**
- **End state mensurável:** pasta antiga não existe (`ls` verificável)
- **Check declarado:** build sem erros
- **Constraint:** escopo implícito — só os arquivos do módulo

---

## Caso 3 — Limpeza de backlog

```
/goal todos os TODO marcados como [tag] em src/ foram resolvidos
(substituídos por implementação real ou removidos com justificativa
em comentário), "grep -r 'TODO\[[tag]\]' src/" não retorna resultado,
ou parar após 10 turnos
```

**Os três elementos:**
- **End state mensurável:** grep não retorna resultado (verificável no transcript)
- **Check declarado:** cada TODO tem resolução ou remoção justificada
- **Constraint:** escopo restrito pela tag específica

---

## Estrutura geral

```
/goal [check declarado],
[end state mensurável],
[constraint opcional],
ou parar após [N] turnos
```

**Dica:** use a cláusula de parada em todo goal que não tem critério 100% binário
e verificável. Goals sem limite podem rodar por muito tempo.

---

## O que o avaliador (Haiku) consegue verificar

✅ Output de comandos que o Claude rodou e mostrou no transcript
✅ Existência/ausência de arquivos via `ls` ou `find` no transcript
✅ Resultado de grep/search mostrado no transcript
✅ Contagem de turnos decorridos

❌ Legibilidade do código (subjetivo)
❌ Qualidade da arquitetura (subjetivo)
❌ Arquivos que o Claude não abriu/mostrou no transcript
