# Assistente

App para Windows que vive no topo da tela: mostra e responde seus agentes de código,
dita o que você fala, conversa com a IA que você já paga e junta suas integrações num
lugar só — sem você sair do que estava fazendo.

Esta é uma versão renomeada e mantida por **K**, feita a partir do projeto
[Coucou](https://github.com/Louis-CFM/coucou), de Louis Raille. O código é o mesmo; o
nome, os textos e o instalador é que passaram a dizer Assistente.

## O que ele faz

- **Ilha no topo da tela**: em vez de uma janela, uma faixa discreta no alto mostra o
  que está acontecendo e abre quando você precisa.
- **Seus agentes**: acompanha Claude Code, Codex, Gemini CLI, Copilot CLI, OpenCode,
  Amp e outros — mostra o que estão fazendo e deixa você aprovar ou responder perguntas
  dali mesmo, sem trocar para o terminal.
- **Ditado**: segure a tecla, fale, solte — o texto é colado onde você estava digitando.
  O reconhecimento roda no seu PC, e o histórico fica com você.
- **Chat**: converse com Claude, Google, OpenAI, OpenRouter ou com um modelo local
  (Ollama, LM Studio ou qualquer servidor compatível com a API da OpenAI), usando a sua
  própria chave.
- **Integrações**: Spotify, correio, WhatsApp, notas, cotações, GitHub e outros painéis
  que aparecem como pílulas na ilha.
- **Atualizações**: o app confere as versões novas e só instala depois que você manda.

## Requisitos

- Windows 10 ou 11 (o WebView2 já vem no 11).
- [Node 20+](https://nodejs.org)
- [Rust](https://rustup.rs)
- Visual Studio Build Tools com a carga **Desktop development with C++**

## Como compilar

```powershell
cd windows
npm install
npm run tauri dev      # versão de desenvolvimento, recarrega sozinha
npm run pack           # gera o instalador em windows\release\
```

O `npm run pack` deixa dois arquivos em `windows\release\`:
`Assistente-Windows-0.5.9-setup.exe` (instalador por usuário) e
`Assistente-Windows-0.5.9.msi` (instalação por máquina).

## Como está organizado

| Pasta | O que tem |
|---|---|
| `windows/src` | A interface: TypeScript e Vite. `core/providers.ts` lista os modelos; `settings/` monta as Configurações; `island/`, `pill/` e `hub/` são as telas. |
| `windows/src-tauri` | O motor em Rust: chat, agentes, voz, segredos, rede, bandeja, atualizações. |
| `windows/hook` | O programa auxiliar que conversa com os agentes. |
| `windows/tests` | Os testes automatizados (`npm test`). |
| `windows/scripts` | Geração de ícones, traduções e empacotamento. |
| `windows/README.md` | A documentação técnica original, em inglês. |

## O que mudou nesta versão

O nome visível passou de Coucou para Assistente em todo lugar: nome do app e da janela,
títulos das telas, instalador, bandeja do sistema, avisos, notificações e os textos nos
14 idiomas.

Continuam iguais, de propósito, os nomes que fazem parte da construção do programa: o
`coucou-hook.exe`, os pacotes internos em Rust, o identificador
`fr.louisraille.coucou` (que define onde seus dados ficam guardados), os nomes dos
grupos de hooks nos agentes e os endereços do GitHub. Trocar isso quebraria instalações
existentes.

## Testes

```powershell
cd windows
npm test
```

Os testes conferem, entre outras coisas, se toda frase usada no código tem tradução nos
14 idiomas. Parte deles compara os textos com a pasta do app de Mac (`NotchBuddy`), então
a suíte inteira só roda no repositório completo — não numa cópia só da pasta `windows`.

## Licença e créditos

Distribuído sob a licença MIT (veja `LICENSE`). O projeto original é o
[Coucou](https://github.com/Louis-CFM/coucou), de **Louis Raille**, e o crédito a ele
continua no código, no instalador e neste documento — é o que a licença pede e é o
mínimo devido a quem escreveu o programa.

Esta versão: **K**.
