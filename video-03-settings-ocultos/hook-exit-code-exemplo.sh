#!/usr/bin/env bash
# Hook: PreToolUse — bloqueia pip install e redireciona para uv
# Coloque em .claude/hooks/pre-tool-use/enforce-uv.sh
#
# Exit codes:
#   0  → sucesso, Claude continua normalmente
#   1  → erro não-bloqueante (aparece no verbose, Claude ignora)
#   2  → erro injetado no contexto — Claude é forçado a reagir antes de continuar

TOOL_NAME="$1"
TOOL_INPUT="$2"

if [ "$TOOL_NAME" = "Bash" ]; then
  if echo "$TOOL_INPUT" | grep -q "pip install"; then
    echo "Erro: uso de pip install não permitido neste projeto."
    echo "Use 'uv add <pacote>' em vez de 'pip install <pacote>'."
    echo "Exemplo: uv add requests"
    exit 2
  fi
fi

exit 0
