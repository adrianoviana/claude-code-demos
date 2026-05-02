# Vídeo 02: Por que seus tokens somem (e como recuperar 80%)

**Canal**: [Adriano Viana](https://youtube.com/@adrianoviana)
**Assista**: [Link do vídeo no YouTube](#) _(será atualizado após publicação)_

---

## Recurso: CLAUDE.md de referência

### O que é

Template de CLAUDE.md com menos de 300 linhas — só o que o Claude genuinamente não sabe por padrão.

Feito para substituir o seu CLAUDE.md atual se ele estiver inchado. Cada linha desnecessária consome tokens em toda mensagem da sessão.

### Como usar

1. Abra `CLAUDE.md`
2. Substitua tudo entre `[ ]` pelas informações do seu projeto
3. Remova as seções que não se aplicam
4. Delete os comentários `<!-- -->` antes de commitar
5. Verifique o checklist no final do arquivo

### O que incluir (e o que não incluir)

**Incluir:**
- Convenções do seu time que fogem do padrão
- Regras de negócio que o Claude não pode inferir do código
- Restrições de arquitetura locais
- Caminhos para arquivos grandes de referência (schema, OpenAPI)

**Não incluir:**
- Como rodar `npm install`
- Estrutura de pastas padrão do seu framework
- Sintaxe de React, TypeScript, SQL
- Qualquer coisa que um dev sênior já saberia

### Referência

- [Documentação oficial — Memory](https://code.claude.com/docs/en/memory)
- [Documentação oficial — Costs](https://code.claude.com/docs/en/costs)
