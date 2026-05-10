# Regras — Frontend (src/components/, src/pages/, src/app/)

- Componentes React com TypeScript strict — sem `any`
- Tailwind para estilo — sem CSS modules ou styled-components
- Nenhum `useEffect` para buscar dados — use React Query ou SWR
- Imports de componentes de UI sempre de `@/components/ui/`
- Sem lógica de negócio em componentes — extraia para hooks customizados em `src/hooks/`
